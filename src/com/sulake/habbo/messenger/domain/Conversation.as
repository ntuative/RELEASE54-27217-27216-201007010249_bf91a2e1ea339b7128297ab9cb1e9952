package com.sulake.habbo.messenger.domain
{
   import com.sulake.core.runtime.IDisposable;
   
   public class Conversation implements IDisposable
   {
       
      
      private var _id:int;
      
      private var var_444:String;
      
      private var _disposed:Boolean;
      
      private var var_968:Boolean;
      
      private var _name:String;
      
      private var var_1195:Array;
      
      private var var_1321:Boolean;
      
      private var _selected:Boolean;
      
      public function Conversation(param1:int, param2:String, param3:String, param4:Boolean)
      {
         var_1195 = new Array();
         super();
         _id = param1;
         _name = param2;
         var_444 = param3;
         var_1321 = param4;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get messages() : Array
      {
         return var_1195;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1321;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(param1)
         {
            var_968 = false;
         }
         _selected = param1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1195 = null;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function setNewMessageArrived(param1:Boolean) : void
      {
         if(_selected)
         {
            var_968 = false;
         }
         else
         {
            var_968 = param1;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function addMessage(param1:Message) : void
      {
         var_1195.push(param1);
      }
      
      public function get newMessageArrived() : Boolean
      {
         return var_968;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         var_1321 = param1;
      }
      
      public function get figure() : String
      {
         return var_444;
      }
   }
}
