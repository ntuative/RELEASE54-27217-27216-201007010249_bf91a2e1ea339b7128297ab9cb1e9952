package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2024:Number;
      
      private var var_628:Number = 0;
      
      private var var_2025:Number;
      
      private var var_627:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2024 = param1;
         var_2025 = param2;
      }
      
      public function update() : void
      {
         var_627 += var_2025;
         var_628 += var_627;
         if(var_628 > 0)
         {
            var_628 = 0;
            var_627 = var_2024 * -1 * var_627;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_627 = param1;
         var_628 = 0;
      }
      
      public function get location() : Number
      {
         return var_628;
      }
   }
}
