package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_682:Array;
      
      private var var_1469:int;
      
      private var var_1514:Array;
      
      private var var_681:Array;
      
      private var var_1379:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1379 = _loc2_.isWrappingEnabled;
         var_1469 = _loc2_.wrappingPrice;
         var_1514 = _loc2_.stuffTypes;
         var_681 = _loc2_.boxTypes;
         var_682 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_682;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1514;
      }
      
      public function get price() : int
      {
         return var_1469;
      }
      
      public function get boxTypes() : Array
      {
         return var_681;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1379;
      }
   }
}
