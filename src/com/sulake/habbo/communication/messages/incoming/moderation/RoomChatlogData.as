package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_722:String;
      
      private var var_1696:Array;
      
      private var var_1697:Boolean;
      
      private var _roomId:int;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         var_1696 = new Array();
         super();
         var_1697 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_722 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1696.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + var_1697 + ", " + _roomId + ", " + var_722 + ", " + chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return var_1697;
      }
      
      public function get roomName() : String
      {
         return var_722;
      }
      
      public function get chatlog() : Array
      {
         return var_1696;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
