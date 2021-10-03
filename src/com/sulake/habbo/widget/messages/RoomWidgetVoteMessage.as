package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_138:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1453:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_138);
         var_1453 = param1;
      }
      
      public function get vote() : int
      {
         return var_1453;
      }
   }
}
