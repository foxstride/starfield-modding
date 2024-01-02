### UpdateImpl(param1:Object) : void

Dumb way to make them all show:
`param1.bMarkerVisible = true;`



```js
// Default
override protected function UpdateImpl(param1:Object) : void
{
	Nameplate_mc.x = param1.fMarkerWidth + MarkerConsts.BODY_NAMEPLATE_PADDING;
	Nameplate_mc.y = 0;
	var _loc2_:int = -1;
	if(param1.bMarkerVisible)
	{
		if(param1.uBodyType == BSGalaxyTypes.BT_STAR)
		{
			_loc2_ = STATE_SUN;
		}
		else
		{
			_loc2_ = STATE_NORMAL;
		}
	}
	if(_loc2_ != this.iState)
	{
		this.ExecuteExitState(this.iState,param1);
		this.ExecuteEnterState(_loc2_,param1);
		this.iState = _loc2_;
	}
	this.ExecuteUpdateState(this.iState,param1);
}
```


```js
// Debug a planet
if(param1.uBodyID == 386399)
{
	param1.bMarkerVisible = true;
	for(var key in param1)
	{
		var msg:* = String(key) + ": " + String(param1[key]);
		Debug.out.log(msg);
	}
}
```

