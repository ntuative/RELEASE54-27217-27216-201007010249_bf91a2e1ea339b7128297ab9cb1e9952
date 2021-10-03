package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2476:int;
      
      private var var_2481:int;
      
      private var var_94:Array;
      
      private var var_236:Array;
      
      private var var_2478:int;
      
      private var var_2480:int;
      
      private var var_2477:int;
      
      private var var_2479:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_94 = new Array();
         this.var_236 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2476;
      }
      
      public function get friends() : Array
      {
         return this.var_236;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2478;
      }
      
      public function get categories() : Array
      {
         return this.var_94;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2481;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2479;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2479 = param1.readInteger();
         this.var_2478 = param1.readInteger();
         this.var_2476 = param1.readInteger();
         this.var_2477 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_94.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_236.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2481 = param1.readInteger();
         this.var_2480 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2477;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2480;
      }
   }
}
