```js
// in ctor
this.setupDebugPanel(this,new Rectangle(-400,-600,300,300));
```


```js
// enumerate
for(var key in param1.data)
{
	var msg:* = String(key) + ": " + String(param1.data[key]);
	Debug.out.log(msg);
}
```