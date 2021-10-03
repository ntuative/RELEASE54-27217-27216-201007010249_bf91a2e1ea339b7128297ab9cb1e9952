package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1786:int;
      
      private var var_2374:int = 0;
      
      private var var_2371:String;
      
      private var var_2373:int;
      
      private var var_2372:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1786 = param1;
         var_2373 = param2;
         var_2372 = param3;
         var_2371 = param4;
      }
      
      public function get length() : int
      {
         return var_2373;
      }
      
      public function get name() : String
      {
         return var_2372;
      }
      
      public function get creator() : String
      {
         return var_2371;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2374;
      }
      
      public function get id() : int
      {
         return var_1786;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2374 = param1;
      }
   }
}
