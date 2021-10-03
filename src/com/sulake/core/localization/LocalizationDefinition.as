package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1521:String;
      
      private var var_689:String;
      
      private var var_1519:String;
      
      private var var_1520:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1520 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1521 = _loc5_[0];
         var_1519 = _loc5_[1];
         _name = param2;
         var_689 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1521;
      }
      
      public function get languageCode() : String
      {
         return var_1520;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_689;
      }
      
      public function get encoding() : String
      {
         return var_1519;
      }
      
      public function get id() : String
      {
         return var_1520 + "_" + var_1521 + "." + var_1519;
      }
   }
}
