In InitializeSkills, we want to use Patch_Container_2 (Science) for the Starborn tree

```js
// decl
import Shared.SkillsUtils;
```

```js
private function InitializeSkills(param1:Array) : *
{
	//while(index < aData.length)
	containerCategory = SkillsUtils.ResolvePatchContainerFromArtName(aData[index]);
	ClipClassReference = getDefinitionByName("Patch_Container_" + containerCategory) as Class;
	// ...
}
```

