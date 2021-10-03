package com.sulake.habbo.moderation
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   
   public class IssueBundle
   {
       
      
      private var _id:int;
      
      private var var_38:int;
      
      private var var_2039:int = 0;
      
      private var var_163:Map;
      
      private var var_2040:String = "";
      
      private var var_1175:int;
      
      public function IssueBundle(param1:int, param2:IssueMessageData)
      {
         super();
         _id = param1;
         var_163 = new Map();
         var_163.add(param2.issueId,param2);
         var_38 = param2.state;
         var_2039 = param2.pickerUserId;
         var_2040 = param2.pickerUserName;
         var_1175 = param2.reportedUserId;
      }
      
      public function get reportedUserId() : int
      {
         return var_1175;
      }
      
      public function getHighestPriorityIssue() : IssueMessageData
      {
         var _loc2_:* = null;
         if(var_163 == null || true)
         {
            return null;
         }
         var _loc1_:IssueMessageData = var_163.getWithIndex(0);
         var _loc3_:int = 1;
         while(_loc3_ < var_163.length)
         {
            _loc2_ = var_163.getWithIndex(_loc3_);
            if(_loc2_ != null && _loc2_.priority > _loc1_.priority)
            {
               _loc1_ = _loc2_;
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function updateIssue(param1:IssueMessageData) : void
      {
         var_163.remove(param1.issueId);
         var_163.add(param1.issueId,param1);
      }
      
      public function getPrioritySum() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for each(_loc2_ in issues)
         {
            _loc1_ += _loc2_.priority;
         }
         return _loc1_;
      }
      
      public function getIssueIds() : Array
      {
         if(var_163 == null)
         {
            return [];
         }
         return var_163.getKeys();
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function getIssueCount() : int
      {
         if(var_163 == null)
         {
            return 0;
         }
         return var_163.length;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc2_ in var_163)
         {
            if(_loc1_ == null || _loc2_.timeStamp < _loc1_.timeStamp)
            {
               _loc1_ = _loc2_;
            }
         }
         if(_loc1_ != null)
         {
            return _loc1_.getOpenTime();
         }
         return "";
      }
      
      public function get pickerUserId() : int
      {
         return var_2039;
      }
      
      public function removeIssue(param1:int) : IssueMessageData
      {
         return var_163.remove(param1) as IssueMessageData;
      }
      
      public function get pickerName() : String
      {
         return var_2040;
      }
      
      public function get issues() : Array
      {
         return var_163.getValues();
      }
      
      public function getMessageCount() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for each(_loc2_ in var_163)
         {
            if(_loc2_.message != "")
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
   }
}
