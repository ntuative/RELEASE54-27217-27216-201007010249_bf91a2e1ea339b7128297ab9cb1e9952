package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1775:int;
      
      private var var_2209:String;
      
      private var var_2211:int;
      
      private var var_2214:int;
      
      private var var_748:Boolean;
      
      private var var_2213:Boolean;
      
      private var var_461:int;
      
      private var var_1230:String;
      
      private var var_2131:int;
      
      private var var_1323:int;
      
      private var _ownerName:String;
      
      private var var_722:String;
      
      private var var_2212:int;
      
      private var var_2210:RoomThumbnailData;
      
      private var var_2130:Boolean;
      
      private var var_696:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_696 = new Array();
         super();
         var_461 = param1.readInteger();
         var_748 = param1.readBoolean();
         var_722 = param1.readString();
         _ownerName = param1.readString();
         var_2131 = param1.readInteger();
         var_1775 = param1.readInteger();
         var_2212 = param1.readInteger();
         var_1230 = param1.readString();
         var_2211 = param1.readInteger();
         var_2130 = param1.readBoolean();
         var_2214 = param1.readInteger();
         var_1323 = param1.readInteger();
         var_2209 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_696.push(_loc4_);
            _loc3_++;
         }
         var_2210 = new RoomThumbnailData(param1);
         var_2213 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2212;
      }
      
      public function get roomName() : String
      {
         return var_722;
      }
      
      public function get userCount() : int
      {
         return var_1775;
      }
      
      public function get score() : int
      {
         return var_2214;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2209;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2130;
      }
      
      public function get tags() : Array
      {
         return var_696;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2213;
      }
      
      public function get event() : Boolean
      {
         return var_748;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1323;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2211;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2210;
      }
      
      public function get doorMode() : int
      {
         return var_2131;
      }
      
      public function get flatId() : int
      {
         return var_461;
      }
      
      public function get description() : String
      {
         return var_1230;
      }
   }
}
