## Build an Item Import URL

Say we have the following Ambusher copied from the game, for example.

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
window.location.href = `https://poeapp.com/#/item-import/${payload}`;
