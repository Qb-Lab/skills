# Site checks

Mechanical checks for a Next.js App Router marketing site built the qblab.co way. Record
each as pass, fail, or not checked with the file or URL.

## Static (repo)

| Check | Where | Pass when |
| --- | --- | --- |
| Canonical origin | `NEXT_PUBLIC_SITE_URL`, `lib/seo.ts` | `metadataBase` is the production origin, https, no trailing slash |
| Title template | `lib/seo.ts` root metadata | `%s · QBLab`; default title is brand plus tagline |
| Per-route canonical | every `page.tsx` | uses `pageMetadata(path)` or sets `alternates.canonical` to its own path |
| One `h1` per page | landing, case studies, legal, blog | exactly one |
| Sitemap | `app/sitemap.ts` | lists `/`, complete case studies only, legal pages; excludes blog while gated and incomplete studies |
| Robots | `app/robots.ts` | allows all, disallows `/api/`, points at the sitemap |
| `llms.txt` | `app/llms.txt/route.ts` | built from `content/`, lists complete case studies, states no prices |
| JSON-LD on `/` | `components/seo/json-ld.tsx` | `Organization`, `WebSite`, `Service`, `FAQPage`, all derived from `content/` |
| JSON-LD on case studies | same | `BreadcrumbList` |
| Open Graph images | `app/opengraph-image.tsx`, `app/work/[slug]/opengraph-image.tsx` | render with the committed static font files |
| Case-study completeness | `content/work.ts`, `isComplete()` | incomplete studies are `noindex` and out of the sitemap; list which are incomplete |
| Placeholders | grep `INPUT_NEEDED` in `content/` | none on pages that are indexed |
| Manifest | `app/manifest.json` | name, maskable icons, theme colour |
| Blog gate | `BLOG_ENABLED` in `content/site.ts` | consistent: routes 404, sitemap excludes, no UI links while false |
| Performance budget | README | mobile Lighthouse ≥ 90 on `/`; first-load JS ≤ 678 KB raw / 216 KB gzip |

## Live (fetch)

| Check | Pass when |
| --- | --- |
| `GET /` returns 200 with the canonical `<link>` pointing at itself | |
| `GET /sitemap.xml`, `/robots.txt`, `/llms.txt` return 200 with the expected content | |
| Every sitemap URL returns 200 and its canonical matches the sitemap entry | |
| `www` and `http` redirect to the canonical origin with 301 | |
| Each indexed page has `<title>`, `<meta name="description">` under 160 characters, `og:image` reachable | |
| JSON-LD parses (validate with a schema tool if available) | |
| No page linked from navigation is `noindex` | |
| Blog routes 404 while gated | |

## Not the audit's job

Keyword density, meta keywords, backlink buying, adding the location to headings, or any
change that would make the copy read worse to a founder than it does now.
