package com.sulake.habbo.avatar.structure.figure
{
   import com.sulake.core.utils.Map;
   import flash.utils.Dictionary;
   
   public class SetType implements ISetType
   {
       
      
      private var var_307:Map;
      
      private var var_600:Dictionary;
      
      private var var_1750:int;
      
      private var _type:String;
      
      public function SetType(param1:XML)
      {
         super();
         _type = String(param1.@type);
         var_1750 = parseInt(param1.@paletteid);
         var_600 = new Dictionary();
         var_600["F"] = new Dictionary();
         var_600["M"] = new Dictionary();
         var_600["F"][0] = Boolean(parseInt(param1.@mand_f_0));
         var_600["F"][1] = Boolean(parseInt(param1.@mand_f_1));
         var_600["M"][0] = Boolean(parseInt(param1.@mand_m_0));
         var_600["M"][1] = Boolean(parseInt(param1.@mand_m_1));
         var_307 = new Map();
         append(param1);
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function cleanUp(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         for each(_loc2_ in param1["HabboWindowManagerCom_habbo_window_layout_dropmenu_item_xml"])
         {
            _loc3_ = String(_loc2_.@id);
            _loc4_ = var_307.getValue(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.dispose();
               var_307.remove(_loc3_);
            }
         }
      }
      
      public function getPartSet(param1:int) : IFigurePartSet
      {
         return var_307.getValue(String(param1));
      }
      
      public function getDefaultPartSet(param1:String) : IFigurePartSet
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:Array = var_307.getKeys();
         var _loc3_:int = _loc2_.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc5_ = var_307.getValue(_loc4_);
            if(_loc5_ && _loc5_.clubLevel == 0 && _loc5_.gender == param1)
            {
               return _loc5_;
            }
            _loc3_--;
         }
         return null;
      }
      
      public function isMandatory(param1:String, param2:int) : Boolean
      {
         return var_600[param1.toUpperCase()][Math.min(param2,1)];
      }
      
      public function get paletteID() : int
      {
         return var_1750;
      }
      
      public function append(param1:XML) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1["HabboWindowManagerCom_habbo_window_layout_dropmenu_item_xml"])
         {
            var_307.add(String(_loc2_.@id),new FigurePartSet(_loc2_,_type));
         }
      }
      
      public function get partSets() : Map
      {
         return var_307;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_307.getValues())
         {
            _loc1_.dispose();
         }
         var_307.dispose();
         var_307 = null;
      }
   }
}
