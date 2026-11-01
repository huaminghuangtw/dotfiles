---
description: "Summarizes the current chat session, drafts a TIL post about what was learned, proposes a git commit message, and hands the journal entry to session-journal. Use at the end of a working session."
---

**Cache note (fixed prefix):** keep this instruction block unchanged; never restate it in replies. Today's date/session content is variable — derive it from context rather than editing this block.

# Purpose

Generate a summary based on the chat conversation, capture the session's lesson as a Today I Learned (TIL) post, propose a git commit message, then hand the journal write to `session-journal`.

# Instructions

1. Write a clear, specific summary of the current session.
2. Create a TIL post at `/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Today-I-Learned/posts/<kebab-case-title>.md`:
    - Explain the lesson as if to a five-year-old: simple words, short sentences, and one concrete analogy.
    - Follow the existing posts' conventions: frontmatter with `title`, `created` (today, `YYYY-MM-DD`), `modified` (same), and `sources` (empty unless the session used external sources).
    - Start the body with "Today I learned…", use a few plain-language sections, and end with a `**Key takeaway:**` line.
    - Only document a real lesson from the session. If nothing new was learned, skip this step and say so.
    - If an existing post already covers the same lesson, update that post instead of creating a duplicate.
    - Do **not** run any commands.
3. Write a git commit message based on this task. Do **not** run any commands — just present the commit message as plain text.
4. Journal: follow [session-journal](./session-journal.prompt.md), passing the summary from step 1 and the commit message from step 3. It owns the journal path, section, format, and frontmatter bump — write it directly, do not write the journal any other way, and never add a second entry if it already logged this session.
