package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvents;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1479:int = 10;
       
      
      private var var_2118:Boolean;
      
      private var var_2121:int;
      
      private var var_1360:int;
      
      private var var_2119:Boolean;
      
      private var var_1130:Array;
      
      private var var_930:Dictionary;
      
      private var var_1129:Array;
      
      private var var_2466:int;
      
      private var var_2124:int;
      
      private var var_2120:UserDefinedRoomEvents;
      
      private var var_1626:int;
      
      private var var_2126:int;
      
      private var var_1948:int;
      
      private var var_645:PublicRoomShortData;
      
      private var var_437:RoomEventData;
      
      private var var_140:MsgWithRequestId;
      
      private var var_2122:Boolean;
      
      private var var_2125:Array;
      
      private var _navigator:HabboNavigator;
      
      private var var_2123:Boolean;
      
      private var var_210:GuestRoomData;
      
      private var var_779:Boolean;
      
      private var var_644:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1130 = new Array();
         var_1129 = new Array();
         var_930 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_140 != null && var_140 as PopularRoomTagsData != null;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2123;
      }
      
      public function startLoading() : void
      {
         this.var_779 = true;
      }
      
      public function get createdFlatId() : int
      {
         return var_2121;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2123 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_437 != null)
         {
            var_437.dispose();
         }
         var_437 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function get homeRoomId() : int
      {
         return var_1626;
      }
      
      public function get stuffStates() : Array
      {
         return var_2125;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_140 != null && var_140 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_140 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_210;
      }
      
      public function get allCategories() : Array
      {
         return var_1130;
      }
      
      public function onRoomExit() : void
      {
         if(var_437 != null)
         {
            var_437.dispose();
            var_437 = null;
         }
         if(var_645 != null)
         {
            var_645.dispose();
            var_645 = null;
         }
         if(var_210 != null)
         {
            var_210.dispose();
            var_210 = null;
         }
         var_644 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_140 = param1;
         var_779 = false;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_210 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1626 == _loc1_;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_140 = param1;
         var_779 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_645 = null;
         var_210 = null;
         var_644 = false;
         if(param1.guestRoom)
         {
            var_644 = param1.owner;
         }
         else
         {
            var_645 = param1.publicSpace;
            var_437 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return var_644;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2466 = param1.limit;
         this.var_1360 = param1.favouriteRoomIds.length;
         this.var_930 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_930[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_140 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return var_2118;
      }
      
      public function set stuffStates(param1:Array) : void
      {
         var_2125 = param1;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_645;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_140 = param1;
         var_779 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1948 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_210 != null && var_644;
      }
      
      public function get userDefinedRoomEvents() : UserDefinedRoomEvents
      {
         return var_2120;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2119;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1130 = param1;
         var_1129 = new Array();
         for each(_loc2_ in var_1130)
         {
            if(_loc2_.visible)
            {
               var_1129.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2124;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2126;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1129;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_140 == null)
         {
            return;
         }
         var_140.dispose();
         var_140 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         var_2118 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_437;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_930[param1] = !!param2 ? "yes" : null;
         var_1360 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_140 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1948;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_140 != null && var_140 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2119 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2124 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2122 = param1;
      }
      
      public function set userDefinedRoomEvents(param1:UserDefinedRoomEvents) : void
      {
         var_2120 = param1;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_779;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         var_1626 = param1;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1360 >= var_2466;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_210 != null)
         {
            var_210.dispose();
         }
         var_210 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2126 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2122;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_210 != null && !var_644;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2121 = param1;
      }
   }
}
