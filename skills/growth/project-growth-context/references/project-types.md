# Project types and stages

Starting heuristics, not truths. They decide where to look first. Evidence in
`<state>/audience.md` and `<state>/learnings.md` overrides anything here, and the strategy
says so when it departs from the default.

## Classify by evidence

Pick the type from who pays and how the product is used, using markers in the repository.
Mixed products take the type of the side that is hardest to acquire.

| Type | Markers |
| --- | --- |
| `b2b-saas` | team or workspace models, roles and seats, SSO, invoices, "book a demo", integrations with work tools |
| `consumer-app` | mobile targets or a consumer web app, individual accounts, store metadata, push notifications, a paywall or ads |
| `marketplace` | two user kinds (buyer and seller, host and guest), listings, payouts, reviews between users |
| `ecommerce` | product catalog, cart and checkout, shipping, a storefront theme |
| `game` | an engine project, Steam / itch / console config, builds, levels, store page assets |
| `developer-tool` | a CLI, SDK, library or API; docs-heavy; package registry publishing; open-source license |
| `service` | an agency, studio or consultancy site; case studies; a booking or contact flow instead of a product |
| `internal-tool` | no public surface; growth means adoption inside one organisation |

`ai` is a modifier, not a type. Classify by the rows above, then apply the AI notes below
when the core value is model output.

## Stage decides the objective

Stage comes from the owner or from unambiguous evidence (no live URL means pre-launch). It
is never inferred from code quality.

| Stage | What is true | The only objective that makes sense |
| --- | --- | --- |
| `pre-launch` | nothing public to use yet | a small audience that is waiting, and a message tested on real people |
| `launched, no traction yet` | usable, almost nobody using it | the first 10 customers or 100 active users, found by hand |
| `early traction` | some real users arriving, unevenly | one repeatable channel, proven with numbers |
| `growing` | a channel works | compound it: loops, retention, a second channel, measurement |

The numbers in that table are default milestones, not targets the owner set. A plan that
uses one says "default milestone" next to it and replaces it when the owner gives a target.

Before a repeatable channel exists, do things that do not scale (direct conversations,
hand-picked communities, founder-led content). Do not propose paid acquisition, a referral
programme, or SEO at volume to a product with no evidence that people keep using it.

## Starting points per type

**b2b-saas.** Objective by default: qualified conversations, then first customers. Start
with founder-led content on LinkedIn, problem education, direct outbound to a narrow list,
niche communities where the buyer asks for help, a demo that shows the before and after;
SEO and case studies once there is something to cite. First loop candidates: useful public
artefact (template, calculator, teardown) → conversation → pilot → case study → more
conversations. Proof that matters: time or money saved for a named kind of team, security
and reliability answers. Traps: content for peers instead of buyers; a free trial with
nobody guiding it; counting followers when the goal is ten customers.

**consumer-app.** Objective by default: installs that activate. Start with short product
demo videos on TikTok, Reels and Shorts, UGC-style content, creators who already have the
audience (the `community-growth` skill's `creators` mode), store listing work (ASO), and a
shareable output inside the product. First loop
candidates: user makes something → shares it → viewers install; invite for a mutual
benefit. Proof that matters: the product working on screen, ratings, real user content.
Traps: polished brand films before a single clip has earned views; buying installs that
never open the app; B2B tactics (cold email, LinkedIn thought pieces).

**marketplace.** Objective by default: liquidity in one narrow segment (one city, one
category), supply side first unless demand is the scarce side. Start by recruiting the
scarce side by hand and showing them demand. Loop: suppliers bring their own customers;
listings become search landing pages. Traps: launching everywhere; marketing to both sides
with the same message.

**ecommerce.** Objective by default: first-order conversion and repeat purchase. Start with
product visuals and UGC, creators and seeding, organic social, email and lifecycle from day
one, search for product and comparison queries. Loop: customer content → social proof on
the product page → more customers. Proof: real photos, reviews, returns policy. Traps:
discounting as the only message; generated lifestyle images that misrepresent the product.

**game.** Objective by default: wishlists or players, plus streamer attention. Start with
gameplay clips (the game is the content), Reddit and Discord where the genre lives, a
demo, festival and store events, pitching small and mid-size streamers and creators who play the
genre with a key (the `community-growth` skill's `creators` mode). Loop: clip → wishlist or
demo → players' own clips and streams. Proof: gameplay
footage, demo retention, wishlists. Traps: trailers made of logos and text; a Discord
opened before there is anything to do in it; pitching the largest streamers first.

**developer-tool.** Objective by default: active developers, measured by installs and real
usage, not stars. Start with a README that works in two minutes, technical posts that
solve a problem, X and Hacker News where the audience argues, Reddit and Discord for the
stack, docs as the landing page, working examples and templates. Loop: template or example
repo → adoption → users' own public repos and posts. Proof: benchmarks that can be rerun,
real code, who depends on it. Traps: marketing language (developers leave); launching on
Hacker News with nothing to try; hiding the price.

**service.** Objective by default: qualified calls. Start with proof of shipped work,
founder-led posts, direct outreach with a specific observation, referrals from past
clients. When the service is QBLab, the existing QBLab skills are the playbook.

**internal-tool.** Objective: active teams. Channels are demos, champions in each team,
onboarding sessions and a visible changelog. Skip public channels entirely.

## AI modifier

- Show the output, not the model. A real input and the real result on screen beats any
  claim about intelligence.
- The objection is trust: accuracy, privacy, what happens when it is wrong. Answer it with
  specifics the product can keep.
- Outputs people want to show others are the natural loop; design the share step.
- Avoid "AI-powered" as the message and avoid the AI visual clichés (see the
  `creative-director` skill). The category is crowded; the specific job done is the pitch.
