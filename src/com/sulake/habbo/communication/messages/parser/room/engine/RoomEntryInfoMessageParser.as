package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2219:int;
      
      private var var_462:Boolean;
      
      private var var_2220:Boolean;
      
      private var var_958:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2220 = param1.readBoolean();
         if(var_2220)
         {
            var_2219 = param1.readInteger();
            var_462 = param1.readBoolean();
         }
         else
         {
            var_958 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_958 != null)
         {
            var_958.dispose();
            var_958 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2219;
      }
      
      public function get owner() : Boolean
      {
         return var_462;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2220;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_958;
      }
   }
}
