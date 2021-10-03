package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_56:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1041:int;
      
      private var _color:uint;
      
      private var var_1042:int;
      
      private var var_1883:int;
      
      private var var_38:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_56,param6,param7);
         var_38 = param1;
         var_1883 = param2;
         var_1041 = param3;
         _color = param4;
         var_1042 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1042;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1041;
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function get presetId() : int
      {
         return var_1883;
      }
   }
}
