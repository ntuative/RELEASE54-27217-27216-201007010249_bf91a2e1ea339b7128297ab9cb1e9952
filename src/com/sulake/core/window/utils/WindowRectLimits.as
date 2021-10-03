package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_435:int = -2.147483648E9;
      
      private var var_436:int = 2.147483647E9;
      
      private var var_434:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      private var var_433:int = -2.147483648E9;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_436;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_433 == int.MIN_VALUE && var_436 == int.MAX_VALUE && var_435 == int.MIN_VALUE && var_434 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_436 = param1;
         if(var_436 < int.MAX_VALUE && true && _target.width > var_436)
         {
            _target.width = var_436;
         }
      }
      
      public function setEmpty() : void
      {
         var_433 = int.MIN_VALUE;
         var_436 = int.MAX_VALUE;
         var_435 = int.MIN_VALUE;
         var_434 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_434 = param1;
         if(var_434 < int.MAX_VALUE && true && _target.height > var_434)
         {
            _target.height = var_434;
         }
      }
      
      public function get minHeight() : int
      {
         return var_435;
      }
      
      public function get minWidth() : int
      {
         return var_433;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_433 = var_433;
         _loc2_.var_436 = var_436;
         _loc2_.var_435 = var_435;
         _loc2_.var_434 = var_434;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_433 = param1;
         if(var_433 > int.MIN_VALUE && true && _target.width < var_433)
         {
            _target.width = var_433;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_435 = param1;
         if(var_435 > int.MIN_VALUE && true && _target.height < var_435)
         {
            _target.height = var_435;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_434;
      }
   }
}
