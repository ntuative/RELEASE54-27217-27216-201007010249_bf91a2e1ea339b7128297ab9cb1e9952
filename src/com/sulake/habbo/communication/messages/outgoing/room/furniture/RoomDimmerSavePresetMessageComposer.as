package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1735:int;
      
      private var var_1738:int;
      
      private var var_1739:Boolean;
      
      private var var_1737:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1736:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1738 = param1;
         var_1735 = param2;
         var_1737 = param3;
         var_1736 = param4;
         var_1739 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1738,var_1735,var_1737,var_1736,int(var_1739)];
      }
      
      public function dispose() : void
      {
      }
   }
}
