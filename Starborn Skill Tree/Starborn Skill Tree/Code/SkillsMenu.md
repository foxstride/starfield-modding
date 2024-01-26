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
	case SkillUtils.STARBORN:
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