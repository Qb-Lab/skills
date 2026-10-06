# QBLab Skills

Agent skills for planning, reviewing, and stress-testing your work, growth skills for
running a software agency, and a universal Growth OS for marketing any product. A skill is a
portable set of instructions that a coding agent loads on demand. These work with Claude Code, Codex,
Cursor, OpenCode, and ~70 other agents via the [`skills` CLI](https://github.com/vercel-labs/skills).

The skills are stack-aware: when the target repo is an Nx monorepo (NestJS, code-first
GraphQL/REST, Prisma or Drizzle on PostgreSQL/MongoDB, Next.js + Tailwind + shadcn/ui) or a
React Native Expo app, they load bundled house-stack references — phase-cutting rules,
stack-specific bug classes, and probe questions. On any other repo they fall back to generic
behavior.

## Install

```bash
# Pick from a list
npx skills add qb-lab/skills

# A specific skill, globally, for Claude Code
npx skills add qb-lab/skills --skill <name> -g -a claude-code

# Everything
npx skills add qb-lab/skills --all
```

Project installs go to `./.claude/skills/` (or your agent's equivalent); `-g` installs to your
home directory instead. `npx skills update` pulls the latest versions.

## Skills

| Skill | Category | What it does | Invoke |
| ----- | -------- | ------------ | ------ |
| [roast-my-plan](./skills/productivity/roast-my-plan/SKILL.md) | Productivity | Writes phased implementation plans sized to one AI coding-agent session per phase; roasts existing plans into that shape. | Claude Code/Cursor: `/roast-my-plan`; Codex: `$roast-my-plan` |
| [who-broke-this](./skills/engineering/who-broke-this/SKILL.md) | Engineering | Bounded Codex review loop over staged changes, with focused verification of the unstaged fixes. | Claude Code/Cursor: `/who-broke-this`; Codex: `$who-broke-this` |
| [hurt-my-feelings](./skills/productivity/hurt-my-feelings/SKILL.md) | Productivity | Breaks complex context into small parts and aligns on each through one-at-a-time questioning. | Claude Code/Cursor: `/hurt-my-feelings`; Codex: `$hurt-my-feelings` |
| [qblab-context](./skills/growth/qblab-context/SKILL.md) | Growth | QBLab's positioning, offers, ideal client, proof and voice, loaded before any client-facing work. | Loads automatically when the task speaks as QBLab; Codex: `$qblab-context` |
| [pre-call-brief](./skills/growth/pre-call-brief/SKILL.md) | Growth | One-page brief before a discovery call: who the lead is, fit, scope and plan hypothesis, quote range, questions to ask. | Claude Code/Cursor: `/pre-call-brief`; Codex: `$pre-call-brief` |
| [proposal](./skills/growth/proposal/SKILL.md) | Growth | Fixed-scope proposal from call notes: goal in the client's words, testable scope table, exclusions, timeline, one price, ownership, next step. | Claude Code/Cursor: `/proposal`; Codex: `$proposal` |
| [case-study](./skills/growth/case-study/SKILL.md) | Growth | Case-study entry in qblab.co's exact shape, mined from the repo and live URL, with one batch of owner questions for the rest. | Claude Code/Cursor: `/case-study`; Codex: `$case-study` |
| [linkedin-post](./skills/growth/linkedin-post/SKILL.md) | Growth | Three LinkedIn post variants from a case study, a commit range, a topic, or the week's work, with a posting log. | Claude Code/Cursor: `/linkedin-post`; Codex: `$linkedin-post` |
| [outreach](./skills/growth/outreach/SKILL.md) | Growth | Researches a target list in a niche and drafts a personalised three-message sequence per target, tracked in a local pipeline file. | Claude Code/Cursor: `/outreach`; Codex: `$outreach` |
| [client-followup](./skills/growth/client-followup/SKILL.md) | Growth | Post-launch check-in drafts that ask a client for a testimonial and a referral, with a forwardable intro. | Claude Code/Cursor: `/client-followup`; Codex: `$client-followup` |
| [growth-brief](./skills/growth/growth-brief/SKILL.md) | Growth | Weekly one-page brief: site funnel, pipeline, activity, stale items, and the single action for the week. | Claude Code/Cursor: `/growth-brief`; Codex: `$growth-brief` |
| [seo-audit](./skills/growth/seo-audit/SKILL.md) | Growth | Checks the site's SEO plumbing, performance budget, and copy against the searches founders make; ranked fix list and page ideas. | Claude Code/Cursor: `/seo-audit`; Codex: `$seo-audit` |
| [blog-post](./skills/growth/blog-post/SKILL.md) | Growth | Writes a qblab.co blog post as MDX the site renders, anchored in real work, from an audit idea or a topic. | Claude Code/Cursor: `/blog-post`; Codex: `$blog-post` |
| [project-growth-context](./skills/growth/project-growth-context/SKILL.md) | Growth | Builds or loads any project's growth context from repository evidence, resolves its private state directory, and holds the shared playbooks the Growth OS skills use. | Loads automatically for growth work on a project; Codex: `$project-growth-context` |
| [growth-os](./skills/growth/growth-os/SKILL.md) | Growth | Orchestrator: judges stage and objective, routes to the focused skills, returns the week's plan, the next action and a recurring routine. | Claude Code/Cursor: `/growth-os`; Codex: `$growth-os` |
| [growth-strategist](./skills/growth/growth-strategist/SKILL.md) | Growth | One objective, positioning, ranked channels with a "not now" list, the first growth loop, 30/60/90 and ranked experiments. | Claude Code/Cursor: `/growth-strategist`; Codex: `$growth-strategist` |
| [audience-intelligence](./skills/growth/audience-intelligence/SKILL.md) | Growth | Evidence-based segments, jobs, pain hierarchy, triggers, objections, B2B buying roles and a verbatim language bank. No fictional personas. | Claude Code/Cursor: `/audience-intelligence`; Codex: `$audience-intelligence` |
| [market-radar](./skills/growth/market-radar/SKILL.md) | Growth | A few dated, sourced opportunities from competitor moves, complaints and trends, each with a response, urgency and confidence. | Claude Code/Cursor: `/market-radar`; Codex: `$market-radar` |
| [community-growth](./skills/growth/community-growth/SKILL.md) | Growth | Maps the communities where the audience talks, surfaces conversations worth joining with draft replies and promo-risk flags, and drafts personal pitches to a short list of creators or streamers. | Claude Code/Cursor: `/community-growth`; Codex: `$community-growth` |
| [content-ideas](./skills/growth/content-ideas/SKILL.md) | Growth | Content ideas by strategic purpose, scored and ranked, deduplicated against the project's content log. | Claude Code/Cursor: `/content-ideas`; Codex: `$content-ideas` |
| [content-calendar](./skills/growth/content-calendar/SKILL.md) | Growth | A 7, 14 or 30 day publishing plan sized to real capacity, each item adapted to its platform. | Claude Code/Cursor: `/content-calendar`; Codex: `$content-calendar` |
| [human-content-writer](./skills/growth/human-content-writer/SKILL.md) | Growth | Social and short-form copy in the project's voice and language that does not read as generated, with every claim traced to evidence. | Claude Code/Cursor: `/human-content-writer`; Codex: `$human-content-writer` |
| [creative-director](./skills/growth/creative-director/SKILL.md) | Growth | A creative brief for a visual (concept, composition, light, realism), then the image itself when the host can generate one, or a production-ready handoff. | Claude Code/Cursor: `/creative-director`; Codex: `$creative-director` |
| [short-video-director](./skills/growth/short-video-director/SKILL.md) | Growth | Shootable TikTok, Reels and Shorts scripts: hook, first frame, beats, shots, on-screen text, cover and audio direction. | Claude Code/Cursor: `/short-video-director`; Codex: `$short-video-director` |
| [launch-campaign](./skills/growth/launch-campaign/SKILL.md) | Growth | An integrated launch from T-14 to T+14: message house, channels chosen from the audience, assets, metrics and risks. | Claude Code/Cursor: `/launch-campaign`; Codex: `$launch-campaign` |
| [growth-experiment](./skills/growth/growth-experiment/SKILL.md) | Growth | Turns ideas into experiment cards with one variable, a baseline and a judge date; ranks by ICE; closes with an honest verdict and a learning. | Claude Code/Cursor: `/growth-experiment`; Codex: `$growth-experiment` |
| [growth-analyst](./skills/growth/growth-analyst/SKILL.md) | Growth | Reads analytics tools, exports or pasted numbers and returns decisions: what to stop, continue, scale and test next. | Claude Code/Cursor: `/growth-analyst`; Codex: `$growth-analyst` |
| [growth-review](./skills/growth/growth-review/SKILL.md) | Growth | Weekly retrospective, midweek check and monthly strategy review that feed the next plan. | Claude Code/Cursor: `/growth-review`; Codex: `$growth-review` |

The engineering and productivity skills are manual-only: they run when you invoke them, never
implicitly. `qblab-context` and `project-growth-context` are the exceptions — they are context packs the
other growth skills depend on, so agents may load them on their own.

### roast-my-plan

Hand it a rough idea or an existing plan (existing plans get an honest roast first). You get
back a phased plan written for a fresh AI coding-agent session per phase — progress tracker,
the decisions and context a fresh session can't recover from the repo, concrete phases with
mechanical exit criteria — saved to the repo's plan location, ending with a copy-paste kickoff
prompt for phase 1. If the `codex` CLI is installed, it can run the finished plan past a second
model before delivering.

### who-broke-this

With changes staged in git, it runs a bounded review loop: Codex (pinned model, read-only)
reviews the staged diff into structured findings, a subagent triages and fixes in the working
tree (never touching the index — a hash guard enforces it), and the dispositions go back to
Codex for focused fix-verification rather than another full review. Runs up to 3 rounds
automatically; more require your explicit approval. Stops early on clean, taste-only findings,
stalemate, or thrash, and ends with a full disposition table.

Requires the [Codex CLI](https://github.com/openai/codex): `npm install -g @openai/codex`
(without it, it offers a single degraded self-review round).

### hurt-my-feelings

Bring something big or fuzzy — a plan, a feature, a pile of context. It breaks it into small
parts, then works through them one at a time with sharp, single questions — what is this part
really, and how should it be built — each with pickable suggested answers (recommendation
marked, your own answer always an option), digging into every vague
answer until you both confirm the same understanding. Questions it can answer from the codebase
it answers itself. Once a part is aligned it may offer one concrete improvement idea. Ends with
an alignment summary concrete enough to hand to a fresh agent session.

### qblab-context

A context pack, not a workflow. It holds what is already public on qblab.co — positioning,
the two plans, the good-fit / not-a-fit profile, real proof points with their honest labels,
and the writing voice with a banned-phrase list — so anything an agent writes as QBLab sounds
like QBLab and never invents a number. Private facts (pricing, capacity, NDA clients) come from
an overlay at `~/.qblab/context.local.md` that is never committed; copy the bundled template to
create it. Every other QBLab growth skill starts by loading this one.

### pre-call-brief

Hand it a Cal.com booking, a pasted enquiry, or a name and company (or say `next` and, if
your agent can read email, it finds the soonest upcoming booking). It does time-boxed public
research on the person, the company and any existing product, scores fit against QBLab's
profile, proposes a scope size and which plan to lead with, pulls a quote range from your
private overlay, and lists the five to eight questions that actually change the estimate.
The brief is saved under `~/.qblab/leads/` and printed. It never contacts the lead.

### proposal

Hand it the call notes or transcript (it also picks up the matching pre-call brief). It writes
the document that follows the 30-minute call: the client's goal in their words, a scope table
where every line is testable, explicit exclusions, the four-week timeline or the subscription
request flow, one fixed price with terms from your overlay, assumptions, what you need from the
client, the ownership paragraph, and a single next step. Saved under `~/.qblab/leads/`; if your
agent can draft email it also prepares a cover note as a draft. Never sends.

### case-study

Point it at a shipped product's repository or live URL. It mines what can be checked (stack
from manifests, features from routes and screens, dates from commits, what the live site shows),
asks you one batch of questions for the rest, and writes the entry in the exact shape qblab.co
renders, plus a 150-word narrative. Inside the qblab.co repo it edits `content/work.ts` in
place; elsewhere it saves under `~/.qblab/case-studies/`. Unknown fields stay `INPUT_NEEDED`;
it never invents an outcome, and it withholds client names not cleared in your overlay.

### linkedin-post

Give it a case study, a commit range that shipped, a topic, or `weekly`. It writes three
variants from the same evidence — a build log with elapsed days from commit dates, a lesson, and
a founder question — each with a hook, a suggested visual and a posting slot, then logs the
draft under `~/.qblab/posts/` so later runs never repeat a source. `weekly` also gives a
two-week plan of post ideas. It drafts; you post.

### outreach

Give it a niche or a list of companies. It builds a target list from QBLab's fit signals
(dropping anyone in your avoid list or already in the pipeline), researches each target for one
specific observation, and writes a first message plus day-4 and day-10 follow-ups where the
first sentence is always about them. Sequences are saved under `~/.qblab/outreach/`, the first
email becomes a draft when your agent can draft mail, and every target gets a row in
`pipeline.csv`. Nothing is ever sent.

### client-followup

For a named client or everyone who is `due` (30 days after launch, then quarterly for
subscriptions). It looks at the live product for one true observation, then drafts the check-in
with the testimonial ask (three questions that make it easy to answer) and a one-sentence
referral ask, a thank-you reply that turns their answer into a publishable quote, and a
three-line intro they can forward. Clients live in `~/.qblab/clients.md`; NDA clients are never
asked for a public quote.

### growth-brief

Run it on Monday. It pulls the site funnel from Mixpanel when your agent has access (visitors,
CTA clicks by location, calendar opened, booked, confirmed), reads every file the other growth
skills write, and produces one page: funnel this week versus last, pipeline by stage, activity
per channel, stale items with dates, whether last week's action happened, and the one action for
this week. Saved under `~/.qblab/briefs/`.

### seo-audit

Point it at the site repo, the live URL, or both. It runs the mechanical checks first
(canonicals, title template, sitemap and robots, JSON-LD, Open Graph images, `llms.txt`,
placeholder leaks, the blog gate, the Lighthouse budget), then spends its effort on whether each
section and case study answers the searches founders actually make, using a bundled query map.
Output is a ranked fix list with files and a table of page and post ideas with working titles.
It never adds the location to headings or proposes keyword stuffing.

### blog-post

Give it a working title from an audit, a query family, or a topic. It insists on one real anchor
(a shipped product, a real decision, a number QBLab can stand behind), then writes 700 to 1,200
words in QBLab's voice with the answer in the first paragraph, and saves an MDX file with the
exact frontmatter the blog route reads. Inside the site repo it writes to `content/blog/` and
runs the build; it never flips the blog gate.

## Universal Growth OS

The QBLab growth skills above are for running the agency. The Growth OS is for marketing
**any** product you are working on: a SaaS, a mobile app, a store, a game, a developer tool, a client
product, or QBLab itself. Install it into a project and say "use growth-os, I want to grow
this product".

```text
project-growth-context          what is true about this project, and where its state lives
        ↓
     growth-os                  decides the objective and routes the work
        ↓
 ┌──────────────┬──────────────────────────────────────────────────────────┐
 │ research     │ audience-intelligence · market-radar · community-growth  │
 │ strategy     │ growth-strategist                                        │
 │ content      │ content-ideas · content-calendar · human-content-writer  │
 │ creative     │ creative-director · short-video-director                 │
 │ campaigns    │ launch-campaign                                          │
 │ measurement  │ growth-experiment · growth-analyst                       │
 └──────────────┴──────────────────────────────────────────────────────────┘
        ↓
   growth-review  →  learnings.md  →  next week's plan
```

How it works:

- **Context from evidence.** `project-growth-context` reads the repository (README, store
  metadata, landing copy, theme tokens, locales, analytics SDKs, changelog), asks you one
  short batch of questions for what code cannot know, and writes a context file. Anything
  still unknown stays `INPUT_NEEDED`; no skill invents traction, pricing, customers,
  competitors or metrics.
- **Private state per project.** Plans, the content log, experiment cards, reviews and
  learnings live in `~/.qblab/growth/<project-id>/` (the id comes from the git remote), or in
  the project's own `.growth/` directory if you create one to share the plan with a team.
  Nothing is written to this catalog or to a repository that did not opt in.
- **A loop that learns.** Experiments, analyses and reviews write to `learnings.md`; every
  planning skill reads it first, so a channel or hook that failed is not proposed again
  unchanged, and what worked gets repeated.
- **Honest about tools.** Skills use live research, image generation, analytics connectors, a
  scheduler or a second model (for example the `codex` CLI for a critique round) only when the
  host actually has them, and otherwise produce a handoff. Routines are marked `scheduled`
  only when a real scheduler was configured.
- **Draft only.** Nothing is posted, sent, submitted or spent on your behalf.

```bash
# In any product repository
npx skills add qb-lab/skills --skill project-growth-context growth-os growth-strategist \
  audience-intelligence market-radar community-growth content-ideas content-calendar \
  human-content-writer creative-director short-video-director launch-campaign \
  growth-experiment growth-analyst growth-review
```

| You say (Claude Code / Cursor; in Codex use `$growth-os …`) | You get |
| --- | --- |
| `/growth-os I want more organic installs` | context, audience, strategy, experiments, ideas, a 7-day calendar, the first asset, the week's plan |
| `/growth-os next` | the one thing to do now |
| `/growth-os weekly` | Monday: last week closed, numbers read, radar run, this week's objective, experiments and content |
| `/growth-os daily` | trend and community radar; a content action only when something is time-sensitive |
| `/growth-os diagnose` | the one bottleneck, with evidence, when growth is not happening |
| `/growth-os launch the Android app on 2026-11-18` | a launch campaign from T-14 to T+14 |
| `/growth-os routine` | a recurring routine (daily, Monday, Wednesday, Friday, monthly) and a scheduler handoff |
| `/market-radar weekly` · `/content-ideas 10` · `/short-video-director C-0012` · `/growth-experiment close EXP-003` | any focused skill by itself |

Each skill works without the others; a missing upstream file never blocks, the skill says
which one would sharpen the result. Inside QBLab's own repositories the Growth OS layers on
`qblab-context` instead of restating it and hands LinkedIn posts, site articles, outbound,
SEO and the weekly funnel to the QBLab skills that already own them.

## Repo structure

```
skills/
├── engineering/
│   └── who-broke-this/
│       ├── SKILL.md
│       ├── agents/openai.yaml    # Codex host metadata (manual-only policy)
│       ├── references/           # review prompt, findings schema, stack bug classes
│       └── scripts/round-budget.sh
├── growth/
│   ├── qblab-context/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # positioning, offers, icp, proof, voice, overlay template
│   ├── pre-call-brief/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # research checklist, brief template
│   ├── proposal/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # proposal template, cover email
│   ├── case-study/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # entry shape, intake questions
│   ├── linkedin-post/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # post patterns
│   ├── outreach/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # message sequence, pipeline columns
│   ├── client-followup/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # clients template, message templates
│   ├── growth-brief/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # site events, brief template
│   ├── seo-audit/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # site checks, query map, report template
│   ├── blog-post/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # post shape
│   ├── project-growth-context/   # Growth OS foundation
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   ├── references/           # context template, discovery, state layout, project types,
│   │   │                         # platform playbook, quality bar, hooks, languages, capabilities
│   │   └── scripts/growth-state.sh
│   ├── growth-os/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # modes, plan template, routines, routine template, scheduler handoff
│   └── <growth-strategist, audience-intelligence, market-radar, community-growth,
│        content-ideas, content-calendar, human-content-writer, creative-director,
│        short-video-director, launch-campaign, growth-experiment, growth-analyst,
│        growth-review>/
│       ├── SKILL.md
│       ├── agents/openai.yaml
│       └── references/           # templates and playbooks specific to the skill
└── productivity/
    ├── roast-my-plan/
    │   ├── SKILL.md
    │   ├── agents/openai.yaml
    │   └── references/           # stack playbook, second-opinion profile
    └── hurt-my-feelings/
        ├── SKILL.md
        ├── agents/openai.yaml
        └── references/           # stack probes, second-reviewer profile
```

## Contributing

Skills live at `skills/<category>/<skill-name>/SKILL.md`. Scaffold one with
`npx skills init <name>`, write the instructions, and open a PR. See [AGENTS.md](./AGENTS.md)
for the category definitions, layout, and authoring conventions.

Test locally before opening a PR:

```bash
npx skills add /path/to/this/repo --skill <name>
```

## License

MIT
