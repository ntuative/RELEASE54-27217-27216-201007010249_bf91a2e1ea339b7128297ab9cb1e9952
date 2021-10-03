package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_868:String = "select_outfit";
       
      
      private var var_2061:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_868);
         var_2061 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2061;
      }
   }
}
