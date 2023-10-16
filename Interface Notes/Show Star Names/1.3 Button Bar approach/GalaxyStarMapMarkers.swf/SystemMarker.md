#### Class Def

```
private var ShouldShowSystemNames = true;
```

#### ProcessUserEvent()

```
if (param1 == "StarNames")
{
	this.ShouldShowSystemNames = !this.ShouldShowSystemNames;
	if (this.ShouldShowSystemNames)
	{
		this.SystemMarkerContainer_mc.visible = true;
	}
	
	return true;
}
```