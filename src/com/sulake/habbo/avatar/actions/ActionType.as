package com.sulake.habbo.avatar.actions
{
   public class ActionType
   {
       
      
      private var var_1267:Array;
      
      private var var_191:int;
      
      private var _id:int;
      
      public function ActionType(param1:XML)
      {
         var_1267 = [];
         super();
         _id = parseInt(param1.@value);
         var_191 = parseInt(param1.@value);
         var _loc2_:String = String(param1.@prevents);
         if(_loc2_ != "")
         {
            var_1267 = _loc2_.split(",");
         }
      }
      
      public function get value() : int
      {
         return var_191;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get prevents() : Array
      {
         return var_1267;
      }
   }
}
