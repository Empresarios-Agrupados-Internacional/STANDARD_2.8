-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Two_thrusters_edu 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) Input_T(
         source = Source_Constant,
         Amp = 105,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   THERMAL.BNode(
         n = 1   ) Space(
         Label = "Node Label",
         qi = 0)
   THERMAL.GR(
         n = 1   ) GR_1(
         REF = 0.00005  -- Non default value.
   )
   THERMAL_EXAMPLES.ThrusterSchematic ThrusterSchematic_1
   THERMAL_EXAMPLES.ThrusterSchematic ThrusterSchematic_2

   CONNECT Input_T.s_out TO Space.s_temperature

   CONNECT GR_1.tp_out TO ThrusterSchematic_2.tp_N13

   CONNECT ThrusterSchematic_1.Space TO Space.tp_in

   CONNECT ThrusterSchematic_1.tp_N13 TO GR_1.tp_in

   CONNECT ThrusterSchematic_2.Space TO Space.tp_in



END COMPONENT