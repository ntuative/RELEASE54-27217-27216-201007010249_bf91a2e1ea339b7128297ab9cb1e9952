package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1291:BigInteger;
      
      private var var_602:BigInteger;
      
      private var var_1556:BigInteger;
      
      private var var_1557:BigInteger;
      
      private var var_1903:BigInteger;
      
      private var var_1749:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1291 = param1;
         var_1556 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1903.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1557 = new BigInteger();
         var_1557.fromRadix(param1,param2);
         var_1903 = var_1557.modPow(var_602,var_1291);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1749.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1291.toString() + ",generator: " + var_1556.toString() + ",secret: " + param1);
         var_602 = new BigInteger();
         var_602.fromRadix(param1,param2);
         var_1749 = var_1556.modPow(var_602,var_1291);
         return true;
      }
   }
}
