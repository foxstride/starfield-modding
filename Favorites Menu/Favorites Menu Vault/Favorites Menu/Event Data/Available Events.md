```js
BSUIDataManager.Subscribe("PowersMenuData",this.onPowersDataUpdate);




BSUIDataManager.Subscribe("PlayerData",this.onPlayerDataUpdate);
BSUIDataManager.Subscribe("PlayerFrequentData",this.OnPlayerFreqDataUpdate);
BSUIDataManager.Subscribe("PlayerInventoryData",this.onInventoryUpdate);
BSUIDataManager.Subscribe("FireForgetEventData",this.onFireForgetEvent);
BSUIDataManager.Subscribe("PersonalEffectsData",this.onPersonalEffectsDataUpdate);
BSUIDataManager.Subscribe("DataInventoryProvider",this.onDataMenuInventoryDataUpdate);

private function onPlayerDataUpdate(param1:FromClientDataEvent) : void
{
	Debug.out.log("onPlayerDataUpdate");
}

private function OnPlayerFreqDataUpdate(param1:FromClientDataEvent) : void
{
	Debug.out.log("OnPlayerFreqDataUpdate");
}

private function onInventoryUpdate(param1:FromClientDataEvent) : void
{
	Debug.out.log("onInventoryUpdate");
}

private function onFireForgetEvent(param1:FromClientDataEvent) : void
{
	Debug.out.log("onFireForgetEvent");
}

private function onPersonalEffectsDataUpdate(param1:FromClientDataEvent) : *
{
	Debug.out.log("onPersonalEffectsDataUpdate");
}

private function onDataMenuInventoryDataUpdate(param1:FromClientDataEvent) : *
{
	Debug.out.log("onDataMenuInventoryDataUpdate");
}

private function onPowersDataUpdate(param1:FromClientDataEvent) : void
{
	Debug.out.log("onPowersDataUpdate");
}
```