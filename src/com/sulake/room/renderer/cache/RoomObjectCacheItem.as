package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_628:RoomObjectLocationCacheItem = null;
      
      private var var_175:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_628 = new RoomObjectLocationCacheItem(param1);
         var_175 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_628;
      }
      
      public function dispose() : void
      {
         if(var_628 != null)
         {
            var_628.dispose();
            var_628 = null;
         }
         if(var_175 != null)
         {
            var_175.dispose();
            var_175 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_175;
      }
   }
}
