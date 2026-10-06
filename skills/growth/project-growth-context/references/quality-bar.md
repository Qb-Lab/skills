# Quality bar

The test for everything the Growth OS produces: **would a good marketer who knows this
product publish it?** Not "is it grammatical" or "does it sound impressive". If the honest
answer is no, change the idea, not the wording.

## 1. Specific or cut

Take any sentence and swap in a competitor's name. If it is still true, it says nothing.
Replace it with something only this project can say (a real feature, a real number, a real
moment from building it, a real user's words), or delete it.

- Bad: "Post consistently on social media to build awareness."
- Good: "Ship three 20-second clips of the receipt scan this week; the scan-to-total moment
  is the only thing in the product that reads in two seconds."

## 2. Writing that does not sound generated

Banned outright (in any language):

in today's fast-paced world · game-changer · revolutionize · unlock the power of · unleash ·
elevate · empower · seamless · cutting-edge · next-level · supercharge · take X to the next
level · whether you're X or Y · say goodbye to · look no further · it's not just X, it's Y ·
here's the thing · let that sink in · the future of X is here · we're thrilled / excited to
announce · dive in / deep dive · in conclusion · at the end of the day

Plus everything in the project's own banned-phrases line.

Structural tells to remove on the edit pass:

- **Threes everywhere.** Lists of exactly three adjectives or three benefits by reflex. Use
  the number of things there actually are; often it is one.
- **The reveal contrast.** "It's not about X. It's about Y." Say Y.
- **Rhetorical questions** as openers or transitions ("Tired of X?", "The result?").
- **Em-dash pile-ups** and a colon in every headline. One per piece at most; a full stop
  usually does the job.
- **The tidy ending.** An inspirational last line, a moral, a summary of what was just
  said. Stop when the point is made.
- **Uniform rhythm.** Every sentence the same length, every paragraph the same shape. Let a
  short one sit next to a long one. A fragment is fine.
- **Emoji as bullets**, more than one emoji in professional copy, hashtag walls.
- **Hedged everything** ("can help you potentially"). Say it or do not.
- **Announcing instead of saying.** "I want to share something" followed by the thing.
  Start with the thing.

What to do instead: concrete nouns, numbers that came from somewhere, the product's real
vocabulary, one idea per piece, the reader as the subject, the register of the platform.
Slightly rough and true beats polished and empty; do not sand every sentence.

## 3. Claims

- Every number, outcome, name, quote and comparison in publishable copy traces to a source
  in the context, the state files, or something the owner said. No source: cut it, or leave
  `INPUT_NEEDED: <what>` in the draft where the owner will see it.
- Research and strategy output labels each claim `Observed` (with URL or file and date),
  `Inferred` (from which observations) or `Hypothesis` (a bet to test). A trend needs
  several independent, dated observations; one viral post is an anecdote.
- Small numbers are reported as small numbers. No percentages when the denominator (the
  posts, visitors or events the rate is computed over) is under about 30; no ratios such as
  "3x" without the counts beside them; no
  "winner" from a handful of posts, never "statistically significant" without a real test.
- Comparisons with competitors state only what a linked source shows, dated.

## 4. Never

Fabricated testimonials, reviews, customers, logos, metrics, press mentions, awards or
scarcity. A generated image or voice presented as a real customer or a real person.
Impersonation. Deceptive reviews or ratings. Sockpuppet accounts, astroturfing, vote
manipulation, mass messages to people who did not ask. Copying a competitor's content or a
creator's script. Invented research or statistics. Health, financial or legal claims the
product cannot substantiate. Anything the context's constraints forbid.

## 5. Visuals

The parallel test: **would someone immediately say "that's an AI image"?** If yes, redesign
the concept before generating anything. Real assets (screenshots, recordings, photos) come
first. The `creative-director` skill holds the detail.

## 6. The critique round

For high-value assets only: positioning and messaging, a launch campaign's message house,
hero and landing copy, a campaign's lead creative brief, paid ad copy. Not for a routine
post.

1. Finish the draft.
2. Critique it as a separate pass, against this rubric, scoring each 1 to 5 with one line
   of evidence: **genericness** (survives the swap test?), **clarity** (the point in one
   read), **credibility** (every claim sourced), **specificity**, **audience relevance**
   (their words, their problem), **hook strength**, **AI-sounding language** or **visual
   cliché**, **conversion intent** (is the next step obvious and proportionate).
3. If a second model is available (see `capabilities.md`), give it the draft, the relevant
   context lines and this rubric, and ask for the three weakest points only. Otherwise run
   the pass yourself, reading as the most sceptical member of the audience.
4. Revise once. Fix what scored 3 or lower; ignore taste-only notes.
5. A second round only if the first found a credibility or clarity failure. Never a third
   unless the owner asks. Say in the output that a critique round ran and what it changed,
   in two lines.
