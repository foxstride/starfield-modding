```js
BSUIDataManager.Subscribe("PowersMenuData",this.onPowersDataUpdate);
```


Received every time we select a new power, open favorites, and assign power to a favorite

```json
{
	sQuantumEssenceDescription: "Increases Starborn power regeneration...",
	uUndiscoveredPowers: 0,
	uUndiscoveredTemples: 0,
	uEssence: 0,
	bFavoritingPower: false,
	aPowers: [
		//...
	]
}
```

```json
// aPowers
{
	sName: "Alien Reanimation",
	sRank: "II",
	sKey: "ArtifactPower_AlienReanim",
	sDescription: "Blah blah blah",
	uId: 2904975, // 2c538f
	uCost: 35,
	bIsUnlocked: true,
	bIsEquipped: false,
	bIsTempleKnown: false,
	sTempleName: ""
}
```