package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_544:ToolbarIconGroup;
      
      private var var_1141:Boolean = false;
      
      private var var_2193:String;
      
      private var var_975:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1140:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_38:String = "-1";
      
      private var var_104:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_790:String;
      
      private var var_2015:int;
      
      private var var_789:Timer;
      
      private var var_1647:Array;
      
      private var var_1143:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2473:Array;
      
      private var var_289:ToolbarBarMenuAnimator;
      
      private var var_445:ToolbarIconAnimator;
      
      private var var_654:Array;
      
      private var var_949:Array;
      
      private var var_948:String = "-1";
      
      private var var_2535:Boolean = true;
      
      private var var_1142:Array;
      
      private var var_1382:Timer;
      
      private var var_2194:int;
      
      private var var_85:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_654 = new Array();
         var_949 = new Array();
         var_2473 = new Array();
         var_1143 = new ToolbarIconBouncer(0.8,1);
         super();
         var_544 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_790 = param4;
         _events = param5;
         var_289 = param6;
         var_1382 = new Timer(40,40);
         var_1382.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_104 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_397,HabboWindowStyle.const_34,HabboWindowParam.const_37,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_104.background = true;
         var_104.mouseTreshold = 0;
         var_104.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_34,HabboWindowParam.const_34,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_104.addChild(_window);
         _window.addEventListener(WindowEvent.const_42,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1647[var_1142.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_2194;
      }
      
      public function get iconId() : String
      {
         return var_790;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_975 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_38 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_104 == null || _window == null)
         {
            return;
         }
         var_104.width = _window.width;
         var_104.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_85 = (0 - 0) / 2;
            _y = var_975 + (0 - 0) / 2;
         }
         else
         {
            var_85 = var_975 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_104.x = var_85;
         var_104.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_104 != null)
         {
            var_104.dispose();
            var_104 = null;
         }
         var_654 = null;
         var_949 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_289 = null;
         var_445 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_654.indexOf(param1) < 0)
         {
            var_654.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_949.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1141)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_289)
               {
                  var_289.repositionWindow(var_790,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_54);
                  _loc4_.iconId = var_790;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1140;
                  }
               }
               break;
            case WindowMouseEvent.const_27:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_948;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_654.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_949[var_654.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1141 = param1;
         if(var_104 != null)
         {
            var_104.visible = var_1141;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_104 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_104.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_104.toolTipCaption = "${toolbar.icon.tooltip." + var_2193.toLowerCase() + "}";
         }
         var_104.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_289 != null)
         {
            var_289.animateWindowIn(this,param1,param2,var_790,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_445 != null && _window != null)
         {
            var_445.update(_window);
            if(var_445.hasNextState())
            {
               state = var_445.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1647 = new Array();
         var_1142 = new Array();
         var_2193 = param1.@id;
         var_2194 = int(param1.@window_offset_from_icon);
         var_2015 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1140 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_948 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1142.push(_loc5_.id);
               var_1647.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1140 == "-1")
                  {
                     var_1140 = _loc5_.id;
                  }
                  if(var_948 == "-1")
                  {
                     var_948 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_38 = var_948;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_289 != null)
         {
            var_289.hideWindow(param1,param2,var_790,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_289 != null)
         {
            var_289.positionWindow(this,param1,param2,var_790,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_289 != null)
         {
            var_289.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1141;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1143 != null && _window != null)
         {
            var_1143.update();
            _window.y = var_1143.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_789 != null)
         {
            var_789.stop();
            var_789 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1141)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_445 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_85,_y,_bitmapData);
            if(false)
            {
               var_789 = new Timer(_loc1_.timer);
               var_789.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_789.start();
            }
            if(_loc1_.bounce)
            {
               var_1143.reset(-7);
               var_1382.reset();
               var_1382.start();
            }
         }
         else
         {
            var_445 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_2015 + var_544.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_38);
      }
      
      public function get window() : IWindow
      {
         return var_104;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_949[var_654.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_544;
      }
   }
}
