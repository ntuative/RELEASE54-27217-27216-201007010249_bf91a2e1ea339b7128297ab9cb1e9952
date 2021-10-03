package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_125:String = "RSPE_POLL_CONTENT";
      
      public static const const_135:String = "RSPE_POLL_OFFER";
      
      public static const const_58:String = "RSPE_POLL_ERROR";
       
      
      private var var_1174:Array = null;
      
      private var var_1443:String = "";
      
      private var var_1368:String;
      
      private var var_1444:String = "";
      
      private var var_1173:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
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
