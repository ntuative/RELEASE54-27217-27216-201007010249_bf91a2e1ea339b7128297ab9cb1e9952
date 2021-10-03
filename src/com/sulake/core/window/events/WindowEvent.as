package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_253:String = "WE_CHILD_RESIZED";
      
      public static const const_1427:String = "WE_CLOSE";
      
      public static const const_1221:String = "WE_DESTROY";
      
      public static const const_126:String = "WE_CHANGE";
      
      public static const const_1330:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1716:String = "WE_PARENT_RESIZE";
      
      public static const const_95:String = "WE_UPDATE";
      
      public static const const_1215:String = "WE_MAXIMIZE";
      
      public static const const_497:String = "WE_DESTROYED";
      
      public static const const_994:String = "WE_UNSELECT";
      
      public static const const_1284:String = "WE_MAXIMIZED";
      
      public static const const_1531:String = "WE_UNLOCKED";
      
      public static const const_468:String = "WE_CHILD_REMOVED";
      
      public static const const_176:String = "WE_OK";
      
      public static const const_42:String = "WE_RESIZED";
      
      public static const const_1227:String = "WE_ACTIVATE";
      
      public static const const_254:String = "WE_ENABLED";
      
      public static const const_412:String = "WE_CHILD_RELOCATED";
      
      public static const const_1363:String = "WE_CREATE";
      
      public static const const_604:String = "WE_SELECT";
      
      public static const const_171:String = "";
      
      public static const const_1694:String = "WE_LOCKED";
      
      public static const const_1564:String = "WE_PARENT_RELOCATE";
      
      public static const const_1635:String = "WE_CHILD_REMOVE";
      
      public static const const_1695:String = "WE_CHILD_RELOCATE";
      
      public static const const_1615:String = "WE_LOCK";
      
      public static const const_201:String = "WE_FOCUSED";
      
      public static const const_563:String = "WE_UNSELECTED";
      
      public static const const_898:String = "WE_DEACTIVATED";
      
      public static const const_1367:String = "WE_MINIMIZED";
      
      public static const const_1617:String = "WE_ARRANGED";
      
      public static const const_1503:String = "WE_UNLOCK";
      
      public static const const_1526:String = "WE_ATTACH";
      
      public static const const_1288:String = "WE_OPEN";
      
      public static const const_1393:String = "WE_RESTORE";
      
      public static const const_1700:String = "WE_PARENT_RELOCATED";
      
      public static const const_1188:String = "WE_RELOCATE";
      
      public static const const_1598:String = "WE_CHILD_RESIZE";
      
      public static const const_1626:String = "WE_ARRANGE";
      
      public static const const_1238:String = "WE_OPENED";
      
      public static const const_1423:String = "WE_CLOSED";
      
      public static const const_1521:String = "WE_DETACHED";
      
      public static const const_1659:String = "WE_UPDATED";
      
      public static const const_1437:String = "WE_UNFOCUSED";
      
      public static const const_386:String = "WE_RELOCATED";
      
      public static const const_1185:String = "WE_DEACTIVATE";
      
      public static const const_235:String = "WE_DISABLED";
      
      public static const const_733:String = "WE_CANCEL";
      
      public static const const_679:String = "WE_ENABLE";
      
      public static const const_1323:String = "WE_ACTIVATED";
      
      public static const const_1404:String = "WE_FOCUS";
      
      public static const const_1569:String = "WE_DETACH";
      
      public static const const_1294:String = "WE_RESTORED";
      
      public static const const_1388:String = "WE_UNFOCUS";
      
      public static const const_53:String = "WE_SELECTED";
      
      public static const const_1432:String = "WE_PARENT_RESIZED";
      
      public static const const_1365:String = "WE_CREATED";
      
      public static const const_1724:String = "WE_ATTACHED";
      
      public static const const_1253:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1727:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1498:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1727 = param3;
         var_1498 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1498;
      }
      
      public function get related() : IWindow
      {
         return var_1727;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1498 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
