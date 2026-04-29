---
name: commit
description: Commit changes with a well-crafted message.
allowed-tools: Bash(git *), Bash(git -C *), Bash(agentic-commit *), Read, Grep, Glob, AskUserQuestion
user-invocable: true
---

# Commit

Auto-invoked when Agent needs to create a git commit.
Use when asked to commit, save changes, or after completing work that should be committed.

## Arguments

`$ARGUMENTS` - optional commit description or guidance.
If empty, infer from staged/unstaged changes.

## Workflow

### 1. Gather context

Run these in parallel:

- `git status` - staged and unstaged changes (never use `-uall`)
- `git diff --cached` - what's already staged
- `git diff` - unstaged changes

### 2. Determine what to commit

- If changes are already staged, use those.
- If nothing is staged, ask the user what to stage.
- Default to **one file per commit** unless the user specifies otherwise or the changes are logically coupled
   (e.g., a test double update required by a test migration).
- If multiple files have unrelated changes, propose splitting into separate commits and confirm with the user.
- **Only commit changes that came from the work just done.** A `/commit` request after
   finishing a task means "commit *our* work" - not "sweep up everything dirty in the tree".
   Pre-existing or user-made changes unrelated to the current task must not be bundled in silently.

### 3. Compose the commit message

**Title (first line):**

- Describes *what* the change does
- Imperative mood ("Add feature", not "Added feature")
- Maximum 50 characters
- Drop backtick fencing from the title if needed to fit
- Must be sufficient on its own

**Body (optional, separated by blank line):**

- Explains *why* if not obvious from the title
- Never repeats the *what* - the diff covers that
- Use semantic line breaks (one sentence per line)
- Fence inline code and file names with backticks
- Track rationale and conversation details
- If the *why* is unclear, ask the user rather than guessing

**Footer (always present, separated by blank line):**

Example:

```
---

Generated with the help of Claude Code, https://claude.ai/code

Co-Authored-By: Claude Code Opus 4.6 <noreply@anthropic.com>
```

If `$ARGUMENTS` provides a hint, use it to guide the message focus.

### 4. Write the message file

Use the `Write` tool to write the complete message to `/tmp/COMMIT_MSG`.
Do not use another bash tool to write to the file.

### 5. Stage and Commit

Run these sequentially, not in parallel.

```bash
git add file1 file2  ...
```

Then:

```bash
git commit -F /tmp/COMMIT_MSG
```

Or with `-C` if working in a worktree:

```bash
git [-C <path>] add file1 file2  ...
```

Then:

```bash
git [-C <path>] commit -F /tmp/COMMIT_MSG
```

### 6. Verify

Run `git status` to confirm the commit succeeded.

---

## Constraints
- **NEVER use command chaining operators** like &&, ;, ||, or |.
- **Never amend** - always create new commits.
- **Never use `git --git-dir`** - use `git -C` or `cd` then `git` in separate calls.
- **Never `cd path && git ...`** - the permission system matches on first token.
- **Never run `git add` and `git commit` in parallel.**
- **Never `git add -A`** or **`git add .`** - stage files by name.
- If there are no changes to commit, say so and stop.
