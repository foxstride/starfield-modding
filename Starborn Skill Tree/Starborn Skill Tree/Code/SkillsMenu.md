```js
// decl
public var SkillTab6:MovieClip; // Added in Top level Frame 1
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