package SystemVerilogCSP;
  typedef enum {idle, r_pend, s_pend, s12m_pend} ChannleStatus;
  typedef enum {P2PhaseBD, P4PhaseBD, P1of2, P1of4} ChannelProtocol;
  typedef enum {ZERO, ONE, NUTRAL} V1of2;
  typedef logic [3:0] Channel1Of4 ;
endpackage : SystemVerilogCSP