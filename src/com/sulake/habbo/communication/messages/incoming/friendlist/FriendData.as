package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_444:String;
      
      private var var_1324:String;
      
      private var var_1322:String;
      
      private var var_1323:int;
      
      private var var_652:int;
      
      private var var_1325:String;
      
      private var _name:String;
      
      private var var_1321:Boolean;
      
      private var var_760:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_652 = param1.readInteger();
         this.var_760 = param1.readBoolean();
         this.var_1321 = param1.readBoolean();
         this.var_444 = param1.readString();
         this.var_1323 = param1.readInteger();
         this.var_1322 = param1.readString();
         this.var_1324 = param1.readString();
         this.var_1325 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_652;
      }
      
      public function get realName() : String
      {
         return var_1325;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1322;
      }
      
      public function get categoryId() : int
      {
         return var_1323;
      }
      
      public function get online() : Boolean
      {
         return var_760;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1321;
      }
      
      public function get lastAccess() : String
      {
         return var_1324;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_444;
      }
   }
}
