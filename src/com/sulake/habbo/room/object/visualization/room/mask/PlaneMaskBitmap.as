package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_48:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_1937:Number = -1.0;
      
      private var var_1001:IGraphicAsset = null;
      
      private var var_1936:Number = 1.0;
      
      private var var_1935:Number = -1.0;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1.0, param3:Number = 1.0, param4:Number = -1.0, param5:Number = 1.0)
      {
         super();
         var_1937 = param2;
         _normalMaxX = param3;
         var_1935 = param4;
         var_1936 = param5;
         var_1001 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1936;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_1937;
      }
      
      public function get normalMinY() : Number
      {
         return var_1935;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_1001;
      }
      
      public function dispose() : void
      {
         var_1001 = null;
      }
   }
}