
```js
package
{
    import Shared.GlobalFunc;
    import flash.geom.ColorTransform;
    
    [Embed(source="/_assets/assets.swf", symbol="SystemNameplate")]
    public class SystemNameplate extends INameplate
    {
        
        private static var aSystemNamesAndLevels:Object = {
            "Al-Battani":35,
            "Alchiba":50,
            "Algorab":70,
            "Alpha Andraste":30,
            "Alpha Centauri":1,
            "Alpha Marae":45,
            "Alpha Ternion":60,
            "Alpha Tirna":35,
            "Altair":15,
            "Andromas":15,
            "Aranae":15,
            "Archimedes":75,
            "Arcturus":15,
            "Bannoc":50,
            "Bannoc Secondus":50,
            "Bara":45,
            "Bardeen":70,
            "Barnard\'s Star":1,
            "Bel":55,
            "Bessel":10,
            "Beta Andraste":20,
            "Beta Marae":45,
            "Beta Ternion":40,
            "Beta Tirna":35,
            "Bohr":75,
            "Bolivar":35,
            "Bradbury":20,
            "Carinae":20,
            "Celebrai":70,
            "Charybdis":65,
            "Cheyenne":1,
            "Copernicus":30,
            "Copernicus Minor":30,
            "Decaran":60,
            "Delta Pavonis":25,
            "Delta Vulpes":50,
            "Denebola":30,
            "Enlil":65,
            "Eridani":20,
            "Eta Cassiopeia":20,
            "Fermi":75,
            "Feynman":55,
            "Foucault":60,
            "Freya":40,
            "Gamma Vulpes":50,
            "Groombridge":25,
            "Guniibuu":20,
            "Hawking":75,
            "Heinlein":45,
            "Heisenberg":55,
            "Huygens":75,
            "Hyla":40,
            "Indum":20,
            "Ixyll":40,
            "Jaffa":35,
            "Kang":60,
            "Kapteyn\'s Star":10,
            "Katydid":75,
            "Khayyam":40,
            "Kryx":20,
            "Kumasi":25,
            "Lantana":30,
            "Leonis":65,
            "Leviathan":55,
            "Linnaeus":45,
            "Lunara":25,
            "Luyten\'s Star":10,
            "Maal":60,
            "Maheo":1,
            "Marduk":70,
            "Masada":75,
            "McClure":20,
            "Moloch":40,
            "Muphrid":15,
            "Narion":1,
            "Nemeria":35,
            "Newton":55,
            "Nikola":40,
            "Nirah":55,
            "Nirvana":40,
            "Oborum Prime":20,
            "Oborum Proxima":25,
            "Olympus":10,
            "Ophion":45,
            "Piazzi":10,
            "Porrima":30,
            "Procyon A":10,
            "Procyon B":5,
            "Proxima Ternion":65,
            "Pyraas":70,
            "Rana":65,
            "Rasalhague":40,
            "Rivera":35,
            "Rutherford":45,
            "Sagan":15,
            "Sakharov":15,
            "Schrodinger":65,
            "Serpentis":55,
            "Shoza":35,
            "Sirius":5,
            "Sol":1,
            "Sparta":60,
            "Strix":70,
            "Syrma":55,
            "Tau Ceti":10,
            "The Pup":10,
            "Tidacha":45,
            "Toliman":5,
            "Ursae Majoris":30,
            "Ursae Minoris":20,
            "Valo":5,
            "Van Maanen\'s Star":10,
            "Vega":25,
            "Verne":70,
            "Volii":5,
            "Wolf":5,
            "Xi Ophiuchi":50,
            "Zelazny":60,
            "Zeta Ophiuchi":50,
            "Zosma":50
        };
        
        private static var NumBeingHighlighted:int = 0;
        
        private static var NumTextBeingShown:int = 0;
         
        
        private var bHighlight:Boolean = false;
        
        private var bAlwaysShowText:Boolean = false;
        
        private var bIsPlotPoint:Boolean = false;
        
        private var bAlwaysShowStarNames:* = false;
        
        private var bShowStarNameColors:* = false;
        
        public function SystemNameplate()
        {
            super();
        }
        
        public static function PreUpdate() : void
        {
            NumBeingHighlighted = 0;
            NumTextBeingShown = 0;
        }
        
        private static function RequestHighlightDelay() : Number
        {
            ++NumBeingHighlighted;
            return MarkerConsts.SOLARSYSTEMMARKER_HIGHLIGHT_DELAY_BASE + MarkerConsts.SOLARSYSTEMMARKER_HIGHLIGHT_DELAY_MULTIPLIER * (NumBeingHighlighted - 1);
        }
        
        private static function RequestShowTextDelay() : Number
        {
            ++NumTextBeingShown;
            return MarkerConsts.SOLARSYSTEMMARKER_SHOW_TEXT_DELAY_BASE + MarkerConsts.SOLARSYSTEMMARKER_SHOW_TEXT_DELAY_MULTIPLIER * (NumTextBeingShown - 1);
        }
        
        private static function GetColorTransformForSystem(systemName:String) : ColorTransform
        {
            var systemLabelColor:* = new ColorTransform();
            var level:* = aSystemNamesAndLevels[systemName];
            if(level <= 10)
            {
                systemLabelColor.color = 52224;
            }
            else if(level <= 20)
            {
                systemLabelColor.color = 6922426;
            }
            else if(level <= 30)
            {
                systemLabelColor.color = 13546021;
            }
            else if(level <= 50)
            {
                systemLabelColor.color = 15235088;
            }
            else if(level <= 75)
            {
                systemLabelColor.color = 15080483;
            }
            else
            {
                systemLabelColor.color = 12040119;
            }
            return systemLabelColor;
        }
        
        override public function Reset() : void
        {
            super.Reset();
            this.bHighlight = false;
            this.bAlwaysShowText = false;
            this.bIsPlotPoint = false;
            this.bAlwaysShowStarNames = false;
            this.bShowStarNameColors = false;
        }
        
        override protected function UpdateImpl(param1:Object) : void
        {
            this.UpdateNameplateColor(param1);
            Nameplate_mc.x = param1.fMarkerRadius;
            Nameplate_mc.y = Nameplate_mc.height * param1.iGroupOrder + 2;
            if(this.bAlwaysShowText == param1.bIsTextPersistent && this.bIsPlotPoint == param1.bIsPlotPoint && this.bHighlight == param1.bShowHighlight && this.bAlwaysShowStarNames == param1.bShowStarNames)
            {
                return;
            }
            if(this.bAlwaysShowText != param1.bIsTextPersistent)
            {
                this.bAlwaysShowText = param1.bIsTextPersistent;
            }
            if(this.bIsPlotPoint != param1.bIsPlotPoint)
            {
                this.bIsPlotPoint = param1.bIsPlotPoint;
            }
            if(this.bHighlight != param1.bShowHighlight)
            {
                this.bHighlight = param1.bShowHighlight;
            }
            if(this.bAlwaysShowStarNames != param1.bShowStarNames)
            {
                this.bAlwaysShowStarNames = param1.bShowStarNames;
            }
            var nameplateUpdate:Number = -1;
            if(this.bHighlight)
            {
                nameplateUpdate = 2;
            }
            else if(!this.bAlwaysShowText && !this.bIsPlotPoint && !this.bHighlight && !this.bAlwaysShowStarNames)
            {
                nameplateUpdate = 0;
            }
            else if(this.bAlwaysShowText || this.bIsPlotPoint || this.bAlwaysShowStarNames && !this.bHighlight)
            {
                nameplateUpdate = 1;
            }
            this.UpdateNameplateVisibility(nameplateUpdate);
        }
        
        private function UpdateNameplateVisibility(param1:uint) : void
        {
            switch(param1)
            {
                case 0:
                    Nameplate_mc.gotoAndPlay("system_close");
                    HideBackgroundAssets();
                    break;
                case 1:
                    Nameplate_mc.gotoAndPlay("system_unselected");
                    HideBackgroundAssets();
                    break;
                case 2:
                    Nameplate_mc.gotoAndPlay("system_selected");
                    SetBackgroundWidth();
                    GlobalFunc.PlayMenuSound("UIMenuStarmapRollover");
            }
        }
        
        private function UpdateNameplateColor(param1:Object) : void
        {
            if(this.bShowStarNameColors != param1.bShowStarNameColors)
            {
                this.bShowStarNameColors = param1.bShowStarNameColors;
                if(this.bShowStarNameColors && param1.sMarkerText && aSystemNamesAndLevels.hasOwnProperty(param1.sMarkerText))
                {
                    var colorTransform:* = SystemNameplate.GetColorTransformForSystem(param1.sMarkerText);
                    this.Nameplate_mc.NameplateText_mc.transform.colorTransform = colorTransform;
                }
                else
                {
                    var defaultColor:* = new ColorTransform();
                    defaultColor.color = 12040119;
                    this.Nameplate_mc.NameplateText_mc.transform.colorTransform = defaultColor;
                }
            }
        }
    }
}

```