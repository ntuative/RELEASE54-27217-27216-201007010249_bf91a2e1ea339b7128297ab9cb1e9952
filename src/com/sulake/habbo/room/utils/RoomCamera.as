package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_367:Number = 0.5;
      
      private static const const_798:int = 3;
      
      private static const const_1121:Number = 1;
       
      
      private var var_1991:Boolean = false;
      
      private var var_1993:Boolean = false;
      
      private var var_1093:int = 0;
      
      private var var_279:Vector3d = null;
      
      private var var_1999:int = 0;
      
      private var var_1998:int = 0;
      
      private var var_1997:Boolean = false;
      
      private var var_1992:int = -2;
      
      private var var_1995:Boolean = false;
      
      private var var_1990:int = 0;
      
      private var var_1994:int = -1;
      
      private var var_423:Vector3d = null;
      
      private var var_1996:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1999;
      }
      
      public function get targetId() : int
      {
         return var_1994;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1990 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1999 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1991 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1994 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1993 = param1;
      }
      
      public function dispose() : void
      {
         var_423 = null;
         var_279 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_423 == null)
         {
            var_423 = new Vector3d();
         }
         var_423.assign(param1);
         var_1093 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1992;
      }
      
      public function get screenHt() : int
      {
         return var_1996;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1998 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_279;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1996 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1990;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1991;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1993;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_423 != null && var_279 != null)
         {
            ++var_1093;
            _loc2_ = Vector3d.dif(var_423,var_279);
            if(_loc2_.length <= const_367)
            {
               var_279 = var_423;
               var_423 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_367 * (const_798 + 1))
               {
                  _loc2_.mul(const_367);
               }
               else if(var_1093 <= const_798)
               {
                  _loc2_.mul(const_367);
               }
               else
               {
                  _loc2_.mul(const_1121);
               }
               var_279 = Vector3d.sum(var_279,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1997 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1998;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1995 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1992 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_279 != null)
         {
            return;
         }
         var_279 = new Vector3d();
         var_279.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1997;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1995;
      }
   }
}
