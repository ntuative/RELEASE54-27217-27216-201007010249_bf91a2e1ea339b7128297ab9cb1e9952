package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1627:int;
      
      private var var_1628:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1627;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1627 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1627 = this.var_1627;
         _loc1_.var_1628 = this.var_1628;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1628 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1628;
      }
   }
}
