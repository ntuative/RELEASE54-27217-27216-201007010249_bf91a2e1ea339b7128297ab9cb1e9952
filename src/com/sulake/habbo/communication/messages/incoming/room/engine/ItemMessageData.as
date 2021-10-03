package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_86:Number = 0;
      
      private var _data:String = "";
      
      private var var_1517:int = 0;
      
      private var var_38:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2202:Boolean = false;
      
      private var var_2536:String = "";
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_260:String = "";
      
      private var var_2205:int = 0;
      
      private var var_2201:int = 0;
      
      private var var_2204:int = 0;
      
      private var var_2203:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2202 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2202;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_206)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_260;
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_206)
         {
            var_2204 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_206)
         {
            var_2205 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_206)
         {
            var_2201 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_206)
         {
            var_260 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_206)
         {
            var_2203 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_206)
         {
            var_38 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_2204;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_206)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2205;
      }
      
      public function get wallY() : Number
      {
         return var_2201;
      }
      
      public function get localY() : Number
      {
         return var_2203;
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_86 = param1;
         }
      }
   }
}
