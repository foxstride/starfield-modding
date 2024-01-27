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
private function InitializeSkills(param1:Array) : *
{
	category = this.resolvePatchDataCategory(aData[index]);
	ClipClassReference = getDefinitionByName("Patch_Container_" + category) as Class;
}
```

