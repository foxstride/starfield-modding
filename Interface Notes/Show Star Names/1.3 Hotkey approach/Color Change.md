#### Class Def

```
// some code
```

#### Method()

```
var systemLevel:uint = uint(param1.data.level); // need to find this

var systemLabelColor:flash.geom.ColorTransform = new flash.geom.ColorTransform();
if (level <= 10)
{
	// cyan
	systemLabelColor.color = 0x119999;
}
else if (level <= 20)
{
	// green
	systemLabelColor.color = 0x00FF00;
}
else if (level <= 30)
{
	// yellow
	systemLabelColor.color = 0xFFFF00;
}
else if (level <= 50)
{
	// orange
	systemLabelColor.color = 0xFB9400;
}
else if (level <= 75)
{
	// red
	systemLabelColor.color = 0xFF0000;
}
else
{
	// white
	systemLabelColor.color = 0xFFFFFF;
}
```