# Discovering a project's growth context

Look before asking. Work down this list and stop reading a source once it has given what it
can. Record the path or URL next to every fact.

## Where the facts are

| Field | Look in |
| --- | --- |
| Name, one-line description, URL | README title and first paragraph; `package.json` (`name`, `description`, `homepage`); `app.json` / `app.config.*`; `pyproject.toml`, `Cargo.toml`, `pubspec.yaml`; site metadata (`<title>`, meta description, Open Graph) |
| Platforms | `ios/`, `android/`, Expo config, `electron`, Steam or itch config, `Dockerfile` for a web service, browser-extension manifest |
| What it does, core features | landing page copy in the repo (`app/page.*`, `pages/index.*`, `content/`, locale JSON); route and screen names; store listing text (`fastlane/metadata`, `store/`, `metadata/`); docs; onboarding screens |
| What is demonstrable | the shortest user flow that ends in a visible result; existing screenshots, recordings, Storybook, demo routes |
| Recent changes | `CHANGELOG`, release notes, the last 30 to 60 days of `git log` grouped into things a user would notice |
| Pricing, business model | a public pricing page or plan table in the site copy; paywall or subscription products named in store config. Server-side price ids are not public pricing: do not read a price from them |
| Audience hints | the words the site uses for its reader ("teams", "creators", "clinics"); testimonials and logos present in the repo (note whether they are real or placeholders); support and FAQ content |
| Positioning | hero headline and subhead, comparison pages, "why us" sections, `llms.txt` |
| Brand voice | landing and onboarding copy, error messages, emails in the repo, the README's register |
| Visual style, colors, fonts | Tailwind or theme config, CSS variables, design-token files, font imports, `public/` and `assets/` (logo, screenshots, illustrations) |
| Languages, geography | i18n directories and locale files, RTL handling, currency and phone formats, store locales |
| Channels | social links in the footer or site config, `mailto:` and community invite links, RSS, a blog directory |
| Analytics | dependencies and init code for PostHog, Mixpanel, GA4 / gtag, Firebase Analytics, Amplitude, Segment, Plausible, Vercel Analytics; the event names actually tracked |
| Constraints | terms and privacy pages, age gates, medical / financial / legal disclaimers, store category |
| Existing marketing thinking | `docs/marketing`, `BRAND.md`, `POSITIONING.md`, pitch or plan files, previous growth state under `<state>` |

If the host can fetch pages, read the live site and any public store listing as well; the
live copy wins over stale copy in the repo. If it cannot, say so and work from the repo.

Outside a repository (the owner just describes a product or gives a URL), the same table
applies to whatever can be fetched; everything else goes to the owner questions.

## What evidence cannot tell you

- A file name is not a description. Open the assets you list (screenshots, recordings,
  press images); note any that are empty, missing or that this host cannot view as
  `unviewed`, and never describe what an unviewed asset shows.
- Code shows what was built, not who uses it. Audience lines derived from copy are
  `[inferred]` until `audience-intelligence` or the owner confirms them.
- A testimonial block or logo wall in the code may be placeholder content. Do not treat it
  as proof until the owner confirms it is real.
- Traction, revenue, list sizes, follower counts and conversion rates are never derived from
  code. Follower counts may be read from a public profile page with the date noted.
- Competitors are named by the owner or found by research with a URL. A competitor you
  "know" from memory is a lead to verify, not a fact.

## Owner questions (one batch, at most seven)

Ask only those the evidence did not answer. Offer pickable answers where possible, with
"skip" always allowed; a skipped answer becomes `INPUT_NEEDED`.

1. What is the one result you want in the next 90 days? (users or installs · leads or first
   customers · revenue · audience or followers · traffic) and is there a target number?
2. Where is it today: not launched, launched with few users, some steady users, or
   growing? Any real numbers you are willing to share: users, customers, revenue, list or
   follower counts. (Used as the baseline; not published unless you say a number can be.)
3. Who actually uses or buys it right now, if anyone, and how did they find it?
4. Who will make the content, how many hours a week, and is anyone willing to be on camera
   or post under their own name?
5. Which channels are already active (handles), and is there any budget for paid, creators
   or tools?
6. Which countries and languages matter first?
7. Anything that must never be claimed or named, and anything regulated about the product?

Follow-ups belong to the skill that needs them (the strategist asks about sales cycle, the
analyst about data access), not to this first pass.
