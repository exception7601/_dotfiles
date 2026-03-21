# Xcode MCP (`xcode.*`)

Control Xcode via MCP.

## List windows first

```bash
# get tabIdentifier for all commands
mcporter call xcode.XcodeListWindows --output json | jq -r '.message | scan("\\* tabIdentifier: ([^,]+)")[]'
```

## Issues

```bash
mcporter call xcode.XcodeListNavigatorIssues tabIdentifier=windowtab1
mcporter call xcode.XcodeListNavigatorIssues severity=error tabIdentifier=windowtab1
mcporter call xcode.XcodeListNavigatorIssues pattern="deprecated" tabIdentifier=windowtab1
```

## Build

```bash
mcporter call xcode.BuildProject tabIdentifier=windowtab1
mcporter call xcode.GetBuildLog tabIdentifier=windowtab1
mcporter call xcode.GetBuildLog severity=warning tabIdentifier=windowtab1
mcporter call xcode.GetBuildLog glob="Sources/**/*.swift" tabIdentifier=windowtab1
```

## Tests

```bash
mcporter call xcode.GetTestList tabIdentifier=windowtab1
mcporter call xcode.RunSomeTests tests='["TestClass/testMethod1"]' tabIdentifier=windowtab1
```

## Code

```bash
# run snippet
mcporter call xcode.ExecuteSnippet codeSnippet="print(\"Hello\")" sourceFilePath="Project/Sources/File.swift" tabIdentifier=windowtab1

# refresh diagnostics
mcporter call xcode.XcodeRefreshCodeIssuesInFile filePath="Project/Sources/File.swift" tabIdentifier=windowtab1
```

## Preview

```bash
mcporter call xcode.RenderPreview sourceFilePath="Project/Sources/File.swift" tabIdentifier=windowtab1
mcporter call xcode.RenderPreview previewDefinitionIndexInFile=1 timeout=60 sourceFilePath="Project/Sources/File.swift" tabIdentifier=windowtab1
```

## Documentation

```bash
mcporter call xcode.DocumentationSearch query="SwiftUI Button"
mcporter call xcode.DocumentationSearch frameworks='["Foundation"]' query="URLSession"
```