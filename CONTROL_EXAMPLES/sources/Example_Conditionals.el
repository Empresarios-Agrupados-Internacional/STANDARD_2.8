-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE CONTROL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.

COMPONENT Example_Conditionals 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_1(
         source = Source_Sine,  -- Non default value.
         Amp = 1,
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_2(
         source = Source_Sine,  -- Non default value.
         Amp = 1,
         Tstart = 2,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.EQ Equal
   CONTROL.GE Greater_or_equal
   CONTROL.GT Greater
   CONTROL.LE Less_or_equal
   CONTROL.LT Less

   CONNECT Signal_1.s_out TO Equal.s_in_1

   CONNECT Signal_1.s_out TO Greater_or_equal.s_in_1

   CONNECT Signal_1.s_out TO Greater.s_in_1

   CONNECT Signal_1.s_out TO Less_or_equal.s_in_1

   CONNECT Signal_1.s_out TO Less.s_in_1

   CONNECT Signal_2.s_out TO Equal.s_in_2

   CONNECT Signal_2.s_out TO Greater_or_equal.s_in_2

   CONNECT Signal_2.s_out TO Greater.s_in_2

   CONNECT Signal_2.s_out TO Less_or_equal.s_in_2

   CONNECT Signal_2.s_out TO Less.s_in_2



END COMPONENT