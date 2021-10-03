package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomPlaneVisibilityUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_965:String = "RORPVUM_FLOOR_VISIBILITY";
      
      public static const const_1035:String = "RORPVUM_WALL_VISIBILITY";
       
      
      private var var_389:Boolean = false;
      
      private var _type:String = "";
      
      public function RoomObjectRoomPlaneVisibilityUpdateMessage(param1:String, param2:Boolean)
      {
         super(null,null);
         _type = param1;
         var_389 = param2;
      }
      
      public function get visible() : Boolean
      {
         return var_389;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
