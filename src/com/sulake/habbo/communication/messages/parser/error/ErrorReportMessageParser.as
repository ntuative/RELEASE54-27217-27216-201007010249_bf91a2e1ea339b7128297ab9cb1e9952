package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1242:int;
      
      private var var_1239:int;
      
      private var var_1241:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1242;
      }
      
      public function flush() : Boolean
      {
         var_1239 = 0;
         var_1242 = 0;
         var_1241 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1239;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1242 = param1.readInteger();
         var_1239 = param1.readInteger();
         var_1241 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1241;
      }
   }
}
