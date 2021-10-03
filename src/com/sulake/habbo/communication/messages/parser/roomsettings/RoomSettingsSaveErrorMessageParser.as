package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1664:int = 9;
      
      public static const const_1663:int = 4;
      
      public static const const_1631:int = 1;
      
      public static const const_1283:int = 10;
      
      public static const const_1649:int = 2;
      
      public static const const_1187:int = 7;
      
      public static const const_1286:int = 11;
      
      public static const const_1547:int = 3;
      
      public static const const_1372:int = 8;
      
      public static const const_1245:int = 5;
      
      public static const const_1517:int = 6;
      
      public static const const_1312:int = 12;
       
      
      private var var_1806:String;
      
      private var _roomId:int;
      
      private var var_1239:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1806;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1239 = param1.readInteger();
         var_1806 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1239;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
