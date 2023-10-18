#### Class Def

```javascript
private var bShowStarNames:Boolean = true;
private var bShowStarNameColors:Boolean = false;

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
		Debug.out.log("Not on Galaxy, ignored");
		return;
	}
	if(param1.keyCode == 49)
	{
		this.ToggleStarNames();
		Debug.out.log("bShowStarNames: " + this.bShowStarNames);
	}
	else if(param1.keyCode == 50)
	{
		this.ToggleStarNameColors();
		Debug.out.log("bShowStarNameColors: " + this.bShowStarNameColors);
	}
}
```

#### onAddedToStage
```js
parent.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDownHandler,true,1,false);
```
#### UpdateMarkers()

```javascript
// in first while loop, after _loc4_ = param1[_loc7_];
_loc4_.bShowStarNames = this.bShowStarNames;
_loc4_.bShowStarNameColors = this.bShowStarNameColors;
```