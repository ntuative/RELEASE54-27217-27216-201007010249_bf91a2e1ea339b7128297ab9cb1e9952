package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.runtime.events.LibraryProgressEvent;
   import com.sulake.core.runtime.events.WarningEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.LibraryLoaderQueue;
   import com.sulake.core.utils.ZipLoader;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_139:uint = 3;
      
      private static const const_1131:String = "zip-libraries";
      
      private static const const_1132:String = "library";
      
      private static const const_1134:String = "library";
      
      private static const const_1130:String = "asset-libraries";
      
      private static const const_1127:String = "library";
      
      private static const const_1133:String = "service-libraries";
      
      private static const const_1128:String = "library";
      
      private static const const_1129:String = "component-libraries";
       
      
      private var var_768:IEventDispatcher;
      
      private var var_920:Profiler;
      
      private var var_284:uint;
      
      private var var_532:Array;
      
      private var var_283:LibraryLoaderQueue;
      
      private var var_634:Array;
      
      private var var_767:ProfilerViewer;
      
      private var var_243:uint;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         var_694 = (param2 & 0) == Core.CORE_SETUP_DEBUG;
         var_532 = new Array();
         var_634 = new Array();
         var_225 = param1;
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_139)
         {
            var_532.push(new Array());
            var_634.push(0);
            _loc3_++;
         }
         var_284 = getTimer();
         attachComponent(this,[new IIDCore()]);
         switch(param2 & 0)
         {
            case Core.const_1343:
               debug("Core; using simple frame update handler");
               var_225.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_936:
               debug("Core; using complex frame update handler");
               var_225.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1267:
               debug("Core; using profiler frame update handler");
               var_225.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_920 = new Profiler(this);
               attachComponent(var_920,[new IIDProfiler()]);
               var_767 = new ProfilerViewer();
               var_225.addChild(var_767);
               break;
            case Core.CORE_SETUP_DEBUG:
               debug("Core; using debug frame update handler");
               var_225.addEventListener(Event.ENTER_FRAME,debugFrameUpdateHandler);
         }
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\" HTTP status " + param1.status + ": " + _loc2_.getLastErrorMessage(),true,Core.const_1394);
         if(!_isDisposed)
         {
            updateLoadingProcess(param1);
         }
      }
      
      override public function removeUpdateReceiver(param1:IUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_139)
         {
            _loc3_ = var_532[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_[_loc2_] = null;
               return;
            }
            _loc4_++;
         }
      }
      
      public function getNumberOfFilesLoaded() : uint
      {
         return var_243 - getNumberOfFilesPending();
      }
      
      private function updateLoadingProgress(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         if(var_768)
         {
            _loc2_ = param1.target as LibraryLoader;
            var_768.dispatchEvent(new LibraryProgressEvent(_loc2_.url,param1.bytesLoaded,param1.bytesTotal,_loc2_.elapsedTime));
         }
      }
      
      private function debugFrameUpdateHandler(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc2_:uint = getTimer();
         var _loc3_:uint = _loc2_ - var_284;
         var_284 = _loc2_;
         _loc4_ = 0;
         while(_loc4_ < CoreComponent.const_139)
         {
            var_634[_loc4_] = 0;
            _loc5_ = var_532[_loc4_];
            _loc8_ = 0;
            _loc7_ = uint(_loc5_.length);
            while(_loc8_ != _loc7_)
            {
               _loc6_ = IUpdateReceiver(_loc5_[_loc8_]);
               if(_loc6_ == null || _loc6_.disposed)
               {
                  _loc5_.splice(_loc8_,1);
                  _loc7_--;
               }
               else
               {
                  _loc6_.update(_loc3_);
                  _loc8_++;
               }
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_1023;
      }
      
      public function readConfigDocument(param1:XML, param2:IEventDispatcher = null) : void
      {
         var node:XML = null;
         var list:XMLList = null;
         var item:XML = null;
         var url:String = null;
         var loader:LibraryLoader = null;
         var config:XML = param1;
         var loadingEventDelegate:IEventDispatcher = param2;
         var context:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain,null);
         debug("Parsing config document");
         var_768 = loadingEventDelegate;
         if(var_283 == null)
         {
            var_283 = new LibraryLoaderQueue(var_694);
         }
         try
         {
            node = config.child(const_1131)[0];
            if(node != null)
            {
               list = node.child(const_1132);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new ZipLoader(context,true,var_694);
                  assets.loadFromFile(loader,true);
                  loader.load(new URLRequest(url));
                  var_283.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
                  ++var_243;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse zip libraries from config xml!",true,Core.const_167,e);
         }
         try
         {
            node = config.child(const_1130)[0];
            if(node != null)
            {
               list = node.child(const_1127);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,var_694);
                  assets.loadFromFile(loader,true);
                  loader.load(new URLRequest(url));
                  var_283.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
                  ++var_243;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse asset libraries from config xml!",true,Core.const_167,e);
         }
         try
         {
            node = config.child(const_1133)[0];
            if(node != null)
            {
               list = node.child(const_1128);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,var_694);
                  loader.load(new URLRequest(url));
                  var_283.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
                  ++var_243;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse interfaces from config xml!",true,Core.const_167,e);
         }
         try
         {
            node = config.child(const_1129)[0];
            if(node != null)
            {
               list = node.child(const_1134);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,var_694);
                  loader.load(new URLRequest(url));
                  var_283.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
                  ++var_243;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse components from config xml!",true,Core.const_167,e);
         }
         if(!disposed)
         {
            updateLoadingProcess();
         }
      }
      
      override public function registerUpdateReceiver(param1:IUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_139 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_532[param2] as Array;
         _loc3_.push(param1);
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_284;
         var_284 = msCurrentTime;
         var_920.start();
         criticality = 0;
         while(criticality < CoreComponent.const_139)
         {
            var_634[criticality] = 0;
            receivers = var_532[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_920.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_920.stop();
         var_767.refresh(var_920);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_225.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_225.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_225.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_225 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_139)
            {
               _loc2_ = var_532[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_283 != null)
            {
               var_283.dispose();
               var_283 = null;
            }
            if(var_767 != null)
            {
               var_767.dispose();
               var_767 = null;
            }
            super.dispose();
         }
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param4)
         {
            ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
         }
         ErrorReportStorage.setParameter("error_cat",String(param3));
         ErrorReportStorage.setParameter("error_desc",param1);
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      private function finalizeLoadingEventDelegate() : void
      {
         if(var_768)
         {
            var_768.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      public function warning(param1:String) : void
      {
         var_2499 = param1;
         if(events == null)
         {
            Logger.log("Failed to dispatch an error because events was null. Message: " + param1);
         }
         else
         {
            events.dispatchEvent(new WarningEvent(Component.COMPONENT_EVENT_WARNING,param1));
         }
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_284;
         var maxTimePerFrame:uint = 1000 / var_225.stage.frameRate;
         var_284 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_139)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_634[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_634[criticality] = 0;
               receivers = var_532[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = IUpdateReceiver(receivers[index]);
                  if(receiver == null || receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        trace(e.getStackTrace());
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2436;
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_284;
         var_284 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_139)
         {
            var_634[criticality] = 0;
            receivers = var_532[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     trace(e.getStackTrace());
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      public function getNumberOfFilesPending() : uint
      {
         return var_283.length;
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               _loc2_.dispose();
               if(var_768)
               {
                  var_768.dispatchEvent(new LibraryProgressEvent(_loc2_.url,var_243 - 0,var_243,_loc2_.elapsedTime));
               }
            }
         }
         if(false)
         {
            finalizeLoadingEventDelegate();
            debug("All libraries loaded, Core is now running");
         }
      }
   }
}
