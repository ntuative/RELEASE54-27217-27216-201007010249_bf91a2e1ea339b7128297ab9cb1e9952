package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_732:String = "Rectangle";
      
      public static const const_55:String = "Boolean";
      
      public static const const_763:String = "Number";
      
      public static const const_59:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_631:String = "Point";
      
      public static const const_919:String = "Array";
      
      public static const const_969:String = "uint";
      
      public static const const_491:String = "hex";
      
      public static const const_900:String = "Map";
       
      
      private var var_667:String;
      
      private var var_191:Object;
      
      private var var_2486:Boolean;
      
      private var _type:String;
      
      private var var_2307:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_667 = param1;
         var_191 = param2;
         _type = param3;
         var_2307 = param4;
         var_2486 = param3 == const_900 || param3 == const_919 || param3 == const_631 || param3 == const_732;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_491:
               return "0x" + uint(var_191).toString(16);
            case const_55:
               return Boolean(var_191) == true ? "FurniturePartyBeamerVisualization" : "HabboRoomWidgetLib_room_queue";
            case const_631:
               return "Point(" + Point(var_191).x + ", " + Point(var_191).y + ")";
            case const_732:
               return "Rectangle(" + Rectangle(var_191).x + ", " + Rectangle(var_191).y + ", " + Rectangle(var_191).width + ", " + Rectangle(var_191).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_900:
               _loc3_ = var_191 as Map;
               _loc1_ = "<var key=\"" + var_667 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_919:
               _loc4_ = var_191 as Array;
               _loc1_ = "<var key=\"" + var_667 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_631:
               _loc5_ = var_191 as Point;
               _loc1_ = "<var key=\"" + var_667 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_732:
               _loc6_ = var_191 as Rectangle;
               _loc1_ = "<var key=\"" + var_667 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_491:
               _loc1_ = "<var key=\"" + var_667 + "\" value=\"" + "0x" + uint(var_191).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_667 + "\" value=\"" + var_191 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_191;
      }
      
      public function get valid() : Boolean
      {
         return var_2307;
      }
      
      public function get key() : String
      {
         return var_667;
      }
   }
}
