package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.plugin.MouseEventManager;
import flixel.addons.text.MyText;

class MyMessageState extends FlxSubState {
   public var bgcolor(default,set):Int;

   private var _bg:FlxSprite;

   public function set_bgcolor(color:Int):Int {
      _bg.makeGraphic(_bg.frameWidth,_bg.frameHeight,color,true);
      return bgcolor= color;
   }

   public function new(m:String,Bgcolor=0xBB000000) {
      super();
      var g= new FlxSprite(0,0).makeGraphic(FlxG.width,FlxG.height,0x01000000,true);
      MouseEventManager.add(g,null,unfreeze);
      add(g);

      var from_top= Std.int(FlxG.height/2);
      
      var t= new MyText(15,from_top+5,FlxG.width-30,m,Reg.textsize_normal);
      //t.alignment= "center";
      //t.borderStyle= FlxText.BORDER_OUTLINE;
      //t.borderColor= 0; // that's black
      t.y-= t.frameHeight/2;
         
      _bg= new FlxSprite(t.x-5,t.y-5).makeGraphic(t.frameWidth+10,t.frameHeight+10,Bgcolor,true);
      add(_bg);
      add(t);
      
      bgcolor= Bgcolor;
   }
   private function unfreeze(s:FlxSprite) {
      close();
   }
}

