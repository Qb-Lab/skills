# Creator and streamer outreach

For projects whose audience follows people rather than forums: games (streamers, video
creators), consumer apps and ecommerce (creators, reviewers), developer tools (people who
make tutorials and newsletters). It is the same ladder as communities, applied to
individuals: be relevant, be useful to their audience, ask once.

This is individual, researched outreach to people who publicly accept pitches. It is not
mass messaging, and it never goes to community members' inboxes.

## Who to pick

- **Fit before size.** Someone who already covers this genre or problem for a small, engaged
  audience beats a large general account. Start with small and mid-size creators; the
  largest get hundreds of pitches and rarely reply to a product nobody has covered yet.
- **Evidence of fit:** two or three of their recent pieces that are about this genre or
  problem, with URLs and dates. No evidence, no row.
- **A public way to pitch:** a business email, a press or key-request form, a stated "DMs
  open for business". If they publish no contact route for pitches, do not contact them.
- Five to ten people per run. A list of fifty is a mail merge.

Without live research, build the list only from names the owner supplies, and mark fit as
`INPUT_NEEDED: check recent content`. Never list a creator from memory as if verified.

## The list

Saved as a `## Creators` table in `<state>/communities.md`:

```
| creator | platform and URL | audience (as shown, with date) | why they fit (their pieces, dated) | contact route | status | last touch | notes |
```

`status`: `candidate` → `drafted` → `sent` → `replied` → `covered` / `declined` / `silent`.
Only the owner's word moves a row past `drafted`.

## The pitch

One message per person, written for that person. Under 120 words.

1. **First line is about their work,** specific enough that it could not be sent to anyone
   else (the video, the moment in it, why it connects).
2. **What this is, in one sentence,** in plain words, with the one thing that makes it worth
   their audience's time.
3. **What is on offer:** a key, early access, a build, the product, an interview, raw
   footage. Something they can use, with no condition attached.
4. **One easy next step,** and an explicit out ("no reply needed if it is not for you").
5. Signed by the person who made the thing.

- Bad: "Hi! We're a passionate indie studio and we'd love for you to check out our amazing
  new game. We think your audience would love it! Let us know your rates."
- Good: "Your video on the water levels in <game they covered> is why I'm writing: the bit
  where you said most puzzle-platformers explain too much. I'm a solo dev making a
  hand-drawn one where you grow bridges by carrying light, no tutorial text. A Steam key
  for the demo build is below if you want it; no need to cover it. Happy to send clean
  gameplay footage too."

## Rules

- The agent drafts; the owner sends, from their own account. Nothing is sent, submitted or
  followed by the agent.
- One follow-up at most, a week or more later, and only with something new (a demo date, a
  build). Then the row is `silent` and stays that way.
- No payment, key or product is offered in exchange for a positive opinion. Paid or gifted
  coverage must be disclosed by the creator under the rules of their platform and market;
  the pitch says the owner expects that.
- No claims the product cannot support, no invented traction ("everyone is playing it").
- Budget and paid partnerships are the owner's decision: if the context shows no budget,
  the pitch offers access only and never asks for rates.
- Coverage that happens is logged in `content-log.csv` (channel `creator:<name>`, with the
  URL), and what worked goes to `learnings.md` through the weekly review.
