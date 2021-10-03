package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.events.warnings.AvatarWalkWarpingWarningEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_790:int = 500;
      
      private static const const_788:Number = 1.5;
      
      private static const const_789:int = 28;
      
      private static const const_791:int = 29;
       
      
      private var var_624:int = 0;
      
      private var var_1085:int = 0;
      
      private var var_743:int = 0;
      
      private var var_1309:int = 0;
      
      private var var_520:int = 0;
      
      private var var_519:int = 0;
      
      private var var_1086:int = 0;
      
      private var var_1084:int = 0;
      
      private var var_374:Vector3d = null;
      
      private var var_1087:int = 0;
      
      private var var_896:int = 0;
      
      private var var_1310:int = 0;
      
      private var _selected:Boolean = false;
      
      public function AvatarLogic()
      {
         super();
         var_1310 = getTimer() + getBlinkInterval();
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(var_1087 > 0)
         {
            if(param1 > var_1087)
            {
               param2.setNumber(RoomObjectVariableEnum.const_228,0);
               var_1087 = 0;
               var_520 = 0;
               var_624 = 0;
            }
            else if(var_624 == 0 && var_520 == 0)
            {
               var_520 = param1 + getTalkingPauseInterval();
               var_624 = var_520 + getTalkingPauseLength();
            }
            else if(var_520 > 0 && param1 > var_520)
            {
               param2.setNumber(RoomObjectVariableEnum.const_228,0);
               var_520 = 0;
            }
            else if(var_624 > 0 && param1 > var_624)
            {
               param2.setNumber(RoomObjectVariableEnum.const_228,1);
               var_624 = 0;
            }
         }
         if(var_743 > 0 && param1 > var_743)
         {
            param2.setNumber(RoomObjectVariableEnum.const_197,0);
            var_743 = 0;
         }
         if(var_1085 > 0 && param1 > var_1085)
         {
            param2.setNumber(RoomObjectVariableEnum.const_266,0);
            var_1085 = 0;
         }
         if(var_1086 > 0 && param1 > var_1086)
         {
            param2.setNumber(RoomObjectVariableEnum.const_1020,0);
            var_1086 = 0;
         }
         if(var_896 > 0)
         {
            if(param1 > var_896)
            {
               param2.setNumber(RoomObjectVariableEnum.const_470,0);
               var_896 = 0;
            }
            else if((var_896 - param1) % 10000 < 1000)
            {
               param2.setNumber(RoomObjectVariableEnum.const_325,1);
            }
            else
            {
               param2.setNumber(RoomObjectVariableEnum.const_325,0);
            }
         }
         if(param1 > var_1310)
         {
            param2.setNumber(RoomObjectVariableEnum.const_612,1);
            var_1310 = param1 + getBlinkInterval();
            var_1084 = param1 + getBlinkLength();
         }
         if(var_1084 > 0 && param1 > var_1084)
         {
            param2.setNumber(RoomObjectVariableEnum.const_612,0);
            var_1084 = 0;
         }
         if(var_519 > 0 && param1 > var_519)
         {
            param2.setNumber(RoomObjectVariableEnum.const_378,var_1309);
            var_519 = 0;
         }
      }
      
      private function updateEffect(param1:int, param2:IRoomObjectModelController) : void
      {
         if(param1 == const_789)
         {
            var_519 = getTimer() + const_790;
            var_1309 = const_791;
         }
         else if(param2.getNumber(RoomObjectVariableEnum.const_378) == const_791)
         {
            var_519 = getTimer() + const_790;
            var_1309 = param1;
            param1 = const_789;
         }
         else
         {
            var_519 = 0;
         }
         param2.setNumber(RoomObjectVariableEnum.const_378,param1);
      }
      
      private function getBlinkInterval() : int
      {
         return 4500 + Math.random() * 1000;
      }
      
      private function getBlinkLength() : int
      {
         return 50 + Math.random() * 200;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectMoveUpdateMessage;
            if(_loc3_ != null && targetIsWarping(_loc3_.realTargetLoc))
            {
               Logger.log("Target warp warning!");
               _loc4_ = new AvatarWalkWarpingWarningEvent();
               eventDispatcher.dispatchEvent(_loc4_);
            }
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_398,_loc5_.postureType);
            _loc2_.setString(RoomObjectVariableEnum.const_767,_loc5_.parameter);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_228,1);
            var_1087 = getTimer() + _loc6_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarTypingUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarTypingUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1025,Number(_loc7_.isTyping));
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_347,_loc8_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarGestureUpdateMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarGestureUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_266,_loc9_.gesture);
            var_1085 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarWaveUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarWaveUpdateMessage;
            if(_loc10_.isWaving)
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_197,1);
               var_743 = getTimer() + 0;
            }
            else
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_197,0);
               var_743 = 0;
            }
            return;
         }
         if(param1 is RoomObjectAvatarDanceUpdateMessage)
         {
            _loc11_ = param1 as RoomObjectAvatarDanceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1003,_loc11_.danceStyle);
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc12_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_474,Number(_loc12_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarEffectUpdateMessage)
         {
            _loc13_ = param1 as RoomObjectAvatarEffectUpdateMessage;
            _loc14_ = _loc13_.effect;
            updateEffect(_loc14_,_loc2_);
            return;
         }
         if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
         {
            _loc15_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_470,_loc15_.itemType);
            var_896 = getTimer() + 100000;
            return;
         }
         if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
         {
            _loc16_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_325,_loc16_.itemType);
            return;
         }
         if(param1 is RoomObjectAvatarSignUpdateMessage)
         {
            _loc17_ = param1 as RoomObjectAvatarSignUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1020,_loc17_.signType);
            var_1086 = getTimer() + 5000;
            return;
         }
         if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
         {
            _loc18_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_754,_loc18_.rawData);
            _loc2_.setNumber(RoomObjectVariableEnum.const_1381,Number(_loc18_.isAdmin));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc19_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc20_ = _loc2_.getString(RoomObjectVariableEnum.const_157);
            _loc21_ = _loc19_.figure;
            _loc22_ = _loc19_.gender;
            if(_loc20_ != null && _loc20_.indexOf(".bds-") != -1)
            {
               _loc21_ += _loc20_.substr(_loc20_.indexOf(".bds-"));
            }
            _loc2_.setString(RoomObjectVariableEnum.const_157,_loc21_);
            _loc2_.setString(RoomObjectVariableEnum.const_999,_loc22_);
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc23_ = param1 as RoomObjectAvatarSelectedMessage;
            _selected = _loc23_.selected;
            var_374 = null;
            return;
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(var_374 == null || var_374.x != _loc2_.x || var_374.y != _loc2_.y || var_374.z != _loc2_.z)
               {
                  if(var_374 == null)
                  {
                     var_374 = new Vector3d();
                  }
                  var_374.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_393,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            updateActions(param1,object.getModelController());
         }
      }
      
      private function getTalkingPauseInterval() : int
      {
         return 100 + Math.random() * 200;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_427,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         var_374 = null;
      }
      
      private function getTalkingPauseLength() : int
      {
         return 75 + Math.random() * 75;
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc3_ = object.getId();
               _loc4_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc5_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_214,_loc3_,_loc4_);
                  eventDispatcher.dispatchEvent(_loc5_);
               }
         }
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_788 || Math.abs(_loc2_.y - param1.y) > const_788)
         {
            return true;
         }
         return false;
      }
   }
}
