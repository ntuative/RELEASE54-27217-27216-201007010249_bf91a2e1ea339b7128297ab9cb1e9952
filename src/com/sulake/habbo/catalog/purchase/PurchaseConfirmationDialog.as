package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.club.ClubBuyOfferData;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.communication.messages.parser.catalog.IsOfferGiftableMessageParser;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.ui.Keyboard;
   
   public class PurchaseConfirmationDialog implements IGetImageListener
   {
       
      
      private var var_2360:String = "";
      
      private var var_1514:Array;
      
      private var var_682:Array;
      
      private var _window:IFrameWindow;
      
      private const const_1467:uint = 4.294967295E9;
      
      private const const_1468:uint = 4.293848814E9;
      
      private var var_999:int;
      
      private const const_1757:uint = 4.291613146E9;
      
      private var var_300:int = -1;
      
      private var var_257:IWindowContainer;
      
      private var var_1180:String;
      
      private var var_576:IWindowContainer;
      
      private var _boxIndex:int;
      
      private var var_1000:int;
      
      private var var_2488:Boolean = false;
      
      private var var_2489:int = 0;
      
      private var var_681:Array;
      
      private const const_1756:int = 10;
      
      private var var_236:Array;
      
      private var var_1455:Boolean;
      
      private var _catalog:HabboCatalog;
      
      private var var_80:IPurchasableOffer;
      
      private var var_221:int;
      
      private var var_467:ICatalogPage;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_1456:Boolean;
      
      public function PurchaseConfirmationDialog(param1:ICoreLocalizationManager)
      {
         var_682 = [];
         var_681 = [];
         super();
         _localization = param1;
      }
      
      public function receiverNotFound() : void
      {
         enableGiftButton(true);
         if(!_catalog || true)
         {
            return;
         }
         _catalog.windowManager.alert("${catalog.gift_wrapping.receiver_not_found.title}","${catalog.gift_wrapping.receiver_not_found.info}",0,alertHandler);
      }
      
      public function notEnoughCredits() : void
      {
         if(_window == null)
         {
            return;
         }
         enableGiftButton(true);
         var _loc1_:ICheckBoxWindow = _window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ != null)
         {
            _loc1_.select();
         }
      }
      
      private function checkboxHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowEvent.const_604:
               showSelectors(false);
               break;
            case WindowEvent.const_563:
               showSelectors(true);
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(true || true)
         {
            return null;
         }
         var _loc2_:XmlAsset = _catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return null;
         }
         return _catalog.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function alertHandler(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
         enableGiftButton(true);
      }
      
      private function setImage(param1:BitmapData, param2:Boolean) : void
      {
         if(_window == null || param1 == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.bitmap != null)
         {
            _loc3_.bitmap.dispose();
            _loc3_.bitmap = null;
         }
         if(_loc3_.bitmap == null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         }
         var _loc4_:int = (_loc3_.width - param1.width) * 0.5;
         var _loc5_:int = (_loc3_.height - param1.height) * 0.5;
         _loc3_.bitmap.draw(param1,new Matrix(1,0,0,1,_loc4_,_loc5_));
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function suggestionsEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _loc3_ = param2 as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               _loc4_ = _loc3_.findChildByName("name_text") as ITextWindow;
               if(_loc4_ == null)
               {
                  return;
               }
               setReceiverName(_loc4_.text);
               showSuggestions(false);
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc5_ = var_257.findChildByName("suggestion_list") as IItemListWindow;
               if(_loc5_ == null)
               {
                  return;
               }
               highlightSuggestion(_loc5_.getListItemIndex(_loc3_));
               break;
         }
      }
      
      private function updateColorGrid() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = _window.findChildByName("color_grid") as IItemGridWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc4_) as IWindowContainer;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.findChildByName("selection") as IBitmapWrapperWindow;
               if(_loc3_ != null)
               {
                  _loc3_.visible = _loc2_.id == var_1000;
               }
            }
            _loc4_++;
         }
      }
      
      private function setReceiverName(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = _window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         focusMessageField();
      }
      
      public function onIsOfferGiftable(param1:IsOfferGiftableMessageParser) : void
      {
         if(this.var_80 == null || this.var_80.offerId != param1.offerId)
         {
            return;
         }
         this.setGiftButtonState(param1.isGiftable);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(param1 == var_999)
         {
            var_999 = 0;
            setImage(param2,true);
         }
      }
      
      private function focusMessageField() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = _window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         _loc1_.focus();
      }
      
      private function showMessageInput(param1:Boolean) : void
      {
         var _loc2_:ITextFieldWindow = _window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      private function updateLocalizations() : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:IProductData = _catalog.getProductData(var_80.localizationId);
         var _loc2_:String = _loc1_ == null ? "" : _loc1_.name;
         _catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","offer_name",_loc2_);
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc7_:String = _catalog.getPurse().credits.toString();
         var _loc8_:String = _catalog.getPurse().pixels.toString();
         switch(var_80.priceType)
         {
            case Offer.const_337:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.credits";
               _loc5_ = _localization.getLocalization(_loc6_);
               _localization.registerParameter(_loc6_,"credits",var_80.priceInCredits.toString());
               _loc3_ = _loc5_.value;
               _localization.registerParameter(_loc6_,"credits",_loc7_);
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_638:
            case Offer.const_494:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.credits+pixels";
               _loc5_ = _localization.getLocalization(_loc6_);
               _localization.registerParameter(_loc6_,"credits",var_80.priceInCredits.toString());
               _localization.registerParameter(_loc6_,"pixels",var_80.priceInPixels.toString());
               _loc3_ = _loc5_.value;
               _localization.registerParameter(_loc6_,"credits",_loc7_);
               _localization.registerParameter(_loc6_,"pixels",_loc8_);
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_462:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.pixels";
               _loc5_ = _localization.getLocalization(_loc6_);
               _localization.registerParameter(_loc6_,"pixels",var_80.priceInPixels.toString());
               _loc3_ = _loc5_.value;
               _localization.registerParameter(_loc6_,"pixels",_loc8_);
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_908:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.nothing";
               _loc5_ = _localization.getLocalization(_loc6_);
               _loc3_ = _loc5_.value;
               _localization.registerParameter(_loc6_,"credits",_loc7_);
               _loc4_ = _loc5_.value;
         }
         _catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","price",_loc3_);
         _catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.amount","amount",_loc4_);
      }
      
      private function showSuggestions(param1:Boolean) : void
      {
         if(var_257 == null)
         {
            return;
         }
         var_257.visible = param1;
         if(!param1)
         {
            showMessageInput(true);
         }
      }
      
      private function toggleCheckbox() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ICheckBoxWindow = _window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.isSelected)
         {
            _loc1_.unselect();
         }
         else
         {
            _loc1_.select();
         }
      }
      
      private function updatePreview() : void
      {
         var _loc3_:* = null;
         if(var_221 < 0)
         {
            var_221 = -1;
         }
         if(var_221 > -1)
         {
            var_221 = 0;
         }
         if(_boxIndex < 0)
         {
            _boxIndex = -1;
         }
         if(_boxIndex > -1)
         {
            _boxIndex = 0;
         }
         var _loc1_:int = 0;
         if(_window == null)
         {
            return;
         }
         var _loc2_:IRoomEngine = var_80.page.viewer.roomEngine;
         _loc3_ = _loc2_.getFurnitureImage(var_1000,new Vector3d(180),64,this,_loc1_.toString());
         if(_loc3_ == null)
         {
            return;
         }
         var_999 = _loc3_.id;
         setImage(_loc3_.data,true);
         showSuggestions(false);
      }
      
      private function getColor(param1:int) : uint
      {
         return param1 % 2 == 0 ? uint(const_1468) : uint(const_1467);
      }
      
      private function initColorGrid() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         if(_window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = _window.findChildByName("color_grid") as IItemGridWindow;
         _loc1_.destroyGridItems();
         var _loc2_:IWindowContainer = createWindow("gift_palette_item") as IWindowContainer;
         _loc2_.procedure = colorHandler;
         var _loc3_:Array = var_1514;
         for each(_loc6_ in _loc3_)
         {
            _loc4_ = _catalog.getFurnitureData(_loc6_,ProductTypeEnum.const_81);
            _loc5_ = _loc2_.clone() as IWindowContainer;
            if(!(!_loc4_ || !_loc5_))
            {
               _loc7_ = uint(_loc4_.colours[0]);
               _loc8_ = (_loc7_ >> 16 & 255) / 255;
               _loc9_ = (_loc7_ >> 8 & 255) / 255;
               _loc10_ = (_loc7_ & 255) / 255;
               _loc11_ = new ColorTransform(_loc8_,_loc9_,_loc10_);
               setBitmapData(_loc5_,"border","ctlg_clr_27x22_1");
               setBitmapData(_loc5_,"color","ctlg_clr_27x22_2",_loc11_);
               setBitmapData(_loc5_,"selection","ctlg_clr_27x22_3");
               _loc5_.id = _loc6_;
               _loc1_.addGridItem(_loc5_);
            }
         }
      }
      
      private function messageInputHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.const_49:
               if(var_1455)
               {
                  _loc3_ = param2 as ITextFieldWindow;
                  if(_loc3_)
                  {
                     _loc3_.text = "";
                     var_1455 = false;
                  }
               }
               break;
            case WindowEvent.const_201:
               showSuggestions(false);
         }
      }
      
      private function reset() : void
      {
         var_80 = null;
         var_467 = null;
         var_1180 = "";
         var_2489 = 0;
         var_2488 = false;
         var_236 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         var_257 = null;
         if(var_576 != null)
         {
            var_576.dispose();
            var_576 = null;
         }
      }
      
      private function confirmationHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "gift_button":
               showGiftDialog();
               break;
            case "buy_button":
               _catalog.purchaseProduct(var_467,var_80,var_1180);
               dispose();
               break;
            case "cancel_button":
            case "header_button_close":
               dispose();
         }
      }
      
      public function dispose() : void
      {
         reset();
      }
      
      public function showOffer(param1:IHabboCatalog, param2:IPurchasableOffer, param3:ICatalogPage, param4:String = "", param5:Array = null) : void
      {
         var_80 = param2;
         var_467 = param3;
         _catalog = param1 as HabboCatalog;
         var_1180 = param4;
         var_236 = param5;
         showConfirmationDialog();
      }
      
      private function selectHighlighted() : void
      {
         if(var_257 == null || true)
         {
            return;
         }
         var _loc1_:IItemListWindow = var_257.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = _loc1_.getListItemAt(var_300) as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _loc2_.findChildByName("name_text") as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         setReceiverName(_loc3_.text);
         showSuggestions(false);
      }
      
      private function giveGift() : void
      {
         var _loc1_:ITextFieldWindow = _window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.text;
         var _loc3_:ITextFieldWindow = _window.findChildByName("message_input") as ITextFieldWindow;
         var _loc4_:String = _loc3_ == null ? "" : _loc3_.text;
         var _loc5_:ICheckBoxWindow = _window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         var _loc6_:Boolean = _loc5_ == null ? false : Boolean(_loc5_.isSelected);
         var _loc7_:int = !!_loc6_ ? 0 : int(var_1000);
         var _loc8_:int = !!_loc6_ ? 0 : int(var_681[_boxIndex]);
         var _loc9_:int = !!_loc6_ ? 0 : int(var_682[var_221]);
         _catalog.purchaseProductAsGift(var_467,var_80,var_1180,_loc2_,_loc4_,_loc7_,_loc8_,_loc9_);
      }
      
      private function nameInputHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowEvent.const_126:
               _loc3_ = param1.window as ITextFieldWindow;
               if(_loc3_ == null)
               {
                  return;
               }
               if(var_2360 == _loc3_.text)
               {
                  return;
               }
               _loc4_ = _loc3_.text.toLowerCase();
               _loc5_ = [];
               for each(_loc7_ in var_236)
               {
                  if(_loc7_.toLowerCase().search(_loc4_) != -1)
                  {
                     _loc5_.push(_loc7_);
                  }
                  if(_loc5_.length >= const_1756)
                  {
                     break;
                  }
               }
               updateSuggestions(_loc5_);
               var_2360 = _loc3_.text;
               break;
            case WindowMouseEvent.const_49:
               showSuggestions(false);
               if(var_1456)
               {
                  _loc3_ = param2 as ITextFieldWindow;
                  if(_loc3_)
                  {
                     _loc3_.text = "";
                     var_1456 = false;
                  }
               }
               break;
            case WindowKeyboardEvent.const_711:
               _loc6_ = param1 as WindowKeyboardEvent;
               switch(_loc6_.keyCode)
               {
                  case Keyboard.UP:
                     highlightSuggestion(var_300 - 1);
                     break;
                  case Keyboard.DOWN:
                     highlightSuggestion(var_300 + 1);
                     break;
                  case Keyboard.ENTER:
                     selectHighlighted();
                     break;
                  case Keyboard.TAB:
                     focusMessageField();
               }
         }
      }
      
      private function enableGiftButton(param1:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = _window.findChildByName("give_gift_button") as IButtonWindow;
         if(_loc2_ != null)
         {
            if(param1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
         }
      }
      
      private function showConfirmationDialog() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(_catalog == null)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
         }
         updateLocalizations();
         _window = createWindow("purchase_confirmation") as IFrameWindow;
         if(_window == null)
         {
            return;
         }
         _window.procedure = confirmationHandler;
         this.setGiftButtonState(false);
         _window.center();
         var _loc1_:ITextWindow = _window.findChildByName("product_name") as ITextWindow;
         if(_loc1_ != null)
         {
            _loc3_ = _catalog.getProductData(var_80.localizationId);
            _loc1_.text = _loc3_ == null ? "" : _loc3_.name;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc4_ = var_80.page.viewer.roomEngine;
            _loc7_ = 0;
            _loc8_ = "";
            _loc9_ = "";
            if(var_80 is Offer)
            {
               _loc10_ = var_80.productContainer.firstProduct;
               _loc9_ = _loc10_.productType;
               _loc7_ = _loc10_.productClassId;
               _loc8_ = _loc10_.extraParam;
            }
            else if(var_80 is ClubBuyOfferData)
            {
               _loc9_ = "null";
            }
            switch(_loc9_)
            {
               case ProductTypeEnum.const_81:
                  _loc5_ = _loc4_.getFurnitureIcon(_loc7_,this);
                  break;
               case ProductTypeEnum.const_80:
                  _loc5_ = _loc4_.getWallItemIcon(_loc7_,this,_loc8_);
                  break;
               case ProductTypeEnum.const_211:
                  _loc6_ = _catalog.getPixelEffectIcon(_loc7_);
                  break;
               case ProductTypeEnum.const_300:
                  _loc6_ = _catalog.getSubscriptionProductIcon(_loc7_);
            }
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.data;
               var_999 = _loc5_.id;
            }
            setImage(_loc6_,true);
         }
      }
      
      private function setGiftButtonState(param1:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = IButtonWindow(_window.findChildByName("gift_button"));
         if(param1)
         {
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      private function showGiftDialog() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(_window != null)
         {
            _window.dispose();
         }
         var _loc1_:GiftWrappingConfiguration = _catalog.giftWrappingConfiguration;
         var _loc2_:String = !!_loc1_.isEnabled ? "gift_wrapping" : "gift_no_wrapping";
         _window = createWindow(_loc2_) as IFrameWindow;
         if(_window == null)
         {
            return;
         }
         _window.center();
         _window.procedure = wrappingHandler;
         _loc3_ = _window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.procedure = nameInputHandler;
         }
         _loc3_ = _window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.procedure = messageInputHandler;
         }
         var_1456 = true;
         var_1455 = true;
         if(_loc1_.isEnabled)
         {
            _loc4_ = _window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
            if(_loc4_ != null)
            {
               _loc4_.procedure = checkboxHandler;
            }
            _localization.registerParameter("catalog.gift_wrapping.price","price",_loc1_.price.toString());
            var_1514 = _loc1_.stuffTypes;
            var_681 = _loc1_.boxTypes;
            var_682 = _loc1_.ribbonTypes;
            var_1000 = var_1514[0];
            _boxIndex = var_681[0];
            var_221 = var_682[0];
            initColorGrid();
            updateColorGrid();
            updatePreview();
         }
      }
      
      private function colorHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1000 = param2.id;
         updateColorGrid();
         updatePreview();
      }
      
      private function showSelectors(param1:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = _window.findChildByName("mask") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = !param1;
      }
      
      private function highlightSuggestion(param1:int) : void
      {
         var _loc3_:* = null;
         if(var_257 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = var_257.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = _loc2_.getListItemAt(var_300) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = getColor(var_300);
         }
         var_300 = param1;
         if(var_300 < 0)
         {
            var_300 = _loc2_.numListItems - 1;
         }
         if(var_300 >= _loc2_.numListItems)
         {
            var_300 = 0;
         }
         _loc3_ = _loc2_.getListItemAt(var_300) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = const_1757;
         }
      }
      
      private function setBitmapData(param1:IWindowContainer, param2:String, param3:String, param4:ColorTransform = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc5_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:BitmapDataAsset = _catalog.assets.getAssetByName(param3) as BitmapDataAsset;
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:BitmapData = _loc6_.content as BitmapData;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc5_.bitmap == null)
         {
            _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         }
         _loc5_.bitmap.draw(_loc7_,null,param4);
      }
      
      private function wrappingHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "give_gift_button":
               giveGift();
               enableGiftButton(false);
               break;
            case "cancel_gifting_button":
            case "header_button_close":
               dispose();
               break;
            case "ribbon_prev":
               --var_221;
               updatePreview();
               break;
            case "ribbon_next":
               ++var_221;
               updatePreview();
               break;
            case "box_prev":
               --_boxIndex;
               updatePreview();
               break;
            case "box_next":
               ++_boxIndex;
               updatePreview();
               break;
            case "use_free_text":
               toggleCheckbox();
         }
      }
      
      private function updateSuggestions(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_257 == null)
         {
            var_257 = _window.findChildByName("suggestion_container") as IWindowContainer;
         }
         if(var_576 == null)
         {
            var_576 = createWindow("suggestion_list_item") as IWindowContainer;
            var_576.procedure = suggestionsEventHandler;
         }
         if(var_257 == null || var_576 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = var_257.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeListItems();
         if(param1.length == 0)
         {
            showSuggestions(false);
            return;
         }
         showSuggestions(true);
         var _loc3_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc5_ = var_576.clone() as IWindowContainer;
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.findChildByName("name_text") as ITextWindow;
               if(_loc6_ != null)
               {
                  _loc6_.text = _loc4_;
                  _loc2_.addListItem(_loc5_);
               }
               _loc5_.color = getColor(_loc3_);
               _loc3_++;
            }
         }
         showMessageInput(param1.length < 2);
         highlightSuggestion(0);
      }
   }
}
