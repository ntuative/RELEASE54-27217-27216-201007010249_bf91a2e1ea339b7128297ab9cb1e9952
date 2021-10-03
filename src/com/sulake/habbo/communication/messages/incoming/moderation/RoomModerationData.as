package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_121:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1775:int;
      
      private var var_461:int;
      
      private var var_748:RoomData;
      
      private var var_1977:int;
      
      private var _ownerName:String;
      
      private var var_1976:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_461 = param1.readInteger();
         var_1775 = param1.readInteger();
         var_1976 = param1.readBoolean();
         var_1977 = param1.readInteger();
         _ownerName = param1.readString();
         var_121 = new RoomData(param1);
         var_748 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1775;
      }
      
      public function get event() : RoomData
      {
         return var_748;
      }
      
      public function get room() : RoomData
      {
         return var_121;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_121 != null)
         {
            var_121.dispose();
            var_121 = null;
         }
         if(var_748 != null)
         {
            var_748.dispose();
            var_748 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_461;
      }
      
      public function get ownerId() : int
      {
         return var_1977;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_1976;
      }
   }
}
