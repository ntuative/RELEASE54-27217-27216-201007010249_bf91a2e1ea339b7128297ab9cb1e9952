package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1228:String = "F";
      
      public static const const_938:String = "M";
       
      
      private var var_85:Number = 0;
      
      private var var_444:String = "";
      
      private var var_1979:int = 0;
      
      private var var_1975:String = "";
      
      private var var_1974:int = 0;
      
      private var var_1896:int = 0;
      
      private var var_1973:String = "";
      
      private var var_647:String = "";
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_260:int = 0;
      
      private var var_1978:String = "";
      
      private var _name:String = "";
      
      private var var_1894:int = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_260;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_206)
         {
            var_260 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_206)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1979;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_206)
         {
            var_1974 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1978;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_206)
         {
            var_1973 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_206)
         {
            var_1978 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_206)
         {
            var_1896 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_206)
         {
            var_444 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_206)
         {
            var_1979 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_206)
         {
            var_647 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1974;
      }
      
      public function get groupID() : String
      {
         return var_1973;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_206)
         {
            var_1894 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_206)
         {
            var_1975 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function get sex() : String
      {
         return var_647;
      }
      
      public function get figure() : String
      {
         return var_444;
      }
      
      public function get webID() : int
      {
         return var_1894;
      }
      
      public function get custom() : String
      {
         return var_1975;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_86 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_206)
         {
            var_85 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1896;
      }
   }
}
