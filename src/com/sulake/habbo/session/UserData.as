package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_444:String = "";
      
      private var var_1975:String = "";
      
      private var var_1974:int = 0;
      
      private var var_1896:int = 0;
      
      private var _type:int = 0;
      
      private var var_1973:String = "";
      
      private var var_647:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1894:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1974 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1973 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_444 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_647 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1974;
      }
      
      public function set webID(param1:int) : void
      {
         var_1894 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1973;
      }
      
      public function set custom(param1:String) : void
      {
         var_1975 = param1;
      }
      
      public function get figure() : String
      {
         return var_444;
      }
      
      public function get sex() : String
      {
         return var_647;
      }
      
      public function get custom() : String
      {
         return var_1975;
      }
      
      public function get webID() : int
      {
         return var_1894;
      }
      
      public function set xp(param1:int) : void
      {
         var_1896 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1896;
      }
   }
}
