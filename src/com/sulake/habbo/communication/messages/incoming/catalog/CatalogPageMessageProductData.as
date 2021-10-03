package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_211:String = "e";
      
      public static const const_80:String = "i";
      
      public static const const_81:String = "s";
       
      
      private var var_1039:String;
      
      private var var_1232:String;
      
      private var var_1233:int;
      
      private var var_2099:int;
      
      private var var_1040:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1232 = param1.readString();
         var_2099 = param1.readInteger();
         var_1039 = param1.readString();
         var_1040 = param1.readInteger();
         var_1233 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1040;
      }
      
      public function get productType() : String
      {
         return var_1232;
      }
      
      public function get expiration() : int
      {
         return var_1233;
      }
      
      public function get furniClassId() : int
      {
         return var_2099;
      }
      
      public function get extraParam() : String
      {
         return var_1039;
      }
   }
}
