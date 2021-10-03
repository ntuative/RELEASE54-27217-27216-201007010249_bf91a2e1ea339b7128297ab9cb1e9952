package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1879:Array;
      
      private var var_1880:String;
      
      private var var_1881:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1880 = param1;
         var_1879 = param2;
         var_1881 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1880;
      }
      
      public function get yieldList() : Array
      {
         return var_1879;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1881;
      }
   }
}
