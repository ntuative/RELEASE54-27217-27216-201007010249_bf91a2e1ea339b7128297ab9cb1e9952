package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetClubGiftInfo;
   import com.sulake.habbo.communication.messages.outgoing.catalog.SelectClubGiftComposer;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class ClubGiftController
   {
       
      
      private var var_1509:Map;
      
      private var _catalog:HabboCatalog;
      
      private var _widget:ClubGiftWidget;
      
      private var var_1094:int;
      
      private var var_1766:int;
      
      private var var_646:Array;
      
      private var var_213:ClubGiftConfirmationDialog;
      
      public function ClubGiftController(param1:HabboCatalog)
      {
         super();
         _catalog = param1;
      }
      
      public function get assets() : IAssetLibrary
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.assets;
      }
      
      public function set widget(param1:ClubGiftWidget) : void
      {
         _widget = param1;
         _catalog.connection.send(new GetClubGiftInfo());
      }
      
      public function selectGift(param1:Offer) : void
      {
         closeConfirmation();
         var_213 = new ClubGiftConfirmationDialog(this,param1);
      }
      
      public function getOffers() : Array
      {
         return var_646;
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.getProductData(param1);
      }
      
      public function closeConfirmation() : void
      {
         if(var_213)
         {
            var_213.dispose();
            var_213 = null;
         }
      }
      
      public function get giftsAvailable() : int
      {
         return var_1094;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.windowManager;
      }
      
      public function dispose() : void
      {
         _catalog = null;
         if(var_213)
         {
            var_213.dispose();
            var_213 = null;
         }
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.localization;
      }
      
      public function get purse() : IPurse
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.getPurse();
      }
      
      public function get daysUntilNextGift() : int
      {
         return var_1766;
      }
      
      public function confirmSelection(param1:String) : void
      {
         if(!param1 || !_catalog || true)
         {
            return;
         }
         _catalog.connection.send(new SelectClubGiftComposer(param1));
         --var_1094;
         _widget.update();
         closeConfirmation();
      }
      
      public function setInfo(param1:int, param2:int, param3:Array, param4:Map) : void
      {
         var_1766 = param1;
         var_1094 = param2;
         var_646 = param3;
         var_1509 = param4;
         _widget.update();
      }
      
      public function getGiftData() : Map
      {
         return var_1509;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.roomEngine;
      }
      
      public function get hasClub() : Boolean
      {
         if(!_catalog || !_catalog.getPurse())
         {
            return false;
         }
         return _catalog.getPurse().clubDays > 0;
      }
   }
}