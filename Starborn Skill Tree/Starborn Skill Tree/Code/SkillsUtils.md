```js
// decl
public static const STARBORN:uint = EnumHelper.GetEnum();
```

```js
public static function ResolvePatchDataCategory(patchData:Object) : uint
{
	if(patchData.sDescription)
	{
		var matches:* = patchData.sDescription.match(SkillsUtils.StarbornTagRegExp);
		if(matches && matches.length > 0)
		{
			patchData.sDescription = patchData.sDescription.replace(SkillsUtils.StarbornTagRegExp,"");
			patchData.uCategory = 6;
			return 2;
		}
	}
	return patchData.uCategory;
}
```

```js
public static function ResolvePatchContainerFromArtName(patchData:Object) : uint
{
	var containerCategory:Number = 2;
	if(patchData && patchData.sArtName)
	{
		var split:* = patchData.sArtName.split("_");
		if(split.length > 1)
		{
			switch(split[1])
			{
				case "Combat":
					containerCategory = 1;
					break;
				case "Science":
					containerCategory = 2;
					break;
				case "Technology":
					containerCategory = 3;
					break;
				case "Physical":
					containerCategory = 4;
					break;
				case "Social":
					containerCategory = 5;
			}
		}
	}
	return containerCategory;
}
```