package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_1227:int;
      
      private var var_352:Number;
      
      private var var_1710:int;
      
      private var var_1007:int;
      
      private var var_2366:int;
      
      private var var_2367:Boolean;
      
      private var _reportIntervalMillis:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++var_1007;
         var _loc3_:int = getTimer();
         if(var_1007 == 1)
         {
            var_352 = param1;
            var_1227 = _loc3_;
         }
         else
         {
            _loc4_ = Number(var_1007);
            var_352 = var_352 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(var_2367 && _loc3_ - var_1227 >= _reportIntervalMillis && var_1710 < var_2366)
         {
            _loc5_ = 1000 / var_352;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++var_1710;
            var_1227 = _loc3_;
            var_1007 = 0;
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         _reportIntervalMillis = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         var_2366 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         var_2367 = true;
      }
      
      public function dispose() : void
      {
      }
   }
}
