package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1318:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1257:int;
      
      private var var_1151:String;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_1151 = param2;
         var_1257 = param3;
      }
      
      public function get classId() : int
      {
         return var_1257;
      }
      
      public function get itemType() : String
      {
         return var_1151;
      }
   }
}
