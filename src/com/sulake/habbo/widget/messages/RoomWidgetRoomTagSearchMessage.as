package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_698:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1809:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_698);
         var_1809 = param1;
      }
      
      public function get tag() : String
      {
         return var_1809;
      }
   }
}