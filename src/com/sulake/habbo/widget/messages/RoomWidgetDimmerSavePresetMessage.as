package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_725:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1735:int;
      
      private var var_1738:int;
      
      private var var_2285:Boolean;
      
      private var var_1042:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_725);
         var_1738 = param1;
         var_1735 = param2;
         _color = param3;
         var_1042 = param4;
         var_2285 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1735;
      }
      
      public function get presetNumber() : int
      {
         return var_1738;
      }
      
      public function get brightness() : int
      {
         return var_1042;
      }
      
      public function get apply() : Boolean
      {
         return var_2285;
      }
   }
}
