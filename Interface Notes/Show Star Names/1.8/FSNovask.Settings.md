```js
package FSNovask
{
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    
    public class Settings
    {
        
        private static var _instance:Settings;
        
        private static var _configFileName:* = "ShowStarNames.ini";
        
        private static var _fontSize:* = "FontSize";
        
        private static var _fontSizeLarge:* = "FontSizeLarge";
        
        private static var _levelColorDefaultOn:* = "LevelColorDefaultOn";
        
        private static var _maxFontSize:* = 36;
        
        private static var _minFontSize:* = 10;
         
        
        private var _urlLoader:URLLoader;
        
        public var FontSize:* = 14;
        
        public var FontSizeLarge:* = 22;
        
        public var LevelColorDefaultOn:Boolean = false;
        
        public function Settings()
        {
            super();
            _urlLoader = new URLLoader();
            _urlLoader.addEventListener(Event.COMPLETE,urlLoader_complete);
        }
        
        public static function getInstance() : Settings
        {
            if(!_instance)
            {
                _instance = new Settings();
            }
            return _instance;
        }
        
        public function getSettings() : *
        {
            var urlRequest:URLRequest = new URLRequest(_configFileName);
            _urlLoader.load(urlRequest);
        }
        
        private function urlLoader_complete(evt:Event) : void
        {
            var settingsArray:Array = _urlLoader.data.split("\n");
            for each(var settingLine in settingsArray)
            {
                var settingNameAndValue:* = settingLine.split("=");
                if(settingNameAndValue.length != 2)
                {
                    continue;
                }
                var parsedFontSize:Number = 0;
                var parsedSetting:* = "0";
                switch(settingNameAndValue[0])
                {
                    case _fontSize:
                        parsedFontSize = Number(settingNameAndValue[1]);
                        if(!isNaN(parsedFontSize))
                        {
                            this.FontSize = clampFontSize(parsedFontSize);
                        }
                        break;
                    case _fontSizeLarge:
                        parsedFontSize = Number(settingNameAndValue[1]);
                        if(!isNaN(parsedFontSize))
                        {
                            this.FontSizeLarge = clampFontSize(parsedFontSize);
                        }
                        break;
                    case _levelColorDefaultOn:
                        parsedSetting = settingNameAndValue[1].toLowerCase();
                        if(parsedSetting == "1" || parsedSetting == "true")
                        {
                            this.LevelColorDefaultOn = true;
                        }
                        else
                        {
                            this.LevelColorDefaultOn = false;
                        }
                        
                        break;
                }
            }
        }
        
        private function clampFontSize(val:Number) : Number
        {
            return Math.min(_maxFontSize,Math.max(_minFontSize,val));
        }
    }
}

```