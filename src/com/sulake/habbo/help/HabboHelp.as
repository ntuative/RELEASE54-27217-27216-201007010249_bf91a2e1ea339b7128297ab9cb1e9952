package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2312:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_145:TutorialUI;
      
      private var var_816:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_64:HelpUI;
      
      private var var_815:IHabboConfigurationManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_668:HotelMergeUI;
      
      private var var_320:IHabboCommunicationManager;
      
      private var var_984:FaqIndex;
      
      private var var_2221:String = "";
      
      private var var_1110:IncomingMessages;
      
      private var var_1422:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1422 = new CallForHelpData();
         var_2312 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_984 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_64 != null)
         {
            var_64.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_64 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_64.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_145 != null)
         {
            var_145.dispose();
            var_145 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_2221;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_64 != null)
         {
            var_64.dispose();
            var_64 = null;
         }
         if(var_145 != null)
         {
            var_145.dispose();
            var_145 = null;
         }
         if(var_668)
         {
            var_668.dispose();
            var_668 = null;
         }
         if(var_984 != null)
         {
            var_984.dispose();
            var_984 = null;
         }
         var_1110 = null;
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(var_816)
         {
            var_816.release(new IIDHabboLocalizationManager());
            var_816 = null;
         }
         if(var_320)
         {
            var_320.release(new IIDHabboCommunicationManager());
            var_320 = null;
         }
         if(var_815)
         {
            var_815.release(new IIDHabboConfigurationManager());
            var_815 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_816;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_89:
               if(var_64 != null)
               {
                  var_64.setRoomSessionStatus(true);
               }
               if(var_145 != null)
               {
                  var_145.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_108:
               if(var_64 != null)
               {
                  var_64.setRoomSessionStatus(false);
               }
               if(var_145 != null)
               {
                  var_145.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_64 != null)
         {
            var_64.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2312;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_64 != null)
         {
            var_64.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_668)
         {
            var_668 = new HotelMergeUI(this);
         }
         var_668.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_145 == null && _assetLibrary != null && _windowManager != null)
         {
            var_145 = new TutorialUI(this);
         }
         return var_145 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_64 == null && _assetLibrary != null && _windowManager != null)
         {
            var_64 = new HelpUI(this,_assetLibrary,_windowManager,var_816,_toolbar);
         }
         return var_64 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1422;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1422.reportedUserId = param1;
         var_1422.reportedUserName = param2;
         var_64.showUI(HabboHelpViewEnum.const_348);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_2221 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(_toolbar != null)
         {
            _toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_134,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_816 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_145 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_145.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_320 = IHabboCommunicationManager(param2);
         var_1110 = new IncomingMessages(this,var_320);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_64 != null)
         {
            var_64.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_64 != null)
         {
            var_64.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_320 != null && param1 != null)
         {
            var_320.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_984;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_64 != null)
         {
            var_64.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_815 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_145;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_83)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_54)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_668;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_89,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_108,onRoomSessionEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_83,onHabboToolbarEvent);
         _toolbar.events.addEventListener(HabboToolbarEvent.const_54,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_64 != null)
         {
            var_64.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_815 == null)
         {
            return param1;
         }
         return var_815.getKey(param1,param2,param3);
      }
   }
}
