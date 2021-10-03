package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1986:int;
      
      private var var_444:String;
      
      private var var_1762:int;
      
      private var var_1747:int;
      
      private var var_1902:int;
      
      private var var_1987:int;
      
      private var _nutrition:int;
      
      private var var_1315:int;
      
      private var var_1985:int;
      
      private var var_1984:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1977:int;
      
      private var var_1983:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1987;
      }
      
      public function flush() : Boolean
      {
         var_1315 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1985;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1984;
      }
      
      public function get maxNutrition() : int
      {
         return var_1983;
      }
      
      public function get figure() : String
      {
         return var_444;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1747;
      }
      
      public function get petId() : int
      {
         return var_1315;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1315 = param1.readInteger();
         _name = param1.readString();
         var_1762 = param1.readInteger();
         var_1985 = param1.readInteger();
         var_1902 = param1.readInteger();
         var_1984 = param1.readInteger();
         _energy = param1.readInteger();
         var_1987 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1983 = param1.readInteger();
         var_444 = param1.readString();
         var_1747 = param1.readInteger();
         var_1977 = param1.readInteger();
         var_1986 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1902;
      }
      
      public function get ownerId() : int
      {
         return var_1977;
      }
      
      public function get age() : int
      {
         return var_1986;
      }
   }
}
