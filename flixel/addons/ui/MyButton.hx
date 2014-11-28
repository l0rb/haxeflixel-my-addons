package flixel.addons.ui;

// testing git

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
   public function is_lit() {
      return (_status==FlxButtonPlus.HIGHLIGHT || _status==FlxButtonPlus.PRESSED);
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
   public function makeButtonGraphic(Normal:Dynamic,?Highlight:Dynamic=null) {
      if(Std.is(Normal, String)) {
         Normal= new FlxSprite(0,0,Normal);
      }
      if(Highlight==null) {
         Highlight= Normal;
      } else if(Std.is(Highlight, String)) {   
         Highlight= new FlxSprite(0,0,Highlight);
      }
      loadButtonGraphic(Normal,Highlight);
   }
}

