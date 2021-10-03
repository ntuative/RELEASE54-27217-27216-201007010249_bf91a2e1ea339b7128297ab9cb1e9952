package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_554:int = 0;
      
      private var _data:String = "";
      
      private var var_1517:int = -1;
      
      private var var_38:int = 0;
      
      private var _type:int = 0;
      
      private var var_662:int = 0;
      
      private var var_2536:String = "";
      
      private var var_1790:int = 0;
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_260:int = 0;
      
      private var var_2276:String = null;
      
      private var var_85:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_206)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_260;
      }
      
      public function get extra() : int
      {
         return var_1517;
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_206)
         {
            var_260 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_206)
         {
            var_85 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_206)
         {
            var_1517 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_206)
         {
            var_38 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1790;
      }
      
      public function get staticClass() : String
      {
         return var_2276;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_206)
         {
            var_1790 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_206)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_206)
         {
            var_2276 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_206)
         {
            var_554 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_206)
         {
            var_662 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_86 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_554;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get sizeY() : int
      {
         return var_662;
      }
   }
}
