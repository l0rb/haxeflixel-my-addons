package flixel.addons.math;

import Math;

class MyComplexNumberBaseClass {
   public var real:Float;
   public var imaginary:Float;

   inline public function new(a:Float,b:Float) {
      this.real= a;
      this.imaginary= b;
   }
}

@:forward(real, imaginary)
abstract MyComplex(MyComplexNumberBaseClass) {
   inline public function new(a:Float,b:Float) {
      this= new MyComplexNumberBaseClass(a,b);
   }

   public var abs(get, never):Float;
   public function get_abs():Float {
      return Math.sqrt(Math.pow(this.real,2)+Math.pow(this.imaginary,2));
   }

   public var square(get, never):MyComplex;
   public function get_square():MyComplex {
      var a= Math.pow(this.real,2)-Math.pow(this.imaginary,2);
      var b= 2*this.real*this.imaginary;
      return new MyComplex(a,b);
   }

   @:op(a+b) public function addition(rhs:MyComplex) {
      return new MyComplex(this.real+rhs.real,this.imaginary+rhs.imaginary);
   }

}
