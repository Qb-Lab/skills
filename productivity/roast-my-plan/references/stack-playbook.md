# House-stack playbook: phase-cutting rules

Apply this when the target repo matches the house stack: an Nx monorepo (`nx.json` at root) with NestJS API, Prisma, and usually a Next.js web app — or a standalone Expo app that pairs with one.

## The dependency chain phases must respect

Backend-to-frontend changes flow through a generation chain. A phase boundary in the middle of a generation step leaves the repo broken, so cut phases *between* these links, never inside one:

```
prisma/models/*.prisma  →  prisma migrate + generated client
  →  Nest services/resolvers  →  schema.gql (emitted at API boot, never hand-edited)
  →  nx codegen <web-app>  →  src/gql.ts hooks  →  UI components
```

Concretely:

- A phase that changes a Prisma model **includes** the migration and the regenerated client, and touches the services that break because of it. Schema change and its consumers ship together or typecheck fails.
- A phase that changes the GraphQL API **ends** with the API booting (so `schema.gql` regenerates) and `nx codegen` re-run for consuming apps. Frontend UI work building on the new hooks is the *next* phase.
- One migration per phase, and each migration must be deployable on its own — plans that batch several half-related model changes into one migration get roasted.

## "Done when" commands that actually verify

- `nx affected -t typecheck build` — this is the CI gate (lint/test are typically not in CI in these repos), so it's the minimum bar for every phase.
- `nx codegen <app>` succeeding proves the GraphQL contract is consistent end to end.
- API tests need env loading: `set -a && source .env && set +a` before jest — don't write "run tests" as a done-when without noting this.
- Local infra is `docker compose up` (postgres + redis); phases needing a DB must say so.

## Monorepo-specific phase rules

- Prefer phases that stay inside one Nx project (`apps/api`, `apps/<x>-web`, or one `packages/**` lib); `@nx/enforce-module-boundaries` will reject shortcuts across them anyway.
- **New shared package gotcha:** in these repos `nx.json` often registers `packages/api/services/*` and `packages/shared/helpers/*` paths in *two* `@nx/js/typescript` plugin entries. A phase that creates a new shared package must include updating both entries, or typecheck targets silently don't run for it.
- Never plan edits to generated artifacts: `schema.gql`, `packages/**/generated/`, `src/gql.ts`, `dist/`, `out-tsc/`.

## Mobile (Expo) phases

- Mobile is almost always a **separate repo** from the API monorepo. A feature spanning both is at minimum two phases in two repos: API first (deployed or locally runnable — mobile codegen points at the running API, e.g. `localhost:5010/graphql`), mobile second.
- Distinguish OTA-updatable phases (JS/TS only → `eas update`) from native phases (new native module, config-plugin change, `app.config.ts` edit → full EAS build + store submission). Never mix the two in one phase; the native one has a days-long feedback loop.
- If a phase touches EAS workflow files, it must keep the mirrored `paths` / `paths-ignore` lists in sync.

## Cross-cutting

- A phase that introduces an env var must list every place it lands: `.env`, deploy config/CI secrets, and for mobile the `EXPO_PUBLIC_*` naming plus `app.config.ts` variants (dev/prod bundle ids differ).
- Data layer is Prisma on Postgres by default (Mongo in rare repos; Drizzle only if you actually see a `drizzle.config.*`) — don't plan for an ORM the repo doesn't use; check first.
- Auth-touching phases must account for both session (Redis-backed) and JWT paths, and CASL ability rules where present.
