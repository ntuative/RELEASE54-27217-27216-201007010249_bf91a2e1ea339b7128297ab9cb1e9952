package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_77:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_260:Vector3d = null;
      
      private var var_2293:int = 0;
      
      private var var_2294:String = null;
      
      private var _category:int = 0;
      
      private var var_2292:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2292 = param3;
         var_77 = new Vector3d();
         var_77.assign(param4);
         var_260 = new Vector3d();
         var_260.assign(param5);
         var_2293 = param6;
         var_2294 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_77;
      }
      
      public function get typeId() : int
      {
         return var_2293;
      }
      
      public function get dir() : Vector3d
      {
         return var_260;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2294;
      }
      
      public function get operation() : String
      {
         return var_2292;
      }
      
      public function dispose() : void
      {
         var_77 = null;
         var_260 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
