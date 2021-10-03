package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_125:DisplayObject;
      
      private var var_2463:uint;
      
      private var var_921:IWindowToolTipAgentService;
      
      private var var_925:IWindowMouseScalingService;
      
      private var var_235:IWindowContext;
      
      private var var_924:IWindowFocusManagerService;
      
      private var var_923:IWindowMouseListenerService;
      
      private var var_922:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2463 = 0;
         var_125 = param2;
         var_235 = param1;
         var_922 = new WindowMouseDragger(param2);
         var_925 = new WindowMouseScaler(param2);
         var_923 = new WindowMouseListener(param2);
         var_924 = new FocusManager(param2);
         var_921 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_925;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_924;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_921;
      }
      
      public function dispose() : void
      {
         if(var_922 != null)
         {
            var_922.dispose();
            var_922 = null;
         }
         if(var_925 != null)
         {
            var_925.dispose();
            var_925 = null;
         }
         if(var_923 != null)
         {
            var_923.dispose();
            var_923 = null;
         }
         if(var_924 != null)
         {
            var_924.dispose();
            var_924 = null;
         }
         if(var_921 != null)
         {
            var_921.dispose();
            var_921 = null;
         }
         var_235 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_923;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_922;
      }
   }
}
