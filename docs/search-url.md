## Build a poeapp.com Search URL

Using the following properties, you must construct a JSON object containing your search criteria.  That will then need to be run through LZString that outputs base64.

For specifying `max` for `[min, max]`, just send a `Number` instead of an `Array`.

| Property | Type | Value | Default |
|---|---|---|---|
| attributes.corrupted | String | Yes, No | either |
| attributes.bricked | String | Yes | either |
| attributes.craftedModsCount | String | Yes, No | either |
| attributes.enchantModsCount | String | Yes, No | either |
| attributes.explicitModsCount | Array | [min, max] | |
| attributes.identified | String | Yes, No | either |
| attributes.ilvl | Array | [min, max] | |
| attributes.itemType | String | Body, Boots, Shield, Card, Gem | |
| attributes.league | String (lowercase) | standard, hardcore, legacy | |
| attributes.rarity | String (lowercase) | normal, magic, rare, unique | |
| in_league | String | Yes, No | Yes |
| info.altArt | String | Yes, No | either |
| info.tokenized.fullName | String | Kaom's Heart | |
| info.typeLine | String | Enfeeble | |
| normalize_quality | String | Yes, No | either |
| mods.total.+# to maximum Life | Array | [min, max] | |
| mods.total.+#% to Chaos Resistance | Array | [min, max] | |
| mods.total.+#% to Cold Resistance | Array | [min, max] | |
| mods.total.+#% to Fire Resistance | Array | [min, max] | |
| mods.total.+#% to Lightning Resistance | Array | [min, max] | |
| online | String | either, active | Yes |
| properties.Armour | Array | [min, max] | |
| properties.Attacks per Second | Array | [min, max] | |
| properties.Chance to Block | Array | [min, max] | |
| properties.Chaos DPS | Array | [min, max] | |
| properties.Chaos Damage | Array | [min, max] | |
| properties.Critical Strike Chance | Array | [min, max] | |
| properties.Elemental DPS | Array | [min, max] | |
| properties.Energy Shield | Array | [min, max] | |
| properties.Evasion Rating | Array | [min, max] | |
| properties.Item Quantity | Array | [min, max] | |
| properties.Level | Array | [min, max] | |
| properties.Physical DPS | Array | [min, max] | |
| properties.Physical Damage | Array | [min, max] | |
| properties.Quality | Array | [min, max] | |
| properties.Total DPS | Array | [min, max] | |
| requirements.Dex | Array | [min, max] | |
| requirements.Int | Array | [min, max] | |
| requirements.Level | Array | [min, max] | |
| requirements.Str | Array | [min, max] | |
| shop.chaos | Array | [min, max] | |
| shop.hasPrice | String | Yes, No | either |
| shop.sellerAccount | String | String | |
| shop.stash.name | String | String | |
| shop.updated | String (enum) | 30m, 1h, 6h, 12h, 1d, 2d, 3d, 1w | |
| sockets.largestLinkGroup | Array | [min, max] | |
| sockets.socketCount | Array | [min, max] | |
| sockets.sortedLinkGroup.B | Number | 1-6 | |
| sockets.sortedLinkGroup.G | Number | 1-6 | |
| sockets.sortedLinkGroup.R | Number | 1-6 | |
| sockets.sortedLinkGroup.W | Number | 1-6 | |
| sockets.totalBlue | Number | 1-6 | |
| sockets.totalGreen | Number | 1-6 | |
| sockets.totalRed | Number | 1-6 | |
| sockets.totalWhite | Number | 1-6 | |


### Mods

For the mods section, it contains an `Array` of mod groups.  The type options are `and`, `if`, `not`, and `count`.  Each mod group will also contain a `mods` object.  The mods object keys must match the mods as they appear prefixed with `total`, `pseudo`, `explicit`, `implicit`, `crafted`, `enchant`, `prophecy`, `utility`, or `properties`.

```javascript
mods: [
  {
    mods: {
      "total.#% increased Cold Damage with Weapons": [1, 100]
    },
    type: "and"
  }, {
    mods: {
      "total.+# to maximum Life": [80, null],
      "total.+#% to Cold Resistance": [30, null]
    },
    range: [1, null],
    type: "count"
  }
]
```

### Constructing the URL

If you want to quickly visualize the structure for your query, it is best to first input it into [poeapp](https://poeapp.com) and save it as a preset.  From there you can visit [poeapp's settings](https://poeapp.com/settings) page, click the download arrow to the left of the preset you just created to copy it to your clipboard, and paste it your editor to view.  The `query` portion of that is what you want to encode and send to poeapp.

[I'm using this LZString implementation.](http://pieroxy.net/blog/pages/lz-string/index.html)  
https://cdnjs.cloudflare.com/ajax/libs/lz-string/1.4.4/lz-string.min.js

```javascript
var data = {
  "attributes.league": "standard",
  "attributes.itemType": "Boots",
  "info.typeLine": "Slink Boots",
  "attributes.rarity": "rare",
  "attributes.corrupted": "Yes",
  "mods": [
    {
      "mods": {
        "implicit.+# to Level of Socketed Gems": [],
        "total.#% increased Movement Speed": [
          20,
          null
        ],
        "total.+# to maximum Life": [
          70,
          null
        ]
      },
      "type": "and"
    }
  ]
};
var payload = LZString.compressToEncodedURIComponent( JSON.stringify(data) );
window.location.href = `https://poeapp.com/#/search/${payload}`;
```
