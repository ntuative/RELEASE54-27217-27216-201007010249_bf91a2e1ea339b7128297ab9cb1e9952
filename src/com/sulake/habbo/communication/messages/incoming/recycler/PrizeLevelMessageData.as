package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_2248:int;
      
      private var var_1409:int;
      
      private var var_797:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1409 = param1.readInteger();
         var_2248 = param1.readInteger();
         var_797 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_797.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_2248;
      }
      
      public function get prizes() : Array
      {
         return var_797;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1409;
      }
   }
}
