# [Path of Exile Trading App](https://poeapp.com)

![alt text](http://i.imgur.com/CIHAh4W.png "Color Customization")

## Color Customization

To start customizing colors, click the gear in the top right of the App.  In the `Colors` field, you will enter JSON data which can be validated at [jslint](http://www.jslint.com/).  After hitting the save icon, you will get a green check if it was successfully saved, otherwise you will get an error message saying invalid JSON.

### Prefixes

| Prefix | Description |
| --- | --- |
| `propertiesPseudo.` | Used when Normalized Quality is enabled and only for values affected by normalizing the quality. |
| `properties.` | For all properties, unless normalized quality is enabled. |
| `mods.` | For matching any mod (e.g. explicit, implicit, enchant, crafted) |

The mod name is the exact mod name as it appears in the search results with the numbers replaced with a `#`.  For example, a mod of `Adds 1 to 2 Cold Damage` becomes `mods.Adds # to # Cold Damage`.

The allowed CSS properties are as follows:

`'color', 'background-color', 'font-weight', 'text-decoration', 'font-style'`

```json
{
  "propertiesPseudo.Evasion Rating": {
    "color": "#0dbb1d"
  },
  "propertiesPseudo.Energy Shield": {
    "color": "#0dbb1d"
  },
  "propertiesPseudo.Armour": {
    "color": "#0dbb1d"
  },
  "propertiesPseudo.Physical DPS": {
    "color": "#0dbb1d"
  },
  "propertiesPseudo.Total DPS": {
    "color": "#0dbb1d"
  },
  "propertiesPseudo.Quality": {
    "color": "#0dbb1d"
  },
  "mods.+#% to Chaos Resistance": {
    "color": "#feb0ff"
  },
  "mods.Adds # to # Chaos Damage": {
    "color": "#feb0ff"
  },
  "properties.Chaos Damage": {
    "color": "#feb0ff"
  },
  "properties.Chaos DPS": {
    "color": "#feb0ff"
  },
  "mods.+#% to Cold Resistance": {
    "color": "#72d0ff"
  },
  "mods.Adds # to # Cold Damage": {
    "color": "#72d0ff"
  },
  "mods.+#% to Lightning Resistance": {
    "color": "#fff88d"
  },
  "mods.Adds # to # Lightning Damage": {
    "color": "#fff88d"
  },
  "mods.+#% to Fire Resistance": {
    "color": "#ffab06"
  },
  "mods.Adds # to # Fire Damage": {
    "color": "#ffab06"
  },
  "mods.+# to maximum Life": {
    "color": "#ff7171"
  },
  "mods.#% increased Movement Speed": {
    "text-decoration": "underline",
    "background-color": "#18754f"
  }
}
```
