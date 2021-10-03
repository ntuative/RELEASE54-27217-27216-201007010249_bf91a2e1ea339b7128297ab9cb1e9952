package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_902:int;
      
      private var _right:int;
      
      private var var_901:int;
      
      private var var_900:int;
      
      private var var_196:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_901 = param1;
         var_900 = param2;
         _right = param3;
         var_902 = param4;
         var_196 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_902 = param1;
         var_196(this);
      }
      
      public function get left() : int
      {
         return var_901;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_901 == 0 && _right == 0 && var_900 == 0 && var_902 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_900 = param1;
         var_196(this);
      }
      
      public function get top() : int
      {
         return var_900;
      }
      
      public function set left(param1:int) : void
      {
         var_901 = param1;
         var_196(this);
      }
      
      public function get bottom() : int
      {
         return var_902;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_901,var_900,_right,var_902,param1);
      }
      
      public function dispose() : void
      {
         var_196 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_196(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
