```js
package Helper
{
    import Debug.*;
    
    public class TryHard
    {
         
        
        public function TryHard()
        {
            super();
        }
        
        public static function tryFunction(param1:Function, param2:String, ... rest) : *
        {
            var func:Function = param1;
            var errMsg:String = param2;
            var args:Array = rest;
            try
            {
                return func.apply(null,args);
            }
            catch(e:Error)
            {
                if(errMsg)
                {
                    Debug.out.error(e,errMsg,null);
                }
            }
            return null;
        }
        
        public static function tryFunctionArray(param1:Function, param2:String, param3:Array) : *
        {
            var func:Function = param1;
            var errMsg:String = param2;
            var args:Array = param3;
            try
            {
                return func.apply(null,args);
            }
            catch(e:Error)
            {
                if(errMsg)
                {
                    Debug.out.error(e,errMsg,null);
                }
            }
            return null;
        }
    }
}

```