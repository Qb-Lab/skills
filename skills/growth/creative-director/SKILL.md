---
name: creative-director
description: >
  Directs the visual for a post, campaign or product: decides how it should be made (existing
  asset, phone shoot, composite or generated), writes a structured creative brief (concept,
  composition, subject, setting, camera, lighting, realism, typography, layout, brand, aspect
  ratio), then generates the image when the host has an image tool or hands off a
  production-ready prompt when it does not. Use when the user says "what should the visual
  be", "make an image for this post", "creative brief for the campaign", "this looks too AI",
  "design the cover", or "produce the image from this brief".
disable-model-invocation: true
argument-hint: "<content id, post, campaign or concept> [mode] [platform] | produce <brief file>"
---

# Creative director

Decide what the picture is for before deciding what is in it. The job is a concept a viewer
understands in one glance and does not clock as generated marketing, not a longer prompt. A
real screenshot or a phone photo beats a generated image almost every time, so generation is
the last resort and the brief always comes first. Draft and produce only; the owner publishes.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Brand section (visual style, colors, fonts, assets
available), Content rules (who may appear on camera), Constraints and Tools, and on
`<state>/content-log.csv`, `<state>/drafts/` and `<state>/campaigns/` for the piece being
illustrated.

## 2. Resolve the job

- **`produce <brief file>`:** read that brief and go straight to section 6.
- **A content id, calendar item or draft:** read the row and the draft so the visual serves
  the hook that is already written. A visual that needs the caption to make sense has failed.
- **A campaign:** read its plan; the hero asset comes first and the rest derive from it.
- **A loose concept:** state the message in one sentence and confirm the platform before
  going further. No platform, no aspect ratio, no brief.

Write down the visual objective in one line: stop the scroll, show the product working, make
a claim believable, or make the reader feel recognised. One objective per asset.

## 3. Decide how it gets made

Take the first option that can carry the concept, and say why the earlier ones could not:

1. **An asset that already exists:** screenshots, recordings, photos, illustrations listed in
   the context or found in the repository. Crop, annotate or sequence it.
2. **A capture or shoot brief:** something the owner can capture in ten minutes: a
   screenshot, a screen recording or a gameplay frame from the running product, or a phone
   photo. Describe the capture; do not generate a substitute for something that could
   simply be taken.
3. **A composite:** a real screenshot or product photo placed into a real or generated scene.
4. **A fully generated image:** only when the subject cannot be shot and is not the product's
   interface.

Never fabricate an interface when screenshots exist, and never present a generated person as
a real customer, user or team member.

## 4. Pick the mode and write the brief

Choose one visual mode from `references/visual-modes.md` (relative to this skill's folder):
UGC, editorial, product, founder, documentary, meme, UI/product demo, or lifestyle. The mode
follows from the platform and the objective, not from taste; the file says when each fits
and what breaks it.

Fill `references/brief-template.md`. Fields that do not apply to the route (a lens for a
screenshot, a room for a gameplay frame) are `n/a`, never invented. Every other field is a
decision: a named lens
feel, a light source with a direction, a specific room, a specific prop. "Modern, clean,
professional" is not a brief. Colors and fonts come from the context with their source; a
missing brand token is `INPUT_NEEDED`, not a guess. Aspect ratio and safe areas follow the
platform notes in the shared `platform-playbook.md` (in `project-growth-context`'s
`references/`). Any language other than English in the image follows the shared
`languages.md`, including right-to-left layout.

## 5. Run the realism check

Read `references/visual-realism.md` and test the brief against it before anything is
generated. Ask: would someone immediately say "this is an AI image"? If yes, change the
concept, not the adjectives. Text in the image is set with real typography afterwards, never
generated.

For a campaign hero asset, run one critique round on the brief as described in the shared
`quality-bar.md`; two at most, and only when the first changed something material.

## 6. Produce or hand off

Follow `references/generation-handoff.md`. Detect an image capability using the shared
`capabilities.md`. With one: generate, inspect the result against the brief, regenerate at
most twice, and save the files next to the brief. Without one: output the exact prompt, the
negative instructions, the aspect ratio, the reference assets required and the
post-processing checklist, ready to paste into whatever tool the owner uses. For options 1
and 2 in section 3 there is nothing to generate: output the edit list or the shot list.

## 7. Save

Save `<state>/creative/YYYY-MM-DD-<slug>.md` holding the brief, the production route, the
prompt and negative instructions if any, the paths of every generated or source file, and
what remains for the owner (shoot, typography pass, approval). Add the brief path to the
`notes` of the matching `content-log.csv` row; do not change its status.

End with three lines: the concept in one sentence, how it gets made (existing asset, shoot,
composite, generated, or handed off), and the file paths. Nothing else.
