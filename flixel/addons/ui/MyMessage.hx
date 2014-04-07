package flixel.addons.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.text.MyText;

class MyMessageState extends FlxSubState {
   public static var VALIGN_TOP= 1;
   public static var VALIGN_CENTER= 2;
   public static var VALIGN_BOTTOM= 3;

   public var bgcolor(default,set):Int;

   private var _bg:FlxSprite;
   private var _message:Array<String>;
   private var _index:Int;
   private var _valign:Int;
   private var padding:Int;
   private var margin:Int;
   private var _text:MyText;

   private function update_y() {
      _text.draw();
      if(_valign==VALIGN_TOP) _text.y= margin+padding;
      if(_valign==VALIGN_BOTTOM) _text.y= FlxG.height-_text.frameHeight-margin-padding;
      if(_valign==VALIGN_CENTER) _text.y= (FlxG.height-_text.frameHeight)/2+padding;
      trace(_text,_text.text);
      _bg.y= _text.y-padding;
      _bg.makeGraphic(_text.frameWidth+2*padding,_text.frameHeight+2*padding,bgcolor,true);
   }

   public function new(Message:Array<String>,TextSize=18,Valign=2,Bgcolor=0xBB000000,P=5,M=10) {
      super();
      padding= P;
      margin= M;

      _message= Message;
      _index= 0;
      _valign= Valign;

      var from_top= Std.int(FlxG.height/2);
      
      _text= new MyText(margin+padding,from_top+padding,FlxG.width-2*(margin+padding),_message[0],TextSize);
      
      //_text.alignment= "center";
      //_text.borderStyle= FlxText.BORDER_OUTLINE;
      //_text.borderColor= 0; // that's black
         
      _bg= new FlxSprite(_text.x-padding,_text.y-padding);
      update_y();

      add(_bg);
      add(_text);
      
      bgcolor= Bgcolor;
   }
   private function next() {
      _index+= 1;
      if(_index>=_message.length) close();
      else {
         _text.text= _message[_index];
         update_y();
      }
   }
   public function set_bgcolor(color:Int):Int {
      _bg.makeGraphic(_bg.frameWidth,_bg.frameHeight,color,true);
      return bgcolor= color;
   }
   override public function update() {
      super.update();
      if(FlxG.mouse.justReleased) next();
   }

}

