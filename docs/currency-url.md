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
window.location.href = `https://poeapp.com/#/currency/${payload}`;
```
