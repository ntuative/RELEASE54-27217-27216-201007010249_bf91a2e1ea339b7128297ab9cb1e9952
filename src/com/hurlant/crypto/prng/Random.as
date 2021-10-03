package com.hurlant.crypto.prng
{
   import com.hurlant.util.Memory;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.text.Font;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class Random
   {
       
      
      private var ready:Boolean = false;
      
      private var var_132:ByteArray;
      
      private var var_1923:Boolean = false;
      
      private var psize:int;
      
      private var state:IPRNG;
      
      private var var_53:int;
      
      public function Random(param1:Class = null)
      {
         var _loc2_:* = 0;
         super();
         if(param1 == null)
         {
            param1 = ARC4;
         }
         state = new param1() as IPRNG;
         psize = state.getPoolSize();
         var_132 = new ByteArray();
         var_53 = 0;
         while(var_53 < psize)
         {
            _loc2_ = uint(65536 * Math.random());
            var _loc3_:* = var_53++;
            var_132[_loc3_] = _loc2_ >>> 8;
            var _loc4_:*;
            var_132[_loc4_ = var_53++] = _loc2_ & 255;
         }
         var_53 = 0;
         seed();
      }
      
      public function autoSeed() : void
      {
         var _loc3_:* = null;
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeUnsignedInt(System.totalMemory);
         _loc1_.writeUTF(Capabilities.serverString);
         _loc1_.writeUnsignedInt(getTimer());
         _loc1_.writeUnsignedInt(new Date().getTime());
         var _loc2_:Array = Font.enumerateFonts(true);
         for each(_loc3_ in _loc2_)
         {
            _loc1_.writeUTF(_loc3_.fontName);
            _loc1_.writeUTF(_loc3_.fontStyle);
            _loc1_.writeUTF(_loc3_.fontType);
         }
         _loc1_.position = 0;
         while(_loc1_.bytesAvailable >= 4)
         {
            seed(_loc1_.readUnsignedInt());
         }
      }
      
      public function seed(param1:int = 0) : void
      {
         if(param1 == 0)
         {
            param1 = new Date().getTime();
         }
         var _loc2_:* = var_53++;
         var_132[_loc2_] = 0 ^ param1 & 255;
         var _loc3_:* = var_53++;
         var_132[_loc3_] = 0 ^ param1 >> 8 & 255;
         var _loc4_:*;
         var_132[_loc4_ = var_53++] = 0 ^ param1 >> 16 & 255;
         var _loc5_:*;
         var_132[_loc5_ = var_53++] = 0 ^ param1 >> 24 & 255;
         var_53 %= psize;
         var_1923 = true;
      }
      
      public function toString() : String
      {
         return "random-" + state.toString();
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < var_132.length)
         {
            var_132[_loc1_] = Math.random() * 256;
            _loc1_++;
         }
         var_132.length = 0;
         var_132 = null;
         state.dispose();
         state = null;
         psize = 0;
         var_53 = 0;
         Memory.gc();
      }
      
      public function nextBytes(param1:ByteArray, param2:int) : void
      {
         while(param2--)
         {
            param1.writeByte(nextByte());
         }
      }
      
      public function nextByte() : int
      {
         if(!ready)
         {
            if(!var_1923)
            {
               autoSeed();
            }
            state.init(var_132);
            var_132.length = 0;
            var_53 = 0;
            ready = true;
         }
         return state.next();
      }
   }
}
