```js
// in ctor
this.setupDebugPanel(this,new Rectangle(-400,-600,300,300));
```


```js
// enumerate
for(var key in test)
{
	var msg:* = String(key) + ": " + String(test[key]);
	Debug.out.log(msg);
}
```