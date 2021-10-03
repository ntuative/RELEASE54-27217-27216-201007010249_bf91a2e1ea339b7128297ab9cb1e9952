package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1008:Array;
      
      private var var_971:int;
      
      private var var_1407:String;
      
      private var _offerId:int;
      
      private var var_970:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1407 = param1.readString();
         var_971 = param1.readInteger();
         var_970 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_1008 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1008.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_1008;
      }
      
      public function get priceInCredits() : int
      {
         return var_971;
      }
      
      public function get localizationId() : String
      {
         return var_1407;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_970;
      }
   }
}
