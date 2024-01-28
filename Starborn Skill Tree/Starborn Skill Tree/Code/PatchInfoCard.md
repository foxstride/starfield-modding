```js
private function GetCategoryText(param1:uint) : String
{
		case 5:
			_loc2_ = "Social";
			break;
		case 6:
			_loc2_ = "StarbornNewGame";	
}
```

```js
private function GetTranslatedCategoryTierText(param1:uint, param2:uint) : String
{
	if(param1 <= 5)
	{
		this.TranslationHelper_tf.text = "$" + this.GetCategoryText(param1).toUpperCase() + "_SKILLS_" + this.GetTierText(param2).toUpperCase();
		return this.TranslationHelper_tf.text;
	}
	this.TranslationHelper_tf.text = "$" + this.GetTierText(param2);
	var skillLevel:* = this.TranslationHelper_tf.text;
	this.TranslationHelper_tf.text = "$Level";
	return skillLevel + " " + this.TranslationHelper_tf.text;
}
```

```js
// lower cased
private function GetTierText(param1:uint) : String
{
	var _loc2_:String = null;
	switch(param1)
	{
		case 1:
			_loc2_ = "Basic";
			break;
		case 2:
			_loc2_ = "Advanced";
			break;
		case 3:
			_loc2_ = "Expert";
			break;
		case 4:
			_loc2_ = "Master";
	}
	return _loc2_;
}
```