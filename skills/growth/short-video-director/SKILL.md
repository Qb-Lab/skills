---
name: short-video-director
description: >
  Turns an idea or a feature into a shootable short-form video for TikTok, Reels or Shorts:
  concept, hook and first frame, second-by-second structure, shot list, B-roll, on-screen
  text, narration, caption, cover and audio direction, with two alternate hooks to test and a
  handoff for an editor or a video tool. Use when the user says "make a TikTok about this",
  "script a Reel", "short video for this feature", "video ideas need scripts", "how do I film
  this", or "the hook is weak".
disable-model-invocation: true
argument-hint: "<content id, idea or feature> [format] [platform]"
---

# Short video director

The first one to three seconds decide whether anything after them is seen, so the script is
written hook first and everything else is built to pay that hook off. Write for what the
owner can actually record this week with a phone and the real product. A script nobody can
shoot is a document, not a video. Draft only; the owner records and publishes.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Product section (what is demonstrable in under 30
seconds), Content rules (who may be on camera, humor), Brand, Constraints and Tools, and on
`<state>/content-log.csv`, `<state>/audience.md` and `<state>/learnings.md` when they exist.

## 2. Resolve the idea and the one point

- **A content id or calendar item:** read the row; keep its bucket, objective and
  experiment link.
- **An idea or feature:** check the log for a repeat using the rule in the shared
  `state.md` (in `project-growth-context`'s `references/`), then continue.

State the video's single point as one sentence a viewer could repeat to a friend. If it
takes two sentences, it is two videos. Read `learnings.md` for hooks, formats and lengths
that have already won or lost, and say when one of them shaped this script.

## 3. Choose the format

Pick one from `references/video-formats.md` (relative to this skill's folder): screen
recording demo, talking head, UGC, founder story, before/after, challenge, reaction,
educational, trend adaptation, or comedy/skit. The choice follows from what is demonstrable,
who is willing to be on camera, and the platform notes in the shared
`platform-playbook.md`. If the context says nobody appears on camera, do not write a talking
head and hope; choose screen recording, hands-only UGC or before/after.

## 4. Write the hook and the first frame

Use the shared `hooks.md`. Open on the result, the problem, or a curiosity gap, already in
motion:

- Bad: "Hi guys, today I'm going to show you our new export feature."
- Good: first frame is the finished invoice landing in the spreadsheet; on-screen text
  "40 PDFs, zero typing"; narration starts "This took eleven seconds."

The first frame must work with the sound off and before any text is read: something is
moving, changing, or visibly wrong. No logo sting, no greeting, no "wait for it". Write two
alternate hooks that change one thing each (the claim, the first frame, or the opening
line) so they can be tested; if the installed `growth-experiment` skill is available, say
which variable each alternate isolates.

## 5. Write the script

Fill `references/script-template.md` completely: 0–3 s, 3–8 s, main section, reveal or
payoff, CTA, shots, B-roll, on-screen text, narration, caption, cover, audio direction,
duration target, and what the owner must record. Rules:

- **Real product footage only.** Screen recordings come from the running product with
  realistic data; never describe or fabricate an interface that does not exist. A feature
  not yet shipped is `INPUT_NEEDED: recording of <feature>`.
- **Every number, outcome and name is sourced** from the context or the owner. No invented
  results, no implied customer.
- **Narration sounds spoken.** Contractions, short clauses, one breath per line. Run it
  against the shared `quality-bar.md`; cut any line that only announces the next line.
- **On-screen text is a second track, not subtitles of the narration:** six words or fewer
  per card, inside the platform's safe area.
- **The payoff arrives before the CTA,** and the CTA is one action that fits the platform's
  norm. Many videos need no spoken CTA at all; the caption carries it.
- **Audio:** describe the direction (tempo, energy, voice-led or music-led, a sound effect
  on the reveal). Do not name a "trending sound" unless it was verified live in this
  session with a link and a date; trends expire in days.
- **Language:** write natively per the shared `languages.md`; narration and on-screen text
  are not translations of an English draft.

## 6. Prepare the handoff

Check the shared `capabilities.md`. If the host or the context's Tools section exposes a
video editing or generation capability, fill the template's handoff block for it: ordered
clip list with in and out points, text cards with timing, audio notes, export settings.
Assume no provider; without one, the same block is the brief for a human editor or the
owner's editing app. Generated footage never stands in for the product or for a real
customer. For the cover image, find the installed `creative-director` skill and follow it
when a designed cover is worth the effort; otherwise name the frame to use.

## 7. Save and log

Save `<state>/video/YYYY-MM-DD-<slug>.md`. Update the matching `content-log.csv` row to
`drafted` with the hook, or add a row (`format: short-video`, one row per platform). Never
mark anything `published`.

End with three lines: the hook, the first frame, and what has to be recorded. Nothing else.
