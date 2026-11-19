---
description: "Summarize this session and write the summary into the latest Daily-Bullet-Journal entry"
argument-hint: "Optional: topic or focus for the summary"
agent: "agent"
---

Summarize this session, then write that summary into the user's Obsidian daily journal. The entry *is* the summary — one artifact, no separate prose version.

## Target

`/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Daily-Bullet-Journal/journals/<YYYY>/<MM-Month>/<YYYY_MM_DD>.md`

- Month folder = zero-padded month + English month name, e.g. `2026/10-October/2026_10_31.md`.
- Default to today; use a different date if the user names one.
- If today's entry doesn't exist, fall back to the most recent existing entry (walk back day by day, crossing into the previous month/year folder when needed). A session that runs past midnight, or one held before the day's note has been created, still belongs in the latest entry — say which date you used.
- Only when no entry exists at all: say so and stop. Do not scaffold a new journal.

## What to write

This is a work record. The non-negotiable part is **what the session completed** — that is the summary; the takeaways are a garnish and may be absent.

When a caller (`/summarize-task`) asks for the summary as text, return the topic line and task bullets you wrote, in the same shape. Do not re-word them into a prose paragraph, and never add a second entry.

1. Reconstruct the session from the local session store (`copilot_sessionStoreSql`, requires `github.copilot.chat.localIndex.enabled`); fall back to conversation context. Never invent details.
2. Name the big picture in one line: which area of the work this session advanced. That becomes the topic bullet — a noun phrase is fine here — so the day reads as a theme, not a pile of trivia.
3. Under it, list the completed tasks in the order they landed — one bullet each. **Open every task bullet with a past-tense verb**: Added, Moved, Dropped, Replaced, Fixed, Built, Rewrote, Split, Renamed. A task bullet is a verifiable outcome: what changed, where it lives (file, route, command, data source), and the effect. Carry the specifics: `src/pages/lifelog.astro`, `/now/en`, `fetch-all.mjs`, `0.55 → 0.99`. Someone reading in six months should be able to point at the thing.
4. Report the final state, not the route taken. Drop attempts that were reverted, and don't log both sides of a reversal.
5. Add takeaways only where you'd act differently next time. A real takeaway has the shape "do A, not B, because C", with the names filled in. If the mechanism can't be stated that plainly, it isn't a takeaway — cut it. One or two is plenty; zero is fine.

Skip only what left no artifact: installs, retries, formatting churn, dead ends already reverted.

## Format

Append to the end of the `# Wins I Achieved` section, matching the file's existing style (`*` bullets, TAB-indented sub-items). Two levels deep, no more:

```text
* <area this session advanced> — <what it now does>
	* [x] <Verb + what shipped, with its file/route/command and the effect>
	* [x] <Verb + what shipped>
		* <lesson: do A, not B, because C>
```

Keep it short. If a lesson deserves depth, write one line pointing at the permanent note instead of pasting the explanation.

## Fails the bar

- Abstract head-nouns with no referent: "the MT-pipeline constraint", "single-source", "the whitespace trap", "better DX", "tradeoffs". Say which file, which symptom, which fix.
- A line that still reads fine after deleting every specific name. It sounds like wisdom and teaches nothing.
- Lessons about effort or attitude ("be careful with…", "this took longer than expected").
- Task bullets that start with a noun phrase instead of a verb: "`/now` bilingual support", "CI data pipeline". Restate as the action that shipped.
- No inventory of completed tasks, or a bullet per commit.

## Rules

- English prose, keeping Chinese terms where they carry meaning.
- Do not restructure, reorder, or "fix" existing journal content.
