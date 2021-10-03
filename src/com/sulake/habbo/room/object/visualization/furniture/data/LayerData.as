package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_417:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_452:int = 0;
      
      public static const const_1046:int = 2;
      
      public static const const_950:int = 1;
      
      public static const const_565:Boolean = false;
      
      public static const const_557:String = "";
      
      public static const const_375:int = 0;
      
      public static const const_382:int = 0;
      
      public static const const_485:int = 0;
       
      
      private var var_1843:int = 0;
      
      private var var_1809:String = "";
      
      private var var_1634:int = 0;
      
      private var var_1842:int = 0;
      
      private var var_1841:Number = 0;
      
      private var var_1839:int = 255;
      
      private var var_1840:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1843;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1634 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1841;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1842 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1843 = param1;
      }
      
      public function get tag() : String
      {
         return var_1809;
      }
      
      public function get alpha() : int
      {
         return var_1839;
      }
      
      public function get ink() : int
      {
         return var_1634;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1841 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1842;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1840 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1840;
      }
      
      public function set tag(param1:String) : void
      {
         var_1809 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1839 = param1;
      }
   }
}
