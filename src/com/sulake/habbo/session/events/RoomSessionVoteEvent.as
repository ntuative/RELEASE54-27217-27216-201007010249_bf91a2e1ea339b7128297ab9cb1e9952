package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_119:String = "RSPE_VOTE_RESULT";
      
      public static const const_132:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1428:int = 0;
      
      private var var_1125:String = "";
      
      private var var_713:Array;
      
      private var var_1149:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1149 = [];
         var_713 = [];
         super(param1,param2,param7,param8);
         var_1125 = param3;
         var_1149 = param4;
         var_713 = param5;
         if(var_713 == null)
         {
            var_713 = [];
         }
         var_1428 = param6;
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
