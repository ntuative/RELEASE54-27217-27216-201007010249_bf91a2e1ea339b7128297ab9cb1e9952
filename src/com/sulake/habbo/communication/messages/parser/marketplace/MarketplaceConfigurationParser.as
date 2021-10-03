package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_2010:int;
      
      private var var_1586:int;
      
      private var var_2006:int;
      
      private var var_2007:int;
      
      private var var_2011:int;
      
      private var var_1585:int;
      
      private var var_2005:int;
      
      private var var_1379:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_2010;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1586;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_2005;
      }
      
      public function get offerMinPrice() : int
      {
         return var_2007;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_2011;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1585;
      }
      
      public function get commission() : int
      {
         return var_2006;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1379 = param1.readBoolean();
         var_2006 = param1.readInteger();
         var_1586 = param1.readInteger();
         var_1585 = param1.readInteger();
         var_2007 = param1.readInteger();
         var_2010 = param1.readInteger();
         var_2011 = param1.readInteger();
         var_2005 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1379;
      }
   }
}
