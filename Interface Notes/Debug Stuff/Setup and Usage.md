```js
public function setupDebugPanel(param1:flash.display.DisplayObjectContainer, param2:flash.geom.Rectangle) : void
{
    Debug.out.iShowDebugPanel = Debug.out.OUTPUT_MODE_ALWAYS;
    Debug.out.setupDebugPanel(param1,param2.x,param2.y,param2.width,param2.height,false,1);
    Debug.out.info("Debug panel added.");
}
```

#### Usage

```js
//onAddedToStage
this.setupDebugPanel(this,new Rectangle(1500,400,400,400));
Debug.out.log("blah");
```

#### Enumerated Props

```js
var test:* = {
	"x":"123",
	"y":"456",
	"z":789
};
for(var key in test)
{
	var msg:* = String(key) + ": " + String(test[key]);
	Debug.out.log(msg);
}
```