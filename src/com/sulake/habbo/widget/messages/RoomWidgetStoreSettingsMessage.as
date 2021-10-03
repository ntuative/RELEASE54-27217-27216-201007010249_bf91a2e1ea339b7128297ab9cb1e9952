package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_694:String = "RWSSM_STORE_SOUND";
      
      public static const const_677:String = "RWSSM_PREVIEW_SOUND";
      
      public static const const_1405:String = "RWSSM_STORE_SETTINGS";
       
      
      private var var_734:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function set volume(param1:Number) : void
      {
         var_734 = param1;
      }
      
      public function get volume() : Number
      {
         return var_734;
      }
   }
}
