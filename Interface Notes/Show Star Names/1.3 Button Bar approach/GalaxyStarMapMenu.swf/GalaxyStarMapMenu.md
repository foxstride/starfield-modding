#### Class Def

```
public function OnStarNamesEvent() : *
{
	this.MapGrid_mc.visible = false;
    // this will go to GalaxyStarMapMarkers
}
```

#### onAddedToStage()

```
this.ButtonHintBar_mc.StarNamesCallback = this.OnStarNamesEvent;
```