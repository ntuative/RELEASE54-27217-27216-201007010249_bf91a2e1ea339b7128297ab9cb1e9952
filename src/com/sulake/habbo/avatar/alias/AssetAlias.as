package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1156:Boolean;
      
      private var _name:String;
      
      private var var_2252:String;
      
      private var var_1155:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2252 = String(param1.@link);
         var_1155 = Boolean(parseInt(param1.@fliph));
         var_1156 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1155;
      }
      
      public function get flipV() : Boolean
      {
         return var_1156;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2252;
      }
   }
}
