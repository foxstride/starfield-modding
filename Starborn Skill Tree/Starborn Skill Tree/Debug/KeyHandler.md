

```js
stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDownHandler,false,1,false);

private function onKeyDownHandler(param1:KeyboardEvent) : void
{
	if(param1.keyCode == 49) // 1
	{
		Debug.out.log("1");
	}
	else if(param1.keyCode == 50) // 2
	{
		Debug.out.log("2");
	}
}
```