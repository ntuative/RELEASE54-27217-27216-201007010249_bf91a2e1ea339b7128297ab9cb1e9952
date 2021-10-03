package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_652:String;
      
      private var _id:int;
      
      private var var_2184:String = "";
      
      private var var_2182:int;
      
      private var var_2183:String;
      
      private var var_2110:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2182 = parseInt(param1.@pattern);
         var_652 = String(param1.@gender);
         var_2110 = Boolean(parseInt(param1.@colorable));
         var_2184 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2184;
      }
      
      public function get isColorable() : Boolean
      {
         return var_2110;
      }
      
      public function get gender() : String
      {
         return var_652;
      }
      
      public function get patternId() : int
      {
         return var_2182;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2183;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2183 = param1;
      }
   }
}
