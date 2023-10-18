Don't need to update SystemMarker, update object is sent down to UpdateImpl

#### Class Def

```javascript
private static function GetColorTransformForSystem(systemName:String) : ColorTransform
{
	var systemLabelColor:* = new ColorTransform();
	var level:* = systemNamesAndLevels[systemName];
	if(level <= 10)
	{
		systemLabelColor.color = 52224;
	}
	else if(level <= 20)
	{
		systemLabelColor.color = 6922426;
	}
	else if(level <= 30)
	{
		systemLabelColor.color = 13546021;
	}
	else if(level <= 50)
	{
		systemLabelColor.color = 15235088;
	}
	else if(level <= 75)
	{
		systemLabelColor.color = 15080483;
	}
	else
	{
		systemLabelColor.color = 12040119;
	}
	return systemLabelColor;
}

private function UpdateNameplateVisibility(param1:uint) : void
{
	switch(param1)
	{
		case 0:
			Nameplate_mc.gotoAndPlay("system_close");
			HideBackgroundAssets();
			break;
		case 1:
			Nameplate_mc.gotoAndPlay("system_unselected");
			HideBackgroundAssets();
			break;
		case 2:
			Nameplate_mc.gotoAndPlay("system_selected");
			SetBackgroundWidth();
			GlobalFunc.PlayMenuSound("UIMenuStarmapRollover");
	}
}
```

#### UpdateImpl()

```javascript
// set colors if enabled
if(param1.showStarNameColors && param1.sMarkerText && systemNamesAndLevels.hasOwnProperty(param1.sMarkerText))
{
	var colorTransform:* = SystemNameplate.GetColorTransformForSystem(param1.sMarkerText);
	this.Nameplate_mc.NameplateText_mc.transform.colorTransform = colorTransform;
}
else
{
	var defaultColor:* = new ColorTransform();
	defaultColor.color = 12040119;
	this.Nameplate_mc.NameplateText_mc.transform.colorTransform = defaultColor;
}
```

#### UpdateImpl()
```js
// show text
override protected function UpdateImpl(param1:Object) : void
{
	if(this.bAlwaysShowText == param1.bIsTextPersistent && this.bIsPlotPoint == param1.bIsPlotPoint && this.bHighlight == param1.bShowHighlight && this.bAlwaysShowStarNames == param1.bShowStarNames)
	{
		return;
	}
	if(param1.showStarNameColors && param1.sMarkerText && systemNamesAndLevels.hasOwnProperty(param1.sMarkerText))
	{
		var colorTransform:* = SystemNameplate.GetColorTransformForSystem(param1.sMarkerText);
		this.Nameplate_mc.NameplateText_mc.transform.colorTransform = colorTransform;
	}
	else
	{
		var defaultColor:* = new ColorTransform();
		defaultColor.color = 12040119;
		this.Nameplate_mc.NameplateText_mc.transform.colorTransform = defaultColor;
	}
	Nameplate_mc.x = param1.fMarkerRadius;
	Nameplate_mc.y = Nameplate_mc.height * param1.iGroupOrder + 2;
	// ---
	Nameplate_mc.x = param1.fMarkerRadius;
	Nameplate_mc.y = Nameplate_mc.height * param1.iGroupOrder + 2;
	if(this.bAlwaysShowText != param1.bIsTextPersistent)
	{
		this.bAlwaysShowText = param1.bIsTextPersistent;
		Debug.out.log(param1.sMarkerText + " bAlwaysShowText: " + this.bAlwaysShowText);
	}
	if(this.bIsPlotPoint != param1.bIsPlotPoint)
	{
		this.bIsPlotPoint = param1.bIsPlotPoint;
		Debug.out.log(param1.sMarkerText + " bIsPlotPoint: " + this.bIsPlotPoint);
	}
	if(this.bHighlight != param1.bShowHighlight)
	{
		this.bHighlight = param1.bShowHighlight;
		Debug.out.log(param1.sMarkerText + " bHighlight: " + this.bHighlight);
	}
	if(this.bAlwaysShowStarNames != param1.bShowStarNames)
	{
		this.bAlwaysShowStarNames = param1.bShowStarNames;
		Debug.out.log(param1.sMarkerText + " bAlwaysShowStarNames: " + this.bAlwaysShowStarNames);
	}
	var nameplateUpdate:Number = -1;
	if(!this.bAlwaysShowText && !this.bIsPlotPoint && !this.bHighlight && !this.bAlwaysShowStarNames)
	{
		nameplateUpdate = 0;
	}
	else if(this.bAlwaysShowText || this.bIsPlotPoint || this.bAlwaysShowStarNames && !this.bHighlight)
	{
		nameplateUpdate = 1;
	}
	else if(this.bHighlight)
	{
		nameplateUpdate = 2;
	}
	this.UpdateNameplateVisibility(nameplateUpdate);
}
```

