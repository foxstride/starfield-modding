```js
for(var key in param1.data)
{
	var msg:* = String(key) + ": \n\t" + String(param1.data.aMarkersData[0][key]) + "\n";
	Debug.out.log(msg);
}
```

`param1.data.aMarkerData`

```js
Debug.out.log("GalaxyMarkersProvider");
for(var key in param1.data.aMarkerData)
{
	var msg:* = String(key) + ": \n\t" + String(param1.data.aMarkerData[key]) + "\n";
	Debug.out.log(msg);
}
```

```js
Debug.out.log("GalaxyMarkersProvider");
for(var key in param1.data.aMarkerData[0])
{
	var msg:* = String(key) + ": \n\t" + String(param1.data.aMarkerData[0][key]) + "\n";
	Debug.out.log(msg);
}
```

fXCoord
fYCoord