package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2029:int = 0;
      
      private var var_1599:int = 0;
      
      private var var_1837:Boolean = false;
      
      private var var_2030:int = 0;
      
      private var var_1831:int = 0;
      
      private var var_1598:int = 0;
      
      private var var_1835:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1599;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1599 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1837 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_1835 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1599 > 0 || var_1598 > 0;
      }
      
      public function get credits() : int
      {
         return var_2030;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_1831 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1598;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1837;
      }
      
      public function get pastClubDays() : int
      {
         return var_1835;
      }
      
      public function get pastVipDays() : int
      {
         return var_1831;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2029 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2029;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1598 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2030 = param1;
      }
   }
}
