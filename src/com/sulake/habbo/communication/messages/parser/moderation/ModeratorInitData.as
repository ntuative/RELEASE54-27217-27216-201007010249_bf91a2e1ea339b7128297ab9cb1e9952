package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1067:Array;
      
      private var var_1913:Boolean;
      
      private var var_1066:Array;
      
      private var var_1912:Boolean;
      
      private var var_1915:Boolean;
      
      private var var_1908:Boolean;
      
      private var var_163:Array;
      
      private var var_1911:Boolean;
      
      private var var_1909:Boolean;
      
      private var var_880:Array;
      
      private var var_1914:Boolean;
      
      private var var_1910:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_163 = [];
         var_1066 = [];
         var_1067 = [];
         var_880 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               var_163.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1066.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_880.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1911 = param1.readBoolean();
         var_1908 = param1.readBoolean();
         var_1912 = param1.readBoolean();
         var_1915 = param1.readBoolean();
         var_1910 = param1.readBoolean();
         var_1909 = param1.readBoolean();
         var_1913 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1067.push(param1.readString());
            _loc4_++;
         }
         var_1914 = param1.readBoolean();
      }
      
      public function get banPermission() : Boolean
      {
         return var_1910;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1066;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1912;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1913;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1911;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1066 = null;
         var_1067 = null;
         var_163 = null;
         for each(_loc1_ in var_880)
         {
            _loc1_.dispose();
         }
         var_880 = null;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return var_1067;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1909;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1915;
      }
      
      public function get offenceCategories() : Array
      {
         return var_880;
      }
      
      public function get issues() : Array
      {
         return var_163;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1914;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1908;
      }
   }
}
