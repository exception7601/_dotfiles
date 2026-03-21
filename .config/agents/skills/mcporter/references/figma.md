# Figma read (`figma.*`)

Extract design data and download assets from Figma files.

## Get fileKey & nodeId

- `fileKey` → from URL `figma.com/design/<fileKey>/...`
- `nodeId` → from URL param `node-id`, replace `-` with `:` (`1-118` → `1:118`)

## Read nodes

```bash
# single node
mcporter call figma.get_figma_data fileKey="abc" nodeId="1:118"

# multiple nodes
mcporter call figma.get_figma_data fileKey="abc" nodeId="1:118;9:432"

# entire file
mcporter call figma.get_figma_data fileKey="abc"
```

## Output format

YAML → minify to JSON:

```bash
jq -c . <(yq -o=json . <(mcporter call figma.get_figma_data fileKey="abc" nodeId="1:118")) > /tmp/figma.json
```

## Token structure

```json
"layout_XXX": { "mode": "column", "gap": "14px", "padding": "16px" }
"fill_XXX":   ["#2C2C2C"] | ["rgba(...)"] | [{"type":"IMAGE","imageRef":"..."}]
"stroke_XXX": { "colors": ["#545454"], "strokeWeight": "1px" }
"font_XXX":   { "fontFamily": "Montserrat", "fontWeight": 700, "fontSize": 19 }
```

## Download images

```bash
mcporter call --args '{"fileKey":"abc","nodes":[{"nodeId":"1:118","fileName":"icon.svg"}],"localPath":"assets"}' figma.download_figma_images
```