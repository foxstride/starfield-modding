UpdateImpl
```js
if(param1.iFontSize && this.Nameplate_mc.NameplateText_mc.text_tf.getTextFormat)
{
	var textFormat:* = this.Nameplate_mc.NameplateText_mc.text_tf.getTextFormat();
	textFormat.size = param1.iFontSize;
	this.Nameplate_mc.NameplateText_mc.text_tf.setTextFormat(textFormat);
}
```