package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2240:String;
      
      private var var_652:String;
      
      private var var_1646:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1646 = param1.readInteger();
         var_2240 = param1.readString();
         var_652 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_652;
      }
      
      public function get figureString() : String
      {
         return var_2240;
      }
      
      public function get slotId() : int
      {
         return var_1646;
      }
   }
}
