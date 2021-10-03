package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1469:int;
      
      private var var_1771:int;
      
      private var var_1830:int = -1;
      
      private var var_153:int;
      
      private var var_1829:int;
      
      private var _offerId:int;
      
      private var var_1468:int;
      
      private var _furniId:int;
      
      private var var_1493:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1829 = param3;
         var_1493 = param4;
         var_1469 = param5;
         var_153 = param6;
         var_1830 = param7;
         var_1771 = param8;
         var_1468 = param9;
      }
      
      public function get status() : int
      {
         return var_153;
      }
      
      public function get price() : int
      {
         return var_1469;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1830;
      }
      
      public function get offerCount() : int
      {
         return var_1468;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1829;
      }
      
      public function get averagePrice() : int
      {
         return var_1771;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get stuffData() : String
      {
         return var_1493;
      }
   }
}
