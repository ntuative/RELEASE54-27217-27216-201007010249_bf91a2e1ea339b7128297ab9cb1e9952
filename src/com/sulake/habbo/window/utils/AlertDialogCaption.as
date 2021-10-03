package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_389:Boolean;
      
      private var var_204:String;
      
      private var var_1256:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_204 = param1;
         var_1256 = param2;
         var_389 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1256;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_389 = param1;
      }
      
      public function get text() : String
      {
         return var_204;
      }
      
      public function get visible() : Boolean
      {
         return var_389;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1256 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_204 = param1;
      }
   }
}
