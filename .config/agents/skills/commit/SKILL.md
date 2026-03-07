---
name: commit
description: |
  Commit staged changes with a well-crafted message.
  Auto-invoked when Claude needs to create a git commit.
  Use when asked to commit, save changes, or after completing work that should be committed.
allowed-tools: Bash(git *), Bash(git -C *), Write, Read, Grep, Glob
---

# TERMINAL EXECUTION RULES
- NEVER use command chaining operators like `&&`, `;`, `||`, or `|`.
- Execute only ONE command per turn. 
- Wait for the output of each command before issuing the next one.

# Commit

Create a git commit for staged changes, following the project's commit conventions.

## Why this skill exists

Multi-line heredoc commit messages don't match `Bash(git commit *)` permission globs
because `*` doesn't cross newlines.
This skill writes the message to a file and uses `git commit -F`, which is a single-line
command that matches the existing globs.

## Arguments

`$ARGUMENTS` - optional hint for what the commit message should focus on.

## Workflow

### 1. Understand the changes

Run in parallel:

- `git status` (or `git -C <path> status` if in a worktree)
- `git diff --cached` (to see what's staged)

If nothing is staged, tell the user and stop.

### 2. Match recent style

Run `git log --oneline -5` to see recent commit messages.

### 3. Draft the commit message

Follow these conventions (from AGENTS.md):

- **Title**: imperative mood, max 50 characters, describes _what_ the change does.
  Fence inline code and file names unless it would exceed 50 chars.
- **Body** (only if the _why_ isn't obvious from the title): explains _why_,
  uses semantic line breaks, never repeats the _what_.
- **Trailer block** (always):

```
---
Generated with the help of Claude Code, https://claude.ai/code

Co-Authored-By: Claude Code Opus 4.6 <noreply@anthropic.com>
```

**IMPORTANT**: Always write the commit message in English, as per user's preference.

If `$ARGUMENTS` provides a hint, use it to guide the message focus.

### 4. Write the message file

Use the `Write` tool to write the complete message to `/tmp/COMMIT_MSG`.
Do not use another bash tool to write to the file.

### 5. Commit

Run:

```bash
git commit -F /tmp/COMMIT_MSG
```

Or with `-C` if working in a worktree:

```bash
git -C <path> commit -F /tmp/COMMIT_MSG
```

This is a single-line command that matches the permission globs.

### 6. Verify

Run `git status` to confirm the commit succeeded.

