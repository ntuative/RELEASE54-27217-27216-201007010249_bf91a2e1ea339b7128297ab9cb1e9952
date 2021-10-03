package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      private var var_260:int = 0;
      
      private var var_1947:int = 0;
      
      private var var_1945:Number = 0;
      
      private var var_1943:Number = 0;
      
      private var var_1946:Number = 0;
      
      private var var_1944:Number = 0;
      
      private var var_1942:Boolean = false;
      
      private var var_85:Number = 0;
      
      private var _id:int = 0;
      
      private var var_234:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_234 = [];
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_86 = param4;
         var_1944 = param5;
         var_260 = param6;
         var_1947 = param7;
         var_1945 = param8;
         var_1943 = param9;
         var_1946 = param10;
         var_1942 = param11;
         var_234 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function get dir() : int
      {
         return var_260;
      }
      
      public function get localZ() : Number
      {
         return var_1944;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1942;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1947;
      }
      
      public function get targetX() : Number
      {
         return var_1945;
      }
      
      public function get targetY() : Number
      {
         return var_1943;
      }
      
      public function get targetZ() : Number
      {
         return var_1946;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get actions() : Array
      {
         return var_234.slice();
      }
   }
}
