package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.utils.IInternalWindowServices;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.InternalWindowServices;
   import com.sulake.core.window.utils.KeyboardEventQueue;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static var var_1019:MouseEventQueue;
      
      public static var var_1721:IMouseCursor;
      
      public static const const_1514:int = 2;
      
      private static var var_1126:Factory;
      
      private static var var_142:IWindowRenderer;
      
      public static var var_1482:KeyboardEventQueue;
      
      public static const const_1539:int = 1;
      
      public static const ERROR_DURING_EVENT_HANDLING:int = 5;
      
      public static const const_1499:int = 0;
      
      public static const const_1718:int = 3;
      
      public static const const_1426:int = 4;
       
      
      protected var var_2430:IWindowFactory;
      
      private var _disposed:Boolean = false;
      
      private var var_778:WindowController;
      
      private var var_756:Date;
      
      protected var var_2429:IWindowParser;
      
      protected var var_1023:Error;
      
      protected var var_2431:IInternalWindowServices;
      
      protected var var_102:WindowController;
      
      protected var var_1492:int = -1;
      
      protected var var_96:IDesktopWindow;
      
      private var var_1624:Boolean = false;
      
      protected var var_2514:Boolean = true;
      
      private var var_194:Boolean = false;
      
      protected var var_1202:SubstituteParentController;
      
      private var var_2465:Point;
      
      protected var var_344:DisplayObjectContainer;
      
      private var var_384:IWindowContextStateListener;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      private var var_641:Point;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         var_641 = new Point();
         var_2465 = new Point();
         super();
         _name = param1;
         var_142 = param2;
         _localization = param4;
         var_344 = param5;
         var_2431 = new InternalWindowServices(this,param5);
         var_2430 = param3;
         var_2429 = new WindowParser(this);
         var_756 = new Date();
         if(var_1126 == null)
         {
            var_1126 = new Factory();
         }
         if(var_1019 == null)
         {
            var_1019 = new MouseEventQueue(param5);
         }
         if(var_1482 == null)
         {
            var_1482 = new KeyboardEventQueue(param5);
         }
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         var_96 = new DesktopController("_CONTEXT_DESKTOP_" + _name,this,param6);
         var_344.addChild(var_96.getDisplayObject());
         var_344.doubleClickEnabled = true;
         var_344.addEventListener(Event.RESIZE,stageResizedHandler);
         var_102 = WindowController(var_96);
         var_1202 = new SubstituteParentController(this);
         var_384 = param7;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == var_96)
         {
            var_96 = null;
         }
         if(param1.state != WindowState.const_389)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = var_1126.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            handleError(WindowContext.const_1426,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = var_1202;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : var_96,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return var_96;
      }
      
      public function render(param1:uint) : void
      {
         var_1624 = true;
         var_142.update(param1);
         var_1624 = false;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         var_344.removeEventListener(Event.RESIZE,stageResizedHandler);
         var_344.removeChild(IGraphicContextHost(var_96).getGraphicContext(true) as DisplayObject);
         var_96.destroy();
         var_96 = null;
         var_1202.destroy();
         var_1202 = null;
         var_1126 = null;
         var_142 = null;
         var_102 = null;
         var_756 = null;
         var_384 = null;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(var_96 != null && true)
         {
            if(var_344 is Stage)
            {
               var_96.width = Stage(var_344).stageWidth;
               var_96.height = Stage(var_344).stageHeight;
            }
            else
            {
               var_96.width = var_344.width;
               var_96.height = var_344.height;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var_142.addToRenderQueue(WindowController(param1),param2,param3);
         return true;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return var_2429;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return var_2430;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_194 = true;
         if(var_1023)
         {
            throw var_1023;
         }
         var _loc6_:Point = new Point();
         var _loc7_:MouseEventQueue = WindowContext.var_1019;
         _loc7_.begin();
         var_641.x = -1;
         var_641.y = -1;
         while(true)
         {
            _loc2_ = _loc7_.next() as MouseEvent;
            if(_loc2_ == null)
            {
               break;
            }
            if(_loc2_.stageX != var_641.x || _loc2_.stageY != var_641.y)
            {
               var_641.x = _loc2_.stageX;
               var_641.y = _loc2_.stageY;
               _loc5_ = new Array();
               var_96.groupChildrenUnderPoint(var_641,_loc5_);
            }
            _loc3_ = _loc5_ != null ? int(_loc5_.length) : 0;
            if(_loc3_ == 1)
            {
               if(_loc2_.type == MouseEvent.MOUSE_MOVE)
               {
                  if(var_102 != var_96 && true)
                  {
                     var_102.getGlobalPosition(_loc6_);
                     var_102.update(var_102,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                     var_102 = WindowController(var_96);
                  }
               }
            }
            while(--_loc3_ > -1)
            {
               _loc4_ = passMouseEvent(WindowController(_loc5_[_loc3_]),_loc2_);
               if(_loc4_ != null && _loc4_.visible)
               {
                  if(_loc2_.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(_loc4_ != var_102)
                     {
                        if(true)
                        {
                           var_102.getGlobalPosition(_loc6_);
                           var_102.update(var_102,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           _loc4_.getGlobalPosition(_loc6_);
                           _loc4_.update(_loc4_,new MouseEvent(MouseEvent.MOUSE_OVER,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           var_102 = _loc4_;
                        }
                     }
                  }
                  else if(_loc2_.type == MouseEvent.MOUSE_UP || _loc2_.type == MouseEvent.CLICK)
                  {
                     if(var_102 && true)
                     {
                        if(var_384 != null)
                        {
                           var_384.mouseEventReceived(_loc2_.type,var_102);
                        }
                     }
                  }
                  if(_loc2_.altKey)
                  {
                     if(var_102)
                     {
                        Logger.log("HOVER: undefined");
                     }
                  }
                  if(_loc4_ != var_96)
                  {
                     _loc2_.stopPropagation();
                     _loc7_.remove();
                  }
                  break;
               }
            }
         }
         _loc7_.end();
         var_194 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         var_1023 = param2;
         var_1492 = param1;
         if(var_2514)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return var_1023;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1721 == null)
         {
            var_1721 = new MouseCursorControl(var_344);
         }
         return var_1721;
      }
      
      public function flushError() : void
      {
         var_1023 = null;
         var_1492 = -1;
      }
      
      public function getLastErrorCode() : int
      {
         return var_1492;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(!param1.testParamFlag(WindowParam.const_44))
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_68))
         {
            return null;
         }
         var _loc3_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc3_);
         var _loc4_:BitmapData = var_142.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc3_,_loc4_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_471))
         {
            if(param1.parent != null)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         var _loc5_:Boolean = true;
         switch(param2.type)
         {
            case MouseEvent.MOUSE_DOWN:
               var_778 = param1;
               break;
            case MouseEvent.CLICK:
               if(var_778 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_778 = null;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               if(var_778 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_778 = null;
               }
               break;
            case MouseEvent.MOUSE_WHEEL:
               if(!(param1 is IScrollableWindow) && !(param1 is IScrollbarWindow))
               {
                  return null;
               }
               break;
         }
         if(_loc5_)
         {
            if(!param1.update(param1,param2))
            {
               if(param1.parent)
               {
                  return passMouseEvent(WindowController(param1.parent),param2);
               }
            }
         }
         return param1;
      }
      
      public function method_15(param1:String) : IWindow
      {
         return var_96.findChildByName(param1);
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return var_2431;
      }
   }
}
