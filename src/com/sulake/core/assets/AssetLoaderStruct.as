package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_712:IAssetLoader;
      
      private var var_1459:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1459 = param1;
         var_712 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_712;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_712 != null)
            {
               if(true)
               {
                  var_712.dispose();
                  var_712 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1459;
      }
   }
}
