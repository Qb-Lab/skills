# Case-study entry shape

This is the type qblab.co renders at `/work/[slug]` and lists in the Work section. Every
field is required. Unsupplied fields start with `INPUT_NEEDED:` and render visibly so a
placeholder cannot slip into production; an incomplete study is `noindex` and left out of
the sitemap until every field is real.

```ts
export type CaseStudy = {
  slug: string;              // lowercase, hyphens
  title: string;             // product name
  client: string;            // who it was built for, in a few words (name or sector)
  summary: string;           // one sentence: what it is and who it serves (card + meta)
  problem: string;           // what the client had before, and why it wasn't working
  built: readonly string[];  // what QBLab designed, built and shipped, one feature per line
  stack: readonly string[];  // technologies, named plainly
  outcome: string;           // what changed for the client; real, checkable statements only
  duration: string;          // e.g. "Built in 2 months" / "Month 5 of an ongoing subscription"
  year: string;              // year of launch
  liveUrl: string;
  image: string;             // screenshot in public/projects/, rendered at 16:10
};
```

## Register per field (match the existing entries)

- **summary** reads like the public ones: "A telehealth platform for clinics: patients,
  appointments and an AI clinical assistant in one place." Colon, then the three things it
  does.
- **problem** is written from the client's side: what they had, what it cost them, why it
  stopped working. No blame, no tech words unless the client would use them.
- **built** lines start with who does what: "Clinic staff see the day's schedule and
  no-shows on one screen." Five to eight lines. Group web, mobile, backend, AI in that order.
- **stack** uses the site's names: TypeScript, React, Next.js, Flutter, Node.js, NestJS,
  Express, Python, PostgreSQL, MongoDB, Prisma, Tailwind CSS, Docker, Google Cloud, and
  others exactly as their manifests name them.
- **outcome** is one to three sentences. Acceptable without metrics: "Launched in four
  weeks on the client's own accounts; five months later it still ships a feature most
  weeks." Not acceptable: any number, percentage, or revenue figure the owner did not
  supply.
- **duration** matches the wording of the existing entries.

## Example entry (placeholders as the site writes them)

```ts
{
  slug: "careflow",
  title: "CareFlow",
  client: `${INPUT_NEEDED} client name or sector`,
  summary: "A telehealth platform for clinics: patients, appointments and an AI clinical assistant in one place.",
  problem: `${INPUT_NEEDED} what the clinic had before and why it wasn't working`,
  built: [`${INPUT_NEEDED} what was built, one item per line`],
  stack: [`${INPUT_NEEDED} stack`],
  outcome: `${INPUT_NEEDED} what changed for the client`,
  duration: "Built in 2 months",
  year: `${INPUT_NEEDED} year`,
  liveUrl: "https://careflowdemo.netlify.app/",
  image: "/projects/p1.png",
}
```
