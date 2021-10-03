package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1780:String;
      
      private var var_461:int;
      
      private var var_1778:String;
      
      private var var_1782:String;
      
      private var var_1779:int;
      
      private var var_1777:String;
      
      private var var_1781:int;
      
      private var var_696:Array;
      
      private var var_1141:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_696 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1141 = false;
            return;
         }
         this.var_1141 = true;
         var_1779 = int(_loc2_);
         var_1778 = param1.readString();
         var_461 = int(param1.readString());
         var_1781 = param1.readInteger();
         var_1780 = param1.readString();
         var_1782 = param1.readString();
         var_1777 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_696.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1781;
      }
      
      public function get eventName() : String
      {
         return var_1780;
      }
      
      public function get eventDescription() : String
      {
         return var_1782;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1778;
      }
      
      public function get tags() : Array
      {
         return var_696;
      }
      
      public function get creationTime() : String
      {
         return var_1777;
      }
      
      public function get exists() : Boolean
      {
         return var_1141;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1779;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_696 = null;
      }
      
      public function get flatId() : int
      {
         return var_461;
      }
   }
}
