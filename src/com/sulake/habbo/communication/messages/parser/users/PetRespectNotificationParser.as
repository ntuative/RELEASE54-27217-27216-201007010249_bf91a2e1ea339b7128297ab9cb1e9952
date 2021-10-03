package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1747:int;
      
      private var var_1223:PetData;
      
      private var var_1748:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1747;
      }
      
      public function get petData() : PetData
      {
         return var_1223;
      }
      
      public function flush() : Boolean
      {
         var_1223 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1748;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1747 = param1.readInteger();
         var_1748 = param1.readInteger();
         var_1223 = new PetData(param1);
         return true;
      }
   }
}
