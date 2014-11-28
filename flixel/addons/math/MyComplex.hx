package flixel.addons.math;

import Math;

class MyComplex {
   public var real:Float;
   public var imaginary:Float;

   public function abs():Float {
      return sqrt(pow(real,2)+pow(imaginary,2));
   }

}

abstract CNum(MyComplex) {
   inline public function new(a:Int,b:Int) {
      real= a;
      imaginary= b;
   }
}
