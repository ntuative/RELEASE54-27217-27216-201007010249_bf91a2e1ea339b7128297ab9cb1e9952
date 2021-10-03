package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.GetEventsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.navigator.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_717:IWindowContainer;
      
      private var var_1056:ITextWindow;
      
      private var var_179:RoomSettingsCtrl;
      
      private var var_1269:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_199:Timer;
      
      private var var_1854:IWindowContainer;
      
      private var var_1270:ITextWindow;
      
      private var var_359:IWindowContainer;
      
      private var var_1856:ITextWindow;
      
      private var var_867:IWindowContainer;
      
      private var var_198:UserDefinedRoomEventsCtrl;
      
      private var var_1543:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_722:ITextWindow;
      
      private var var_1544:IWindowContainer;
      
      private var var_1271:IWindowContainer;
      
      private var var_869:ITextWindow;
      
      private var var_1055:ITextFieldWindow;
      
      private var var_269:IWindowContainer;
      
      private var var_868:ITextWindow;
      
      private var var_1542:IButtonWindow;
      
      private var var_1054:ITextWindow;
      
      private var var_2446:int;
      
      private var var_1274:IContainerButtonWindow;
      
      private var var_870:IWindowContainer;
      
      private var var_1275:ITextWindow;
      
      private var var_1273:IContainerButtonWindow;
      
      private var var_1541:ITextWindow;
      
      private var var_917:TagRenderer;
      
      private var var_1540:IButtonWindow;
      
      private var var_1780:ITextWindow;
      
      private var var_309:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_718:ITextWindow;
      
      private var var_229:RoomThumbnailCtrl;
      
      private var var_1272:IContainerButtonWindow;
      
      private var var_1855:IWindowContainer;
      
      private var var_270:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_309 = new RoomEventViewCtrl(_navigator);
         var_179 = new RoomSettingsCtrl(_navigator,this,true);
         var_229 = new RoomThumbnailCtrl(_navigator);
         var_198 = new UserDefinedRoomEventsCtrl(_navigator);
         var_917 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_179);
         var_199 = new Timer(6000,1);
         var_199.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_179.active = true;
         this.var_309.active = false;
         this.var_229.active = false;
         this.var_198.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1543.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1540.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1544.visible = Util.hasVisibleChildren(var_1544);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_722.text = param1.roomName;
         var_722.height = NaN;
         _ownerName.text = param1.ownerName;
         var_869.text = param1.description;
         var_917.refreshTags(var_359,param1.tags);
         var_869.visible = false;
         if(param1.description != "")
         {
            var_869.height = NaN;
            var_869.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_359,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_359,"thumb_down",_loc3_,onThumbDown,0);
         var_1856.visible = _loc3_;
         var_868.visible = !_loc3_;
         var_1541.visible = !_loc3_;
         var_1541.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_359,"home",param2,null,0);
         _navigator.refreshButton(var_359,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_359,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_722.y,0);
         var_359.visible = true;
         var_359.height = Util.getLowestPoint(var_359);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function startUserDefinedRoomEventsEdit() : void
      {
         this.var_199.reset();
         this.var_179.active = false;
         this.var_309.active = false;
         this.var_229.active = false;
         this.var_198.active = true;
         _navigator.send(new GetEventsMessageComposer());
      }
      
      public function dispose() : void
      {
         if(var_199)
         {
            var_199.removeEventListener(TimerEvent.TIMER,hideInfo);
            var_199.reset();
            var_199 = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_419,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false || false)
         {
            return;
         }
         var_1542.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1269.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1272.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1274.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1273.visible = _navigator.data.canEditRoomSettings && param1;
         var_1271.visible = Util.hasVisibleChildren(var_1271);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_199.reset();
         this.var_309.active = false;
         this.var_179.active = false;
         this.var_229.active = false;
         this.var_198.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_199.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_199.reset();
         this.var_309.active = false;
         this.var_179.active = false;
         this.var_229.active = false;
         this.var_198.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_419,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_269);
         var_269.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == _navigator.data.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_179.refresh(var_269);
         this.var_229.refresh(var_269);
         this.var_198.refresh(var_269);
         Util.moveChildrenToColumn(var_269,["room_details","room_buttons"],0,2);
         var_269.height = Util.getLowestPoint(var_269);
         var_269.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1055.setSelection(0,var_1055.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_270);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_309.refresh(var_270);
         if(Util.hasVisibleChildren(var_270) && !(this.var_229.active || this.var_198.active))
         {
            Util.moveChildrenToColumn(var_270,["event_details","event_buttons"],0,2);
            var_270.height = Util.getLowestPoint(var_270);
            var_270.visible = true;
         }
         else
         {
            var_270.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_199.reset();
         this.var_309.active = true;
         this.var_179.active = false;
         this.var_229.active = false;
         this.var_198.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_199.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_1056.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1056.height = NaN;
         var_1270.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1270.height = NaN;
         Util.moveChildrenToColumn(var_717,["public_space_name","public_space_desc"],var_1056.y,0);
         var_717.visible = true;
         var_717.height = Math.max(86,Util.getLowestPoint(var_717));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function get userDefinedRoomEventsCtrl() : UserDefinedRoomEventsCtrl
      {
         return var_198;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","HabboRoomWidgetLib_room_queue") == "FurniturePartyBeamerVisualization";
         if(_loc1_ && true && true && true && true)
         {
            var_870.visible = true;
            var_1055.text = this.getEmbedData();
         }
         else
         {
            var_870.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_199.reset();
         this.var_179.load(param1);
         this.var_179.active = true;
         this.var_309.active = false;
         this.var_229.active = false;
         this.var_198.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_199.reset();
         this.var_179.active = false;
         this.var_309.active = false;
         this.var_229.active = true;
         this.var_198.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_65,false);
         _window.setParamFlag(HabboWindowParam.const_1391,true);
         _window.visible = false;
         var_269 = IWindowContainer(find("room_info"));
         var_359 = IWindowContainer(find("room_details"));
         var_717 = IWindowContainer(find("public_space_details"));
         var_1855 = IWindowContainer(find("owner_name_cont"));
         var_1854 = IWindowContainer(find("rating_cont"));
         var_1271 = IWindowContainer(find("room_buttons"));
         var_722 = ITextWindow(find("room_name"));
         var_1056 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_869 = ITextWindow(find("room_desc"));
         var_1270 = ITextWindow(find("public_space_desc"));
         var_1054 = ITextWindow(find("owner_caption"));
         var_868 = ITextWindow(find("rating_caption"));
         var_1856 = ITextWindow(find("rate_caption"));
         var_1541 = ITextWindow(find("rating_txt"));
         var_270 = IWindowContainer(find("event_info"));
         var_867 = IWindowContainer(find("event_details"));
         var_1544 = IWindowContainer(find("event_buttons"));
         var_1780 = ITextWindow(find("event_name"));
         var_718 = ITextWindow(find("event_desc"));
         var_1269 = IContainerButtonWindow(find("add_favourite_button"));
         var_1272 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1274 = IContainerButtonWindow(find("make_home_button"));
         var_1273 = IContainerButtonWindow(find("unmake_home_button"));
         var_1542 = IButtonWindow(find("room_settings_button"));
         var_1543 = IButtonWindow(find("create_event_button"));
         var_1540 = IButtonWindow(find("edit_event_button"));
         var_870 = IWindowContainer(find("embed_info"));
         var_1275 = ITextWindow(find("embed_info_txt"));
         var_1055 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1269,onAddFavouriteClick);
         Util.setProcDirectly(var_1272,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1542,onRoomSettingsClick);
         Util.setProcDirectly(var_1274,onMakeHomeClick);
         Util.setProcDirectly(var_1273,onUnmakeHomeClick);
         Util.setProcDirectly(var_1543,onEventSettingsClick);
         Util.setProcDirectly(var_1540,onEventSettingsClick);
         Util.setProcDirectly(var_1055,onEmbedSrcClick);
         _navigator.refreshButton(var_1269,"favourite",true,null,0);
         _navigator.refreshButton(var_1272,"favourite",true,null,0);
         _navigator.refreshButton(var_1274,"home",true,null,0);
         _navigator.refreshButton(var_1273,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_269,onHover);
         Util.setProcDirectly(var_270,onHover);
         var_1054.width = var_1054.textWidth;
         Util.moveChildrenToRow(var_1855,["owner_caption","owner_name"],var_1054.x,var_1054.y,3);
         var_868.width = var_868.textWidth;
         Util.moveChildrenToRow(var_1854,["rating_caption","rating_txt"],var_868.x,var_868.y,3);
         var_1275.height = NaN;
         Util.moveChildrenToColumn(var_870,["embed_info_txt","embed_src_txt"],var_1275.y,2);
         var_870.height = Util.getLowestPoint(var_870) + 5;
         var_2446 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1780.text = param1.eventName;
         var_718.text = param1.eventDescription;
         var_917.refreshTags(var_867,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_718.visible = false;
         if(param1.eventDescription != "")
         {
            var_718.height = NaN;
            var_718.y = Util.getLowestPoint(var_867) + 2;
            var_718.visible = true;
         }
         var_867.visible = true;
         var_867.height = Util.getLowestPoint(var_867);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1036,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
