package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_127:int = 0;
      
      public static const const_124:int = 1;
      
      public static const const_109:int = 2;
      
      public static const const_578:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1414:int = 0;
      
      private var var_2237:String = "";
      
      private var var_204:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_204 = param2;
         var_1414 = param3;
         var_2237 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_2237;
      }
      
      public function get chatType() : int
      {
         return var_1414;
      }
      
      public function get text() : String
      {
         return var_204;
      }
   }
}
