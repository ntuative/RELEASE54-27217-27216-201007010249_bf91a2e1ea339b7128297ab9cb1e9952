package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2327:int;
      
      private var var_2329:String;
      
      private var var_1705:IActionDefinition;
      
      private var var_2331:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2328:String;
      
      private var var_2330:String;
      
      private var var_2110:Boolean;
      
      private var var_2332:ColorTransform;
      
      private var var_2115:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2329 = param1;
         var_2328 = param2;
         var_2327 = param3;
         _color = param4;
         _frames = param5;
         var_1705 = param6;
         var_2110 = param7;
         var_2115 = param8;
         var_2330 = param9;
         var_2331 = param10;
         var_2332 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_2110;
      }
      
      public function get partType() : String
      {
         return var_2328;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2115;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2331;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2327;
      }
      
      public function get flippedPartType() : String
      {
         return var_2330;
      }
      
      public function get bodyPartId() : String
      {
         return var_2329;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1705;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2332;
      }
   }
}
