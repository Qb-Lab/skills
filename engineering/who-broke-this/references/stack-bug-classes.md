# House-stack bug classes

Append this to the review prompt when the repo matches the house stack (Nx monorepo + NestJS + Prisma, or an Expo app). These are the breakage patterns generic review misses; hunt them specifically.

## Prisma / data layer

- Model changed in `prisma/models/*.prisma` (or `schema.prisma`) with **no matching migration**, or migration present but generated client not regenerated — consumers compile against stale types.
- Nullability or enum drift: field made optional/required in the schema while service code still assumes the old shape.
- Multi-file schema repos: relation added in one `.prisma` file without the back-relation in the other file.
- Raw queries or `queryRaw` bypassing the schema after a rename.

## GraphQL (Nest code-first)

- `@Field()` nullability disagreeing with the TS type (house rule: explicit `| null` and `!` together) — breaks consumers at runtime, not compile time.
- New resolver/service not registered in its `*.module.ts`, or the module not imported in `app.module.ts` — boots fine until the query is hit.
- Hand edits to `schema.gql` — it's emitted at API boot; any manual change is a bug by definition.
- Input DTO (`dto/*.input.ts`) changed without updating the mutations' consumers.
- Breaking schema change (field removed/renamed/type-narrowed) — flag loudly: web *and* a separately-shipped mobile app consume this schema, and old mobile builds can't be forced to update.

## Codegen chain

- Backend schema change without re-running codegen: stale `src/gql.ts` in web/mobile means the diff "works" but ships hooks that no longer match the API.
- `codegen.ts` document globs not covering a newly added `*.graphql`/`*.gql` file.

## NestJS runtime

- Provider added to a service but missing from the module's `providers` — DI failure at boot.
- Global exception-filter order changed (custom `ApiError` filters are order-sensitive).
- BullMQ: processor name/queue name mismatch between producer and `@Processor`; jobs silently never consumed.
- Webhook controllers (Stripe/Sumsub/Twilio): signature verification removed or raw-body handling broken by a body-parser change.
- Guards/CASL: a new resolver or controller without the auth guard or ability check its siblings have.

## Frontend (Next.js / Tailwind / shadcn)

- TanStack Query: mutation without invalidating the query keys it stales; codegen'd `exposeQueryKeys` keys ignored in favor of hand-written ones.
- Tailwind version mismatch assumptions: v4 repos have no `tailwind.config` (CSS-based config); a diff adding v3-style config or plugin syntax to a v4 app does nothing.
- shadcn components in these repos may sit on **Base UI, not Radix** — check `components.json` before trusting prop names in the diff.
- Server/client component boundary: hooks or browser APIs added to a file without `'use client'`.

## Expo / React Native

- `app.config.ts` variant drift: change applied to one `APP_VARIANT` branch (dev) but not the other (prod), or bundle id/scheme/applinks touched inconsistently.
- EAS workflow files: the mirrored `paths` / `paths-ignore` lists edited on one side only.
- Native-affecting change (new native dep, config plugin, `patches/`) shipped as if it were OTA-safe — old binaries will crash on `eas update`.
- NativeWind: className using web-only Tailwind utilities that don't exist in NativeWind.
- Deep links: route moved without updating `+native-intent` prefix handling.

## Cross-cutting

- New env var read in code but absent from `.env` handling, CI/deploy secrets, or (mobile) not `EXPO_PUBLIC_`-prefixed when read client-side.
- `nx.json` plugin `exclude`/re-registration lists not updated for a new `packages/**` project — its typecheck silently stops running, so "typecheck passes" proves nothing for that package.
- Edits inside generated/never-edit paths: `schema.gql`, `packages/**/generated/`, `src/gql.ts`, `dist/`, `out-tsc/`.
