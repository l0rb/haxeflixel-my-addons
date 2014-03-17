package flixel.addons.ui;

import flixel.addons.ui.FlxButtonPlus;
import flixel.addons.text.MyText;
import flixel.FlxG;
class MyButton extends FlxButtonPlus {
   public function new(X:Float=0, Y:Float=0, ?Callback:Void->Void, ?Label:String, Width:Int=100, Height:Int=20) {
      super(X,Y,Callback,Label,Width,Height);
      moves= false;
      if(Label!=null) {
         var t= new MyText(X,Y,Width,Label,Height);
         t.alignment= "center";
         textNormal= t;
         textHighlight= t;
      }
   }
   // because FlxButtonPlus is a group it adds it's x and y to all children if they are changed
   // this results in adding it twice if the list of children contains two pointers to the same object
   // the two methods below prevent that from happening to textNormal and textHighlight
   override private function set_x(Value:Float) {
      super.set_x(Value);
      if(textNormal==textHighlight && textNormal!=null) {
         textNormal.x= Value;
      }
      return Value;
   }
   override private function set_y(Value:Float) {
      super.set_y(Value);
      if(textNormal==textHighlight && textNormal!=null) {
         textNormal.y= Value;
      }
      return Value;
   }
}

