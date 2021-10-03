package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1036:int = 0;
      
      private var var_1412:int = 0;
      
      private var var_1753:String = "";
      
      private var var_1037:int = 0;
      
      private var var_2289:String = "";
      
      private var var_2286:int = 0;
      
      private var var_1506:String = "";
      
      private var var_2177:int = 0;
      
      private var var_2287:int = 0;
      
      private var var_1757:String = "";
      
      private var var_2288:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2177 = param1;
         var_1757 = param2;
         var_1506 = param3;
         var_1753 = param4;
         var_2289 = param5;
         if(param6)
         {
            var_1412 = 1;
         }
         else
         {
            var_1412 = 0;
         }
         var_2286 = param7;
         var_2287 = param8;
         var_1037 = param9;
         var_2288 = param10;
         var_1036 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2177,var_1757,var_1506,var_1753,var_2289,var_1412,var_2286,var_2287,var_1037,var_2288,var_1036];
      }
      
      public function dispose() : void
      {
      }
   }
}
