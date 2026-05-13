# GTA Physical Map (QBCore)

A simple **physical world map item** for QB Core that works with `qb-inventory`.
When a player uses the item from their inventory, the script plays a short unfold animation and opens the GTA V map screen.

## Features

- Adds a usable inventory item (`world_map` by default)
- Works with `qb-inventory` + QBCore useable items
- Optional unfold animation + progress bar
- Configurable item name and timing

## Installation

1. Place this resource in your server resources folder (for example `resources/[qb]/GTA-physical-map-`).
2. Add this line to your `server.cfg`:

   ```cfg
   ensure GTA-physical-map-
   ```

3. Add an item entry in `qb-core/shared/items.lua`:

   ```lua
   ['world_map'] = {
       ['name'] = 'world_map',
       ['label'] = 'World Map',
       ['weight'] = 100,
       ['type'] = 'item',
       ['image'] = 'world_map.png',
       ['unique'] = false,
       ['useable'] = true,
       ['shouldClose'] = true,
       ['combinable'] = nil,
       ['description'] = 'A foldable paper map of San Andreas.'
   },
   ```

4. Add a matching item icon (`world_map.png`) to your inventory image folder:
   - `qb-inventory/html/images/world_map.png`

5. Restart the server or resource.

## Configuration

Edit `config.lua`:

- `Config.ItemName` - item name that triggers this resource
- `Config.UnfoldDuration` - progress duration in milliseconds
- `Config.Anim` - animation dictionary/name/flag

## Usage

Give yourself the item and use it from inventory:

```bash
/giveitem [id] world_map 1
```

When used, the map opens for the player.
