package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1169:int = 1;
      
      private static const const_1074:int = 3;
      
      private static const const_1168:int = 2;
      
      private static const const_1167:int = 15;
       
      
      private var var_964:int;
      
      private var var_227:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_227 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1168)
         {
            var_227 = new Array();
            var_227.push(const_1169);
            var_964 = const_1167;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_964 > 0)
         {
            --var_964;
         }
         if(var_964 == 0)
         {
            if(false)
            {
               super.setAnimation(var_227.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
