package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1151:String;
      
      private var var_1802:int;
      
      private var var_1803:int;
      
      private var var_1517:int;
      
      private var var_1796:int;
      
      private var _category:int;
      
      private var var_2519:int;
      
      private var var_1801:int;
      
      private var var_1800:int;
      
      private var var_1797:int;
      
      private var var_1798:int;
      
      private var var_1799:Boolean;
      
      private var var_1493:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1802 = param1;
         var_1151 = param2;
         var_1803 = param3;
         var_1797 = param4;
         _category = param5;
         var_1493 = param6;
         var_1517 = param7;
         var_1800 = param8;
         var_1801 = param9;
         var_1798 = param10;
         var_1796 = param11;
         var_1799 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1797;
      }
      
      public function get extra() : int
      {
         return var_1517;
      }
      
      public function get stuffData() : String
      {
         return var_1493;
      }
      
      public function get groupable() : Boolean
      {
         return var_1799;
      }
      
      public function get creationMonth() : int
      {
         return var_1798;
      }
      
      public function get roomItemID() : int
      {
         return var_1803;
      }
      
      public function get itemType() : String
      {
         return var_1151;
      }
      
      public function get itemID() : int
      {
         return var_1802;
      }
      
      public function get songID() : int
      {
         return var_1517;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1800;
      }
      
      public function get creationYear() : int
      {
         return var_1796;
      }
      
      public function get creationDay() : int
      {
         return var_1801;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
