package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_1662:String;
      
      private var var_1014:Array;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         var_1014 = new Array();
         super();
         this.var_1662 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_1014.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1014.length)
         {
            _loc1_.push(this.var_1014[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1662);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.var_1014 = null;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_1014.push(param1);
      }
   }
}
