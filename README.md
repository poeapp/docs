# [Path of Exile Trading App](https://poeapp.com)

## Build a poeapp.com Search URL

Using the following properties, you must construct a JSON object containing your search criteria.  That will then need to be run through LZString that outputs base64.

For specifying `max` for `[min, max]`, just send a `Number` instead of an `Array`.

| Property | Type | Value | Default |
|---|---|---|---|
| attributes.corrupted | String | Yes, No | Either |
| attributes.craftedModsCount | String | Yes, No | Either |
| attributes.enchantModsCount | String | Yes, No | Either |
| attributes.explicitModsCount | Array | [min, max] | |
| attributes.identified | String | Yes, No | Either |
| attributes.ilvl | Array | [min, max] | |
| attributes.itemType | String | Body, Boots, Shield, Card, Gem | |
| attributes.league | String | standard, hardcore, legacy | |
| attributes.rarity | String | normal, magic, rare, unique | |
| info.altArt | String | Yes, No | Either |
| info.tokenized.fullName | String | Kaom's Heart | |
| info.typeLine | String | Enfeeble | |
| normalize_quality | String | Yes, No | Either |
| mods.total.+# to maximum Life | Array | [min, max] | |
| mods.total.+#% to Chaos Resistance | Array | [min, max] | |
| mods.total.+#% to Cold Resistance | Array | [min, max] | |
| mods.total.+#% to Fire Resistance | Array | [min, max] | |
| mods.total.+#% to Lightning Resistance | Array | [min, max] | |
| online | String | either | Yes |
| properties.Armour | Array | [min, max] | |
| properties.Attacks per Second | Array | [min, max] | |
| properties.Chance to Block | Array | [min, max] | |
| properties.Chaos DPS | Array | [min, max] | |
| properties.Chaos Damage.avg | Array | [min, max] | |
| properties.Critical Strike Chance | Array | [min, max] | |
| properties.Elemental DPS | Array | [min, max] | |
| properties.Energy Shield | Array | [min, max] | |
| properties.Evasion Rating | Array | [min, max] | |
| properties.Item Quantity | Array | [min, max] | |
| properties.Level | Array | [min, max] | |
| properties.Physical DPS | Array | [min, max] | |
| properties.Physical Damage.avg | Array | [min, max] | |
| properties.Quality | Array | [min, max] | |
| properties.Total DPS | Array | [min, max] | |
| requirements.Dex | Array | [min, max] | |
| requirements.Int | Array | [min, max] | |
| requirements.Level | Array | [min, max] | |
| requirements.Str | Array | [min, max] | |
| shop.chaos | Array | [min, max] | |
| shop.hasPrice | String | Yes, No | Either |
| shop.sellerAccount | String | String | |
| shop.stash.name | String | String | |
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


## Mods

For the mods section, it contains an `Array` of mod groups.  The type options are `and`, `if`, `not`, and `count`.  Each mod group will also contain a `mods` object.  The mods object keys must match the mods as they appear prefixed with `total`, `pseduo`, `explicit`, `implicit`, `crafted`, `enchant`, `prophecy`, `utility`, or `properties`.

```javascript
mods: {
  [
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
}
```

## Constructing the URL

[I'm using this LZString implementation.](http://pieroxy.net/blog/pages/lz-string/index.html)

```javascript
var payload = LZString.compressToBase64( JSON.stringify(data) );
window.location.href = 'https://poeapp.com/#' + payload;
```

---

![alt text](http://i.imgur.com/BXOwazP.png "Search Grid")
![alt text](http://i.imgur.com/ANrEPEi.png "Search List")
![alt text](http://i.imgur.com/X4NqD1P.png "Mods and Presets")
![alt text](http://i.imgur.com/kKDf3uU.png "Last Online")
![alt text](http://i.imgur.com/cgEtwb3.png "Item Grid")
