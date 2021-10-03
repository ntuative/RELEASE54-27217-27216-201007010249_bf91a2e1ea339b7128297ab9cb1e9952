package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
   public class AvatarEffect
   {
       
      
      private var var_1905:int;
      
      private var var_1276:int;
      
      private var _type:int;
      
      private var var_1906:int;
      
      public function AvatarEffect()
      {
         super();
      }
      
      public function get inactiveEffectsInInventory() : int
      {
         return var_1906;
      }
      
      public function set secondsLeftIfActive(param1:int) : void
      {
         var_1905 = param1;
      }
      
      public function get duration() : int
      {
         return var_1276;
      }
      
      public function set inactiveEffectsInInventory(param1:int) : void
      {
         var_1906 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1276 = param1;
      }
      
      public function get secondsLeftIfActive() : int
      {
         return var_1905;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
   }
}
