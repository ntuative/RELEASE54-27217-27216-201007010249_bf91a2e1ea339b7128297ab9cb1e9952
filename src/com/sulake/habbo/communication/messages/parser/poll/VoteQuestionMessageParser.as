package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteQuestionMessageParser implements IMessageParser
   {
       
      
      private var var_1149:Array;
      
      private var var_1125:String;
      
      public function VoteQuestionMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1125 = param1.readString();
         var_1149 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1149.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get choices() : Array
      {
         return var_1149.slice();
      }
      
      public function flush() : Boolean
      {
         var_1125 = "";
         var_1149 = [];
         return true;
      }
      
      public function get question() : String
      {
         return var_1125;
      }
   }
}
