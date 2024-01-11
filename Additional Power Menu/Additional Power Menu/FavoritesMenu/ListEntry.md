```js
override protected function TryGetEntryText(param1:Object) : String
{
	this.setData(param1);
	var activeText:* = !!param1.bIsEquipped ? " <font color=\"#39ABC2\">$POWERS_HOVER</font>" : "";
	var favoriteText:* = !!param1.iFavoriteSlot ? " [" + param1.iFavoriteSlot + "]" : "";
	return this.sName + this.sRank + activeText + favoriteText;
}
```