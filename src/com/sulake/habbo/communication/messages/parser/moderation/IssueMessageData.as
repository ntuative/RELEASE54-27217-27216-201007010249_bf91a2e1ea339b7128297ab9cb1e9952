package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_144:int = 1;
      
      public static const const_1406:int = 3;
      
      public static const const_440:int = 2;
       
      
      private var var_2375:int;
      
      private var var_2348:int;
      
      private var var_2380:int;
      
      private var var_2050:int;
      
      private var var_38:int;
      
      private var var_461:int;
      
      private var var_1246:int;
      
      private var var_1928:int;
      
      private var var_1175:int;
      
      private var _roomResources:String;
      
      private var var_1988:int;
      
      private var var_2376:int;
      
      private var var_2381:String;
      
      private var var_2291:String;
      
      private var var_2377:int = 0;
      
      private var var_1445:String;
      
      private var _message:String;
      
      private var var_2039:int;
      
      private var var_2379:String;
      
      private var var_1323:int;
      
      private var var_722:String;
      
      private var var_2378:String;
      
      private var var_1633:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1175 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2377 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2376;
      }
      
      public function set roomName(param1:String) : void
      {
         var_722 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1988 = param1;
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_722;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_2050 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_38 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_2348;
      }
      
      public function get priority() : int
      {
         return var_2375 + var_2377;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1928 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_2291;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1633) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1323;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2376 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1246;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2381 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1988;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_2050;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2378 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1445 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1928;
      }
      
      public function set priority(param1:int) : void
      {
         var_2375 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_2348 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2381;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2380 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_2291 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_2039 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1445;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1246 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2380;
      }
      
      public function set flatId(param1:int) : void
      {
         var_461 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1323 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1633 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_2039;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2379 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1633;
      }
      
      public function get reportedUserId() : int
      {
         return var_1175;
      }
      
      public function get flatId() : int
      {
         return var_461;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2378;
      }
      
      public function get reporterUserName() : String
      {
         return var_2379;
      }
   }
}
