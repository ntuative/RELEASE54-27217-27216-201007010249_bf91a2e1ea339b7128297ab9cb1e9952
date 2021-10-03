package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1087:int = 80;
       
      
      private var var_500:Map;
      
      private var var_722:String = "";
      
      private var var_1278:Array;
      
      public function UserRegistry()
      {
         var_500 = new Map();
         var_1278 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_500.getValue(var_1278.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_722;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_500.getValue(param1) != null)
         {
            var_500.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_722);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_722 == "")
         {
            var_1278.push(param1);
         }
         var_500.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_500;
      }
      
      public function unregisterRoom() : void
      {
         var_722 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_500.length > const_1087)
         {
            _loc1_ = var_500.getKey(0);
            var_500.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_722 = param1;
         if(var_722 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
