package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.enum.RenderMode;
   import com.sulake.habbo.avatar.palette.PaletteManager;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.pets.PetDataManager;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   
   public class AvatarRenderManager extends Component implements IAvatarRenderManager
   {
       
      
      private var var_84:String;
      
      private var var_245:AvatarAssetDownloadManager;
      
      private var var_378:PetDataManager;
      
      private var var_430:Map;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_377:AssetAliasCollection;
      
      private var var_770:PaletteManager;
      
      private var var_30:CoreComponent;
      
      private var var_138:Map;
      
      public function AvatarRenderManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_138 = new Map();
         param2 |= const_866;
         super(param1,param2,param3);
         var_84 = RenderMode.const_1383;
         if(param1 is CoreComponent)
         {
            var_30 = CoreComponent(param1);
            var_30.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
         var_430 = new Map();
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
      }
      
      private function initAvatarAssetsDownloadManager() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:AvatarStructure = var_138.getValue(AvatarType.const_70) as AvatarStructure;
         if(_loc1_ != null && var_245 == null)
         {
            _loc2_ = _habboConfiguration.getKey("flash.dynamic.avatar.download.configuration","figuremap.xml");
            _loc3_ = _habboConfiguration.getKey("flash.dynamic.avatar.download.url","");
            var_245 = new AvatarAssetDownloadManager(var_30.assets,_loc2_,_loc3_,_loc1_);
            var_245.addEventListener(Event.COMPLETE,onAvatarAssetsDownloadManagerReady);
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var _loc2_:* = null;
         _loc2_ = var_138.getValue(AvatarType.const_70) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
         _loc2_ = var_138.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
      }
      
      private function onStructureInit(param1:Event = null) : void
      {
         var _loc2_:AvatarStructure = param1.target as AvatarStructure;
         if(_loc2_.avatarType == AvatarType.const_70)
         {
            initAvatarAssetsDownloadManager();
         }
      }
      
      public function downloadFigure(param1:AvatarFigureContainer, param2:IAvatarImageListener) : void
      {
         if(!var_245)
         {
            return;
         }
         var_245.loadFigureSetData(param1,param2);
      }
      
      private function init() : void
      {
         var _loc3_:* = null;
         var _loc1_:AssetLibraryCollection = var_30.assets as AssetLibraryCollection;
         var_377 = new AssetAliasCollection(_loc1_);
         var_378 = new PetDataManager(_loc1_,this);
         var_770 = new PaletteManager(_loc1_);
         var _loc2_:XML = _assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         var_378.populateFigureData(_loc2_);
         _loc3_ = new AvatarStructure(this,assets,_loc1_,AvatarType.const_70);
         _loc3_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_138.add(AvatarType.const_70,_loc3_);
         _loc3_ = new AvatarStructure(this,assets,_loc1_,AvatarType.PET);
         _loc3_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_138.add(AvatarType.PET,_loc3_);
      }
      
      public function isFigureReady(param1:AvatarFigureContainer) : Boolean
      {
         if(!var_245)
         {
            return false;
         }
         return var_245.isReady(param1);
      }
      
      public function createPetImage(param1:int, param2:int, param3:uint, param4:String, param5:IPetImageListener = null) : IAvatarImage
      {
         var _loc9_:* = null;
         var _loc6_:* = !var_378.assetsReady(param1,param4);
         var _loc7_:String = var_378.createPetFigureString(param1,param2,param3);
         var _loc8_:AvatarStructure = var_138.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc8_ == null)
         {
            return null;
         }
         if(!_loc6_)
         {
            return new PetImage(_loc8_,var_377,_loc7_,param4);
         }
         if(param5 != null)
         {
            _loc9_ = var_430[_loc7_];
            if(!_loc9_)
            {
               _loc9_ = [];
            }
            _loc9_.push(param5);
            var_430.add(_loc7_,_loc9_);
         }
         return new PlaceholderPetImage(_loc8_,var_377,_loc7_,param4,_assets);
      }
      
      public function resetPetData() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var_377.init();
         var_378.init();
         var_770.init();
         var _loc1_:XML = _assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         var_378.populateFigureData(_loc1_);
         var _loc2_:AvatarStructure = var_138.getValue(AvatarType.PET);
         _loc2_.init();
         _loc2_.resetPartOffsets();
         var _loc5_:Array = var_430.getKeys();
         for each(_loc6_ in _loc5_)
         {
            _loc4_ = var_430.getValue(_loc6_);
            if(_loc4_)
            {
               for each(_loc3_ in _loc4_)
               {
                  if(_loc3_ != null && !_loc3_.disposed)
                  {
                     _loc3_.petImageReady(_loc6_);
                  }
               }
            }
         }
         var_430.reset();
      }
      
      public function getFigureData(param1:String) : IFigureData
      {
         var _loc2_:AvatarStructure = var_138.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.figureData;
         }
         return null;
      }
      
      override public function dispose() : void
      {
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
         if(var_138 != null)
         {
            var_138.dispose();
            var_138 = null;
         }
         if(var_378 != null)
         {
            var_378.dispose();
            var_378 = null;
         }
         if(var_770 != null)
         {
            var_770.dispose();
            var_770 = null;
         }
         if(var_377 != null)
         {
            var_377.dispose();
            var_377 = null;
         }
         if(var_430)
         {
            var_430.dispose();
            var_430 = null;
         }
         if(var_245)
         {
            var_245.dispose();
            var_245 = null;
         }
         PartOffsetData.dispose();
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         init();
      }
      
      public function get petDataManager() : IPetDataManager
      {
         return var_378 as IPetDataManager;
      }
      
      public function get paletteManager() : PaletteManager
      {
         return var_770;
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
         }
      }
      
      public function injectFigureData(param1:String, param2:XML) : void
      {
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarType.const_70:
               _loc3_ = var_138.getValue(AvatarType.const_70) as AvatarStructure;
               break;
            case AvatarType.PET:
               _loc3_ = var_138.getValue(AvatarType.PET) as AvatarStructure;
               break;
            default:
               Logger.log("Uknown avatar type: " + param1);
         }
         if(_loc3_ != null)
         {
            _loc3_.injectFigureData(param2);
         }
      }
      
      public function get mode() : String
      {
         return var_84;
      }
      
      public function getMandatoryAvatarPartSetIds(param1:String, param2:int) : Array
      {
         var _loc3_:AvatarStructure = var_138.getValue(AvatarType.const_70) as AvatarStructure;
         return _loc3_.getMandatorySetTypeIds(param1,param2);
      }
      
      public function set mode(param1:String) : void
      {
         var_84 = param1;
         if(var_84 == RenderMode.const_1296)
         {
            init();
         }
         if(var_84 == RenderMode.const_1333)
         {
            init();
            onConfigurationInit(null);
            initAvatarAssetsDownloadManager();
         }
      }
      
      private function validateAvatarFigure(param1:AvatarFigureContainer, param2:String) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc3_:AvatarStructure = var_138.getValue(AvatarType.const_70) as AvatarStructure;
         var _loc6_:Array = _loc3_.getMandatorySetTypeIds(param2,2);
         if(_loc6_)
         {
            _loc7_ = _loc3_.figureData;
            for each(_loc8_ in _loc6_)
            {
               if(!param1.hasPartType(_loc8_))
               {
                  _loc9_ = _loc3_.getDefaultPartSet(_loc8_,param2);
                  if(_loc9_)
                  {
                     param1.updatePart(_loc8_,_loc9_.id,[0]);
                     _loc4_ = true;
                  }
               }
               else
               {
                  _loc10_ = _loc7_.getSetType(_loc8_);
                  _loc11_ = _loc10_.getPartSet(param1.getPartSetId(_loc8_));
                  if(!_loc11_)
                  {
                     _loc12_ = _loc3_.getDefaultPartSet(_loc8_,param2);
                     param1.updatePart(_loc8_,_loc12_.id,[0]);
                     _loc4_ = true;
                  }
               }
            }
         }
         return !_loc4_;
      }
      
      public function createFigureContainer(param1:String) : AvatarFigureContainer
      {
         return new AvatarFigureContainer(param1);
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         return var_377.getAssetByName(param1);
      }
      
      public function createPetImageFromFigure(param1:String, param2:String, param3:IPetImageListener = null) : IAvatarImage
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc4_:Array = param1.split(" ");
         if(_loc4_.length == 0)
         {
            return null;
         }
         var _loc5_:int = int(_loc4_[0]);
         var _loc6_:int = int(_loc4_[1]);
         var _loc7_:uint = parseInt(_loc4_[2],16);
         return createPetImage(_loc5_,_loc6_,_loc7_,param2,param3);
      }
      
      public function createAvatarImage(param1:String, param2:String, param3:String = null, param4:IAvatarImageListener = null) : IAvatarImage
      {
         var _loc5_:AvatarStructure = var_138.getValue(AvatarType.const_70) as AvatarStructure;
         if(_loc5_ == null)
         {
            return null;
         }
         if(!var_245)
         {
            return null;
         }
         var _loc6_:AvatarFigureContainer = new AvatarFigureContainer(param1);
         if(param3)
         {
            validateAvatarFigure(_loc6_,param3);
         }
         if(var_245.isReady(_loc6_))
         {
            return new AvatarImage(_loc5_,var_377,_loc6_,param2,param3);
         }
         var_245.loadFigureSetData(_loc6_,param4);
         return new PlaceholderAvatarImage(_loc5_,var_377,param2);
      }
      
      private function onAvatarAssetsDownloadManagerReady(param1:Event = null) : void
      {
         this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
      }
   }
}
