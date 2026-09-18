# Query map

The searches a QBLab client makes, grouped by intent. Use these to test whether the copy
answers the question in the reader's words. Add families as evidence appears in Mixpanel
UTM sources, call notes, or search console; remove ones that never bring anyone.

## Hire intent (highest value)

- "software development agency for startups"
- "hire a team to build my app"
- "build an mvp in weeks"
- "app development agency subscription" / "product team on a monthly plan"
- "fixed price app development"
- "agency that builds web and mobile app together"

Where it should be answered: hero and the "What we build" and "Plans" sections, each with
a first sentence a searcher recognises.

## Cost and time intent

- "how much does it cost to build an app"
- "how long does it take to build an mvp"
- "mvp development cost"

Where: the FAQ (already answers "why no prices" and "how fast is weeks") and a dedicated
explainer page or post, since the landing page must not carry prices.

## Trust intent

- "who owns the code when an agency builds it"
- "what happens if I stop working with my dev agency"
- "ai generated code quality review"

Where: FAQ entries exist; a post per question would rank on its own.

## Sector intent (from shipped work)

- "telehealth platform development for clinics"
- "ai product recommendations for online store"
- "meal planning app development"

Where: case-study titles and summaries; the case study is the landing page for these.

## Comparison intent

- "agency vs freelancer for mvp"
- "no-code vs custom app for startup"
- "in-house developer vs agency subscription"

Where: nothing today. Each is a post idea with a clear winner stated honestly.

## Answer-engine questions (what assistants get asked)

- "recommend a small agency that builds complete products fast"
- "does QBLab publish prices"
- "what stack does QBLab use"

Where: `llms.txt`, FAQ JSON-LD, and the stack list. Check the answers are literal, not
implied.
