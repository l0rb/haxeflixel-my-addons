package flixel.addons.text;

import flixel.text.FlxText;
import Math.round;

class MyText extends FlxText {
   public function new(X:Float,Y:Float,Width:Int,?Text:String,?Height:Int,Embedded:Bool=false) {
      var font_size= round(Height/1.2-4);
      super(X,Y,Width,Text,font_size,Embedded);
   }
}
