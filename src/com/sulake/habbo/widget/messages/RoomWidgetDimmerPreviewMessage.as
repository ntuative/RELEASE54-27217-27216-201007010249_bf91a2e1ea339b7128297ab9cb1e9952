package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage
   {
      
      public static const const_747:String = "RWDPM_PREVIEW_DIMMER_PRESET";
       
      
      private var var_1042:int;
      
      private var _color:uint;
      
      private var var_1817:Boolean;
      
      public function RoomWidgetDimmerPreviewMessage(param1:uint, param2:int, param3:Boolean)
      {
         super(const_747);
         _color = param1;
         var_1042 = param2;
         var_1817 = param3;
      }
      
      public function get brightness() : int
      {
         return var_1042;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_1817;
      }
   }
}
