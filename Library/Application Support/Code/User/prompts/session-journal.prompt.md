---
description: "Log this session's takeaways into today's Daily-Bullet-Journal entry"
argument-hint: "Optional: topic or focus for the summary"
agent: "agent"
---

Write this session's takeaways into the user's Obsidian daily journal.

## Target

`/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Daily-Bullet-Journal/journals/<YYYY>/<MM-Month>/<YYYY_MM_DD>.md`

- Month folder = zero-padded month + English month name, e.g. `2026/10-October/2026_10_31.md`.
- Default to today; use a different date if the user names one.
- If the file doesn't exist, say so and stop. Do not scaffold a new journal.

## What to write

1. Work out what actually happened: decisions made, things learned, problems solved, what's still open. Prefer the local session store (`copilot_sessionStoreSql`, requires `github.copilot.chat.localIndex.enabled`) over your own recollection of the chat; fall back to conversation context when unavailable. Never invent details.
2. Pick 1–4 takeaways that will still matter in six months. Skip mechanical steps (installs, renames, retries) and anything already obvious from the diff.
3. Write 2–5 bullets. Each bullet carries one concrete takeaway, not a log line, and leads with the noun (tool, concept, decision) rather than "I".
4. Write it straight into the file. No draft, no approval step.

## Format

Append to the end of the `# Wins I Achieved` section, matching the file's existing style (`*` bullets, TAB-indented sub-items):

```text
* <one-line topic> — <what it was>
	* <takeaway>
	* <takeaway>
```

Keep it short. If a takeaway deserves depth, write one line here pointing at the permanent note instead of pasting the explanation.

If the caller supplies a commit message, add it as the last TAB-indented sub-bullet under that topic bullet, using only the subject line:

```text
	* Commit: `<subject line>`
```

## Rules

- English prose, keeping Chinese terms where they carry meaning.
- Do not restructure, reorder, or "fix" existing journal content.
