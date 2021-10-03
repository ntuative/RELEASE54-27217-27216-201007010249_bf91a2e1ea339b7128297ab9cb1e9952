package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_700:int = 6;
      
      public static const const_203:int = 5;
      
      public static const const_712:int = 2;
      
      public static const const_345:int = 9;
      
      public static const const_303:int = 4;
      
      public static const const_261:int = 2;
      
      public static const const_671:int = 4;
      
      public static const const_195:int = 8;
      
      public static const const_647:int = 7;
      
      public static const const_282:int = 3;
      
      public static const const_355:int = 1;
      
      public static const const_230:int = 5;
      
      public static const const_385:int = 12;
      
      public static const const_333:int = 1;
      
      public static const const_716:int = 11;
      
      public static const const_675:int = 3;
      
      public static const const_1721:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_469:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_469 = new Array();
         var_469.push(new Tab(_navigator,const_355,const_385,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_391));
         var_469.push(new Tab(_navigator,const_261,const_333,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_391));
         var_469.push(new Tab(_navigator,const_303,const_716,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_921));
         var_469.push(new Tab(_navigator,const_282,const_203,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_391));
         var_469.push(new Tab(_navigator,const_230,const_195,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_601));
         setSelectedTab(const_355);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_469)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_469)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_469)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_303;
      }
      
      public function get tabs() : Array
      {
         return var_469;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
