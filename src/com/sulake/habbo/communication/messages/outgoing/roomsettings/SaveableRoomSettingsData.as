package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_2271:Boolean;
      
      private var var_2268:Boolean;
      
      private var var_2270:Array;
      
      private var var_2213:Boolean;
      
      private var var_1230:String;
      
      private var var_2267:int;
      
      private var var_2269:Boolean;
      
      private var var_2131:int;
      
      private var var_1323:int;
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_696:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2268 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_2267;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2267 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_2269 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_696;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2213;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2270 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_696 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2271;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2268;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1323;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2213 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_2269;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2270;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_2131 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2271 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_2131;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1323 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1230 = param1;
      }
      
      public function get description() : String
      {
         return var_1230;
      }
   }
}
