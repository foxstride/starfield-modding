decl
```js
private var mapSettings:Settings;
```

ctor
```js
this.mapSettings = Settings.getInstance();
this.mapSettings.getSettings();
```

UpdateCurrentView
```js
//...
if(this.CurrentView == ViewTypes.VIEW_GALAXY)
{
	if(!this.bMapSettingsUsed)
	{
		this.bShowStarNameColors = this.mapSettings.LevelColorDefaultOn;
		this.bMapSettingsUsed = true;
		Debug.out.log("UpdateCurrentView - this.bShowStarNameColors: " + this.bShowStarNameColors);
	}
	//...
}
//...
```

UpdateMarkers
```js
// after _loc4_.bShowStarNameColors = this.bShowStarNameColors;
_loc4_.iFontSize = this.mapSettings.FontSize;
// for _lrg, use FontSizeLarge:
//_loc4_.iFontSize = this.mapSettings.FontSizeLarge;
```