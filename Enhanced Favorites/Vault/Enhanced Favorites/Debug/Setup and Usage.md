```js
public function setupDebugPanel(param1:flash.display.DisplayObjectContainer, param2:flash.geom.Rectangle) : void
{
    Debug.out.iShowDebugPanel = Debug.out.OUTPUT_MODE_ALWAYS;
    Debug.out.setupDebugPanel(param1,param2.x,param2.y,param2.width,param2.height,false,1);
}
```

```js
this.setupDebugPanel(this,new Rectangle(350,-200,400,400));
```

```js
for(var key in test)
{
	var msg:* = String(key) + ": " + String(test[key]);
	Debug.out.log(msg);
}
```