package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1804:Date;
      
      private var var_1247:Boolean = false;
      
      private var _type:int;
      
      private var var_398:BitmapData;
      
      private var var_276:Boolean = false;
      
      private var var_1276:int;
      
      private var var_603:int = 1;
      
      private var var_1045:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_398;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_603;
         if(var_603 < 0)
         {
            var_603 = 0;
         }
         var_1045 = var_1276;
         var_276 = false;
         var_1247 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1045 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_276;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_398 = param1;
      }
      
      public function get duration() : int
      {
         return var_1276;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1247;
      }
      
      public function get effectsInInventory() : int
      {
         return var_603;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_398;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_276)
         {
            var_1804 = new Date();
         }
         var_276 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_603 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_276)
         {
            _loc1_ = var_1045 - (new Date().valueOf() - var_1804.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1045;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1247 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1276 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
