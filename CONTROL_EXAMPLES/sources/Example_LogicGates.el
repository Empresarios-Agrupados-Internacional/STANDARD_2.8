-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.

COMPONENT Example_LogicGates 

PORTS



TOPOLOGY
   CONTROL.Gate_AND AND_1
   CONTROL.Gate_NOT NOT_1
   CONTROL.Gate_OR OR_1
   CONTROL.Gate_XOR XOR
   CONTROL.SourcebPulse(
         n_out = 1   ) SourcebPulse_1(
         Period = 10,
         pulseWidth = 5,
         Tstart = 5)
   CONTROL.SourcebPulse(
         n_out = 1   ) SourcebPulse_2(
         Period = 5,  -- Non default value.
         pulseWidth = 2.5,  -- Non default value.
         Tstart = 2.5  -- Non default value.
   )

   CONNECT SourcebPulse_1.s_out TO AND_1.s_in_1

   CONNECT SourcebPulse_1.s_out TO OR_1.s_in_1

   CONNECT SourcebPulse_1.s_out TO XOR.s_in_1

   CONNECT SourcebPulse_2.s_out TO AND_1.s_in_2

   CONNECT SourcebPulse_2.s_out TO NOT_1.s_in

   CONNECT SourcebPulse_2.s_out TO OR_1.s_in_2

   CONNECT SourcebPulse_2.s_out TO XOR.s_in_2



END COMPONENT