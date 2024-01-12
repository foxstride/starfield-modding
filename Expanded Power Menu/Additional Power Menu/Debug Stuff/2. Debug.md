```js
package
{
    import Helper.TryHard;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.utils.clearTimeout;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getQualifiedSuperclassName;
    import flash.utils.setTimeout;
    
    public class Debug
    {
        
        private static var singleton:Debug = null;
         
        
        public const LEVEL_INFO:int = 0;
        
        public const LEVEL_MESSAGE:int = 1;
        
        public const LEVEL_ERROR:int = 5;
        
        public const OUTPUT_MODE_NEVER:int = 0;
        
        public const OUTPUT_MODE_ON_ERROR:int = 1;
        
        public const OUTPUT_MODE_ON_MESSAGES:int = 2;
        
        public const OUTPUT_MODE_ALWAYS:int = 3;
        
        public var iShowDebugPanel:int = -1;
        
        private const LOG_MAX_LENGTH:int = 200;
        
        private var outTextField:TextField = null;
        
        protected var outTextContainer:Sprite = null;
        
        private var isAddedToTarget:Boolean = false;
        
        protected var targetContainer:DisplayObjectContainer = null;
        
        private var highestLogLevel:int = 0;
        
        private var logData:Vector.<Object> = null;
        
        private var refeshOutputTimeout:uint = 0;
        
        private var outputFilterLevel:int = -3;
        
        private var stopRefresh:Boolean = false;
        
        public function Debug()
        {
            super();
            this.logData = new Vector.<Object>();
            this.iShowDebugPanel = -1;
        }
        
        public static function get out() : Debug
        {
            if(singleton === null)
            {
                singleton = new Debug();
            }
            return singleton;
        }
        
        public function setupDebugPanel(param1:DisplayObjectContainer, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Number = 1) : void
        {
            TryHard.tryFunction(this.setupDebugPanelTried,"setupDebugPanel",param1,param2,param3,param4,param5,param6,param7);
        }
        
        private function setupDebugPanelTried(param1:DisplayObjectContainer, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Number = 1) : void
        {
            if(!param1)
            {
                this.log("<Log> targetContainer is null!");
                return;
            }
            var _loc8_:TextField = null;
            var _loc9_:Sprite = this.outTextContainer;
            this.targetContainer = param1;
            if(_loc9_)
            {
                this.log("<Log> SETUP DEBUG PANEL ALREADY EXISTS! OVERWRITE.",this.LEVEL_INFO);
                if(_loc9_.parent)
                {
                    _loc9_.parent.removeChild(_loc9_);
                }
                this.isAddedToTarget = false;
            }
            _loc8_ = this.buildTextField(param4,param5);
            _loc9_ = new Sprite();
            this.outTextContainer = _loc9_;
            _loc9_.name = "FallUI_debug_panel";
            _loc9_.x = param2;
            _loc9_.y = param3;
            _loc9_.scaleX = param7;
            _loc9_.scaleY = param7;
            var _loc10_:TextField = new TextField();
            _loc10_.width = _loc8_.width;
            _loc10_.height = _loc8_.height;
            _loc10_.background = true;
            if(!param6)
            {
                _loc10_.backgroundColor = 2236962;
                _loc10_.alpha = 0.2;
                _loc8_.addEventListener(MouseEvent.ROLL_OVER,this.onRollEvent,false,0,true);
                _loc8_.addEventListener(MouseEvent.ROLL_OUT,this.onRollEvent,false,0,true);
            }
            else
            {
                _loc10_.backgroundColor = 2236962;
            }
            _loc8_.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel,false,0,true);
            this.outTextField = _loc8_;
            _loc9_.addChild(_loc10_);
            _loc9_.addChild(_loc8_);
            _loc8_ = this.addButton("ALL",null,-1);
            _loc8_ = this.addButton("INFO",_loc8_,0);
            _loc8_ = this.addButton("OTH",_loc8_,-2);
            _loc8_ = this.addButton("MSG",_loc8_,1);
            _loc8_ = this.addButton("ERR",_loc8_,5);
            _loc8_ = this.addButton("HIDE",_loc8_,100);
            _loc8_ = this.addButton("FRZ",_loc8_,101);
            _loc8_ = this.addButton("CLR",_loc8_,103);
            this.updateTfs(this.outputFilterLevel);
            this.log("<Log> Log output panel ready.",this.LEVEL_INFO);
        }
        
        public function disableLevelAutoSwitch() : void
        {
            this.outputFilterLevel = -1;
        }
        
        private function onRollEvent(param1:MouseEvent) : void
        {
            this.outTextContainer.getChildAt(0).alpha = param1.type === MouseEvent.ROLL_OVER ? 1 : 0.2;
        }
        
        private function onMouseWheel(param1:MouseEvent) : void
        {
            param1.stopImmediatePropagation();
            param1.preventDefault();
        }
        
        public function getVisibleBoundaries(param1:DisplayObject = null) : Rectangle
        {
            var _loc4_:Rectangle = null;
            if(!this.isAddedToTarget)
            {
                return null;
            }
            var _loc2_:Rectangle = new Rectangle();
            var _loc3_:Rectangle = this.outTextContainer.transform.pixelBounds;
            _loc2_.topLeft = this.targetContainer.localToGlobal(_loc3_.topLeft);
            _loc2_.bottomRight = this.targetContainer.localToGlobal(_loc3_.bottomRight);
            if(param1)
            {
                _loc4_ = new Rectangle();
                _loc4_.topLeft = param1.globalToLocal(_loc2_.topLeft);
                _loc4_.bottomRight = param1.globalToLocal(_loc2_.bottomRight);
                return _loc4_;
            }
            return _loc2_;
        }
        
        public function pushToTop(param1:DisplayObjectContainer = null) : void
        {
            var _loc2_:DisplayObjectContainer = this.targetContainer;
            var _loc3_:Sprite = this.outTextContainer;
            if(!this.isAddedToTarget)
            {
                return;
            }
            if(!_loc2_)
            {
                return;
            }
            if(_loc2_.contains(_loc3_))
            {
                _loc2_.removeChild(_loc3_);
                if(param1)
                {
                    _loc2_ = param1;
                }
                _loc2_.addChild(_loc3_);
            }
        }
        
        private function buildTextField(param1:Number, param2:Number) : TextField
        {
            var _loc3_:TextFormat = new TextFormat();
            _loc3_.color = 11184810;
            _loc3_.font = "Arial";
            _loc3_.size = 10;
            _loc3_.leading = -1;
            var _loc4_:TextField = new TextField();
            _loc4_.defaultTextFormat = _loc3_;
            _loc4_.setTextFormat(_loc3_);
            _loc4_.width = param1;
            _loc4_.height = param2;
            _loc4_.wordWrap = true;
            return _loc4_;
        }
        
        private function addButton(param1:String, param2:TextField, param3:int) : TextField
        {
            var _loc4_:TextField = this.buildTextField(100,14);
            _loc4_.text = param1;
            _loc4_.y = -16;
            _loc4_.width = _loc4_.textWidth + 4;
            _loc4_.background = true;
            _loc4_.backgroundColor = 2236962;
            _loc4_.selectable = false;
            if(param2)
            {
                _loc4_.x = param2.x + param2.width + 5;
            }
            _loc4_.borderColor = param3 + 10000;
            this.outTextContainer.addChild(_loc4_);
            _loc4_.addEventListener(MouseEvent.CLICK,this.onButtonClick,false,0,true);
            return _loc4_;
        }
        
        private function updateTfs(param1:int) : void
        {
            var _loc3_:TextField = null;
            var _loc4_:int = 0;
            if(!this.outTextContainer)
            {
                return;
            }
            var _loc2_:int = this.outTextContainer.numChildren;
            while(_loc2_--)
            {
                _loc3_ = this.outTextContainer.getChildAt(_loc2_) as TextField;
                if(_loc3_)
                {
                    _loc4_ = _loc3_.borderColor - 10000;
                    if(_loc4_ >= -2)
                    {
                        if(_loc4_ <= 5)
                        {
                            if(_loc4_ !== param1)
                            {
                                _loc3_.backgroundColor = 2236962;
                                _loc3_.textColor = 11184810;
                            }
                            else
                            {
                                _loc3_.backgroundColor = 8947848;
                                _loc3_.textColor = 0;
                            }
                        }
                    }
                }
            }
        }
        
        private function onButtonClick(param1:MouseEvent) : void
        {
            var _loc2_:TextField = param1.target as TextField;
            var _loc3_:int = _loc2_.borderColor - 10000;
            if(_loc3_ >= -2 && _loc3_ <= 5)
            {
                this.outputFilterLevel = _loc3_;
                this.refreshOutput();
                this.updateTfs(_loc3_);
            }
            if(_loc3_ === 100)
            {
                this.outTextContainer.visible = false;
            }
            if(_loc3_ === 103)
            {
                this.logData.splice(0,this.logData.length);
                this.log("(Log cleared)",0);
            }
            if(_loc3_ === 101)
            {
                if(!this.stopRefresh)
                {
                    this.log("(Log freezed)");
                }
                else
                {
                    this.log("(Log unfreezed)");
                }
                this.refreshOutput();
                this.stopRefresh = !this.stopRefresh;
            }
        }
        
        public function log(param1:String = "", param2:int = 1) : void
        {
            var _loc3_:* = this.iShowDebugPanel;
            if(this.highestLogLevel < param2)
            {
                this.highestLogLevel = param2;
                if(param2 > 0)
                {
                    if(this.outputFilterLevel === -3)
                    {
                        this.outputFilterLevel = -2;
                    }
                }
            }
            if(_loc3_ === this.OUTPUT_MODE_NEVER)
            {
                return;
            }
            var _loc4_:Vector.<Object> = this.logData;
            _loc4_.push({
                "level":param2,
                "date":new Date(),
                "message":String(param1)
            });
            if(_loc4_.length > this.LOG_MAX_LENGTH)
            {
                _loc4_.splice(0,10);
            }
            if(_loc3_ === -1)
            {
                return;
            }
            var _loc5_:Boolean = false;
            if(_loc3_ > -1)
            {
                if(_loc3_ === this.OUTPUT_MODE_ON_ERROR)
                {
                    if(this.highestLogLevel >= this.LEVEL_ERROR)
                    {
                        _loc5_ = true;
                    }
                }
                else if(_loc3_ == this.OUTPUT_MODE_ON_MESSAGES)
                {
                    if(this.highestLogLevel >= this.LEVEL_MESSAGE)
                    {
                        _loc5_ = true;
                    }
                }
                else if(_loc3_ === this.OUTPUT_MODE_ALWAYS)
                {
                    _loc5_ = true;
                }
            }
            if(!_loc5_)
            {
                return;
            }
            if(!this.outTextField)
            {
                return;
            }
            if(!this.outTextContainer.visible)
            {
                return;
            }
            if(!this.isAddedToTarget)
            {
                this.targetContainer.addChild(this.outTextContainer);
                this.isAddedToTarget = true;
                this.log("<Log> Output inited with output_mode=" + _loc3_,this.LEVEL_INFO);
            }
            clearTimeout(this.refeshOutputTimeout);
            this.refeshOutputTimeout = setTimeout(this.refreshOutput,25);
        }
        
        public function info(param1:String = "") : void
        {
            this.log(param1,this.LEVEL_INFO);
        }
        
        private function refreshOutput() : void
        {
            if(this.stopRefresh)
            {
                return;
            }
            this.outTextField.htmlText = this.logData.map(this.formatLogLine).join("");
            this.outTextField.scrollV = this.outTextField.maxScrollV;
        }
        
        private function formatLogLine(param1:Object) : String
        {
            var _loc3_:* = null;
            var _loc5_:Date = null;
            var _loc2_:int = int(param1.level);
            var _loc4_:* = this.outputFilterLevel;
            if(_loc4_ > -1)
            {
                if(_loc2_ !== _loc4_)
                {
                    return "";
                }
            }
            else
            {
                if(_loc4_ !== -2)
                {
                    return param1.message + "\n";
                }
                if(_loc2_ === 0)
                {
                    return "";
                }
            }
            return param1.message + "\n";
        }
        
        public function error(param1:Error, param2:String = "", param3:Object = null) : void
        {
            var _loc4_:String = "";
            if(param3)
            {
                if(getQualifiedSuperclassName(param3))
                {
                    _loc4_ = "(" + getQualifiedSuperclassName(param3) + ">)";
                }
            }
            if(param3 && getQualifiedClassName(param3))
            {
                _loc4_ += "(" + getQualifiedClassName(param3) + ">)" + "::";
            }
            else
            {
                _loc4_ += "(unknown)";
            }
            var _loc5_:String = param1.message;
            this.log(_loc4_ + param2 + "> " + param1.name + " | " + _loc5_,this.LEVEL_ERROR);
        }
        
	    public function logObject(param1:Object) : void
        {
            for(var key in param1)
            {
                var msg:* = String(key) + ": \n\t" + String(param1[key]) + "\n";
                this.log(msg);
            }
            this.log("-----");
        }
    }
}

```