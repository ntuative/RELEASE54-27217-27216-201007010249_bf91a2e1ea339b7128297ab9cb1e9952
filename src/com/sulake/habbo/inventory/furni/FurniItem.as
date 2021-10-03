package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1791:int;
      
      private var var_1787:Boolean;
      
      private var var_1786:int;
      
      private var var_1493:String;
      
      private var var_1789:Boolean = false;
      
      private var var_1790:int;
      
      private var var_484:int;
      
      private var var_1151:String;
      
      private var var_1646:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1257:int;
      
      private var var_1788:Boolean;
      
      private var var_1785:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1791 = param1;
         var_1151 = param2;
         _objId = param3;
         var_1257 = param4;
         var_1493 = param5;
         var_1787 = param6;
         var_1788 = param7;
         var_1790 = param8;
         var_1646 = param9;
         var_1786 = param10;
         var_484 = -1;
      }
      
      public function get songId() : int
      {
         return var_1786;
      }
      
      public function get iconCallbackId() : int
      {
         return var_484;
      }
      
      public function get expiryTime() : int
      {
         return var_1790;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1785 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1789 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_484 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1788;
      }
      
      public function get slotId() : String
      {
         return var_1646;
      }
      
      public function get classId() : int
      {
         return var_1257;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1787;
      }
      
      public function get stuffData() : String
      {
         return var_1493;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1791;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1789;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1785;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1151;
      }
   }
}
