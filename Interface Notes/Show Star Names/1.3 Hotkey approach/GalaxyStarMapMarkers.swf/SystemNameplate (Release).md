
```js
package
{
    import Shared.GlobalFunc;
    import flash.geom.ColorTransform;
    
    [Embed(source="/_assets/assets.swf", symbol="SystemNameplate")]
    public class SystemNameplate extends INameplate
    {
        
        private static var aSystemNamesAndLevels:Object = {
            "386524":35,
            "386585":50,
            "386500":70,
            "386575":30,
            "386570":1,
            "386542":45,
            "386510":60,
            "386591":35,
            "386530":15,
            "386538":15,
            "386564":15,
            "386499":75,
            "386573":15,
            "386528":50,
            "386572":50,
            "386579":45,
            "386604":70,
            "386537":1,
            "386521":55,
            "386526":10,
            "386574":20,
            "386541":45,
            "386512":40,
            "386590":35,
            "386495":75,
            "386606":35,
            "386555":20,
            "386597":20,
            "386503":70,
            "386525":65,
            "386567":1,
            "386561":30,
            "386560":30,
            "386518":60,
            "386529":25,
            "386562":50,
            "386589":30,
            "386509":65,
            "386603":20,
            "386598":20,
            "386498":75,
            "386539":55,
            "386569":60,
            "386568":40,
            "386563":50,
            "386587":25,
            "386550":20,
            "386497":75,
            "386513":45,
            "386551":55,
            "386496":75,
            "386571":40,
            "386549":20,
            "386582":40,
            "386556":35,
            "386504":60,
            "386602":10,
            "386502":75,
            "386523":40,
            "386558":20,
            "386592":25,
            "386588":30,
            "386506":65,
            "386534":55,
            "386532":45,
            "386609":25,
            "386601":10,
            "386501":60,
            "386566":1,
            "386584":70,
            "386552":75,
            "386554":20,
            "386576":40,
            "386577":15,
            "386608":1,
            "386544":35,
            "386531":55,
            "386517":40,
            "386614":55,
            "386586":40,
            "386548":20,
            "386547":25,
            "386565":10,
            "386615":45,
            "386527":10,
            "386583":30,
            "386600":10,
            "386599":5,
            "386511":65,
            "386522":70,
            "386520":65,
            "386540":40,
            "386605":35,
            "386581":45,
            "386508":15,
            "386543":15,
            "386536":65,
            "386559":55,
            "386578":35,
            "386613":5,
            "386507":1,
            "386557":60,
            "386519":70,
            "386514":55,
            "386535":10,
            "405964":10,
            "386553":45,
            "386610":5,
            "386594":30,
            "386593":20,
            "386607":5,
            "386596":10,
            "386533":25,
            "386515":70,
            "386580":5,
            "386611":5,
            "386546":50,
            "386516":60,
            "386545":50,
            "386595":50
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
        
        private static function GetColorTransformForSystem(uBodyID:uint) : ColorTransform
        {
            var systemLabelColor:* = new ColorTransform();
            var level:* = aSystemNamesAndLevels[uBodyID];
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
                if(this.bShowStarNameColors && param1.uBodyID && aSystemNamesAndLevels.hasOwnProperty(param1.uBodyID))
                {
                    var colorTransform:* = SystemNameplate.GetColorTransformForSystem(param1.uBodyID);
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