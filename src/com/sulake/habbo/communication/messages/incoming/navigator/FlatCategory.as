package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_389:Boolean;
      
      private var var_1340:int;
      
      private var var_1666:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1340 = param1.readInteger();
         var_1666 = param1.readString();
         var_389 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_389;
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
