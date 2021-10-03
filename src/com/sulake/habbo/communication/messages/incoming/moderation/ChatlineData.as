package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1662:String;
      
      private var var_2004:int;
      
      private var var_2001:int;
      
      private var var_2002:int;
      
      private var var_2003:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2004 = param1.readInteger();
         var_2002 = param1.readInteger();
         var_2001 = param1.readInteger();
         var_2003 = param1.readString();
         var_1662 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1662;
      }
      
      public function get hour() : int
      {
         return var_2004;
      }
      
      public function get minute() : int
      {
         return var_2002;
      }
      
      public function get chatterName() : String
      {
         return var_2003;
      }
      
      public function get chatterId() : int
      {
         return var_2001;
      }
   }
}
