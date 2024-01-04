```js
private function onKeyDownHandler(param1:KeyboardEvent) : void
{
	if(this.CurrentView != ViewTypes.VIEW_GALAXY)
	{
		return;
	}
	if(param1.keyCode == 51)
	{
		Debug.out.log("Hit 3");
		FakeCursorVisible;
		Debug.out.log("Finish 3");
	}
	else if(param1.keyCode == 52)
	{
		Debug.out.log("Hit 4");
		Debug.out.log("Finish 4");
	}
	else if(param1.keyCode == 53)
	{
		Debug.out.log("Hit 5");
		if(this.OutpostSelect_mc.visible)
		{
			Debug.out.log("Hide Outpost Select");
			this.OutpostSelect_mc.Hide();
		}
		else
		{
			Debug.out.log("Show Outpost Select");
			this.OutpostSelect_mc.Show();
		}
		Debug.out.log("Finish 5");
	}
}
```