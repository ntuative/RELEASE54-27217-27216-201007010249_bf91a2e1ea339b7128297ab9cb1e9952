package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class UserDefinedRoomEvent implements IDisposable
   {
       
      
      private var var_1100:Array;
      
      private var _disposed:Boolean;
      
      private var var_2020:int;
      
      private var _id:int;
      
      private var var_234:Array;
      
      public function UserDefinedRoomEvent(param1:IMessageDataWrapper)
      {
         var_234 = new Array();
         var_1100 = new Array();
         super();
         _id = param1.readInteger();
         var_2020 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1100.push(new TriggerDefinition(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_234.push(new ActionDefinition(param1));
            _loc3_++;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get triggers() : Array
      {
         return var_1100;
      }
      
      public function get propagation() : int
      {
         return var_2020;
      }
      
      public function get actions() : Array
      {
         return var_234;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_234 = null;
         var_1100 = null;
      }
   }
}
