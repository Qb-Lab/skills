# House-stack probe bank

Extra questions for when the context under discussion targets the house stack (Nx monorepo + NestJS + GraphQL + Prisma + Next.js, with separate Expo mobile repos). Same rules apply: one question at a time, only ask what genuinely affects how a part gets built, adapt wording to the actual answer trail.

## Monorepo boundaries

- Why is this a new package instead of code in the app (or vice versa)? What second consumer justifies the extraction?
- Which Nx projects does this touch, and what does `nx affected` look like on a typical PR — did you just make every change rebuild the world?

## Data layer

- What's the migration rollback story? If this migration lands and the deploy fails, what state is production in?
- This schema change — is it backward-compatible with the *currently deployed* API for the window between migrate and deploy?
- Why Postgres/Mongo for this (whichever the plan picks)? What query pattern breaks the choice?
- Any raw SQL or `queryRaw`? Who keeps that in sync with the schema next year?

## API contract

- GraphQL or REST for this endpoint — and why does the answer differ from the rest of the API?
- Who consumes this schema change, and what happens to a **mobile build from three months ago** that still calls the old shape? You can't force phones to update.
- Is anything here a breaking change hidden as additive (nullability tightened, enum value removed, semantics changed under the same field name)?
- Auth: which CASL abilities / guards cover the new surface? What's the exact request an attacker without the role sends?

## Mobile release reality

- Is every part of this OTA-updatable, or is there a native change hiding in it (new dep with native code, config plugin, app.config edit)? What's the store-review latency on the critical path?
- Which app variant did you think about — dev and prod have different bundle ids, schemes, and applinks. Does this work on both?
- What happens to a user mid-flow when the OTA update lands?

## Operations

- New env vars/secrets: enumerate every place they must exist. Which environment will you forget?
- This adds a queue/cron/webhook — what happens when it fires twice? When it doesn't fire? Who notices?
- CI only gates typecheck and build in these repos. What actually proves this feature works before a human clicks around?

## The simpler-thing question

- The stack already has Stripe/Sumsub/Twilio/S3/BullMQ/Redis wired up. Why is this plan building X instead of using the integration that's already there?
