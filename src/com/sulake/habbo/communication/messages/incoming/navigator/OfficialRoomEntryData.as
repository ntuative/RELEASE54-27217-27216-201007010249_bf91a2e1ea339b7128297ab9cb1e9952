package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1317:int = 4;
      
      public static const const_592:int = 3;
      
      public static const const_540:int = 2;
      
      public static const const_884:int = 1;
       
      
      private var var_2140:String;
      
      private var _disposed:Boolean;
      
      private var var_1775:int;
      
      private var var_2138:Boolean;
      
      private var var_942:String;
      
      private var var_937:PublicRoomData;
      
      private var var_2139:int;
      
      private var _index:int;
      
      private var var_2136:String;
      
      private var _type:int;
      
      private var var_1809:String;
      
      private var var_936:GuestRoomData;
      
      private var var_2137:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2140 = param1.readString();
         var_2137 = param1.readString();
         var_2138 = param1.readInteger() == 1;
         var_2136 = param1.readString();
         var_942 = param1.readString();
         var_2139 = param1.readInteger();
         var_1775 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_884)
         {
            var_1809 = param1.readString();
         }
         else if(_type == const_592)
         {
            var_937 = new PublicRoomData(param1);
         }
         else if(_type == const_540)
         {
            var_936 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2139;
      }
      
      public function get popupCaption() : String
      {
         return var_2140;
      }
      
      public function get userCount() : int
      {
         return var_1775;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2138;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_884)
         {
            return 0;
         }
         if(this.type == const_540)
         {
            return this.var_936.maxUserCount;
         }
         if(this.type == const_592)
         {
            return this.var_937.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2137;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_936 != null)
         {
            this.var_936.dispose();
            this.var_936 = null;
         }
         if(this.var_937 != null)
         {
            this.var_937.dispose();
            this.var_937 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_936;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2136;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_937;
      }
      
      public function get picRef() : String
      {
         return var_942;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1809;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
