```js
// onAddedToStage
BSUIDataManager.Subscribe("FavoritesData",this.onFavoriteDataUpdate);
```


```js

private var FavoritePowersA:Object = {};

private function onFavoriteDataUpdate(param1:FromClientDataEvent) : void
{
	var favoritesInfoA:Array = param1.data.aFavoriteItems;
	this.FavoritePowersA = {};
	var i:* = 0;
	while(i < favoritesInfoA.length)
	{
		if(favoritesInfoA[i].bIsPower && favoritesInfoA[i].bIsEquippable)
		{
			this.FavoritePowersA[favoritesInfoA[i].sName] = i + 1;
		}
		i++;
	}
}
```

```js
// onPowersDataUpdate ~Line 335
var power:* = param1.data.aPowers[i];
if(!this.IsVanillaPower(power.uId))
{
	power.bIsSelected = power.bIsEquipped;
	if(this.FavoritePowersA.hasOwnProperty(power.sName))
	{
		power["iFavoriteSlot"] = this.FavoritePowersA[power.sName];
	}
	nonStarbornPowers.push(power);
}
i++;
```