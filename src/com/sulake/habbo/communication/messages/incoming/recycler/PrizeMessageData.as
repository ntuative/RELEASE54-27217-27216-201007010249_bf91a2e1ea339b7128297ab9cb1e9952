package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1716:int;
      
      private var var_2075:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_2075 = param1.readString();
         var_1716 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1716;
      }
      
      public function get method_5() : String
      {
         return var_2075;
      }
   }
}
