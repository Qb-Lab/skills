# QBLab Skills

Agent skills for planning, reviewing, and stress-testing your work, plus growth skills for
running a software agency. A skill is a portable set
of instructions that a coding agent loads on demand. These work with Claude Code, Codex,
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

The engineering and productivity skills are manual-only: they run when you invoke them, never
implicitly. `qblab-context` is the exception — it is a context pack the other growth skills
depend on, so agents may load it on their own.

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
create it. Every other growth skill starts by loading this one.

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
│   └── blog-post/
│       ├── SKILL.md
│       ├── agents/openai.yaml
│       └── references/           # post shape
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
