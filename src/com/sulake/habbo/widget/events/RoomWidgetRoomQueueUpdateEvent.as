package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_409:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_299:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_975:int;
      
      private var var_276:Boolean;
      
      private var var_2132:Boolean;
      
      private var var_1587:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_975 = param2;
         var_2132 = param3;
         var_276 = param4;
         var_1587 = param5;
      }
      
      public function get position() : int
      {
         return var_975;
      }
      
      public function get isActive() : Boolean
      {
         return var_276;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1587;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_2132;
      }
   }
}
