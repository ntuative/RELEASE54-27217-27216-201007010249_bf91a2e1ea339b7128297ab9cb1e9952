package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1079:SoundChannel = null;
      
      private var var_893:Boolean;
      
      private var var_1080:Sound = null;
      
      private var var_734:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1080 = param1;
         var_1080.addEventListener(Event.COMPLETE,onComplete);
         var_734 = 1;
         var_893 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_893;
      }
      
      public function stop() : Boolean
      {
         var_1079.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_893 = false;
         var_1079 = var_1080.play(0);
         this.volume = var_734;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_734;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1079.position;
      }
      
      public function get length() : Number
      {
         return var_1080.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_734 = param1;
         if(var_1079 != null)
         {
            var_1079.soundTransform = new SoundTransform(var_734);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_893 = true;
      }
   }
}
