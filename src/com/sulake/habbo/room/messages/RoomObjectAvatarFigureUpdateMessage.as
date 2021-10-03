package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2062:String;
      
      private var var_444:String;
      
      private var var_652:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_444 = param1;
         var_652 = param2;
         var_2062 = param3;
      }
      
      public function get race() : String
      {
         return var_2062;
      }
      
      public function get figure() : String
      {
         return var_444;
      }
      
      public function get gender() : String
      {
         return var_652;
      }
   }
}
