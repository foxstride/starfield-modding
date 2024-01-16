Copy FSNovask.PowerNameSettings in full

```js
import FSNovask.PowerNameSettings;


public var PowerName_mc:MovieClip;


private var powerNames:PowerNameSettings;



this.powerNames = PowerNameSettings.getInstance();
this.powerNames.getSettings();



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




/// PowerName_mc placement
// Move H -256.350 V -118.150
// Scale W 305.050 H 18.00
```