```js
//import
import FSNovask.PowerNameSettings;

//decl
public var PowerName_mc:MovieClip;

private var powerNames:PowerNameSettings;

//ctor
this.powerNames = PowerNameSettings.getInstance();
this.powerNames.getSettings();

// OnStarbornPowersDataUpdate

if(param1.data.bHasSpell)
{
	var resolvedName:* = this.powerNames.GetPowerName(param1.data.sKey);
	this.PowerName_mc.visible = true;
	GlobalFunc.SetText(this.PowerName_mc.PowerName_txt,resolvedName);
}
else
{
	this.PowerName_mc.visible = false;
	GlobalFunc.SetText(this.PowerName_mc.PowerName_txt,"");
}
```

