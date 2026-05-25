-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.

COMPONENT Example_Timers 

PORTS



TOPOLOGY
   CONTROL.SourcebPulse(
         n_out = 1   ) SourcebPulse_1(
         Period = 7,  -- Non default value.
         pulseWidth = 3,  -- Non default value.
         Tstart = 1  -- Non default value.
   )
   CONTROL.Timer_TOFF Timer_TOFF_1(
         PT = 2)
   CONTROL.Timer_TON Timer_TON_1(
         PT = 2)
   CONTROL.Timer_TP Timer_TP_1(
         PT = 2)

   CONNECT SourcebPulse_1.s_out TO Timer_TOFF_1.s_in

   CONNECT SourcebPulse_1.s_out TO Timer_TON_1.s_in

   CONNECT SourcebPulse_1.s_out TO Timer_TP_1.s_in



END COMPONENT