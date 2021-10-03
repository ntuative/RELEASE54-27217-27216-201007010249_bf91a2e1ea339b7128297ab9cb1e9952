package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1340:int;
      
      private var var_1666:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1340 = param1;
         var_1666 = param2;
         Logger.log("READ NODE: " + var_1340 + ", " + var_1666);
      }
      
      public function get nodeName() : String
      {
         return var_1666;
      }
      
      public function get nodeId() : int
      {
         return var_1340;
      }
   }
}
