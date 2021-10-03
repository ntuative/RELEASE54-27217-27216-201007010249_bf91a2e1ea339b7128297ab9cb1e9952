package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1075:int = 31;
      
      private static const const_1074:int = 32;
      
      private static const const_773:int = 10;
      
      private static const const_512:int = 20;
       
      
      private var var_639:Boolean = false;
      
      private var var_227:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_227 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!var_639)
            {
               var_639 = true;
               var_227 = new Array();
               var_227.push(const_1075);
               var_227.push(const_1074);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_773)
         {
            if(var_639)
            {
               var_639 = false;
               var_227 = new Array();
               var_227.push(const_773 + param1);
               var_227.push(const_512 + param1);
               var_227.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
