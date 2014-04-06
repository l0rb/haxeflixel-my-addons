package flixel.addons.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.plugin.MouseEventManager;
import flixel.addons.text.MyText;

class MyMessageState extends FlxSubState {
   public var bgcolor(default,set):Int;

   private var _bg:FlxSprite;

   public function new(m:String,Bgcolor=0xBB000000,TextSize=18) {
      super();
      var padding= 5;
      var margin= 10;

      var g= new FlxSprite(0,0).makeGraphic(FlxG.width,FlxG.height,0x01000000,true);
      MouseEventManager.add(g,null,unfreeze);
      add(g);

      var from_top= Std.int(FlxG.height/2);
      
      var t= new MyText(margin+padding,from_top+padding,FlxG.width-2*(margin+padding),m,TextSize);
      //t.alignment= "center";
      //t.borderStyle= FlxText.BORDER_OUTLINE;
      //t.borderColor= 0; // that's black
      t.y-= t.frameHeight/2;
         
      _bg= new FlxSprite(t.x-padding,t.y-padding);
      _bg.makeGraphic(t.frameWidth+2*padding,t.frameHeight+2*padding,Bgcolor,true);
      add(_bg);
      add(t);
      
      bgcolor= Bgcolor;
   }
   private function unfreeze(s:FlxSprite) {
      close();
   }
   public function set_bgcolor(color:Int):Int {
      _bg.makeGraphic(_bg.frameWidth,_bg.frameHeight,color,true);
      return bgcolor= color;
   }

}

