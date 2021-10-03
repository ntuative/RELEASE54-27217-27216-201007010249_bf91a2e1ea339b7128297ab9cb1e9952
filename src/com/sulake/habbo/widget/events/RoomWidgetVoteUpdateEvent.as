package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_119:String = "RWPUE_VOTE_RESULT";
      
      public static const const_132:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1428:int;
      
      private var var_1125:String;
      
      private var var_713:Array;
      
      private var var_1149:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1125 = param2;
         var_1149 = param3;
         var_713 = param4;
         if(var_713 == null)
         {
            var_713 = [];
         }
         var_1428 = param5;
      }
      
      public function get votes() : Array
      {
         return var_713.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1428;
      }
      
      public function get question() : String
      {
         return var_1125;
      }
      
      public function get choices() : Array
      {
         return var_1149.slice();
      }
   }
}
