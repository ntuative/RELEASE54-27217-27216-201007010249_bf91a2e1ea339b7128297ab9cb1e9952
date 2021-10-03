package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1703:int = 5;
      
      public static const const_1675:int = 113;
      
      public static const const_1512:int = 29;
      
      public static const const_1686:int = 0;
      
      public static const const_1504:int = 102;
      
      public static const const_1537:int = 25;
      
      public static const const_1698:int = 20;
      
      public static const const_1657:int = 116;
      
      public static const const_1689:int = 114;
      
      public static const const_1726:int = 101;
      
      public static const const_1593:int = 108;
      
      public static const const_1705:int = 112;
      
      public static const const_1622:int = 100;
      
      public static const const_1634:int = 24;
      
      public static const const_1360:int = 10;
      
      public static const const_1722:int = 111;
      
      public static const const_1534:int = 23;
      
      public static const const_1508:int = 26;
      
      public static const const_1272:int = 2;
      
      public static const const_1719:int = 22;
      
      public static const const_1672:int = 17;
      
      public static const const_1575:int = 18;
      
      public static const const_1545:int = 3;
      
      public static const const_1563:int = 109;
      
      public static const const_1265:int = 1;
      
      public static const const_1550:int = 103;
      
      public static const const_1699:int = 11;
      
      public static const const_1710:int = 28;
      
      public static const const_1533:int = 104;
      
      public static const const_1632:int = 13;
      
      public static const const_1669:int = 107;
      
      public static const const_1723:int = 27;
      
      public static const const_1646:int = 118;
      
      public static const const_1518:int = 115;
      
      public static const const_1619:int = 16;
      
      public static const const_1720:int = 19;
      
      public static const const_1507:int = 4;
      
      public static const const_1637:int = 105;
      
      public static const const_1679:int = 117;
      
      public static const const_1667:int = 119;
      
      public static const const_1682:int = 106;
      
      public static const const_1497:int = 12;
      
      public static const const_1658:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1265:
            case const_1360:
               return "banned";
            case const_1272:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
