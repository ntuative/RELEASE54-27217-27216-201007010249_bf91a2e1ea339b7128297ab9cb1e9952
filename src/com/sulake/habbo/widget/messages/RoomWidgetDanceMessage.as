package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_560:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_916:int = 0;
      
      public static const const_1414:Array = [2,3,4];
       
      
      private var var_83:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_560);
         var_83 = param1;
      }
      
      public function get style() : int
      {
         return var_83;
      }
   }
}
