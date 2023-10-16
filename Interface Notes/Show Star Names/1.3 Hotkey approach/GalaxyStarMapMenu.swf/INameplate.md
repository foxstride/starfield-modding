#### Class Def

```
private function GetChallengeLevelColor(param1:Object) : flash.geom.ColorTransform
{
	var systemChallengeLevel:uint = uint(param1.data.systemChallengeLevel);
	var textColor:ColorTransform = new ColorTransform();
	switch(systemChallengeLevel)
	{
		case 0:
			this.ChallengeIndicator_mc.gotoAndStop("Trivial");
			textColor.color = 0xCC0000;
			break;
		case 1:
			this.ChallengeIndicator_mc.gotoAndStop("Easy");
			textColor.color = 0x69A1BA;
			break;
		case 2:
			this.ChallengeIndicator_mc.gotoAndStop("Average");
			textColor.color = 0xCEB225;
			break;
		case 3:
			this.ChallengeIndicator_mc.gotoAndStop("Challenging");
			textColor.color = 0xE87810;
			break;
		case 4:
			this.ChallengeIndicator_mc.gotoAndStop("Deadly");
			textColor.color = 0xE61C23;
			break;
		default:
		textColor.color = 0xb7b7b7;
		// debug:
		// textColor.color = 0xC11CE6;
		break;
	}
	return textColor;
}

private function SetTextColor(colorTransform:ColorTransform) : void
{
	this.Nameplate_mc.NameplateText_mc.transform.colorTransform = colorTransform;
}
```

#### Update()

```
if(param1.hasOwnProperty("data") && param1.data.hasOwnProperty("systemChallengeLevel"))
{
	var color:* = this.GetChallengeLevelColor(param1);
	this.SetTextColor(color);
}
// don't use this else block in the release
else
{
	var failedColor:ColorTransform = new ColorTransform();
	failedColor.color = 12655846;
	this.SetTextColor(failedColor);
}
```