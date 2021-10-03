package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2453:Boolean;
      
      private var var_2455:int;
      
      private var var_2452:Boolean;
      
      private var var_1611:String;
      
      private var var_1325:String;
      
      private var var_1948:int;
      
      private var var_2056:String;
      
      private var var_2454:String;
      
      private var var_2055:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1948 = param1.readInteger();
         this.var_1611 = param1.readString();
         this.var_2056 = param1.readString();
         this.var_2453 = param1.readBoolean();
         this.var_2452 = param1.readBoolean();
         param1.readString();
         this.var_2455 = param1.readInteger();
         this.var_2055 = param1.readString();
         this.var_2454 = param1.readString();
         this.var_1325 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1325;
      }
      
      public function get avatarName() : String
      {
         return this.var_1611;
      }
      
      public function get avatarId() : int
      {
         return this.var_1948;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2453;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2454;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2055;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2452;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2056;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2455;
      }
   }
}
