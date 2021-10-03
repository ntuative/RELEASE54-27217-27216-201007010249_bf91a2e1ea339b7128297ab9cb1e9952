package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_739:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_563:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_739);
         var_563 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_563;
      }
   }
}
