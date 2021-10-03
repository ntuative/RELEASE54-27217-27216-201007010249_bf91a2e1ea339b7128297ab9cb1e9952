package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PublicSpaceCastLibsMessageParser implements IMessageParser
   {
       
      
      private var var_2348:int;
      
      private var var_2346:String;
      
      private var var_1340:int;
      
      public function PublicSpaceCastLibsMessageParser()
      {
         super();
      }
      
      public function get unitPort() : int
      {
         return var_2348;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get castLibs() : String
      {
         return var_2346;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1340 = param1.readInteger();
         this.var_2346 = param1.readString();
         this.var_2348 = param1.readInteger();
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1340;
      }
   }
}
