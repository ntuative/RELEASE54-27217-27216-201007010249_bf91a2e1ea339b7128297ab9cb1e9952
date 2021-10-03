package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_758;
         param1["bitmap"] = const_550;
         param1["border"] = const_594;
         param1["border_notify"] = const_1387;
         param1["button"] = const_426;
         param1["button_thick"] = const_750;
         param1["button_icon"] = const_1254;
         param1["button_group_left"] = const_655;
         param1["button_group_center"] = const_755;
         param1["button_group_right"] = const_673;
         param1["canvas"] = const_549;
         param1["checkbox"] = const_717;
         param1["closebutton"] = const_930;
         param1["container"] = const_304;
         param1["container_button"] = const_735;
         param1["display_object_wrapper"] = const_543;
         param1["dropmenu"] = const_480;
         param1["dropmenu_item"] = const_476;
         param1["frame"] = const_356;
         param1["frame_notify"] = const_1237;
         param1["header"] = const_626;
         param1["icon"] = const_942;
         param1["itemgrid"] = const_925;
         param1["itemgrid_horizontal"] = const_463;
         param1["itemgrid_vertical"] = const_562;
         param1["itemlist"] = const_1006;
         param1["itemlist_horizontal"] = const_309;
         param1["itemlist_vertical"] = const_326;
         param1["maximizebox"] = const_1319;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1376;
         param1["submenu"] = const_1048;
         param1["minimizebox"] = const_1191;
         param1["notify"] = const_1226;
         param1["null"] = const_744;
         param1["password"] = const_746;
         param1["radiobutton"] = const_661;
         param1["region"] = const_397;
         param1["restorebox"] = const_1443;
         param1["scaler"] = const_697;
         param1["scaler_horizontal"] = const_1277;
         param1["scaler_vertical"] = const_1322;
         param1["scrollbar_horizontal"] = const_422;
         param1["scrollbar_vertical"] = const_538;
         param1["scrollbar_slider_button_up"] = const_934;
         param1["scrollbar_slider_button_down"] = const_920;
         param1["scrollbar_slider_button_left"] = const_833;
         param1["scrollbar_slider_button_right"] = const_886;
         param1["scrollbar_slider_bar_horizontal"] = const_962;
         param1["scrollbar_slider_bar_vertical"] = const_932;
         param1["scrollbar_slider_track_horizontal"] = const_901;
         param1["scrollbar_slider_track_vertical"] = const_957;
         param1["scrollable_itemlist"] = const_1307;
         param1["scrollable_itemlist_vertical"] = const_428;
         param1["scrollable_itemlist_horizontal"] = const_915;
         param1["selector"] = const_636;
         param1["selector_list"] = const_742;
         param1["submenu"] = const_1048;
         param1["tab_button"] = const_643;
         param1["tab_container_button"] = const_971;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_892;
         param1["tab_selector"] = const_531;
         param1["text"] = const_561;
         param1["input"] = const_651;
         param1["toolbar"] = const_1364;
         param1["tooltip"] = const_358;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
