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


### Mods

For the mods section, it contains an `Array` of mod groups.  The type options are `and`, `if`, `not`, and `count`.  Each mod group will also contain a `mods` object.  The mods object keys must match the mods as they appear prefixed with `total`, `pseudo`, `explicit`, `implicit`, `crafted`, `enchant`, `prophecy`, `utility`, or `properties`.

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

### Constructing the URL

[I'm using this LZString implementation.](http://pieroxy.net/blog/pages/lz-string/index.html)

```javascript
var payload = LZString.compressToBase64( JSON.stringify(data) );
window.location.href = 'https://poeapp.com/search/' + payload;
```

---

## Build a Currency Exchange URL

There are three properties in this JSON object, `need`, `have`, and `league`.  Here is an example of a query for the `Standard` league, looking to buy `Blessing of Chayula` or `Splinter of Chayula` for `Chaos Orb` or `Orb of Fusing`.

```javascript
{
  "need": ["Blessing of Chayula", "Splinter of Chayula"],
  "have": ["Chaos Orb", "Orb of Fusing"],
  "league": "standard"
}
```

To construct the URL:

```javascript
var payload = encodeURIComponent( JSON.stringify(data) );
window.location.href = 'https://poeapp.com/currency/' + payload;
```

---

## Build an Item Import URL

Say we have the following Ambuser copied from the game, for example.

```
Rarity: Rare
Brood Stinger
Ambusher
--------
Dagger
Quality: +20% (augmented)
Physical Damage: 23-89 (augmented)
Elemental Damage: 58-91 (augmented), 45-79 (augmented), 2-43 (augmented)
Critical Strike Chance: 7.68% (augmented)
Attacks per Second: 1.90 (augmented)
Weapon Range: 8
--------
Requirements:
Level: 61
Dex: 113
Int: 113
--------
Sockets: G-R-R 
--------
Item Level: 84
--------
30% increased Global Critical Strike Chance
--------
Adds 58 to 91 Fire Damage
Adds 45 to 79 Cold Damage
Adds 2 to 43 Lightning Damage
27% increased Attack Speed
+238 to Accuracy Rating
26% increased Critical Strike Chance
```

We will url encode it into the following string to be used in the URL:

```
Rarity%3A%20Rare%0ABrood%20Stinger%0AAmbusher%0A--------%0ADagger%0AQuality%3A%20%2B20%25%20(augmented)%0APhysical%20Damage%3A%2023-89%20(augmented)%0AElemental%20Damage%3A%2058-91%20(augmented)%2C%2045-79%20(augmented)%2C%202-43%20(augmented)%0ACritical%20Strike%20Chance%3A%207.68%25%20(augmented)%0AAttacks%20per%20Second%3A%201.90%20(augmented)%0AWeapon%20Range%3A%208%0A--------%0ARequirements%3A%0ALevel%3A%2061%0ADex%3A%20113%0AInt%3A%20113%0A--------%0ASockets%3A%20G-R-R%20%0A--------%0AItem%20Level%3A%2084%0A--------%0A30%25%20increased%20Global%20Critical%20Strike%20Chance%0A--------%0AAdds%2058%20to%2091%20Fire%20Damage%0AAdds%2045%20to%2079%20Cold%20Damage%0AAdds%202%20to%2043%20Lightning%20Damage%0A27%25%20increased%20Attack%20Speed%0A%2B238%20to%20Accuracy%20Rating%0A26%25%20increased%20Critical%20Strike%20Chance
```

To construct the URL:

```javascript
// itemData contains the text copied from the game
var payload = encodeURIComponent(itemData);
window.location.href = 'https://poeapp.com/item-import/' + payload;
```

---

![alt text](http://i.imgur.com/BXOwazP.png "Search Grid")
![alt text](http://i.imgur.com/ANrEPEi.png "Search List")
![alt text](http://i.imgur.com/X4NqD1P.png "Mods and Presets")
![alt text](http://i.imgur.com/kKDf3uU.png "Last Online")
![alt text](http://i.imgur.com/cgEtwb3.png "Item Grid")
