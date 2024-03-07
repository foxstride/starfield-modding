#### Move `PlotLinePointsInfo` and `PlotLineInfo` into their own classes otherwise you get CTDs. They are at the bottom

import
```js
import FSNovask.Settings;
import flash.events.KeyboardEvent;
```

decl
```js
private var bShowStarNames:Boolean = true;
private var bShowStarNameColors:Boolean = false;
private var mapSettings:Settings;
private var bMapSettingsUsed:Boolean = false;

public function ToggleStarNames() : void
{
	this.bShowStarNames = !this.bShowStarNames;
}

public function ToggleStarNameColors() : void
{
	this.bShowStarNameColors = !this.bShowStarNameColors;
}

private function onKeyDownHandler(param1:KeyboardEvent) : void
{
	if(this.CurrentView != ViewTypes.VIEW_GALAXY)
	{
		return;
	}
	if(param1.keyCode == 49)
	{
		this.ToggleStarNames();
	}
	else if(param1.keyCode == 50)
	{
		this.ToggleStarNameColors();
	}
}
```

ctor
```js
this.mapSettings = Settings.getInstance();
this.mapSettings.getSettings();
```

onAddedToStage
```js
stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDownHandler,false,1,false);
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
	}
	//...
}
//...
```

UpdateMarkers
```js
while(_loc7_ < _loc6_)
{
	_loc4_ = param1[_loc7_];
	// new
	_loc4_.bShowStarNames = this.bShowStarNames;
	_loc4_.bShowStarNameColors = this.bShowStarNameColors;
	_loc4_.iFontSize = this.mapSettings.FontSize;
	//_loc4_.iFontSize = this.mapSettings.FontSizeLarge;
	// ...
}
```