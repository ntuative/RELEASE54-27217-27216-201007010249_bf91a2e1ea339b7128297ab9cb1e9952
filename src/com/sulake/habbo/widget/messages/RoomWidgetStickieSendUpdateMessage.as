package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_507:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_634:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_772:String;
      
      private var var_161:int;
      
      private var var_204:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_161 = param2;
         var_204 = param3;
         var_772 = param4;
      }
      
      public function get objectId() : int
      {
         return var_161;
      }
      
      public function get text() : String
      {
         return var_204;
      }
      
      public function get colorHex() : String
      {
         return var_772;
      }
   }
}
