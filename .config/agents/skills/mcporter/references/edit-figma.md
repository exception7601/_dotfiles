# Figma edit (`edit_figma.*`)

Edit Figma designs via channel.

## Setup

```bash
mcporter call edit_figma.join_channel channel="xyz"  # once per session
# Re-run only on "Must join a channel" error
```

## Read

```bash
mcporter call edit_figma.get_document_info
mcporter call edit_figma.get_selection
mcporter call edit_figma.get_node_info nodeId="123:456" --output json > /tmp/figma_raw.json
mcporter call edit_figma.set_selections nodeIds='["123:456","789:012"]'
```

## Apply edits

**Always write to `/tmp/edit_operations.sh` and run it once**

```bash
bash /tmp/edit_operations.sh
```

## Create

```bash
mcporter call edit_figma.create_rectangle x=0 y=0 width=200 height=120 name="Card" parentId="123:456"
mcporter call edit_figma.create_frame x=0 y=0 width=400 height=300 name="Container" layoutMode="VERTICAL" itemSpacing=16
mcporter call edit_figma.create_text x=0 y=0 text="Title" fontSize=24 fontWeight=700 parentId="123:456"
```

## Modify

```bash
# text
mcporter call edit_figma.set_text_content nodeId="123:456" text="New"
mcporter call edit_figma.set_multiple_text_contents nodeId="123:456" text='["111=Title","222=Body"]'

# style
mcporter call edit_figma.set_fill_color nodeId="123:456" r=0.2 g=0.4 b=0.8 a=1
mcporter call edit_figma.set_stroke_color nodeId="123:456" r=0 g=0 b=0 a=1 weight=1
mcporter call edit_figma.set_corner_radius nodeId="123:456" radius=12

# layout
mcporter call edit_figma.move_node nodeId="123:456" x=240 y=320
mcporter call edit_figma.resize_node nodeId="123:456" width=320 height=180
mcporter call edit_figma.set_layout_mode nodeId="123:456" layoutMode="VERTICAL"
mcporter call edit_figma.set_padding nodeId="123:456" paddingTop=16 paddingRight=16 paddingBottom=16 paddingLeft=16
mcporter call edit_figma.set_item_spacing nodeId="123:456" itemSpacing=12

# delete
mcporter call edit_figma.delete_node nodeId="123:456"
mcporter call edit_figma.delete_multiple_nodes nodeIds='["123:456","789:012"]'
```

## Export

```bash
mcporter call edit_figma.export_node_as_image nodeId="123:456" format="PNG" scale=2
```