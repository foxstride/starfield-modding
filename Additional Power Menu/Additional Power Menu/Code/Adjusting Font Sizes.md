Not sure how to set this in the text fields without a working font tag, so doing it programmatically

```js
private function setTextSizeForSelection()
{
	var nameTextFormat:* = this.SelectionInfo_mc.Name_mc.Name_tf.getTextFormat();
	nameTextFormat.size = PowersMenu.NAME_DESCRIPTION_FONT_SIZE;            
	this.SelectionInfo_mc.Name_mc.Name_tf.setTextFormat(nameTextFormat);
            
	var descriptionTextFormat:* = this.SelectionInfo_mc.Description_mc.Description_tf.getTextFormat();
	descriptionTextFormat.size = PowersMenu.NAME_DESCRIPTION_FONT_SIZE;            this.SelectionInfo_mc.Description_mc.Description_tf.setTextFormat(descriptionTextFormat);
	
	var costTextFormat:* = this.SelectionInfo_mc.Cost_mc.PowerCost_mc.Text_tf.getTextFormat();
	costTextFormat.size = PowersMenu.POWER_COST_FONT_SIZE;            this.SelectionInfo_mc.Cost_mc.PowerCost_mc.Text_tf.setTextFormat(costTextFormat);
	
	var totalTextFormat:* = this.SelectionInfo_mc.Total_mc.PowerCost_mc.Text_tf.getTextFormat();
	totalTextFormat.size = PowersMenu.POWER_COST_FONT_SIZE;            this.SelectionInfo_mc.Total_mc.PowerCost_mc.Text_tf.setTextFormat(totalTextFormat);
}
```
