In GalaxyStarMapMenu onKeyDownHandler:
```js
else if(param1.keyCode == 53) // '5' key
{
	if(this.OutpostSelect_mc.visible)
	{
		Debug.out.log("Hide Outpost Select");
		this.OutpostSelect_mc.Hide();
	}
	else
	{
		Debug.out.log("Show Outpost Select");
		this.OutpostSelect_mc.Show();
	}
}
```

```js
param1.data.OutpostsA.push({
	"uFormID":386608,
	"sOutpostName":"Narion"
});
param1.data.OutpostsA.push({
	"uFormID":386607,
	"sOutpostName":"Valo"
});
param1.data.OutpostsA.push({
	"uFormID":386570,
	"sOutpostName":"Alpha Centauri"
});
```

In OutpostSelectPopup.onItemPressed:

```js
BSUIDataManager.dispatchEvent(new CustomEvent("StarMapMenu_QuickSelectChange",{"bodyID":_loc1_.uFormID}));
// still don't know how to make the map pan to the selected system
```

We don't want to use this, but good example of populating a scrolling list and sending events