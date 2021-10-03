package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Triggerable
   {
       
      
      private var var_1279:String;
      
      private var var_1574:String;
      
      private var var_2060:int;
      
      private var var_2059:int;
      
      private var var_310:int;
      
      public function Triggerable(param1:IMessageDataWrapper)
      {
         super();
         var_310 = param1.readInteger();
         var_1279 = param1.readString();
         var_1574 = param1.readString();
         var_2059 = param1.readInteger();
         var_2060 = param1.readInteger();
      }
      
      public function get params() : String
      {
         return var_1574;
      }
      
      public function get cooldownPeriod() : int
      {
         return var_2060;
      }
      
      public function get performCount() : int
      {
         return var_2059;
      }
      
      public function get stuffId() : int
      {
         return var_310;
      }
      
      public function get stuffName() : String
      {
         return var_1279;
      }
   }
}
