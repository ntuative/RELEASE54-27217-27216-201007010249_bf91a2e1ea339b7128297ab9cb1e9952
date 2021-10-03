package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_272:String = "REOB_OBJECT_ADDED";
      
      public static const const_472:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_96:String = "REOR_REMOVE_DIMMER";
      
      public static const const_115:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_241:String = "REOB_OBJECT_PLACED";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_STICKIE:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_404:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_129:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_610:String = "REOE_OBJECT_REMOVED";
      
      public static const const_123:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_133:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const const_131:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_421:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const ROOM_OBJECT_SELECTED:String = "REOE_OBJECT_SELECTED";
      
      public static const const_453:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_487:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
      
      public static const const_113:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_710:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_117:String = "REOE_WIDGET_REQUEST_TROPHY";
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_161:int;
      
      private var _category:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         var_161 = param4;
         _category = param5;
      }
      
      public function get objectId() : int
      {
         return var_161;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
