package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1428:int;
      
      private var var_1125:String;
      
      private var var_713:Array;
      
      private var var_1149:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_713.slice();
      }
      
      public function flush() : Boolean
      {
         var_1125 = "";
         var_1149 = [];
         var_713 = [];
         var_1428 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1428;
      }
      
      public function get question() : String
      {
         return var_1125;
      }
      
      public function get choices() : Array
      {
         return var_1149.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1125 = param1.readString();
         var_1149 = [];
         var_713 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1149.push(param1.readString());
            var_713.push(param1.readInteger());
            _loc3_++;
         }
         var_1428 = param1.readInteger();
         return true;
      }
   }
}
