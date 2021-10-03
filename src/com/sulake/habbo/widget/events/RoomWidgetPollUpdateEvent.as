package com.sulake.habbo.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_125:String = "RWPUW_CONTENT";
      
      public static const const_135:String = "RWPUW_OFFER";
      
      public static const const_58:String = "RWPUW_ERROR";
       
      
      private var var_1174:Array = null;
      
      private var var_1443:String = "";
      
      private var var_1368:String;
      
      private var var_1444:String = "";
      
      private var var_1173:int = 0;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         _id = param1;
         super(param2,param3,param4);
      }
      
      public function get questionArray() : Array
      {
         return var_1174;
      }
      
      public function get startMessage() : String
      {
         return var_1443;
      }
      
      public function get summary() : String
      {
         return var_1368;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1443 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_1173 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1368 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_1173;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1444 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1444;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1174 = param1;
      }
   }
}
