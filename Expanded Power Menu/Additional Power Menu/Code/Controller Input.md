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
	// relies on code in SetSelectedIndex being commented out
	// clamp value since we are changing the scroll amount
	var clamped:* = GlobalFunc.Clamp(param1,0,this.maxScrollPosition);
	if(clamped != this._scrollPosition)
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

// commented the first this.scrollPosition related code
// this prevents the list janky with 
// simultaneous mouse-ing over and scrolling
protected function SetSelectedIndex(param1:int) : *
{
	var _loc2_:BSContainerEntry = null;
	var _loc3_:int = this._selectedIndex;
	var _loc4_:int = this.scrollPosition;
	if(!this.initialized)
	{
		this._selectedIndex = -1;
		return;
	}
	this._selectedIndex = GlobalFunc.Clamp(param1,-1,this.entryCount - 1);
	//if(this._selectedIndex < this.scrollPosition)
	//{
	//	this.scrollPosition -= this.scrollPosition - this._selectedIndex;
	//}
	if(this._selectedIndex - this.scrollPosition > this.itemsShown - 1)
	{
		Debug.out.log("SetSelectedIndex B");
		this.scrollPosition += this._selectedIndex - this.scrollPosition - (this.itemsShown - 1);
	}
	if(this._selectedIndex != _loc3_)
	{
		this.OnSelectionChanged(_loc3_,_loc4_);
	}
}
```




