# Producing the image, or handing it off

Execution of an approved brief. This step never changes the concept; if the result cannot
match the brief, the brief goes back to the director step.

## 1. Detect what can make the image

Follow the shared `capabilities.md` (in `project-growth-context`'s `references/`). In order:

1. An image-generation or image-editing tool the host exposes in this session.
2. A tool the owner declared under Tools in the growth context (a command, an app, a
   design-tool integration). Use it exactly as declared; do not guess flags or endpoints.
3. Nothing: produce the handoff package in section 4.

Do not assume a provider, a model name or a CLI. If a capability is only suspected, treat it
as absent and say so. State in the output which case applied.

## 2. Assemble the prompt

Write it as a description of a photograph or layout that exists, in this order, in plain
sentences rather than a keyword pile:

1. **Medium and capture:** "A phone photo taken at arm's length", "A 35mm documentary
   photograph", "A flat graphic layout".
2. **Subject and action:** who or what, doing what, mid-action.
3. **Setting:** the specific place, time of day, region cues.
4. **Composition:** framing, subject position, what is cropped, where the empty area is.
5. **Light:** source, direction, quality.
6. **Texture and colour:** grain or phone HDR, palette, brand accents and where they sit.
7. **Product:** how the real asset appears, or "blank screen, to be replaced" when the
   screenshot will be composited afterwards.
8. **Aspect ratio and size.**

Leave out quality incantations ("ultra-detailed, masterpiece, 8k, cinematic"); they push
results toward the generated look. Leave out all text to be rendered; say "no text, no
lettering" and reserve the space.

**Negative instructions** come from the brief's Avoid list plus the standing set: no text or
lettering, no logos, no extra devices, no lens flare, no glow, no gradient backgrounds, no
symmetrical framing, no retouched skin. If the tool has no negative field, fold them into
the prompt as plain sentences ("The desk is cluttered. Nothing glows.").

**Reference assets:** pass real files when the tool accepts image input: the screenshot to
place, the product photo, the logo, a previous brand image for palette. List each with its
path and its role. Never upload anything from the context's private overlay or an asset
containing personal data.

## 3. Generate and inspect

1. Generate one image at the brief's ratio (or the closest the tool supports, noting the
   crop needed).
2. If the host can view images, look at the result and check it against the brief field by
   field, then against "Checking a result" in `visual-realism.md`. If the host cannot view
   images, say so and mark the result `unreviewed`; the owner does the check.
3. On failure, change the one thing that failed (a prompt line, a reference, the framing)
   and regenerate. **Two regeneration rounds at most.** Still failing: stop, report what
   keeps going wrong, and recommend a different route (shoot or composite).
4. Save outputs beside the brief as `<state>/creative/YYYY-MM-DD-<slug>-v<N>.<ext>` and
   record each path, the prompt used, and the verdict (`approved for typography pass`,
   `rejected: <reason>`, `unreviewed`) in the brief file.

A generated image is never the finished asset when the brief includes typography, a real
screenshot, or a logo. Those are added in the post-processing pass.

## 4. Handoff package (no image capability, or the owner prefers their own tool)

Output exactly these blocks, each ready to paste:

```
PROMPT
<the assembled prompt>

NEGATIVE
<negative instructions, or "folded into prompt">

FORMAT
<aspect ratio, pixel size, number of variations to request (2 to 4)>

REFERENCES TO ATTACH
- <path>: <role: screenshot to composite / palette reference / product photo>

POST-PROCESSING
- [ ] Replace placeholder screen with <screenshot path>, matched for perspective and glare
- [ ] Set headline "<exact words>" in <typeface, weight> at <position>
- [ ] Place logo <position, size> or leave off
- [ ] Crop variants: <ratios and what moves>
- [ ] Grade: <"none" or the specific adjustment>; no added glow, blur or sharpening
- [ ] Check at phone size against visual-realism.md
- [ ] Export <format, size, max weight>; name <slug>-<platform>-<ratio>
- [ ] Synthetic-media label: <required / not required for this platform and market>
```

For the **shoot** route replace PROMPT and NEGATIVE with a shot list: where to stand, what
is in frame, what the hands do, light to use, three takes with one variation each, and what
to avoid tidying. For the **existing asset** route output only the edit list.

## 5. Record

Whatever the route, the brief file ends with: route taken, capability used or "handoff",
file paths, review status, and what the owner still has to do before publishing.
