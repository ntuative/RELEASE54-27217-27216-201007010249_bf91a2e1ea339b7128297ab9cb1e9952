package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_240:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1926:Boolean = false;
      
      private var var_1925:int = 0;
      
      private var var_1924:int = 0;
      
      private var var_1858:int;
      
      private var var_1927:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_240,param6,param7);
         var_1927 = param1;
         var_1924 = param2;
         var_1925 = param3;
         var_1926 = param4;
         var_1858 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1858;
      }
      
      public function get pastPeriods() : int
      {
         return var_1925;
      }
      
      public function get periodsLeft() : int
      {
         return var_1924;
      }
      
      public function get daysLeft() : int
      {
         return var_1927;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1926;
      }
   }
}
