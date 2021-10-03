package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1421:String = "WN_CREATED";
      
      public static const const_909:String = "WN_DISABLE";
      
      public static const const_1044:String = "WN_DEACTIVATED";
      
      public static const const_904:String = "WN_OPENED";
      
      public static const const_983:String = "WN_CLOSED";
      
      public static const const_899:String = "WN_DESTROY";
      
      public static const const_1613:String = "WN_ARRANGED";
      
      public static const const_482:String = "WN_PARENT_RESIZED";
      
      public static const const_870:String = "WN_ENABLE";
      
      public static const const_881:String = "WN_RELOCATE";
      
      public static const const_929:String = "WN_FOCUS";
      
      public static const const_1013:String = "WN_PARENT_RELOCATED";
      
      public static const const_396:String = "WN_PARAM_UPDATED";
      
      public static const const_714:String = "WN_PARENT_ACTIVATED";
      
      public static const const_170:String = "WN_RESIZED";
      
      public static const const_831:String = "WN_CLOSE";
      
      public static const const_875:String = "WN_PARENT_REMOVED";
      
      public static const const_294:String = "WN_CHILD_RELOCATED";
      
      public static const const_577:String = "WN_ENABLED";
      
      public static const const_289:String = "WN_CHILD_RESIZED";
      
      public static const const_854:String = "WN_MINIMIZED";
      
      public static const const_568:String = "WN_DISABLED";
      
      public static const const_194:String = "WN_CHILD_ACTIVATED";
      
      public static const const_435:String = "WN_STATE_UPDATED";
      
      public static const const_760:String = "WN_UNSELECTED";
      
      public static const const_499:String = "WN_STYLE_UPDATED";
      
      public static const const_1618:String = "WN_UPDATE";
      
      public static const const_484:String = "WN_PARENT_ADDED";
      
      public static const const_596:String = "WN_RESIZE";
      
      public static const const_686:String = "WN_CHILD_REMOVED";
      
      public static const const_1551:String = "";
      
      public static const const_837:String = "WN_RESTORED";
      
      public static const const_319:String = "WN_SELECTED";
      
      public static const const_844:String = "WN_MINIMIZE";
      
      public static const const_1060:String = "WN_FOCUSED";
      
      public static const const_1335:String = "WN_LOCK";
      
      public static const const_307:String = "WN_CHILD_ADDED";
      
      public static const const_923:String = "WN_UNFOCUSED";
      
      public static const const_467:String = "WN_RELOCATED";
      
      public static const const_836:String = "WN_DEACTIVATE";
      
      public static const const_1199:String = "WN_CRETAE";
      
      public static const const_918:String = "WN_RESTORE";
      
      public static const const_310:String = "WN_ACTVATED";
      
      public static const const_1392:String = "WN_LOCKED";
      
      public static const const_455:String = "WN_SELECT";
      
      public static const const_897:String = "WN_MAXIMIZE";
      
      public static const const_853:String = "WN_OPEN";
      
      public static const const_727:String = "WN_UNSELECT";
      
      public static const const_1591:String = "WN_ARRANGE";
      
      public static const const_1260:String = "WN_UNLOCKED";
      
      public static const const_1717:String = "WN_UPDATED";
      
      public static const const_1034:String = "WN_ACTIVATE";
      
      public static const const_1233:String = "WN_UNLOCK";
      
      public static const const_1059:String = "WN_MAXIMIZED";
      
      public static const const_990:String = "WN_DESTROYED";
      
      public static const const_1022:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1727,cancelable);
      }
   }
}
