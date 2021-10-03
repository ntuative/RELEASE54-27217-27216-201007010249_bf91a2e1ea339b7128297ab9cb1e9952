package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1762:int;
      
      private var var_1747:int;
      
      private var var_1902:int;
      
      private var var_2063:int;
      
      private var _nutrition:int;
      
      private var var_1315:int;
      
      private var var_2067:int;
      
      private var var_2068:int;
      
      private var _energy:int;
      
      private var var_1986:int;
      
      private var var_2064:int;
      
      private var _ownerName:String;
      
      private var var_1977:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1762;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1747 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1762 = param1;
      }
      
      public function get petId() : int
      {
         return var_1315;
      }
      
      public function get experienceMax() : int
      {
         return var_2068;
      }
      
      public function get nutritionMax() : int
      {
         return var_2063;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_2067 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1977;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1315 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_2064;
      }
      
      public function get respect() : int
      {
         return var_1747;
      }
      
      public function get levelMax() : int
      {
         return var_2067;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_2068 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1902 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_2063 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1977 = param1;
      }
      
      public function get experience() : int
      {
         return var_1902;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_2064 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1986 = param1;
      }
      
      public function get age() : int
      {
         return var_1986;
      }
   }
}
