#### Class Def

```
private function ToggleStarNames() : void
{
	this.ShouldShowStarNames = !this.ShouldShowStarNames;
	SystemMarkerContainer_mc.visible = this.ShouldShowStarNames;
}
```

#### ProcessUserEvent()

```
if(param1 == "ToggleStarNames")
{
	this.ToggleStarNames();
	return true;
}
```