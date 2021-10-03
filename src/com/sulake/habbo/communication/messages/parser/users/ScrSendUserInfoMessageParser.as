package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1303:int = 2;
      
      public static const const_1529:int = 1;
       
      
      private var var_1836:int;
      
      private var var_1838:int;
      
      private var var_1837:Boolean;
      
      private var var_1833:int;
      
      private var var_1475:String;
      
      private var var_1834:Boolean;
      
      private var var_1831:int;
      
      private var var_1832:int;
      
      private var var_1835:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1838;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1837;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1832;
      }
      
      public function get memberPeriods() : int
      {
         return var_1833;
      }
      
      public function get productName() : String
      {
         return var_1475;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1834;
      }
      
      public function get responseType() : int
      {
         return var_1836;
      }
      
      public function get pastClubDays() : int
      {
         return var_1835;
      }
      
      public function get pastVipDays() : int
      {
         return var_1831;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1475 = param1.readString();
         var_1838 = param1.readInteger();
         var_1833 = param1.readInteger();
         var_1832 = param1.readInteger();
         var_1836 = param1.readInteger();
         var_1834 = param1.readBoolean();
         var_1837 = param1.readBoolean();
         var_1835 = param1.readInteger();
         var_1831 = param1.readInteger();
         return true;
      }
   }
}
