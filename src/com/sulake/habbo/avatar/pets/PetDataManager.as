package com.sulake.habbo.avatar.pets
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.AvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class PetDataManager implements IPetDataManager
   {
       
      
      private var var_766:Array;
      
      private var var_263:Array;
      
      private var var_1115:Array;
      
      private var _assets:AssetLibraryCollection;
      
      private var var_1114:Array;
      
      private var var_142:AvatarRenderManager;
      
      private var var_428:Map;
      
      public function PetDataManager(param1:AssetLibraryCollection, param2:AvatarRenderManager)
      {
         super();
         var_428 = new Map();
         _assets = param1;
         var_766 = [];
         var_142 = param2;
         var_263 = [];
         var_1114 = [];
         var_1115 = [];
         init();
      }
      
      public function get species() : Map
      {
         return var_428;
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc1_:Array = _assets.getAssetsByName("petData");
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.content as XML;
               _loc4_ = int(_loc3_.@species);
               if(var_428.getValue(_loc4_) == null)
               {
                  var_428.add(_loc4_,new PetData(_loc3_));
               }
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         _assets = null;
         var_142 = null;
         var_766 = null;
         var_428 = null;
         if(var_263 != null)
         {
            for each(_loc1_ in var_263)
            {
               _loc1_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,onLoaderComplete);
               _loc1_ = null;
            }
         }
         var_263 = null;
         var_1114 = null;
         var_1115 = null;
      }
      
      public function assetsReady(param1:int, param2:String, param3:IPetDataListener = null) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc4_:* = [];
         switch(param1)
         {
            case 0:
               _loc4_.push("h_dog.swf");
               break;
            case 1:
               _loc4_.push("h_dog.swf");
               _loc4_.push("h_cat.swf");
               break;
            case 2:
               _loc4_.push("h_dog.swf");
               _loc4_.push("h_croco.swf");
               break;
            case 3:
               _loc4_.push("h_terrier.swf");
               break;
            case 4:
               _loc4_.push("h_bear.swf");
               break;
            case 5:
               _loc4_.push("h_pig.swf");
         }
         if(param2 == AvatarScaleType.SMALL)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc4_[_loc5_] = "s" + _loc4_[_loc5_];
               _loc5_++;
            }
         }
         _loc4_.push("pets_palettes.swf");
         var _loc7_:Boolean = true;
         for each(_loc6_ in _loc4_)
         {
            if(var_1115.indexOf(_loc6_) == -1)
            {
               _loc7_ = false;
               if(var_1114.indexOf(_loc6_) == -1)
               {
                  _loc8_ = new LibraryLoader();
                  _assets.loadFromFile(_loc8_);
                  _loc8_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,onLoaderComplete);
                  _loc8_.load(new URLRequest(_loc6_));
                  var_263.push(_loc8_);
                  var_1114.push(_loc6_);
                  if(param3 != null && var_766.indexOf(param3) == -1)
                  {
                     var_766.push(param3);
                  }
               }
            }
         }
         return _loc7_;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,onLoaderComplete);
         var_1115.push(_loc2_.url);
         var _loc3_:int = var_263.indexOf(_loc2_);
         if(_loc3_ >= 0)
         {
            var_263.splice(_loc3_,1);
         }
         if(false)
         {
            var_142.resetPetData();
            notifyListeners();
         }
      }
      
      public function getPetData(param1:int, param2:IPetDataListener = null) : IPetData
      {
         var _loc3_:IPetData = var_428.getValue(param1) as IPetData;
         if(_loc3_ == null)
         {
            assetsReady(param1,AvatarScaleType.const_47,param2);
         }
         return _loc3_;
      }
      
      private function notifyListeners() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_766.pop() as IPetDataListener;
            if(_loc1_ != null)
            {
               _loc1_.petDataReady();
            }
         }
      }
      
      public function createPetFigureString(param1:int, param2:int, param3:uint) : String
      {
         var _loc4_:PetData = var_428.getValue(param1);
         if(_loc4_ == null)
         {
            Logger.log("Could not find Pet Data: " + param1);
            return "";
         }
         var _loc5_:Breed = _loc4_.findBreed(param2);
         var _loc6_:PetColor = _loc4_.findColor(param3);
         if(_loc5_ == null)
         {
            return "";
         }
         if(_loc6_ == null)
         {
            return _loc5_.avatarFigureString;
         }
         var _loc7_:Array = _loc5_.avatarFigureString.split(".");
         return _loc7_.join(_loc6_.figurePartPaletteColorId + ".");
      }
      
      public function populateFigureData(param1:XML) : void
      {
         var targetSets:Array = null;
         var targetPalette:XML = null;
         var speciesKeys:Array = null;
         var key:int = 0;
         var petData:PetData = null;
         var petColorData:PetColor = null;
         var breed:Breed = null;
         var colorValue:String = null;
         var color:XML = null;
         var colorId:int = 0;
         var avatarFigureString:String = null;
         var targetSetName:String = null;
         var figureTargetSet:XML = null;
         var figurePart:XML = null;
         var setId:int = 0;
         var figureSet:XML = null;
         var figureData:XML = param1;
         targetSets = ["pbd","phd","ptl"];
         targetPalette = figureData.colors.palette.(@id == "1")[0];
         speciesKeys = var_428.getKeys();
         for each(key in speciesKeys)
         {
            petData = var_428.getValue(key);
            if(petData != null)
            {
               for each(petColorData in petData.colors)
               {
                  colorValue = petColorData.rgb.toString(16);
                  color = targetPalette.color.(text() == colorValue)[0];
                  if(color == null)
                  {
                     colorId = targetPalette.children().length() + 1;
                     color = <color id="{colorId}" index="{colorId}" club="0" selectable="1">{colorValue}</color>;
                     targetPalette.appendChild(color);
                  }
                  petColorData.figurePartPaletteColorId = parseInt(color.@id);
               }
               for each(breed in petData.breeds)
               {
                  avatarFigureString = "";
                  for each(targetSetName in targetSets)
                  {
                     figureTargetSet = figureData.sets.settype.(@type == targetSetName)[0];
                     if(figureTargetSet == null)
                     {
                        Logger.log("Could not find Figure Target Set for populating Pet Data: " + targetSetName);
                     }
                     else
                     {
                        figurePart = figureTargetSet.HabboWindowManagerCom_habbo_window_layout_dropmenu_item_xml.part.(@id == petData.species).(hasOwnProperty("palettemapid") && @palettemapid == breed.patternId)[0];
                        if(figurePart == null)
                        {
                        }
                        setId = figureTargetSet.children().length() + 1;
                        figureSet = <set id="{setId}" gender="U" club="0" colorable="1" selectable="1"/>;
                        figurePart = <part id="{petData.species}" breed="{breed.id}" type="{targetSetName}" colorable="1" colorindex="1" index="1"/>;
                        if(breed.patternId >= 0)
                        {
                           figurePart.@palettemapid = breed.patternId;
                        }
                        figureSet.appendChild(figurePart);
                        figureTargetSet.appendChild(figureSet);
                        avatarFigureString += targetSetName + "-" + setId + "-" + ".";
                     }
                  }
                  breed.avatarFigureString = avatarFigureString;
               }
            }
         }
      }
   }
}
