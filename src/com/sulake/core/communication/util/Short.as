package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_776:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_776 = new ByteArray();
         var_776.writeShort(param1);
         var_776.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_776.position = 0;
         if(false)
         {
            _loc1_ = var_776.readShort();
            var_776.position = 0;
         }
         return _loc1_;
      }
   }
}
