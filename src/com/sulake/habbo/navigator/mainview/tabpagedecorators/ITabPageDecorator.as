package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
   import com.sulake.core.window.IWindowContainer;
   
   public interface ITabPageDecorator
   {
       
      
      function tabSelected() : void;
      
      function refreshCustomContent(param1:IWindowContainer) : void;
      
      function refreshFooter(param1:IWindowContainer) : void;
      
      function navigatorOpenedWhileInTab() : void;
   }
}
