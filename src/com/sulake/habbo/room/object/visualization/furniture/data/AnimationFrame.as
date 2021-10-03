package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_548:int = -1;
      
      public static const const_1049:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2196:int = -1;
      
      private var var_85:int = 0;
      
      private var var_1383:int = 1;
      
      private var var_950:int = 1;
      
      private var var_2198:Boolean = false;
      
      private var var_2197:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_2198 = param5;
         if(param4 < 0)
         {
            param4 = const_548;
         }
         var_950 = param4;
         var_1383 = param4;
         if(param6 >= 0)
         {
            var_2196 = param6;
            var_2197 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_950 > 0 && param1 > var_950)
         {
            param1 = var_950;
         }
         var_1383 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_950;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2197;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_950 < 0)
         {
            return const_548;
         }
         return var_1383;
      }
      
      public function get activeSequence() : int
      {
         return var_2196;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2198;
      }
      
      public function get x() : int
      {
         return var_85;
      }
   }
}
