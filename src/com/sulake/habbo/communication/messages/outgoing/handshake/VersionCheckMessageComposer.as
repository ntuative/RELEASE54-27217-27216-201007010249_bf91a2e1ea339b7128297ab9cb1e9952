package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2017:String;
      
      private var var_1347:String;
      
      private var var_2018:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2018 = param1;
         var_1347 = param2;
         var_2017 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2018,var_1347,var_2017];
      }
      
      public function dispose() : void
      {
      }
   }
}
