```js
// decl
public var SkillTab6:MovieClip; // Added in Top level Frame 1
```

```js
// ctor
// Fix this instead of using literal 5
while(_loc2_ <= this.MaxCategory)
```

```js
private static function get previousCategory() : uint
{
	// ...
	case SkillsUtils.PHYSICAL:
		return SkillsUtils.STARBORN;
	case SkillsUtils.STARBORN:
		return SkillsUtils.STARBORN;
	// ...
}
```

```js
private static function get nextCategory() : uint
{
	case SkillsUtils.STARBORN:
		return SkillsUtils.PHYSICAL;
}
```

```js
private function onLastCategoryUpdate(param1:uint) : void
{
	// ...
	case SkillsUtils.PHYSICAL:
		this.gotoAndStop("PhysicalStopFrame");
		this["SkillTab" + SkillsUtils.STARBORN].gotoAndPlay("OpenLeft");
		this["SkillTab" + SkillsUtils.PHYSICAL].gotoAndPlay("OpenCenter");
		this["SkillTab" + SkillsUtils.SOCIAL].gotoAndPlay("OpenRight");
	case SkillsUtils.STARBORN:
		this.gotoAndStop("StarbornStopFrame");
		this["SkillTab" + SkillsUtils.STARBORN].gotoAndPlay("OpenCenter");
		this["SkillTab" + SkillsUtils.PHYSICAL].gotoAndPlay("OpenRight");
}
```

```js
private function GetCategoryName(param1:uint, param2:Boolean) : *
{
	//...
	case SkillsUtils.STARBORN:
		return "$StarbornNewGame";
}
```

```js
private function onSetCategory(param1:CustomEvent) : *
{
	// make sure we put breaks to not fall through
	case SkillsUtils.SOCIAL:
		this.gotoAndStop("SocialStopFrame");
		break;
	case SkillsUtils.STARBORN:
		this.gotoAndStop("StarbornStopFrame");
}
```

```js
private function onPatchChanges() : *
{
	while(_loc1_ <= this.MaxCategory)
}
```

```js
private function onClosing() : *
{
	while(_loc1_ <= this.MaxCategory)
}
```

```js
private function CloseMenu(param1:Boolean) : *
{
	while(_loc2_ <= this.MaxCategory)
}
```

```js
private function set CurrentCategory(param1:int) : *
{
	else if(param1 > SkillsUtils.STARBORN)
}
```


```js
internal function frame134() : *
{
	stop();
}
```
---
# AddFrameScript
```js
//addFrameScript

// When adding frames, need to offset all frame numbers after the added frames by the amount of frames that we added

// e.g. if adding one frame as Frame 111, 110 / this.frame111 will become 111/this.frame112

addFrameScript(6,
			this.frame7,
			7,
			this.frame8,
			32,
			this.frame33,
			33,
			this.frame34,
			58,
			this.frame59,
			59,
			this.frame60,
			84,
			this.frame85,
			85,
			this.frame86,
			109,
			this.frame110,
			110,
			this.frame111,
			133,
			this.frame134,
			134,
			this.frame135,
			135,
			this.frame136,
			160,
			this.frame161,
			161,
			this.frame162,
			186,
			this.frame187,
			187,
			this.frame188,
			212,
			this.frame213,
			213,
			this.frame214,
			238,
			this.frame239,
			239,
			this.frame240,
			264,
			this.frame265,
			273,
			this.frame274);
```