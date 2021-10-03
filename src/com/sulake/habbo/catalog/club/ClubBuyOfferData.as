package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_2080:int;
      
      private var var_2300:Boolean = false;
      
      private var var_2081:int;
      
      private var var_2082:int;
      
      private var var_2077:int;
      
      private var var_1351:String;
      
      private var var_1469:int;
      
      private var _offerId:int;
      
      private var var_2076:int;
      
      private var var_2079:Boolean;
      
      private var var_2078:Boolean;
      
      private var var_467:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1351 = param2;
         var_1469 = param3;
         var_2078 = param4;
         var_2079 = param5;
         var_2081 = param6;
         var_2077 = param7;
         var_2082 = param8;
         var_2080 = param9;
         var_2076 = param10;
      }
      
      public function get month() : int
      {
         return var_2080;
      }
      
      public function get page() : ICatalogPage
      {
         return var_467;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_2079;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_467 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_337;
      }
      
      public function get upgrade() : Boolean
      {
         return var_2078;
      }
      
      public function get localizationId() : String
      {
         return var_1351;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_2077;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_2300;
      }
      
      public function get day() : int
      {
         return var_2076;
      }
      
      public function get year() : int
      {
         return var_2082;
      }
      
      public function get price() : int
      {
         return var_1469;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_2300 = param1;
      }
      
      public function get periods() : int
      {
         return var_2081;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1469;
      }
      
      public function get productCode() : String
      {
         return var_1351;
      }
   }
}
