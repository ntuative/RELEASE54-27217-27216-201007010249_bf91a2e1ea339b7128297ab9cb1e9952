package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_208:String = "TUI_NAME_VIEW";
      
      public static const const_86:String = "TUI_MAIN_VIEW";
      
      public static const const_302:String = "TUI_CLOTHES_VIEW";
      
      public static const const_439:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_1190:Boolean = false;
      
      private var var_1189:Boolean = false;
      
      private var _window:IWindowContainer;
      
      private var var_1651:int = 0;
      
      private var _main:HabboHelp;
      
      private var var_1191:Boolean = false;
      
      private var var_1480:Boolean = false;
      
      private var var_1652:int = 0;
      
      private var var_35:ITutorialUIView;
      
      public function TutorialUI(param1:HabboHelp)
      {
         super();
         _main = param1;
         _main.events.addEventListener(HabboHelpTutorialEvent.const_390,onTaskDoneEvent);
         _main.events.addEventListener(HabboHelpTutorialEvent.const_431,onTaskDoneEvent);
         _main.events.addEventListener(HabboHelpTutorialEvent.const_448,onTaskDoneEvent);
      }
      
      public function prepareForTutorial() : void
      {
         if(_main == null || true)
         {
            return;
         }
         _main.hideUI();
         _main.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_107));
      }
      
      public function get help() : HabboHelp
      {
         return _main;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1190;
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var_1191 = param1;
         var_1189 = param2;
         var_1190 = param3;
         if(var_35 == null || var_35.id == const_86)
         {
            prepareForTutorial();
            showView(const_86);
         }
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            disposeView();
         }
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!_main || true || true)
         {
            return;
         }
         var_1189 = true;
         _main.localization.registerParameter("help.tutorial.name.changed","name",name);
         _main.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
         if(var_35 != null && (var_35.id == const_208 || var_35.id == const_86))
         {
            showView(const_86);
         }
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(hasTasksDone)
         {
            if(_main)
            {
               _main.removeTutorialUI();
            }
            return;
         }
         var _loc3_:Boolean = false;
         if(_window == null)
         {
            _window = buildXmlWindow("tutorial_frame") as IWindowContainer;
            if(_window == null)
            {
               return;
            }
            _window.procedure = windowProcedure;
            _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            var_1652 = 0 - _loc2_.width;
            var_1651 = _window.height;
            _loc3_ = true;
         }
         _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(var_35 != null)
         {
            var_35.dispose();
         }
         switch(param1)
         {
            case const_86:
               var_35 = new TutorialMainView(_loc2_,this);
               break;
            case const_208:
               var_35 = new TutorialNameChangeView(this);
               _loc2_.addListItem(var_35.view);
               prepareForTutorial();
               break;
            case const_302:
               var_35 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_439:
               var_35 = new TutorialCallGuideBotView(_loc2_,this);
         }
         _window.height = _loc2_.height + var_1651;
         _window.width = _loc2_.width + var_1652;
         if(_loc3_)
         {
            if(_window == null)
            {
               return;
            }
            _window.x = _window.context.getDesktopWindow().width / 2 - 0;
            _window.y = 0;
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return _main.assets;
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode != ChangeUserNameResultMessageEvent.var_688)
         {
            showView(const_208);
            (var_35 as TutorialNameChangeView).setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return _main.localization;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1191;
      }
      
      public function dispose() : void
      {
         disposeView();
         if(_main)
         {
            _main.events.removeEventListener(HabboHelpTutorialEvent.const_390,onTaskDoneEvent);
            _main.events.removeEventListener(HabboHelpTutorialEvent.const_431,onTaskDoneEvent);
            _main.events.removeEventListener(HabboHelpTutorialEvent.const_448,onTaskDoneEvent);
            _main = null;
         }
      }
      
      public function changeName(param1:String) : void
      {
         disposeWindow();
         _main.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_390:
               var_1190 = true;
               if(var_35 != null && var_35.id == const_439)
               {
                  showView(const_86);
               }
               break;
            case HabboHelpTutorialEvent.const_431:
               if(var_35 != null && var_35.id == const_302)
               {
                  var_1480 = true;
                  disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_448:
               if(var_1480)
               {
                  var_1480 = false;
                  showView(const_86);
               }
         }
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1189;
      }
      
      public function get myName() : String
      {
         return _main.ownUserName;
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         showView(const_208);
         var _loc3_:TutorialNameChangeView = var_35 as TutorialNameChangeView;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_688)
         {
            _loc3_.checkedName = _loc2_.name;
         }
         else
         {
            _loc3_.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      private function disposeView() : void
      {
         if(var_35 != null)
         {
            var_35.dispose();
            var_35 = null;
         }
         disposeWindow();
      }
      
      public function onUserChanged() : void
      {
         var_1191 = true;
         if(var_35 != null && (var_35.id == const_302 || var_35.id == const_86))
         {
            showView(const_86);
         }
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(_main == null || true)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(_main.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || true)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(_main.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function checkName(param1:String) : void
      {
         disposeWindow();
         _main.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  disposeView();
               }
         }
      }
      
      public function get hasTasksDone() : Boolean
      {
         return var_1191 && var_1189 && var_1190;
      }
   }
}
