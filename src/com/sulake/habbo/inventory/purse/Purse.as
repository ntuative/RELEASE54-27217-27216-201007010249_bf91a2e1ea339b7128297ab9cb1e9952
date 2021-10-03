package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2102:Boolean = false;
      
      private var var_2103:int = 0;
      
      private var var_1599:int = 0;
      
      private var var_2101:int = 0;
      
      private var var_1837:Boolean = false;
      
      private var var_1577:int = 0;
      
      private var var_1598:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1577 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2103;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2102;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2102 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1837;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2103 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1599 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1577;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1837 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2101 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1599;
      }
      
      public function get pixelBalance() : int
      {
         return var_2101;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1598 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1598;
      }
   }
}
