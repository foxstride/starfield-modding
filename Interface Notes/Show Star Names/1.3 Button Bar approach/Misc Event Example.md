```
dispatchCustomEvent("StarMapMenu_ToggleStarNames", param2:Object = null)

BSUIDataManager.dispatchCustomEvent("StarMapMenu_ToggleStarNames",{"starNamesVisible":false});


this.addEventListener(KeyboardEvent.KEY_DOWN,this.onMainKey,false,0,true);
this.stage.removeEventListener(KeyboardEvent.KEY_DOWN)

private function onMainKey(param1:KeyboardEvent) : void
{
    var _loc2_:Boolean = param1.type === KeyboardEvent.KEY_DOWN;
    if(this.mainType !== TYPE_INVENTORY)
    {
        if(_loc2_)
        {
            if(param1.keyCode === Keyboard.CONTROL)
            {
                this.controlKeyDown = !this.controlKeyDown;
                this.shiftKeyDown = false;
                this.onTransferModifierKeyChanged();
            }
            if(param1.keyCode === Keyboard.SHIFT)
            {
                this.shiftKeyDown = !this.shiftKeyDown;
                this.controlKeyDown = false;
                this.onTransferModifierKeyChanged();
            }
        }
    }
}


override public function onRemovedFromStage() : void
{
    super.onRemovedFromStage();
    this.PreviewSceneRect_mc.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOverModel);
    this.PreviewSceneRect_mc.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOutModel);
}
```