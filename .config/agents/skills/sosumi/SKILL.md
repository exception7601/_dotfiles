---
name: sosumi
description: Fetches Apple documentation as Markdown via Sosumi. Use for Apple API reference, Human Interface Guidelines, WWDC transcripts, and external Swift-DocC pages.
---

# Sosumi Skill

Use this skill to reliably fetch Apple docs as Markdown when coding agents need precise API details.

## When to Use

Use Sosumi when the request involves any of the following:

- Apple platform APIs (`Swift`, `SwiftUI`, `UIKit`, `AppKit`, `Foundation`, etc.)
- API signatures, availability, parameter behavior, or return semantics
- Human Interface Guidelines questions
- WWDC session transcript lookup
- External Swift-DocC documentation (for example, GitHub Pages or Swift Package Index hosts)

## Core Workflow

1. If you don't know the exact URL, search first with `sosumi search`.
2. Fetch the best match with `sosumi fetch`.
3. Prefer specific symbol pages over broad top-level pages.

## CLI Usage

Use the `sosumi` CLI directly:

### Fetch Examples

```bash
# Apple API reference — full URL or path-only both work
sosumi fetch "https://developer.apple.com/documentation/swift/array"
sosumi fetch "/documentation/swift/array"

# Human Interface Guidelines
sosumi fetch "/design/human-interface-guidelines/color"

# WWDC video transcript
sosumi fetch "/videos/play/wwdc2021/10133"

# External Swift-DocC pages
sosumi fetch "https://apple.github.io/swift-argument-parser/documentation/argumentparser"
sosumi fetch "https://swiftpackageindex.com/pointfreeco/swift-composable-architecture/1.23.1/documentation/composablearchitecture"
```

### Search Examples

```bash
sosumi search "SwiftData"
sosumi search "async sequence"
```

### JSON Output

Use `--json` for structured output when scripting:

```bash
sosumi fetch "/documentation/swift/array" --json
sosumi search "SwiftData" --json
```

## Output & Organization

Unless the user explicitly wants the response returned directly in context, save larger Sosumi results under `.sosumi/`.
Add `.sosumi/` to `.gitignore`.
Because `sosumi` doesn't provide an `-o` flag, use shell redirection with quoted targets.

```bash
mkdir -p .sosumi
sosumi search "SwiftData" --json > .sosumi/search-swiftdata.json
sosumi fetch "/documentation/swift/array" > .sosumi/swift-array.md
sosumi fetch "/documentation/swiftui/view/symboleffect(_:options:value:)" --json > .sosumi/swiftui-symbol-effect.json
```

Naming conventions:

```
.sosumi/search-{query}.json
.sosumi/{framework}-{symbol}.md
.sosumi/{framework}-{symbol}.json
```

Never read large saved files all at once.
Use `wc`, `head`, `grep`, and `jq` to inspect only what you need.

```bash
wc -l .sosumi/swift-array.md
head -40 .sosumi/swift-array.md
grep -n "symbolEffect" .sosumi/swiftui-symbol-effect.json
jq -r '.results[] | "\(.title): \(.url)"' .sosumi/search-swiftdata.json
```

## Content Types

| Content | Path pattern |
|---|---|
| Apple API reference | `/documentation/{framework}/{symbol}` |
| Human Interface Guidelines | `/design/human-interface-guidelines/{topic}` |
| Apple video transcript | `/videos/play/{collection}/{id}` |
| External Swift-DocC | Full `https://` URL |

## Best Practices

- Search first if the exact path is unknown.
- Always wrap fetch targets in double quotes, including path-only arguments like `"/documentation/..."`.
- Quoting avoids shell parsing problems for paths and URLs that contain characters like `(`, `)`, `?`, and `&`.
- Unless the user asks for inline output, save substantial search and fetch results under `.sosumi/` for reuse.
- Check `.sosumi/` before re-fetching the same page or search query.
- Fetch targeted symbol pages for coding questions, not top-level framework pages.
- Prefer official Apple pages and WWDC transcripts over broader search results when both exist.
- Keep source links in answers so users can verify details.

## Troubleshooting

### 404 or sparse output

- The path may be incorrect or too broad.
- Run `sosumi search` first, then fetch a specific result.

### External page cannot be fetched

- The host may block access via `robots.txt` or `X-Robots-Tag`.
- Try another canonical URL for the same symbol.
- If you already saved prior output in `.sosumi/`, inspect that cache before trying alternate fetches.
