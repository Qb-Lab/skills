# Voice modes

A mode is who is talking. The platform decides the shape (the shared `platform-playbook.md`
in `project-growth-context`'s `references/`); the mode decides the register. They combine:
"founder on Reddit" and "founder on LinkedIn" are the same person in two rooms. The project's
own Brand section always wins over the defaults here.

Samples use made-up products. Any number in a sample is illustrative; in real output every
number needs a source.

## Founder

One person, first person singular, talking about what they did and what happened.

- **Sounds like:** decisions, costs and mistakes with dates. "I", not "we at". Admits what is
  not working yet. Technical or commercial detail a marketer would not know to include.
- **Breaks when:** it becomes a lesson for everyone ("here's what I learned about
  leadership"), announces feelings ("thrilled", "humbled"), or hides the number.
- **Sample:** "I shipped the import screen on Friday and nobody used it. Eleven people opened
  it. Zero finished. Turns out asking for a bank login on screen one is a great way to find
  out how little people trust you."

## Professional

The company speaking to buyers who will be judged for choosing it. Calm, exact, unhurried.

- **Sounds like:** what the product does, for whom, with what limit. Plain verbs. States the
  constraint before the reader has to ask ("works with PDFs and scans; not handwriting").
- **Breaks when:** it reaches for scale words ("enterprise-grade", "seamless", "robust"),
  stacks adjectives, or sounds like nobody in particular wrote it.
- **Sample:** "The export now matches your chart of accounts on the first run. You map the
  columns once; every invoice after that lands in the right place. Handwritten invoices
  still need a person."

## Educational

Someone who does the work showing one thing they know.

- **Sounds like:** one technique, shown on a real example, usable without buying anything.
  Says when the technique does not apply.
- **Breaks when:** it becomes a listicle of five shallow tips, opens with "Did you know", or
  saves the useful part for a link.
- **Sample:** "If a level can only be solved by guessing, players quit at exactly that level
  and blame themselves. Check it this way: run a solver that is only allowed to make forced
  moves. If it gets stuck, so will they."

## Humorous

Funny because it is true about the audience's life, not because it has jokes in it.

- **Sounds like:** a situation the reader has been in, described flatly. Understatement.
  The product is a prop at most. Short.
- **Breaks when:** it explains the joke, uses a meme format from memory instead of one seen
  live this month, punches at users or competitors, or bolts a sales line on the end.
- **Sample:** "Budgeting app notifications, ranked: 1. 'You're on track.' 2. Nothing. 3.
  'We noticed a transaction at 2:14am.' Please. I also noticed."

## Technical

An engineer writing for engineers. Precision is the personality.

- **Sounds like:** versions, limits, numbers with units, what was measured and how. Shows
  the command, the config or the trace. Names the trade-off that was accepted.
- **Breaks when:** it says "blazing fast" instead of the latency, hides the benchmark
  method, or simplifies until it is wrong. Engineers forgive dry; they do not forgive vague.
- **Sample:** "Totals extraction went from two model calls to one plus a checksum: sum the
  line items, compare to the parsed total, re-read only on mismatch. Median time per invoice
  dropped; the long tail did not, because scans with skew still take the slow path."

## Opinionated

A position the product actually embodies, argued by someone who would defend it in replies.

- **Sounds like:** the common belief, stated fairly; why it fails, with one concrete case;
  what to do instead. Willing to lose some readers.
- **Breaks when:** the opinion is one nobody disagrees with ("quality matters"), it attacks
  people rather than practices, or it hedges every line until there is no position left.
- **Sample:** "Categories are why budgeting apps die in week two. Nobody wants to file 60
  transactions on a Sunday. We took them out. You get one number: what you can spend before
  payday. Some people hate it. They are usually accountants."

## Choosing

| Situation | Mode |
| --- | --- |
| Early stage, founder visible, audience follows builders | founder |
| Buyers with a boss to answer to; regulated or high-trust category | professional |
| The buyer must understand something before they can want it | educational |
| Consumer feed, humor allowed in the context | humorous |
| Developer tool, API, infrastructure, technical buyer | technical |
| A crowded category where the product made a different choice | opinionated |

One mode per piece. A founder post with a professional paragraph in the middle reads like
two people wrote it, because two voices did.
