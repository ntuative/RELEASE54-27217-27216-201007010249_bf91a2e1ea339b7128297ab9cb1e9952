package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_2080:int;
      
      private var var_1469:int;
      
      private var var_2081:int;
      
      private var _offerId:int;
      
      private var var_2082:int;
      
      private var var_2076:int;
      
      private var var_2079:Boolean;
      
      private var var_2077:int;
      
      private var var_2078:Boolean;
      
      private var var_1351:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1351 = param1.readString();
         var_1469 = param1.readInteger();
         var_2078 = param1.readBoolean();
         var_2079 = param1.readBoolean();
         var_2081 = param1.readInteger();
         var_2077 = param1.readInteger();
         var_2082 = param1.readInteger();
         var_2080 = param1.readInteger();
         var_2076 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_2082;
      }
      
      public function get month() : int
      {
         return var_2080;
      }
      
      public function get price() : int
      {
         return var_1469;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_2081;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_2077;
      }
      
      public function get upgrade() : Boolean
      {
         return var_2078;
      }
      
      public function get day() : int
      {
         return var_2076;
      }
      
      public function get vip() : Boolean
      {
         return var_2079;
      }
      
      public function get productCode() : String
      {
         return var_1351;
      }
   }
}
