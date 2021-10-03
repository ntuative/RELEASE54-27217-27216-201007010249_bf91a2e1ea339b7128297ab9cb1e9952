package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_693:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_583:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_249:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1552:Point;
      
      private var var_1551:Rectangle;
      
      private var var_154:Number = 0.0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0.0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1551 = param2;
         var_1552 = param3;
         var_154 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1551 != null)
         {
            return var_1551.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_154;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1552 != null)
         {
            return var_1552.clone();
         }
         return null;
      }
   }
}
