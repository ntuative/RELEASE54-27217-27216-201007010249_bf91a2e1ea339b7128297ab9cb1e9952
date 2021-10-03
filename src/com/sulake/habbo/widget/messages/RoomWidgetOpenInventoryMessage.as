package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_1054:String = "inventory_badges";
      
      public static const const_1430:String = "inventory_clothes";
      
      public static const const_1348:String = "inventory_furniture";
      
      public static const const_649:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_949:String = "inventory_effects";
       
      
      private var var_1956:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_649);
         var_1956 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1956;
      }
   }
}
