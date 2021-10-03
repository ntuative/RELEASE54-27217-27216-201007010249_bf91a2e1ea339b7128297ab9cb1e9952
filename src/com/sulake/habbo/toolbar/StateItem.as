package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1481:Boolean;
      
      private var var_2352:String;
      
      private var _frames:XMLList;
      
      private var var_1140:String = "-1";
      
      private var var_695:String;
      
      private var var_181:int = 120;
      
      private var var_1448:String = "-1";
      
      private var var_1447:String;
      
      private var var_2353:Boolean;
      
      private var var_1703:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1481 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_2353 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_181 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1447 = param1.@namebase;
         }
         else
         {
            var_1447 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_1140 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1448 = param1.@nextState;
         }
         else
         {
            var_1448 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1703 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_2352 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_695 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_1140 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_2353;
      }
      
      public function get defaultState() : String
      {
         return var_1703;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1703 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_2352;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_181;
      }
      
      public function get loop() : Boolean
      {
         return var_1481;
      }
      
      public function get nextState() : String
      {
         return var_1448;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_695;
      }
      
      public function get stateOver() : String
      {
         return var_1140;
      }
      
      public function get nameBase() : String
      {
         return var_1447;
      }
   }
}
