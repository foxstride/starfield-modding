Needed before adding category to TabBar
```js
package SkillsMenu_fla
{
    import flash.display.MovieClip;
    
    [Embed(source="/_assets/assets.swf", symbol="SkillsMenu_fla.Tab_Category_Starborn_30")]
    public dynamic class Tab_Category_Starborn_30 extends MovieClip
    {
         
        
        public function Tab_Category_Starborn_30()
        {
            super();
            addFrameScript(0,this.frame1);
        }
        
        internal function frame1() : *
        {
            stop();
        }
    }
}

```