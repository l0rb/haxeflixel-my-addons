package flixel.addons.sound;

import flixel.FlxG;
import flixel.text.FlxButton;

class MyMute extends FlxButton {
   public var unmute:String;
   public var mute:String;
   public function new(X=-1,Y=-1,Mute="assets/images/mute.png",Unmute="assets/images/unmute.png") {
      if(X==-1) { X= FlxG.width-50; }
      if(Y==-1) { Y= 10; }
      super(X,Y," ",toggle);
      mute= Mute;
      unmute= Unmute;
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

