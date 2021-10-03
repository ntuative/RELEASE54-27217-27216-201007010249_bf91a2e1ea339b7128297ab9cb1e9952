package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1982:String;
      
      private var var_872:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1982 = param1;
         var_872 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1982;
      }
      
      public function get parameter() : String
      {
         return var_872;
      }
   }
}
