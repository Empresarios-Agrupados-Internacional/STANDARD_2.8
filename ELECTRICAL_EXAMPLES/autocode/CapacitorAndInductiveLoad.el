-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT CapacitorAndInductiveLoad 
// The objective of this exercise is to see the effect of how capacitors affect the circuit

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
   ELECTRICAL.Capacitor Capacitor_1(
         C = 2.3e-6  -- Non default value.
   )
   ELECTRICAL.Ground Ground_1
   ELECTRICAL.InductivePhasor Ind_component_1(
         Real_component = 10,  -- Non default value.
         Imaginary_component = 15,  -- Non default value.
         Frequency = 50)
   ELECTRICAL.InductivePhasor Ind_component_2(
         Real_component = 100,  -- Non default value.
         Imaginary_component = 100,  -- Non default value.
         Frequency = 50)
   ELECTRICAL.VoltageSignal VoltageSignal_1

   CONNECT AnalogSource_1.s_out TO VoltageSignal_1.s_in

   CONNECT Capacitor_1.e_n TO Ground_1.e_p

   CONNECT Capacitor_1.e_p TO Ind_component_2.pos

   CONNECT Ind_component_1.neg TO Capacitor_1.e_p

   CONNECT Ind_component_2.neg TO Ground_1.e_p

   CONNECT VoltageSignal_1.e_n TO Ground_1.e_p

   CONNECT VoltageSignal_1.e_p TO Ind_component_1.pos



END COMPONENT