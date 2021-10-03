package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_444:String;
      
      private var var_1762:int;
      
      private var var_1763:String;
      
      private var var_1075:int;
      
      private var var_1315:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1315;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1315 = param1.readInteger();
         var_1763 = param1.readString();
         var_1762 = param1.readInteger();
         var_444 = param1.readString();
         var_1075 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1763;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_444;
      }
      
      public function get petType() : int
      {
         return var_1075;
      }
      
      public function get level() : int
      {
         return var_1762;
      }
   }
}
