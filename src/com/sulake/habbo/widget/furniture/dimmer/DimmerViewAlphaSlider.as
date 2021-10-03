package com.sulake.habbo.widget.furniture.dimmer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class DimmerViewAlphaSlider
   {
       
      
      private var _view:DimmerView;
      
      private var var_2537:int;
      
      private var var_664:BitmapData;
      
      private var var_1154:int = 255;
      
      private var var_1679:int;
      
      private var var_809:int = 0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_665:BitmapData;
      
      public function DimmerViewAlphaSlider(param1:DimmerView, param2:IWindowContainer, param3:IAssetLibrary, param4:int = 0, param5:int = 255)
      {
         super();
         _view = param1;
         _sliderContainer = param2;
         var_809 = param4;
         var_1154 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.const_93 && param1.type != WindowMouseEvent.const_506)
         {
            return;
         }
         _view.selectedBrightness = getValue(param2.x);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_665 != null)
         {
            _loc2_.bitmap = new BitmapData(var_665.width,var_665.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_665,var_665.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_664 != null)
            {
               _loc2_.bitmap = new BitmapData(var_664.width,var_664.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_664,var_664.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               var_1679 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("dimmer_slider_base"));
         var_665 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("dimmer_slider_button"));
         var_664 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_1154 = param1;
         setValue(_view.selectedBrightness);
      }
      
      public function dispose() : void
      {
         _view = null;
         _sliderContainer = null;
         var_665 = null;
         var_664 = null;
      }
      
      private function getSliderPosition(param1:int) : int
      {
         return int(var_1679 * (Number(param1 - var_809) / (var_1154 - var_809)));
      }
      
      public function set min(param1:Number) : void
      {
         var_809 = param1;
         setValue(_view.selectedBrightness);
      }
      
      public function setValue(param1:int) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function getValue(param1:Number) : int
      {
         return int(param1 / var_1679 * (var_1154 - var_809)) + var_809;
      }
   }
}
