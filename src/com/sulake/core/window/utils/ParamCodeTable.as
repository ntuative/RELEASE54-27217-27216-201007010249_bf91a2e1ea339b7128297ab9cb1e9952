package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_137;
         param1["bound_to_parent_rect"] = const_87;
         param1["child_window"] = const_878;
         param1["embedded_controller"] = const_336;
         param1["resize_to_accommodate_children"] = const_60;
         param1["input_event_processor"] = const_44;
         param1["internal_event_handling"] = const_618;
         param1["mouse_dragging_target"] = const_231;
         param1["mouse_dragging_trigger"] = const_341;
         param1["mouse_scaling_target"] = const_276;
         param1["mouse_scaling_trigger"] = const_454;
         param1["horizontal_mouse_scaling_trigger"] = const_227;
         param1["vertical_mouse_scaling_trigger"] = const_232;
         param1["observe_parent_input_events"] = const_914;
         param1["optimize_region_to_layout_size"] = const_508;
         param1["parent_window"] = const_852;
         param1["relative_horizontal_scale_center"] = const_165;
         param1["relative_horizontal_scale_fixed"] = const_111;
         param1["relative_horizontal_scale_move"] = const_346;
         param1["relative_horizontal_scale_strech"] = const_269;
         param1["relative_scale_center"] = const_1008;
         param1["relative_scale_fixed"] = const_654;
         param1["relative_scale_move"] = const_859;
         param1["relative_scale_strech"] = const_863;
         param1["relative_vertical_scale_center"] = const_179;
         param1["relative_vertical_scale_fixed"] = const_116;
         param1["relative_vertical_scale_move"] = const_311;
         param1["relative_vertical_scale_strech"] = const_290;
         param1["on_resize_align_left"] = const_642;
         param1["on_resize_align_right"] = const_381;
         param1["on_resize_align_center"] = const_402;
         param1["on_resize_align_top"] = const_708;
         param1["on_resize_align_bottom"] = const_425;
         param1["on_resize_align_middle"] = const_458;
         param1["on_accommodate_align_left"] = const_987;
         param1["on_accommodate_align_right"] = const_479;
         param1["on_accommodate_align_center"] = const_564;
         param1["on_accommodate_align_top"] = const_906;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_688;
         param1["route_input_events_to_parent"] = const_471;
         param1["use_parent_graphic_context"] = const_29;
         param1["draggable_with_mouse"] = const_1058;
         param1["scalable_with_mouse"] = const_988;
         param1["reflect_horizontal_resize_to_parent"] = const_461;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_293;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
