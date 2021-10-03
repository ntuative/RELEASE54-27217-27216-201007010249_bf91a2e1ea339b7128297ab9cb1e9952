package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_22:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_689:String;
      
      protected var var_481:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_481 = param1;
         var_689 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_481;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            var_22 = DisplayAsset(param1).var_22;
            var_481 = DisplayAsset(param1).var_481;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function get url() : String
      {
         return var_689;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            var_22 = param1 as DisplayObject;
            if(var_22 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            var_22 = DisplayAsset(param1).var_22;
            var_481 = DisplayAsset(param1).var_481;
            if(var_22 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function get content() : Object
      {
         return var_22;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(false)
            {
               if(var_22.loaderInfo.loader != null)
               {
                  var_22.loaderInfo.loader.unload();
               }
            }
            var_22 = null;
            var_481 = null;
            _disposed = true;
            var_689 = null;
         }
      }
   }
}
