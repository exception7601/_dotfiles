---
name: mcporter
description: CLI bridge for MCP servers (Figma, Xcode). Use when the user mentions mcporter or needs to interact with any MCP tool.
---

# mcporter

`mcporter` is the CLI for interacting with MCP servers.

## Rules

- One `mcporter` command per terminal call — never chain with `&&` or `;`
- Always check `mcporter daemon status` first; start with `mcporter daemon start` if needed

## Quick Start

```bash
mcporter daemon status
mcporter call figma.get_figma_data fileKey="abc" nodeId="1:118"  # read Figma
mcporter call edit_figma.join_channel channel="xyz"               # edit Figma
mcporter call xcode.XcodeListWindows                              # Xcode
```

## References

Load the relevant file for the MCP you need:

- **Figma read** → `references/figma.md`
- **Figma edit** → `references/edit-figma.md`
- **Xcode** → `references/xcode.md`