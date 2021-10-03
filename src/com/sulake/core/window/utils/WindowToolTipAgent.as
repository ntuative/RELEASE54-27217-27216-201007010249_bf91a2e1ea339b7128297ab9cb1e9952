package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_345:Timer;
      
      protected var var_1025:String;
      
      protected var var_1024:uint;
      
      protected var var_1204:Point;
      
      protected var var_262:IToolTipWindow;
      
      protected var var_1203:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1204 = new Point();
         var_1203 = new Point(20,20);
         var_1024 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_345 != null)
         {
            var_345.stop();
            var_345.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_345 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1204);
            if(var_262 != null && true)
            {
               var_262.x = param1 + var_1203.x;
               var_262.y = param2 + var_1203.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_345 != null)
         {
            var_345.reset();
         }
         if(_window && true)
         {
            if(var_262 == null || false)
            {
               var_262 = _window.context.create("undefined::ToolTip",var_1025,WindowType.const_358,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_262.x = _loc2_.x + var_1204.x + var_1203.x;
            var_262.y = _loc2_.y + var_1204.y + var_1203.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_1025 = IInteractiveWindow(param1).toolTipCaption;
               var_1024 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_1025 = param1.caption;
               var_1024 = 500;
            }
            _mouse.x = var_125.mouseX;
            _mouse.y = var_125.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1204);
            if(var_1025 != null && var_1025 != "")
            {
               if(var_345 == null)
               {
                  var_345 = new Timer(var_1024,1);
                  var_345.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_345.reset();
               var_345.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_262 != null && true)
         {
            var_262.destroy();
            var_262 = null;
         }
      }
   }
}
