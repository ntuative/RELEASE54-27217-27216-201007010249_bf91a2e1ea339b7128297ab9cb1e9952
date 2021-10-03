package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_696:int = 2;
      
      public static const const_856:int = 6;
      
      public static const const_751:int = 1;
      
      public static const const_718:int = 3;
      
      public static const const_952:int = 4;
      
      public static const const_670:int = 5;
       
      
      private var var_2400:String;
      
      private var var_1158:int;
      
      private var var_2142:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1158 = param2;
         var_2142 = param3;
         var_2400 = param4;
      }
      
      public function get time() : String
      {
         return var_2400;
      }
      
      public function get senderId() : int
      {
         return var_1158;
      }
      
      public function get messageText() : String
      {
         return var_2142;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
