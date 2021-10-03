package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1957:Boolean;
      
      private var var_1859:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1957 = Boolean(parseInt(param1.@club));
         var_1859 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1957;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1859;
      }
   }
}
