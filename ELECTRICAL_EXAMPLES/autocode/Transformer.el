-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Transformer 
// The objective of this exercise is to see how an ideal transformer affects the current and voltage on both sides.

PORTS



TOPOLOGY
   ELECTRICAL.VoltageSignal VoltageSignal_1
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
   ELECTRICAL.Ground Ground_1
   ELECTRICAL.IdealTransformer IdealTransformer_1(
         n = 0.25  -- Non default value.
   )
   ELECTRICAL.Ground Ground_2
   ELECTRICAL.InductivePhasor Ind_component_1(
         Real_component = 1,
         Imaginary_component = 1,
         Frequency = 50)
   ELECTRICAL.InductivePhasor Ind_component_2(
         Real_component = 1,
         Imaginary_component = 1,
         Frequency = 50)

   CONNECT AnalogSource_1.s_out TO VoltageSignal_1.s_in

   CONNECT VoltageSignal_1.e_n TO Ground_1.e_p

   CONNECT IdealTransformer_1.e_n1 TO Ground_1.e_p

   CONNECT IdealTransformer_1.e_n2 TO Ground_2.e_p

   CONNECT VoltageSignal_1.e_p TO Ind_component_1.pos

   CONNECT Ind_component_1.neg TO IdealTransformer_1.e_p1

   CONNECT IdealTransformer_1.e_p2 TO Ind_component_2.pos

   CONNECT Ind_component_2.neg TO Ground_2.e_p



END COMPONENT