package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2151:Number = 0.0;
      
      private var var_2153:Number = 0.0;
      
      private var var_2154:Number = 0.0;
      
      private var var_2152:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_2153 = param1;
         var_2154 = param2;
         var_2151 = param3;
         var_2152 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_2153;
      }
      
      public function get leftSideLength() : Number
      {
         return var_2151;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_2154;
      }
      
      public function get rightSideLength() : Number
      {
         return var_2152;
      }
   }
}
