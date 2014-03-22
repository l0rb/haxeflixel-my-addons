package flixel.addons.util;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flash.display.BitmapData;
import flixel.text.FlxText;

@:bitmap("assets/images/pause.png") private class PauseButton extends BitmapData {}
@:bitmap("assets/images/unpause.png") private class UnpauseButton extends BitmapData {}

class MyPauseSubState extends FlxSubState {
   override public function create() {
      bgColor= 0xc0000000;
      var paused= new FlxText(Std.int(FlxG.width/2-100),Std.int(FlxG.height/2-20),200,"Paused",35,false);
      paused.alignment= "center";
      add(paused);
      var unp= new FlxButton(FlxG.width-150,10," ",close);
      unp.loadGraphic(UnpauseButton);
      add(unp);
   }
}

class MyPause extends FlxButton {
   public function new(X=-1,Y=10,?Pause=null) {
      if(X==-1) { X= FlxG.width-150; }
      super(X,Y," ",pause);
      if(Pause==null) { Pause= PauseButton; }
      loadGraphic(Pause);
   }
   public function pause() {
      FlxG.state.persistentUpdate= false;
      FlxG.state.openSubState(new MyPauseSubState());
   }
}

