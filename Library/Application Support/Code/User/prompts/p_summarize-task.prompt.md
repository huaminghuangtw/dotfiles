---
description: "Summarizes the session via session-journal (which writes the journal entry), drafts a TIL post about what was learned, and proposes a git commit message. Use at the end of a working session."
---

**Cache note (fixed prefix):** keep this instruction block unchanged; never restate it in replies. Today's date/session content is variable — derive it from context rather than editing this block.

# Purpose

End a working session: have `session-journal` summarize the session and log it, capture the session's lesson as a Today I Learned (TIL) post, and propose a git commit message.

# Instructions

1. Summary + journal: follow [session-journal](./session-journal.prompt.md). It reconstructs the session, writes the `# Wins I Achieved` entry, and returns the summary. That summary is your step-1 output — present it as written, do not paraphrase it or compose a second summary of your own. It owns the journal path, section, format, and frontmatter bump; never write the journal any other way, and never add a second entry if it already logged this session.
2. Create a TIL **draft** at `/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Today-I-Learned/posts/<kebab-case-title>.md`:
    - Explain the lesson as if to a five-year-old: simple words, short sentences, and one concrete analogy.
    - Follow the existing posts' conventions: frontmatter with `title`, `created` (today, `YYYY-MM-DD`), `modified` (same), and `sources` (empty unless the session used external sources).
    - Start the body with "Today I learned…", use a few plain-language sections, and end with a `**Key takeaway:**` line.
    - Only document a real lesson from the session. If nothing new was learned, skip this step and say so.
    - If an existing post already covers the same lesson, update that post instead of creating a duplicate.
    - Do **not** run any commands.
3. Write a git commit message based on this task. Do **not** run any commands — just present the commit message as plain text. If step 1 already wrote this session's entry, hand the subject line back to `session-journal` so it appends the `Commit:` sub-bullet there.
