In InitializeSkills, we want to use Patch_Container_2 (Science) for the Starborn tree

```js
// decl
private static var StarbornTagRegExp:RegExp = /\[STARBORN\]\s+?/

private function resolvePatchDataCategory(patchData:Object) : uint
{
	if(patchData.sDescription)
	{
		var matches:* = patchData.sDescription.match(SkillsPatchWidget.StarbornTagRegExp);
		if(matches && matches.length > 0)
		{
			patchData.sDescription = patchData.sDescription.replace(SkillsPatchWidget.StarbornTagRegExp,"");
			patchData.uCategory = 6;
			return 2;
		}
	}
	return patchData.uCategory;
}
```

```js
public function resolvePatchContainerFromArtName(patchData:Object) : uint
{
	var containerCategory:Number = 2;
	if(patchData && patchData.sArtName)
	{
		var split:* = patchData.sArtName.split("_");
		if(split.length > 1)
		{
			Debug.out.log("Split val: " + split[1]);
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

```js
private function InitializeSkills(param1:Array) : *
{
	category = this.resolvePatchDataCategory(aData[index]);
	ClipClassReference = getDefinitionByName("Patch_Container_" + category) as Class;
}
```

