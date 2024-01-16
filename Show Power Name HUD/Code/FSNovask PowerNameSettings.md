```js
package FSNovask
{
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    
    public class PowerNameSettings
    {
        
        public static const DEFAULT_POWER_NAMES:Object = {
            "ArtifactPower_AlienReanim":"Alien Reanimation",
            "ArtifactPower_AntiGravityField":"Anti-Gravity Field",
            "ArtifactPower_CreateVacuum":"Create Vacuum",
            "ArtifactPower_CreatorsPeace":"Creators\' Peace",
            "ArtifactPower_Earthbound":"Earthbound",
            "ArtifactPower_ElementalBlast":"Elemental Pull",
            "ArtifactPower_EternalHarvest":"Eternal Harvest",
            "ArtifactPower_GravDash":"Grav Dash",
            "ArtifactPower_GravWave":"Gravity Wave",
            "ArtifactPower_GravWell":"Gravity Well",
            "ArtifactPower_InnerDemon":"Inner Demon",
            "ArtifactPower_LifeForced":"Life Forced",
            "ArtifactPower_MoonForm":"Moon Form",
            "ArtifactPower_ParallelSelf":"Parallel Self",
            "ArtifactPower_ParticleBeam":"Particle Beam",
            "ArtifactPower_PersonalAtmo":"Personal Atmosphere",
            "ArtifactPower_PhasedTime":"Phased Time",
            "ArtifactPower_Precognition":"Precognition",
            "ArtifactPower_ReactiveShield":"Reactive Shield",
            "ArtifactPower_SenseStarStuff":"Sense Star Stuff",
            "ArtifactPower_SolarFlare":"Solar Flare",
            "ArtifactPower_SunlessSpace":"Sunless Space",
            "ArtifactPower_Supernova":"Supernova",
            "ArtifactPower_VoidForm":"Void Form"
        };
        
        private static var _instance:PowerNameSettings;
        
        private static var _configFileName:* = "ShowPowerNameHUDTranslate.txt";
         
        
        private var powerNames:Object;
        
        private var _urlLoader:URLLoader;
        
        public function PowerNameSettings()
        {
            this.powerNames = {};
            super();
            _urlLoader = new URLLoader();
            _urlLoader.addEventListener(Event.COMPLETE,urlLoader_complete);
        }
        
        public static function getInstance() : PowerNameSettings
        {
            if(!_instance)
            {
                _instance = new PowerNameSettings();
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
                if(settingNameAndValue.length == 2)
                {
                    var parsedPowerKey:String = String(settingNameAndValue[0]);
                    var parsedPowerName:String = String(settingNameAndValue[1]);
                    if(parsedPowerKey && parsedPowerName)
                    {
                        this.powerNames[parsedPowerKey] = parsedPowerName;
                    }
                }
            }
        }
        
        public function GetPowerName(sKey:String) : String
        {
            if(this.powerNames.hasOwnProperty(sKey))
            {
                return this.powerNames[sKey];
            }
            if(PowerNameSettings.DEFAULT_POWER_NAMES.hasOwnProperty(sKey))
            {
                return Settings.DEFAULT_POWER_NAMES[sKey];
            }
            return sKey;
        }
    }
}

```