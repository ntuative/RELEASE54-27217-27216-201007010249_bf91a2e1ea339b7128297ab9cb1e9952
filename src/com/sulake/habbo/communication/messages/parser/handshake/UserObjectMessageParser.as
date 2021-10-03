package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_444:String;
      
      private var var_2442:String;
      
      private var var_2445:int;
      
      private var var_2444:int;
      
      private var var_647:String;
      
      private var var_1325:String;
      
      private var _name:String;
      
      private var var_546:int;
      
      private var var_953:int;
      
      private var var_2441:int;
      
      private var _respectTotal:int;
      
      private var var_2443:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2444;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1325;
      }
      
      public function get customData() : String
      {
         return this.var_2442;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_546;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2445;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2443;
      }
      
      public function get figure() : String
      {
         return this.var_444;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_647;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_444 = param1.readString();
         this.var_647 = param1.readString();
         this.var_2442 = param1.readString();
         this.var_1325 = param1.readString();
         this.var_2441 = param1.readInteger();
         this.var_2443 = param1.readString();
         this.var_2445 = param1.readInteger();
         this.var_2444 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_953 = param1.readInteger();
         this.var_546 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2441;
      }
      
      public function get respectLeft() : int
      {
         return this.var_953;
      }
   }
}
