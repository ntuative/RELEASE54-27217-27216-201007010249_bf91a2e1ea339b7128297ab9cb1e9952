package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1151:int;
      
      private var var_1408:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1151 = param1;
         var_1408 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1151;
      }
      
      public function get itemName() : String
      {
         return var_1408;
      }
   }
}
