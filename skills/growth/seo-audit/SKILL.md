---
name: seo-audit
description: >
  Audit qblab.co (or any QBLab-built marketing site) for search and answer-engine
  readiness: metadata and canonicals, structured data, sitemap and robots, llms.txt, Core
  Web Vitals against the site's own budget, and on-page copy versus the keywords founders
  actually search. Ends with a ranked fix list and page or post ideas. Use when the user
  says "SEO audit", "why aren't we ranking", "check the site's SEO", or before a release
  of the marketing site.
disable-model-invocation: true
argument-hint: "<site URL or repo path; defaults to the current repo>"
---

# SEO audit

qblab.co already has the plumbing: generated sitemap and robots, JSON-LD, canonicals, Open
Graph images, `llms.txt`, and a performance budget. An audit therefore checks that the
plumbing still holds, then spends most of its effort on the part code cannot fix: whether
the copy answers what a founder types into a search box or an AI assistant. Report only;
propose changes as a ranked list, do not apply them unless the user asks.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it. Positioning decides which
queries matter; `voice.md` forbids keyword-stuffed copy. The site's own rule stands:
location appears once as trust, never as a ranking keyword.

## 2. Establish the target

- **Repo path** (default: current directory if it holds `app/sitemap.ts` or
  `content/site.ts`): read `references/site-checks.md` (relative to this skill's folder)
  and run every static check it lists against the code.
- **Live URL**: fetch the pages the sitemap lists and run the live checks in the same file.
  If the host cannot fetch, say so and audit the repo only.
- Both when both are available. Never guess the state of a page you did not read.

## 3. Check the plumbing (fast, mechanical)

Work through `references/site-checks.md` and record pass, fail, or not checked for each
item. Anything failing is a fix-list entry with the file or URL.

Performance: if `lighthouse` or a Lighthouse tool is available, run mobile on `/` and the
newest case study; compare against the site's budget (mobile performance at or above 90;
first-load JS at or under 678 KB raw and 216 KB gzip for `/`). Without a tool, mark it not
checked.

## 4. Check the copy against real queries

This is the part that moves rankings. From `references/query-map.md`, take the query
families a QBLab client would use, then for each landing section and case study ask:

- Does a heading or the first sentence of the section answer the query in the reader's
  words? (Not "What we build" but the phrase they would type.)
- Is there a page at all for the query family, or is it a paragraph buried on the landing
  page? A missing page is a page idea, not a copy edit.
- Do case studies name the sector and the product type in plain words the summary and
  title, so "telehealth platform for clinics" is findable?
- Does `llms.txt` and the FAQ JSON-LD answer the questions an assistant is asked ("how
  much does it cost", "who owns the code", "how long does it take")?

Do not propose adding "Dubai" or "UAE" to headings; the site's rule forbids location as a
ranking signal. Do not propose a keyword density change. Propose pages, headings, and
first sentences.

If the host has web search, check the top results for three of the query families and
note what those pages have that qblab.co lacks (a page type, a comparison, a price
anchor, a checklist). One line each.

## 5. Report

Fill `references/report-template.md`. The fix list is ranked by expected effect divided
by effort, each item one line with a file or URL and the change in plain words. Page and
post ideas carry the query family they serve and a working title in QBLab's voice; the
`blog-post` skill takes those titles as input. Save to `docs/seo/YYYY-MM-DD-audit.md`
inside the site repo when auditing the repo, otherwise to `~/.qblab/seo/`. Print the
report.

End with the top three fixes, one line each.
