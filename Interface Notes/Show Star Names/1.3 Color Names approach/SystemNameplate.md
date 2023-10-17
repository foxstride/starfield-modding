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
		systemLabelColor.color = 0x00cc00;
	}
	else if(level <= 20)
	{
		systemLabelColor.color = 0x69a0ba;
	}
	else if(level <= 30)
	{
		systemLabelColor.color = 0xceb225;
	}
	else if(level <= 50)
	{
		systemLabelColor.color = 0xe87810;
	}
	else if(level <= 75)
	{
		systemLabelColor.color = 0xe61c23;
	}
	else
	{
		systemLabelColor.color = 0xb7b7b7;
	}
	return systemLabelColor;
}
```

Level/Color thresholds:

<= 10: Green - 0, 204, 0 - 0x00cc00
<= 20: Blue - 105, 161, 186 - 0x69a0ba
<= 30: Yellow - 206, 177, 37 - 0xceb225
<= 50: Orange - 232, 121, 16 - 0xe87810
\>= 50: Red - 230, 28, 36 - 0xe61c23