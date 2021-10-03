package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1988:int;
      
      private var var_1175:int;
      
      private var var_1989:int;
      
      private var var_1583:int;
      
      private var var_121:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1583 = param1.readInteger();
         var_1989 = param1.readInteger();
         var_1175 = param1.readInteger();
         var_1988 = param1.readInteger();
         var_121 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1583);
      }
      
      public function get chatRecordId() : int
      {
         return var_1988;
      }
      
      public function get reportedUserId() : int
      {
         return var_1175;
      }
      
      public function get callerUserId() : int
      {
         return var_1989;
      }
      
      public function get callId() : int
      {
         return var_1583;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_121;
      }
   }
}
