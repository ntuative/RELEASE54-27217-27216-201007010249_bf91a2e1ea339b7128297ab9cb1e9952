package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1493:String;
      
      private var var_1151:String;
      
      private var var_2389:Boolean;
      
      private var var_1517:int;
      
      private var var_1791:int;
      
      private var var_2388:Boolean;
      
      private var var_1646:String = "";
      
      private var var_1787:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1257:int;
      
      private var var_1788:Boolean;
      
      private var var_1786:int = -1;
      
      private var var_1790:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1791 = param1;
         var_1151 = param2;
         _objId = param3;
         var_1257 = param4;
         _category = param5;
         var_1493 = param6;
         var_2389 = param7;
         var_1787 = param8;
         var_1788 = param9;
         var_2388 = param10;
         var_1790 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1646;
      }
      
      public function get extra() : int
      {
         return var_1517;
      }
      
      public function get classId() : int
      {
         return var_1257;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2388;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2389;
      }
      
      public function get stripId() : int
      {
         return var_1791;
      }
      
      public function get stuffData() : String
      {
         return var_1493;
      }
      
      public function get songId() : int
      {
         return var_1786;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1646 = param1;
         var_1517 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1151;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1790;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1788;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1787;
      }
   }
}
