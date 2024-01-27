```js
// decl
public static function ResolveStarbornCategory(patchData:Object) : *
{
	if (patchData && patchData.uCategory)
	{
		return patchData.uCategory > 5 ? 2 : patchData.uCategory;
	}
	else
	{
		return 1;
	}
}
```

```js
public function PopulateData(param1:Object) : *
{
	var category:* = SkillsPopupWidget.ResolveStarbornCategory(param1);
	var _loc2_:String = SkillsUtils.GetFullDefaultSkillPatchName(category);
	// replaces this line:
	//var _loc2_:String = SkillsUtils.GetFullDefaultSkillPatchName(param1.uCategory);
}
```

