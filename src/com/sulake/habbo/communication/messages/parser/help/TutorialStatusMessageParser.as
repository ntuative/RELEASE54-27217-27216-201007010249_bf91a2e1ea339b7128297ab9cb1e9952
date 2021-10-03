package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1190:Boolean;
      
      private var var_1189:Boolean;
      
      private var var_1191:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1190;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1189;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1191 = param1.readBoolean();
         var_1189 = param1.readBoolean();
         var_1190 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1191;
      }
      
      public function flush() : Boolean
      {
         var_1191 = false;
         var_1189 = false;
         var_1190 = false;
         return true;
      }
   }
}
