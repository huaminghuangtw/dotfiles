---
description: "Summarizes the session via journal (which writes the journal entry) and drafts a TIL post about what was learned. Use at the end of a working session."
---

**Cache note (fixed prefix):** keep this instruction block unchanged; never restate it in replies. Today's date/session content is variable — derive it from context rather than editing this block.

# Purpose

End a working session: have `journal` summarize the session and log it, then capture the session's lesson as a Today I Learned (TIL) post.

# Instructions

1. Summary + journal: follow [journal](./journal.prompt.md). It reconstructs the session, writes the `# Wins I Achieved` entry, and returns the summary. That summary is your step-1 output — present it as written, do not paraphrase it or compose a second summary of your own. It owns the journal path, section, format, and frontmatter bump; never write the journal any other way, and never add a second entry if it already logged this session.
2. Create a TIL **draft** at `/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Today-I-Learned/posts/<kebab-case-title>.md`:
    - Explain the lesson as if to a five-year-old: simple words, short sentences, and one concrete analogy.
    - Follow the existing posts' conventions: frontmatter with `title`, `created` (today, `YYYY-MM-DD`), `modified` (same), `draft: true`, and `sources` (empty unless the session used external sources). Always include `draft: true` so the post stays unpublished until reviewed.
    - Start the body with "Today I learned…", use a few plain-language sections, and end with a `**Key takeaway:**` line.
    - Only document a real lesson from the session. If nothing new was learned, skip this step and say so.
    - If an existing post already covers the same lesson, update that post instead of creating a duplicate.
    - Do **not** run any commands.
