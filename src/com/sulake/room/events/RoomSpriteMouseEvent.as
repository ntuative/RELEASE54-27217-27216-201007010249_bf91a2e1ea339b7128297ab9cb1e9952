package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2104:Boolean = false;
      
      private var var_2105:Boolean = false;
      
      private var var_1848:String = "";
      
      private var _type:String = "";
      
      private var var_2107:Boolean = false;
      
      private var var_2204:Number = 0;
      
      private var var_2249:Number = 0;
      
      private var var_2250:Number = 0;
      
      private var var_2251:String = "";
      
      private var var_2203:Number = 0;
      
      private var var_2106:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2251 = param2;
         var_1848 = param3;
         var_2249 = param4;
         var_2250 = param5;
         var_2204 = param6;
         var_2203 = param7;
         var_2106 = param8;
         var_2105 = param9;
         var_2107 = param10;
         var_2104 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2106;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2104;
      }
      
      public function get localX() : Number
      {
         return var_2204;
      }
      
      public function get localY() : Number
      {
         return var_2203;
      }
      
      public function get canvasId() : String
      {
         return var_2251;
      }
      
      public function get altKey() : Boolean
      {
         return var_2105;
      }
      
      public function get spriteTag() : String
      {
         return var_1848;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2249;
      }
      
      public function get screenY() : Number
      {
         return var_2250;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2107;
      }
   }
}
