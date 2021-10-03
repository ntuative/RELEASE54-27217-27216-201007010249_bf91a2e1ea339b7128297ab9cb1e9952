package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1693:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1546:String = "ROE_MOUSE_ENTER";
      
      public static const const_469:String = "ROE_MOUSE_MOVE";
      
      public static const const_1641:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_214:String = "ROE_MOUSE_CLICK";
      
      public static const const_379:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2107:Boolean;
      
      private var var_2104:Boolean;
      
      private var var_2105:Boolean;
      
      private var var_2106:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2105 = param4;
         var_2106 = param5;
         var_2107 = param6;
         var_2104 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2104;
      }
      
      public function get altKey() : Boolean
      {
         return var_2105;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2106;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2107;
      }
   }
}
