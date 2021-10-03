package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_599:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_737:String = "RWPCM_PET_COMMAND";
       
      
      private var var_191:String;
      
      private var var_1315:int = 0;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         var_1315 = param2;
         var_191 = param3;
      }
      
      public function get value() : String
      {
         return var_191;
      }
      
      public function get petId() : int
      {
         return var_1315;
      }
   }
}
