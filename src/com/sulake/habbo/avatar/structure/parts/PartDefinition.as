package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1593:int = -1;
      
      private var var_1328:Boolean;
      
      private var var_1327:String;
      
      private var var_2023:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_2023 = String(param1["set-type"]);
         var_1327 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1328 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1593 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1327;
      }
      
      public function get staticId() : int
      {
         return var_1593;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1593 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1328;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1328 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1327 = param1;
      }
      
      public function get setType() : String
      {
         return var_2023;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
