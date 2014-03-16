package flixel.addons.ui;

import flixel.addons.ui.FlxButtonPlus;
import flixel.addons.text.MyText;

class MyButton extends FlxButtonPlus {
   public function new(X:Int=0, Y:Int=0, ?Callback:Void->Void, ?Label:String, Width:Int=100, Height:Int=20) {
      super(X,Y,Callback,Label,Width,Height);
      if(Label!=null) {
         var t= new MyText(X,Y,Width,Label,Height);
         t.alignment= "center";
         textNormal= t;
         textHighlight= t;
      }
   }
}

