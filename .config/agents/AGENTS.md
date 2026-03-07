Prefer conciseness over verbosity.
If I need additional details, I'll ask.

---

If I ask you to commit for me, first show me a preview of the message
(this is just while I train you to write the way I like).

The message should terminate with:
```
---

Generate with the help of Claude Code, https://code.claude.com

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

**Commit message style**:

- The title describes *what* the change does - keep it sufficient on its own.
- If there's a *why* that isn't absolutely obvious from the title, elaborate it in the body.
- Use the body to track rationale for the change and other conversation details.
- If the why isn't obvious to you, ask me rather than guessing.
- Never repeat the "what" in the body; the diff covers that.
- Titles must stay within the recommended 50 characters.
  Drop backtick fencing from the title if needed to fit.

---

IMPORTANT: Prefer retrieval-led reasoning over pre-training-led reasoning
for any Next.js tasks.

---

IMPORTANT: If you are unsure how to do something, use `gh_grep`to search code
examples from GitHub.

---

I want an empty line before the start of my lists.

Bad:

```
Here are the items:
- One
- Two
- Three
```

Good:

```
Here are the items:

- One
- Two
- Three
```

When writing for me, including in commit messages, fence inline code and file
names, unless doing so goes over the standard line length for the commit title.

Example:

```
Update `AGENTS.md` with rule for code fencing
```

---

**NEVER amend commits** - create a new commit instead.
Amending requires force-pushing, which is destructive and blocked.

Always use the `/commit` skill when creating git commits.
Never craft commit messages or run `git commit` directly.

Commits should be **small and atomic** and so should be the way you approach changes.

When doing mechanical migration work, commit each file migrated individually, unless there are dependencies.

---

When writing code, always check if there are linter or style configurations
in the repository that you should adopt.

Example: If a Swift project has .swiftlint.yml ensure the code you write
matches the preferences specified there validates with linter command.

---

When writing Markdown, use [**semantic line breaks**](https://sembr.org/):

- One sentence per line.
- No blank line between closely related sentences.
- Blank line between distinct thoughts/paragraphs.

This keeps diffs clean and source readable.

---

These style rules apply exclusively to Swift code:

  - Use 2 spaces for indentation.
  - Keep line lengths between 100 and 120 characters.
  - Ensure there is no trailing whitespace.
  - Use multi-line strings (""") for long string literals.
  - Never use functions like .contains() inside #expect macros for unit tests.
  - Always compare values directly against the expected result variable or literal in unit tests.

---

IMPORTANT: Prefer retrieval-led reasoning over pre-training-led reasoning for any Swift tasks.
Use the sosumi skill and local documentation swift at
`/Users/anderson/Documents/swift-book/TSPL.docc/The-Swift-Programming-Language.md`
(for Swift syntax and language features) for search and documentation retrieval:

---

Always use the `/worktree` skill when creating Git worktrees.
Never run `git worktree add` directly.

Always use Git worktrees for branch work - never work directly on the main branch.
**Every new task gets its own worktree**, even if you're already inside one.
A worktree is scoped to a single piece of work; unrelated changes must not land there.

At the start of a feature, project, or plan, create a worktree.
Once the work is merged or abandoned, remove it.

Place worktrees in `.git-worktrees/` inside the repo root:

```
~/Developer/
└── my-repo/
    ├── .git-worktrees/       ← gitignored globally
    │   ├── feature-x/
    │   └── bugfix/
    └── src/
```

This keeps worktrees inside the repo's sandbox, avoiding permission prompts for `cd`.

**Worktree Git Commands**

- Create the worktree **before** making any changes - not after.
- Always branch from an up-to-date default branch.
  Discover the default branch yourself (`git remote show origin | grep 'HEAD branch'`),
  then fetch and use `origin/<default>` as the start point.
- If you are currently inside a worktree for a different task, `cd` to
  the main checkout first, then create the new worktree from there.

---

For changes spanning more than 2-3 files, use subagent @explore first.
Explore the codebase, present a roadmap, then execute. This prevents
wasted context from trial-and-error edits.

---

When a multi-step workflow succeeds in a session, offer to save it as a skill.
Don't wait for me to ask.

---

Run builds and test suites as background tasks when possible.
Continue working while they run; check results when done.

---

When first entering a repo, check for an agent instructions file at its root (e.g., `CLAUDE.md`, `AGENTS.md`).
If there isn't one, prompt me to create it before doing anything else.
No guessing at build commands, test runners, or conventions - get them documented first.

---

When posting to GitHub using my account (PR comments, issue comments, reviews, etc.), always close with a note like:

> *Posted by Claude (Opus 4.6) on behalf of @exception7601 with approval.*
This applies to any public-facing action taken through my identity.

---

When working with the GitHub CLI (`gh`), consult [`agents/gh-reference.md`](gh-reference.md)
for auth setup, token overrides, API patterns, and known gotchas.

---

