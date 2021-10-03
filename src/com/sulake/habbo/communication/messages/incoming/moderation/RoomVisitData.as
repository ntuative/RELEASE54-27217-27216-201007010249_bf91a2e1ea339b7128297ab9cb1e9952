package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_722:String;
      
      private var var_1812:int;
      
      private var var_1697:Boolean;
      
      private var _roomId:int;
      
      private var var_1813:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1697 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_722 = param1.readString();
         var_1813 = param1.readInteger();
         var_1812 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1697;
      }
      
      public function get roomName() : String
      {
         return var_722;
      }
      
      public function get enterMinute() : int
      {
         return var_1812;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1813;
      }
   }
}
