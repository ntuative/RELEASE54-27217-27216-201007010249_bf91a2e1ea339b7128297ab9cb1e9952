package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_464:FloorRasterizer;
      
      private var var_959:Boolean = false;
      
      private var var_671:PlaneMaskManager;
      
      private var var_463:WallRasterizer;
      
      private var var_670:WallAdRasterizer;
      
      private var var_465:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_463 = new WallRasterizer();
         var_464 = new FloorRasterizer();
         var_670 = new WallAdRasterizer();
         var_465 = new LandscapeRasterizer();
         var_671 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_463;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_670;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_464;
      }
      
      public function get initialized() : Boolean
      {
         return var_959;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_671;
      }
      
      public function dispose() : void
      {
         if(var_463 != null)
         {
            var_463.dispose();
            var_463 = null;
         }
         if(var_464 != null)
         {
            var_464.dispose();
            var_464 = null;
         }
         if(var_670 != null)
         {
            var_670.dispose();
            var_670 = null;
         }
         if(var_465 != null)
         {
            var_465.dispose();
            var_465 = null;
         }
         if(var_671 != null)
         {
            var_671.dispose();
            var_671 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_463.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_464.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_670.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_465.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_671.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_463 != null)
         {
            var_463.clearCache();
         }
         if(var_464 != null)
         {
            var_464.clearCache();
         }
         if(var_465 != null)
         {
            var_465.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_465;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_959)
         {
            return;
         }
         var_463.initializeAssetCollection(param1);
         var_464.initializeAssetCollection(param1);
         var_670.initializeAssetCollection(param1);
         var_465.initializeAssetCollection(param1);
         var_671.initializeAssetCollection(param1);
         var_959 = true;
      }
   }
}
