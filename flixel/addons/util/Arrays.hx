package flixel.addons.util;

abstract Array2D<T>(Array<Array<T>>) {
   public function new() {
      this= new Array<Array<T>>();
   }
   @:arrayAccess public inline function arrayAccess(key:Int):Dynamic {
      if(this[key]==null) this[key]= new Array<T>();
      return this[key];
   }
}

abstract Array3D<T>(Array<Array2D<T>>) {
   public function new() {
      this= new Array<Array2D<T>>();
   }
   @:arrayAccess public inline function arrayAccess(key:Int):Array2D<T> {
      if(this[key]==null) this[key]= new Array2D<T>();
      return this[key];
   }
   @:arrayAccess public inline function arrayWrite<T>(key:Int, value:Array2D<T>):Array2D<T> {
      this[key]= value;
      return value;
   }
}
