-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.

COMPONENT DiodeAndInductiveLoad 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_1(
         source = Source_Sine,  -- Non default value.
         Amp = 220,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 0.02,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   ELECTRICAL.Diode Diode_1(
         Ids = 1e-06,
         Vt = 0.04,
         R = 100000000)
   ELECTRICAL.Ground Ground_1
   ELECTRICAL.Ground Ground_2
   ELECTRICAL.IdealTransformer IdealTransformer_1(
         n = 0.25  -- Non default value.
   )
   ELECTRICAL.InductivePhasor Ind_component_2(
         Real_component = 1,
         Imaginary_component = 1,
         Frequency = 50)
   ELECTRICAL.VoltageSignal VoltageSignal_1

   CONNECT AnalogSource_1.s_out TO VoltageSignal_1.s_in

   CONNECT Diode_1.e_n TO Ind_component_2.pos

   CONNECT IdealTransformer_1.e_p2 TO Diode_1.e_p

   CONNECT IdealTransformer_1.e_n1 TO Ground_1.e_p

   CONNECT IdealTransformer_1.e_n2 TO Ground_2.e_p

   CONNECT Ind_component_2.neg TO Ground_2.e_p

   CONNECT VoltageSignal_1.e_n TO Ground_1.e_p

   CONNECT VoltageSignal_1.e_p TO IdealTransformer_1.e_p1



END COMPONENT