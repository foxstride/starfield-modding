```js
public function setupDebugPanel(param1:flash.display.DisplayObjectContainer, param2:flash.geom.Rectangle) : void
{
    Debug.out.iShowDebugPanel = Debug.out.OUTPUT_MODE_ALWAYS;
	Debug.out.setupDebugPanel(param1,param2.x,param2.y,param2.width,param2.height,false,1);
}
```

```js
// ctor
// Favorites-specific X/Y
this.setupDebugPanel(this,new Rectangle(300,0,400,400));
```