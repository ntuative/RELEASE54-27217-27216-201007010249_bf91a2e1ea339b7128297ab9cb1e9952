package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1762:int;
      
      private var var_1902:int;
      
      private var var_2063:int;
      
      private var _type:int;
      
      private var var_1315:int = -1;
      
      private var var_2067:int;
      
      private var _nutrition:int;
      
      private var var_2068:int;
      
      private var _energy:int;
      
      private var var_2062:int;
      
      private var var_2064:int;
      
      private var var_2066:int;
      
      private var var_1986:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_2065:Boolean;
      
      private var _name:String = "";
      
      private var var_1977:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_2065;
      }
      
      public function get level() : int
      {
         return var_1762;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_2068;
      }
      
      public function get id() : int
      {
         return var_1315;
      }
      
      public function get nutritionMax() : int
      {
         return var_2063;
      }
      
      public function get ownerId() : int
      {
         return var_1977;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1315 = param1.id;
         _type = param1.petType;
         var_2062 = param1.petRace;
         _image = param1.image;
         var_2065 = param1.isOwnPet;
         var_1977 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1762 = param1.level;
         var_2067 = param1.levelMax;
         var_1902 = param1.experience;
         var_2068 = param1.experienceMax;
         _energy = param1.energy;
         var_2064 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_2063 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_2066 = param1.roomIndex;
         var_1986 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_2066;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_2064;
      }
      
      public function get levelMax() : int
      {
         return var_2067;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_2062;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1902;
      }
      
      public function get age() : int
      {
         return var_1986;
      }
   }
}
