package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_819:int = 2;
      
      private static const const_1106:Array = [0,0,0];
       
      
      private var var_800:int = 0;
      
      private var var_444:String;
      
      private var var_1810:int = 0;
      
      private const const_1470:int = 1;
      
      private var var_451:String = "";
      
      private var var_730:int = 0;
      
      private var var_1215:int = 0;
      
      private var var_1901:Boolean = false;
      
      private var var_416:Boolean;
      
      private const const_1105:int = 3;
      
      private var var_1148:int = 0;
      
      private var _effectType:int = 0;
      
      private var var_67:IAvatarImage = null;
      
      private var var_1555:String = "";
      
      private var var_1853:Boolean = false;
      
      private var var_563:Boolean = false;
      
      private var var_2242:Boolean = false;
      
      private var var_731:int = 0;
      
      private var _isDisposed:Boolean;
      
      private const const_1734:int = 3;
      
      private var var_1370:int = -1;
      
      private var var_1661:int = -1;
      
      private var var_1400:Boolean = false;
      
      private var var_2451:Array;
      
      private const const_1165:int = 0;
      
      private var var_1659:int = -1;
      
      private var var_1554:int = -1;
      
      private var var_1147:int = 0;
      
      private var var_1660:int = 0;
      
      private var var_652:String;
      
      private var var_962:Boolean = false;
      
      private var var_1401:Boolean = false;
      
      private var var_552:BitmapDataAsset;
      
      private const const_1484:int = 2;
      
      private var _visualizationData:AvatarVisualizationData = null;
      
      private var var_335:BitmapDataAsset;
      
      private var var_506:Map;
      
      public function AvatarVisualization()
      {
         var_2451 = new Array();
         super();
         var_506 = new Map();
         var_416 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         _visualizationData = param1 as AvatarVisualizationData;
         createSprites(const_1105);
         return true;
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            var_1401 = false;
         }
         if(var_451 == "sit" || var_451 == "lay")
         {
            var_1148 = param1 / 2;
         }
         else
         {
            var_1148 = 0;
         }
         var_1400 = false;
         var_962 = false;
         if(var_451 == "lay")
         {
            var_962 = true;
            _loc2_ = int(var_1555);
            if(_loc2_ < 0)
            {
               var_1400 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_170)
         {
            var_2242 = param1.getNumber(RoomObjectVariableEnum.const_228) > 0;
            var_1853 = param1.getNumber(RoomObjectVariableEnum.const_197) > 0;
            var_1901 = param1.getNumber(RoomObjectVariableEnum.const_474) > 0;
            var_1401 = param1.getNumber(RoomObjectVariableEnum.const_612) > 0;
            var_563 = param1.getNumber(RoomObjectVariableEnum.const_1025) > 0;
            var_1215 = param1.getNumber(RoomObjectVariableEnum.const_266);
            var_451 = param1.getString(RoomObjectVariableEnum.const_398);
            var_1555 = param1.getString(RoomObjectVariableEnum.const_767);
            var_1660 = param1.getNumber(RoomObjectVariableEnum.const_1003);
            _effectType = param1.getNumber(RoomObjectVariableEnum.const_378);
            var_1147 = param1.getNumber(RoomObjectVariableEnum.const_470);
            var_800 = param1.getNumber(RoomObjectVariableEnum.const_325);
            var_1554 = param1.getNumber(RoomObjectVariableEnum.const_347);
            if(var_1147 > 0 && param1.getNumber(RoomObjectVariableEnum.const_325) > 0)
            {
               var_800 = var_1147;
            }
            else
            {
               var_800 = 0;
            }
            validateActions(param2);
            var_652 = param1.getString(RoomObjectVariableEnum.const_999);
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_157);
            updateFigure(_loc3_);
            var_170 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_506)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_506.reset();
         var_67 = null;
         _loc2_ = getSprite(const_1165);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
         }
      }
      
      private function updateFigure(param1:String) : void
      {
         if(var_444 != param1)
         {
            var_444 = param1;
            resetImages();
         }
      }
      
      override public function dispose() : void
      {
         if(var_506 != null)
         {
            resetImages();
            var_506.dispose();
            var_506 = null;
         }
         _visualizationData = null;
         var_335 = null;
         var_552 = null;
         super.dispose();
         _isDisposed = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(const_1470);
         var_335 = null;
         if(var_451 == "mv" || var_451 == "std")
         {
            _loc2_.visible = true;
            if(var_335 == null || param1 != var_152)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  var_335 = var_67.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  var_335 = var_67.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(var_335 != null)
               {
                  _loc2_.asset = var_335.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            var_335 = null;
            _loc2_.visible = false;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = var_506.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = _visualizationData.getAvatar(var_444,param1,var_652,this);
            if(_loc3_ != null)
            {
               var_506.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         resetImages();
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var_552 = null;
         var _loc2_:IRoomObjectSprite = getSprite(const_1484);
         if(var_563)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               var_552 = _visualizationData.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               var_552 = _visualizationData.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(var_451 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(var_451 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(var_552 != null)
            {
               _loc2_.asset = var_552.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(_visualizationData == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:Number = param1.scale;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = updateModel(_loc4_,_loc5_);
         if(_loc9_ || _loc5_ != var_152 || var_67 == null)
         {
            if(_loc5_ != var_152)
            {
               _loc7_ = true;
               validateActions(_loc5_);
            }
            if(_loc7_ || var_67 == null)
            {
               var_67 = getAvatarImage(_loc5_);
               _loc6_ = true;
            }
            if(var_67 == null)
            {
               return;
            }
            updateShadow(_loc5_);
            updateTypingBubble(_loc5_);
            _loc8_ = updateObject(_loc3_,param1,true);
            updateActions(var_67);
            var_152 = _loc5_;
         }
         else
         {
            _loc8_ = updateObject(_loc3_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = var_416 || var_731 > 0;
         if(_loc10_)
         {
            var_731 = const_819;
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --var_731;
            --var_730;
            if(!(var_730 <= 0 || _loc7_ || _loc9_ || _loc6_))
            {
               return;
            }
            var_67.updateAnimationByFrames(1);
            var_730 = const_819;
            _loc13_ = var_67.getCanvasOffsets();
            if(_loc13_ == null || _loc13_.length < 3)
            {
               _loc13_ = const_1106;
            }
            _loc12_ = getSprite(const_1165);
            if(_loc12_ != null)
            {
               _loc16_ = var_67.getImage(AvatarSetType.const_30,false);
               if(_loc16_ != null)
               {
                  _loc12_.asset = _loc16_;
               }
               if(_loc12_.asset)
               {
                  _loc12_.offsetX = -1 * _loc5_ / 2 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + _loc5_ / 4 + _loc13_[1] + var_1148;
               }
               if(var_962)
               {
                  if(var_1400)
                  {
                     _loc12_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc12_.relativeDepth = -0.409 + _loc13_[2];
                  }
               }
               else
               {
                  _loc12_.relativeDepth = -0.01 + _loc13_[2];
               }
            }
            _loc12_ = getSprite(const_1484);
            if(_loc12_ != null && _loc12_.visible)
            {
               if(!var_962)
               {
                  _loc12_.relativeDepth = -0.02 + _loc13_[2];
               }
               else
               {
                  _loc12_.relativeDepth = -0.44 + _loc13_[2];
               }
            }
            var_416 = var_67.isAnimating();
            _loc14_ = const_1105;
            for each(_loc15_ in var_67.getSprites())
            {
               if(_loc15_.id == "avatar")
               {
                  _loc12_ = getSprite(const_1165);
                  _loc17_ = var_67.getLayerData(_loc15_);
                  _loc18_ = _loc15_.getDirectionOffsetX(var_67.getDirection());
                  _loc19_ = _loc15_.getDirectionOffsetY(var_67.getDirection());
                  if(_loc17_ != null)
                  {
                     _loc18_ += _loc17_.dx;
                     _loc19_ += _loc17_.dy;
                  }
                  if(_loc5_ < 48)
                  {
                     _loc18_ /= 2;
                     _loc19_ /= 2;
                  }
                  _loc12_.offsetX += _loc18_;
                  _loc12_.offsetY += _loc19_;
               }
               else
               {
                  _loc12_ = getSprite(_loc14_);
                  if(_loc12_ != null)
                  {
                     _loc12_.visible = true;
                     _loc20_ = var_67.getLayerData(_loc15_);
                     _loc21_ = 0;
                     _loc22_ = _loc15_.getDirectionOffsetX(var_67.getDirection());
                     _loc23_ = _loc15_.getDirectionOffsetY(var_67.getDirection());
                     _loc24_ = _loc15_.getDirectionOffsetZ(var_67.getDirection());
                     _loc25_ = 0;
                     if(_loc15_.hasDirections)
                     {
                        _loc25_ = var_67.getDirection();
                     }
                     if(_loc20_ != null)
                     {
                        _loc21_ = _loc20_.animationFrame;
                        _loc22_ += _loc20_.dx;
                        _loc23_ += _loc20_.dy;
                        _loc25_ += _loc20_.directionOffset;
                     }
                     if(_loc5_ < 48)
                     {
                        _loc22_ /= 2;
                        _loc23_ /= 2;
                     }
                     if(_loc25_ < 0)
                     {
                        _loc25_ += 8;
                     }
                     else if(_loc25_ > 7)
                     {
                        _loc25_ -= 8;
                     }
                     _loc26_ = var_67.getScale() + "_" + _loc15_.member + "_" + _loc25_ + "_" + _loc21_;
                     _loc27_ = var_67.getAsset(_loc26_);
                     if(_loc27_ == null)
                     {
                        continue;
                     }
                     _loc12_.asset = _loc27_.content as BitmapData;
                     _loc12_.offsetX = -_loc27_.offset.x - _loc5_ / 2 + _loc22_;
                     _loc12_.offsetY = -_loc27_.offset.y + _loc23_ + var_1148;
                     if(var_962)
                     {
                        _loc12_.relativeDepth = -0.409 - 0.1 * spriteCount * _loc24_;
                     }
                     else
                     {
                        _loc12_.relativeDepth = -0.01 - 0.1 * spriteCount * _loc24_;
                     }
                     if(_loc15_.ink == 33)
                     {
                        _loc12_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc12_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc14_++;
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_303 != param1.getUpdateID() || var_1370 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = var_1554;
            if(var_451 == "float")
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
            }
            _loc5_ = (_loc5_ % 360 + 360) % 360;
            if(_loc4_ != var_1659 || param3)
            {
               var_1659 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               var_67.setDirectionAngle(AvatarSetType.const_30,_loc4_);
            }
            if(_loc5_ != var_1661 || param3)
            {
               var_1661 = _loc5_;
               if(var_1661 != var_1659)
               {
                  _loc5_ -= 112.5;
                  _loc5_ = (_loc5_ + 360) % 360;
                  var_67.setDirectionAngle(AvatarSetType.const_40,_loc5_);
               }
            }
            var_303 = param1.getUpdateID();
            var_1370 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_387,var_451,var_1555);
         if(var_1215 > 0)
         {
            param1.appendAction(AvatarAction.const_277,AvatarAction.const_1204[var_1215]);
         }
         if(var_1660 > 0)
         {
            param1.appendAction(AvatarAction.const_1052,var_1660);
         }
         if(var_1810 > 0)
         {
            param1.appendAction(AvatarAction.const_968,var_1810);
         }
         if(var_1147 > 0)
         {
            param1.appendAction(AvatarAction.const_1055,var_1147);
         }
         if(var_800 > 0)
         {
            param1.appendAction(AvatarAction.const_976,var_800);
         }
         if(var_2242)
         {
            param1.appendAction(AvatarAction.const_283);
         }
         if(var_1901 || var_1401)
         {
            param1.appendAction(AvatarAction.const_501);
         }
         if(var_1853)
         {
            param1.appendAction(AvatarAction.const_252);
         }
         if(_effectType > 0)
         {
            param1.appendAction(AvatarAction.const_411,_effectType);
         }
         param1.endActionAppends();
         var_416 = param1.isAnimating();
         var _loc2_:int = const_1105;
         for each(_loc3_ in var_67.getSprites())
         {
            if(_loc3_.id != "avatarImage")
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
   }
}
