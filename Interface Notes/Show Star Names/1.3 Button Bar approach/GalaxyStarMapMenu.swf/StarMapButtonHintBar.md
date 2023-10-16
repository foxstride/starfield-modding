#### Class def
```
public var StarNamesButtonData:ButtonBaseData = null;
public var StarNamesButton:ButtonBase = null;
private var starNamesCallback:Function;
// ...
public function set StarNamesCallback(param1:Function) : *
{
    this.starNamesCallback = param1;
}

private function OnStarNamesEvent() : void
{
    this.starNamesCallback();
}
```

#### PopulateButtons()
```
this.StarNamesButtonData = new ButtonBaseData("STAR NAMES",[new UserEventData("",this.OnStarNamesEvent)]);
this.StarNamesButton = ButtonFactory.AddToButtonBar("BasicButton",this.StarNamesButtonData,this.HintBar_mc) as ButtonBase;
this.StarNamesButton.name = "StarNamesButton";

// add to vector
this.buttonV.push(this.StarNamesButton);
```

