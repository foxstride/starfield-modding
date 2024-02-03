```js
// PowersMenu ProcessUserEvent
// adds Accept and Up/Down controls
if(!param2)
{
	switch(param1)
	{
		case "Accept":
			if(this.SelectedPower)
			{
				this.SelectedPower.setActive();
			}
			else
			{
				this.SelectPowersList_mc.ProcessUserEvent(param1);
			}
			_loc3_ = true;
			break;
		case "XButton":
			this.MyButtonManager.ProcessUserEvent(param1,param2);
			break;
		case "Down":
		case "Up":
			this.SelectPowersList_mc.ProcessUserEvent(param1);
			_loc3_ = true;
			break;
		case "LShoulder":
			this.SetNamesVisible(!this.NamesVisible);
			_loc3_ = true;
	}
}
```

```js
// SelectPowersList
import flash.events.Event;

public function ProcessUserEvent(param1:String) : void
{
	switch(param1)
	{
		case "Accept":
			if(this.List_mc.selectedEntry)
			{
				this.onItemPressed();
			}
			break;
		case "Down":
			// dummy event for now
			this.List_mc.onScrollDownArrowClick(new Event("SelectPowersListScrollDown"));
			break;
		case "Up":
			// dummy event for now
			this.List_mc.onScrollUpArrowClick(new Event("SelectPowersListScrollUp"));
	}
}
```

```js
// BSScrollingContainer
public function set scrollPosition(param1:int) : *
{
	// clamp value since we are changing the scroll amount
	var clamped:* = Math.min(Math.max(0,param1),this.maxScrollPosition);
	if(param1 != this._scrollPosition)
	{
		this.updateScrollPosition(clamped);
	}
}

public function onScrollUpArrowClick(param1:Event) : *
{
	if(this.canScroll)
	{
		this.scrollPosition += -3; // originally 1
		param1.stopPropagation();
	}
}

public function onScrollDownArrowClick(param1:Event) : *
{
	if(this.canScroll)
	{
		this.scrollPosition += 3; // originally 1
		param1.stopPropagation();
	}
}
```




