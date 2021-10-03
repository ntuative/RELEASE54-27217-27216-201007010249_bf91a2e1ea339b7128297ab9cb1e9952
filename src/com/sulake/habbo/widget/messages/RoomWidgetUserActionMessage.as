package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_544:String = "RWUAM_RESPECT_USER";
      
      public static const const_635:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_668:String = "RWUAM_START_TRADING";
      
      public static const const_704:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_622:String = "RWUAM_WHISPER_USER";
      
      public static const const_552:String = "RWUAM_IGNORE_USER";
      
      public static const const_446:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_741:String = "RWUAM_BAN_USER";
      
      public static const const_705:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_503:String = "RWUAM_KICK_USER";
      
      public static const const_567:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_533:String = " RWUAM_RESPECT_PET";
      
      public static const const_373:String = "RWUAM_KICK_BOT";
      
      public static const const_1397:String = "RWUAM_TRAIN_PET";
      
      public static const const_740:String = "RWUAM_PICKUP_PET";
      
      public static const const_607:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_731:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
