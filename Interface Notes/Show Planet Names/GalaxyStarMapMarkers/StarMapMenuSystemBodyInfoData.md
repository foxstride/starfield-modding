```js
BSUIDataManager.Subscribe("StarMapMenuSystemBodyInfoData",function(param1:FromClientDataEvent):*
{
	for(var key in param1.data)
	{
		var msg:* = String(key) + ": " + String(param1.data[key]);
		Debug.out.log(msg);
	}
	/*
	for(var key in param1.data.childInfoA[0])
	{
		var msg:* = String(key) + ": " + String(param1.data.childInfoA[0][key]);
		Debug.out.log(msg);
	}
	*/
	SystemInfo_mc.SetSystemBodyInfo(param1.data);
	SystemInfoMini_mc.SetSystemBodyInfo(param1.data);
});
```

`param1.data` has  `param1.data.childInfoA` which contains objects for each planet in the system

```json
{
bodyID: 386608, // The star ID in xEdit for the solar system we're in (NarionStar)
parentCelestialBodyID: 0, // no idea
bodyType: 1, // star
color: 4293786876, // no idea
sunRadiusPercent: 1,
scanned: true,
focusedBodyID: 386608, 
focusedCelestialBodyID: 386608,
focusedCelestialBodyName: "Narion",
systemName: "Narion",
childInfoA: [
	// objects for each planet in the system
	// each of these also has "childInfoA" which are the moons for the planet
	{ }
]
},
```

```json
{
// planet object: 
bodyID: 386396,
parentCelestialBodyID: 386608,
bodyType: 2, // planet
color: 16744448,
sunRadiusPercent: 0.4,
scanned: false,
childInfoA: [
	// moons for the planet
	{}
]
}
```

```json
{
// moon object:
bodyID: 386398,
parentCelestialBodyID: 386396,
bodyType: 3, // moon
color: 0,
sunRadiusPercent: 0.044,
scanned: false
}
```
