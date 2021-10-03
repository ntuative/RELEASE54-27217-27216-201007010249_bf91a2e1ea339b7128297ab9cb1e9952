package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1929:int;
      
      private var var_1930:int;
      
      private var var_1934:int;
      
      private var _userName:String;
      
      private var var_1931:int;
      
      private var var_1932:int;
      
      private var var_1933:int;
      
      private var _userId:int;
      
      private var var_760:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1932 = param1.readInteger();
         var_1931 = param1.readInteger();
         var_760 = param1.readBoolean();
         var_1934 = param1.readInteger();
         var_1930 = param1.readInteger();
         var_1929 = param1.readInteger();
         var_1933 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1933;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_760;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1931;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1930;
      }
      
      public function get cautionCount() : int
      {
         return var_1929;
      }
      
      public function get cfhCount() : int
      {
         return var_1934;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1932;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
