package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1511:Array;
      
      private var var_1771:int;
      
      private var var_1769:int;
      
      private var var_1768:int;
      
      private var var_1770:int;
      
      private var _dayOffsets:Array;
      
      private var var_1767:int;
      
      private var var_1510:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1511;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1511 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1769;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1510 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1771 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1768;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1770;
      }
      
      public function get offerCount() : int
      {
         return var_1767;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1767 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1510;
      }
      
      public function get averagePrice() : int
      {
         return var_1771;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1770 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1768 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1769 = param1;
      }
   }
}
