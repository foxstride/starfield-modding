#### Class Def

```javascript
// Add names and levels JSON
import flash.geom.ColorTransform;
```

#### UpdateImpl()

```javascript
if(param1.sMarkerText && systemNamesAndLevels.hasOwnProperty(param1.sMarkerText))
{
	var colorTransform:* = SystemNameplate.GetColorTransformForSystem(param1.sMarkerText);
	this.Nameplate_mc.NameplateText_mc.transform.colorTransform = colorTransform;
}
```

#### GetColorTransformForSystem
```js
private GetColorTransformForSystem(var systemName:String) : ColorTransform
{
	var systemLabelColor:* = new ColorTransform();
	var level:* = systemNamesAndLevels[systemName];
	if(level <= 10)
	{
		systemLabelColor.color = 1153433;
	}
	else if(level <= 20)
	{
		systemLabelColor.color = 65280;
	}
	else if(level <= 30)
	{
		systemLabelColor.color = 16776960;
	}
	else if(level <= 50)
	{
		systemLabelColor.color = 16487424;
	}
	else if(level <= 75)
	{
		systemLabelColor.color = 16711680;
	}
	else
	{
		systemLabelColor.color = 16777215; // #b7b7b7
	}
	return systemLabelColor;
}
```

Level/Color thresholds:

