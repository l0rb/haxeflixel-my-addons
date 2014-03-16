package flixel.addons.ui;

import flixel.addons.ui.FlxButtonPlus;
import Math.round;

class MyButton extends FlxButtonPlus {
   public function new(X:Int=0, Y:Int=0, ?Callback:Void->Void, ?Label:String, Width:Int=100, Height:Int=20) {
      super(X,Y,Callback,Label,Width,Height);
      if(Label!=null) {
         var fontsize= round(Height/1.2-4);
         textNormal.setFormat(null,fontsize,false);
         textHighlight.setFormat(null,fontsize,false);
      }
   }
}

