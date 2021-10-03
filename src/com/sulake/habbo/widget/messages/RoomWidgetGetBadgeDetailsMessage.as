package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_584:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1038:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_584);
         var_1038 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1038;
      }
   }
}
