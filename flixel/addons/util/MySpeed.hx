package flixel.addons.util;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flash.display.BitmapData;
import Math.round;

@:bitmap("assets/images/x1.png") private class X1Button extends BitmapData {}
@:bitmap("assets/images/x2.png") private class X2Button extends BitmapData {}
@:bitmap("assets/images/x3.png") private class X3Button extends BitmapData {}

class MySpeed extends FlxButton {
   public var x1:Dynamic;
   public var x2:Dynamic;
   public var x3:Dynamic;
   private var speed:Int=1;
   private var base_frame:Int;
   private var base_time:Float;
   public function new(X=-1,Y=10,?X1=null,?X2=null,X3=null) {
      if(X==-1) { X= FlxG.width-100; }
      super(X,Y," ",next);
      base_frame= FlxG.updateFramerate;
      base_time= FlxG.timeScale;
      if(X1==null) { x1= X1Button; } else { x1= X1; }
      if(X2==null) { x2= X2Button; } else { x2= X2; }
      if(X3==null) { x3= X3Button; } else { x3= X3; }
      make_graphic();
   }
   public function set_speed(s:Float=1) {
      FlxG.timeScale= base_time*s;
      FlxG.updateFramerate= round(base_frame*FlxG.timeScale);
   }
   public function next() {
      speed= (speed>=3) ? 1 : (speed+1);
      set_speed(speed);
      make_graphic();
   }
   public function make_graphic() {
      if(speed==1) {
         loadGraphic(x1);
      } else if(speed==2) {
         loadGraphic(x2);
      } else if(speed==3) {
         loadGraphic(x3);
      }
   }
   override public function destroy() {
      FlxG.timeScale= base_time;
      FlxG.updateFramerate= base_frame;
      // leave it behind the way we got it
      super.destroy();
   }
}

