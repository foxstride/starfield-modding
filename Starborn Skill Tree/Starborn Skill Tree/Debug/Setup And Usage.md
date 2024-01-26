```js
public function setupDebugPanel(param1:flash.display.DisplayObjectContainer, param2:flash.geom.Rectangle) : void
{
    Debug.out.iShowDebugPanel = Debug.out.OUTPUT_MODE_ALWAYS;
    Debug.out.setupDebugPanel(param1,param2.x,param2.y,param2.width,param2.height,false,1);
}
```

#### Usage

```js
//onAddedToStage
this.setupDebugPanel(this,new Rectangle(1500,400,400,400));

Debug.out.log("blah");

// for PlayerHudComponents.gfx
this.setupDebugPanel(this,new Rectangle(-400,-600,300,300));
```

#### Enumerated Props

```js
var test:* = {
	"x":"123",
	"y":"456",
	"z":789
};
for(var key in param1.data)
{
	var msg:* = String(key) + ": " + String(param1.data[key]);
	Debug.out.log(msg);
}


var i:* = 0;
while(i < param1.data.Patches.dataA.length)
{
	if(param1.data.Patches.dataA[i].sName == "Fitness")
	{
		for(var key in param1.data.Patches.dataA[i])
		{
			var msg:* = String(key) + ": " + String(param1.data.Patches.dataA[i][key]);
			Debug.out.log(msg);
		}
	}
	i++;
}
```