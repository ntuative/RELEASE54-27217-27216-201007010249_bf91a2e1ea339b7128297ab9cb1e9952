package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1258:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_865:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1258 = param1;
         var_865 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_865;
      }
      
      public function get identifier() : IID
      {
         return var_1258;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1258 = null;
            while(false)
            {
               var_865.pop();
            }
            var_865 = null;
         }
      }
   }
}
