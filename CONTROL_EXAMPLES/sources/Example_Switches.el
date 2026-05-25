-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE CONTROL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.

COMPONENT Example_Switches 

PORTS



TOPOLOGY
   CONTROL.LogicalSwitch(
         n = 1   ) LogicalSwitch_1
   CONTROL.SourceChirp(
         n_out = 1   ) SourceChirp(
         Amp = 1,
         frec_o = 0.1,
         Phase = 0,
         Tstart = 0,
         Offset = 0,
         frec_slope = 0.1)
   CONTROL.SourceExp(
         n_out = 1   ) SourceExp(
         outMax = 1,
         riseTime = 5,  -- Non default value.
         riseTimeConst = 5,  -- Non default value.
         fallTimeConst = 5,  -- Non default value.
         Tstart = 0.5,
         Offset = 0)
   CONTROL.SourcebPulse(
         n_out = 1   ) SourcebPulse(
         Period = 4,  -- Non default value.
         pulseWidth = 2,  -- Non default value.
         Tstart = 1  -- Non default value.
   )
   CONTROL.SourcebSampleTrigger(
         n_out = 1   ) SourcebSampleTrigger_1(
         Period = 1,  -- Non default value.
         Tstart = 1)
   CONTROL.SourcebStep(
         n_out = 1   ) SourcebStep_1(
         Tstart = 1  -- Non default value.
   )
   CONTROL.Switch(
         n = 1   ) Switch_1
   CONTROL.Timer_TP Timer_TP(
         PT = 2)

   CONNECT LogicalSwitch_1.s_out TO Timer_TP.s_in

   CONNECT SourceChirp.s_out TO Switch_1.s_in[1]

   CONNECT SourceExp.s_out TO Switch_1.s_in[2]

   CONNECT SourcebPulse.s_out TO LogicalSwitch_1.s_in[2]

   CONNECT SourcebPulse.s_out TO Switch_1.s_b_in

   CONNECT SourcebSampleTrigger_1.s_out TO LogicalSwitch_1.s_in[3]

   CONNECT SourcebStep_1.s_out TO LogicalSwitch_1.s_in[1]



END COMPONENT