package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2384:Class;
      
      private var var_2385:Class;
      
      private var var_2386:String;
      
      private var var_1476:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2386 = param1;
         var_2385 = param2;
         var_2384 = param3;
         if(rest == null)
         {
            var_1476 = new Array();
         }
         else
         {
            var_1476 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2384;
      }
      
      public function get assetClass() : Class
      {
         return var_2385;
      }
      
      public function get mimeType() : String
      {
         return var_2386;
      }
      
      public function get fileTypes() : Array
      {
         return var_1476;
      }
   }
}
