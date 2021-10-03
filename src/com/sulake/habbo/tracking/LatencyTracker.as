package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_169:Array;
      
      private var var_38:Boolean = false;
      
      private var var_1698:int = 0;
      
      private var var_1700:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_572:Map;
      
      private var var_2350:int = 0;
      
      private var var_1699:int = 0;
      
      private var var_150:IHabboConfigurationManager;
      
      private var var_1446:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1701:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_38)
         {
            return;
         }
         if(getTimer() - var_1698 > var_1700)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1698 = getTimer();
         var_572.add(var_1446,var_1698);
         _connection.send(new LatencyPingRequestMessageComposer(var_1446));
         ++var_1446;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_150 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1700 = int(var_150.getKey("latencytest.interval"));
         var_1701 = int(var_150.getKey("latencytest.report.index"));
         var_2350 = int(var_150.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1700 < 1)
         {
            return;
         }
         var_572 = new Map();
         var_169 = new Array();
         var_38 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_572 == null || var_169 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_572.getValue(_loc2_.requestId);
         var_572.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_169.push(_loc4_);
         if(var_169.length == var_1701 && var_1701 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_169.length)
            {
               _loc5_ += var_169[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_169.length)
            {
               if(var_169[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_169[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_169 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1699) > var_2350 || var_1699 == 0)
            {
               var_1699 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_169.length);
               _connection.send(_loc11_);
            }
            var_169 = [];
         }
      }
      
      public function dispose() : void
      {
         var_38 = false;
         var_150 = null;
         _communication = null;
         _connection = null;
         if(var_572 != null)
         {
            var_572.dispose();
            var_572 = null;
         }
         var_169 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_150 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
