```js
// decl
public var Starborn_mc:MovieClip;

private var OverStarbornCatcher:Boolean = false;
```

```js
// ctor
// Needs Tab_Category_Starborn_30 script first, otherwise crashes
this.Clips.push(this.Starborn_mc);

this.Starborn_mc.addEventListener(MouseEvent.CLICK,this.onStarbornClick);

this.Starborn_mc.addEventListener(MouseEvent.ROLL_OVER,this.onCombatRollover);
this.Starborn_mc.addEventListener(MouseEvent.ROLL_OUT,this.onCombatRollout);
```

```js
private function onStarbornClick(param1:Event) : *
{
	Debug.out.log("Starborn clicked");
	// will need SkillsMenu changes first
	// dispatchEvent(new CustomEvent(SET_CATEGORY,{"category": 6},true,true));
}

private function onStarbornRollover() : void
{
	this.OverStarbornCatcher = true;
}

private function onStarbornRollout() : void
{
	this.OverStarbornCatcher = false;
}
```