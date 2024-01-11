
```js
for(var key in this.FavoritesInfoA[0])
{
	var msg:* = String(key) + ": " + String(this.FavoritesInfoA[0][key]);
	Debug.out.log(msg);
}
```