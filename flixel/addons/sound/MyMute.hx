package flixel.addons.sound;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flash.display.BitmapData;

@:bitmap("assets/images/mute.png") private class MuteButton extends BitmapData {}
@:bitmap("assets/images/unmute.png") private class UnmuteButton extends BitmapData {}

class MyMute extends FlxButton {
   public var unmute:Dynamic;
   public var mute:Dynamic;
   public function new(X=-1,Y=10,?Mute=null,?Unmute=null) {
      if(X==-1) { X= FlxG.width-50; }
      super(X,Y," ",toggle);
      if(Mute==null) { mute= MuteButton; }
      else { mute= Mute; }
      if(Unmute==null) { unmute= UnmuteButton; }
      else { unmute= Unmute; }
      make_graphic();
   }
   public function toggle() {
      FlxG.sound.muted= !FlxG.sound.muted;
      make_graphic();
   }
   public function make_graphic() {
      if(FlxG.sound.muted) {
         loadGraphic(unmute);
      } else {
         loadGraphic(mute);
      }
   }
}

