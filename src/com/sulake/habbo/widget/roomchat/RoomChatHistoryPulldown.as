package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryPulldown
   {
      
      public static const const_436:int = 2;
      
      public static const const_322:int = 1;
      
      public static const const_209:int = 0;
      
      public static const const_793:int = 3;
      
      private static const const_829:int = 150;
      
      private static const const_828:int = 250;
      
      public static const const_73:int = 39;
       
      
      private var var_1684:BitmapData;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1685:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var var_2315:int = 0;
      
      private var var_40:IWindowContainer;
      
      private var var_104:IRegionWindow;
      
      private var var_2314:int = 30;
      
      private var var_38:int = -1;
      
      private var var_2318:BitmapData;
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2313:BitmapData;
      
      private var var_76:IBitmapWrapperWindow;
      
      private var var_2316:BitmapData;
      
      private var var_2317:BitmapData;
      
      private var var_1683:BitmapData;
      
      public function RoomChatHistoryPulldown(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         _widget = param1;
         _windowManager = param2;
         _assetLibrary = param4;
         var_40 = param3;
         var_2317 = (_assetLibrary.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData;
         var_1685 = (_assetLibrary.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData;
         var_2316 = (_assetLibrary.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData;
         var_1683 = (_assetLibrary.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData;
         var_1684 = (_assetLibrary.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData;
         var_2318 = (_assetLibrary.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData;
         var_2313 = (_assetLibrary.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData;
         var_76 = _windowManager.createWindow("chat_history_bg","",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_36,HabboWindowParam.const_65,new Rectangle(0,0,param3.width,param3.height - const_73),null,0,0) as IBitmapWrapperWindow;
         var_40.addChild(var_76);
         _window = _windowManager.createWindow("chat_pulldown","",HabboWindowType.const_52,HabboWindowStyle.const_36,HabboWindowParam.const_37,new Rectangle(0,0 - const_73,param3.width,const_73),null,0) as IWindowContainer;
         var_40.addChild(_window);
         var_104 = _windowManager.createWindow("REGIONchat_pulldown","",WindowType.const_397,HabboWindowStyle.const_34,0 | 0 | 0 | 0,new Rectangle(0,0,param3.width,param3.height - const_73),null,0) as IRegionWindow;
         if(var_104 != null)
         {
            var_104.background = true;
            var_104.mouseTreshold = 0;
            var_104.addEventListener(WindowMouseEvent.const_49,onPulldownMouseDown);
            var_40.addChild(var_104);
            var_104.toolTipCaption = "${chat.history.drag.tooltip}";
            var_104.toolTipDelay = 250;
         }
         var _loc5_:XmlAsset = param4.getAssetByName("chat_history_pulldown") as XmlAsset;
         _window.buildFromXML(_loc5_.content as XML);
         _window.addEventListener(WindowMouseEvent.const_49,onPulldownMouseDown);
         var _loc6_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc6_.mouseTreshold = 0;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onCloseButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.const_93,onCloseButtonMouseUp);
            _loc6_.addEventListener(WindowMouseEvent.const_49,onCloseButtonMouseDown);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onCloseButtonMouseOver);
            _loc6_.addEventListener(WindowMouseEvent.const_27,onCloseButtonMouseOut);
         }
         _window.background = true;
         _window.color = 0;
         _window.mouseTreshold = 0;
         this.state = const_209;
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseDown(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_2318.clone();
         }
      }
      
      private function onCloseButtonMouseUp(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1684.clone();
         }
      }
      
      public function update(param1:uint) : void
      {
         switch(state)
         {
            case const_436:
               var_76.blend += param1 / const_828;
               _window.blend += param1 / const_828;
               if(false)
               {
                  state = const_322;
               }
               break;
            case const_793:
               var_76.blend = 0 - param1 / const_829;
               _window.blend = 0 - param1 / const_829;
               if(true)
               {
                  state = const_209;
               }
         }
      }
      
      private function onCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownCloseButtonClicked(param1);
         }
      }
      
      public function get state() : int
      {
         return var_38;
      }
      
      private function onCloseButtonMouseOver(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1684.clone();
         }
      }
      
      public function dispose() : void
      {
         if(var_104 != null)
         {
            var_104.dispose();
            var_104 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_76 != null)
         {
            var_76.dispose();
            var_76 = null;
         }
      }
      
      private function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownMouseDown(param1);
         }
      }
      
      public function set state(param1:int) : void
      {
         if(param1 == var_38)
         {
            return;
         }
         switch(param1)
         {
            case const_322:
               if(var_38 == const_209)
               {
                  this.state = const_436;
               }
               else
               {
                  if(_window == null || var_76 == null)
                  {
                     return;
                  }
                  _window.visible = true;
                  var_76.visible = true;
                  var_104.visible = true;
                  var_38 = param1;
               }
               break;
            case const_209:
               if(_window == null || var_76 == null)
               {
                  return;
               }
               _window.visible = false;
               var_76.visible = false;
               var_104.visible = false;
               var_38 = param1;
               break;
            case const_436:
               if(_window == null || var_76 == null)
               {
                  return;
               }
               _window.blend = 0;
               var_76.blend = 0;
               _window.visible = true;
               var_76.visible = true;
               var_38 = param1;
               break;
            case const_793:
               if(_window == null || var_76 == null)
               {
                  return;
               }
               _window.blend = 1;
               var_76.blend = 1;
               var_38 = param1;
               break;
         }
      }
      
      private function tileBitmapHorz(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:int = param2.width / param1.width;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_ + 1)
         {
            param2.copyPixels(param1,param1.rect,new Point(_loc4_ * param1.width,0));
            _loc4_++;
         }
      }
      
      public function containerResized(param1:Rectangle) : void
      {
         if(_window != null)
         {
            _window.x = 0;
            _window.y = 0 - const_73;
            _window.width = var_40.width;
         }
         if(var_104 != null)
         {
            var_104.x = 0;
            var_104.y = 0 - const_73;
            var_104.width = 0 - var_2314;
         }
         if(var_76 != null)
         {
            var_76.rectangle = var_40.rectangle;
            var_76.height = 0 - const_73;
         }
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseOut(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1683.clone();
         }
      }
      
      private function buildWindowGraphics() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(_window == null)
         {
            return;
         }
         if(var_2315 == _window.width)
         {
            return;
         }
         var_2315 = _window.width;
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("grapBarBg") as IBitmapWrapperWindow;
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripL") as IBitmapWrapperWindow;
         var _loc4_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripR") as IBitmapWrapperWindow;
         var _loc5_:IBitmapWrapperWindow = _window.findChildByName("grapBarHandle") as IBitmapWrapperWindow;
         if(_loc2_ != null && _loc5_ != null)
         {
            _loc5_.bitmap = var_2316.clone();
            _loc2_.bitmap = var_1683.clone();
            var_2314 = 0 - _loc2_.x;
         }
         _loc3_.width = _loc5_.x - 5;
         _loc3_.x = 0;
         _loc4_.x = _loc5_.x + _loc5_.width + 5;
         _loc4_.width = _loc2_.x - 5 - _loc4_.x;
         if(_loc3_.width < 0)
         {
            _loc3_.width = 0;
         }
         if(_loc4_.width < 0)
         {
            _loc4_.width = 0;
         }
         if(_loc1_ != null && _loc3_ != null && _loc4_ != null)
         {
            if(_loc1_.width > 0 && _loc1_.height > 0)
            {
               _loc7_ = new BitmapData(_loc1_.width,_loc1_.height);
               tileBitmapHorz(var_2317.clone(),_loc7_);
               _loc1_.bitmap = _loc7_;
            }
            if(_loc3_.width > 0 && _loc3_.height > 0)
            {
               _loc8_ = new BitmapData(_loc3_.width,_loc3_.height);
               tileBitmapHorz(var_1685.clone(),_loc8_);
               _loc3_.bitmap = _loc8_;
            }
            if(_loc4_.width > 0 && _loc4_.height > 0)
            {
               _loc9_ = new BitmapData(_loc4_.width,_loc4_.height);
               tileBitmapHorz(var_1685.clone(),_loc9_);
               _loc4_.bitmap = _loc9_;
            }
         }
         if(var_76 == null)
         {
            return;
         }
         var_76.bitmap = var_2313.clone();
      }
   }
}
