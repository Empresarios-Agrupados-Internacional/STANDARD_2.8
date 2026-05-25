-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL
USE ELECTRICAL



-- EL code of the schematic.

COMPONENT FilterExamples 

PORTS



TOPOLOGY
   CONTROL.Addition(
         n = 1   ) Addition_1
   CONTROL.Addition(
         n = 1   ) Addition_2
   CONTROL.AnalogSource(
         n_out = 1   ) High_freq(
         source = Source_Sine,  -- Non default value.
         Amp = 5,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 0.02,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Low_freq(
         source = Source_Sine,  -- Non default value.
         Amp = 5,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 2,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Mid_freq(
         source = Source_Sine,  -- Non default value.
         Amp = 5,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 0.2,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   ELECTRICAL.Capacitor Capacitor_1(
         C = 4e-06  -- Non default value.
   )
   ELECTRICAL.Capacitor Capacitor_1_1(
         C = 100e-9  -- Non default value.
   )
   ELECTRICAL.Capacitor Capacitor_1_1_1(
         C = 100e-9  -- Non default value.
   )
   ELECTRICAL.Capacitor Capacitor_1_2(
         C = 1e-9  -- Non default value.
   )
   ELECTRICAL.Ground Ground_1
   ELECTRICAL.Ground Ground_1_1
   ELECTRICAL.Ground Ground_1_1_1
   ELECTRICAL.Resistor Resistor_1(
         R = 1000  -- Non default value.
   )
   ELECTRICAL.Resistor Resistor_1_1(
         R = 3062224.4  -- Non default value.
   )
   ELECTRICAL.Resistor Resistor_1_1_1(
         R = 19904459  -- Non default value.
   )
   ELECTRICAL.Resistor Resistor_1_2(
         R = 530786  -- Non default value.
   )
   ELECTRICAL.Resistor Resistor_2(
         R = 1)
   ELECTRICAL.Resistor Resistor_2_1(
         R = 1)
   ELECTRICAL.Resistor Resistor_3(
         R = 1)
   ELECTRICAL.VoltageSignal VoltageSignal_1
   ELECTRICAL.VoltageSignal VoltageSignal_1_1
   ELECTRICAL.VoltageSignal VoltageSignal_1_1_1

   CONNECT Addition_1.s_out TO Addition_2.s_in_1

   CONNECT Addition_2.s_out TO VoltageSignal_1.s_in

   CONNECT Addition_2.s_out TO VoltageSignal_1_1.s_in

   CONNECT Addition_2.s_out TO VoltageSignal_1_1_1.s_in

   CONNECT High_freq.s_out TO Addition_1.s_in_2

   CONNECT Low_freq.s_out TO Addition_2.s_in_2

   CONNECT Mid_freq.s_out TO Addition_1.s_in_1

   CONNECT Capacitor_1.e_n TO Resistor_1.e_p

   CONNECT Capacitor_1.e_n TO Resistor_2.e_p

   CONNECT Capacitor_1_1.e_n TO Ground_1_1.e_p

   CONNECT Capacitor_1_1_1.e_n TO Ground_1_1_1.e_p

   CONNECT Capacitor_1_2.e_n TO Resistor_1_1_1.e_p

   CONNECT Capacitor_1_2.e_n TO Resistor_1_2.e_p

   CONNECT Resistor_1.e_n TO Ground_1.e_p

   CONNECT Resistor_1_1.e_n TO Capacitor_1_1.e_p

   CONNECT Resistor_1_1.e_n TO Resistor_2_1.e_p

   CONNECT Resistor_1_1_1.e_n TO Capacitor_1_1_1.e_p

   CONNECT Resistor_1_1_1.e_n TO Resistor_3.e_p

   CONNECT Resistor_1_2.e_n TO Ground_1_1_1.e_p

   CONNECT Resistor_2.e_n TO Ground_1.e_p

   CONNECT Resistor_2_1.e_n TO Ground_1_1.e_p

   CONNECT Resistor_3.e_n TO Ground_1_1_1.e_p

   CONNECT VoltageSignal_1.e_p TO Capacitor_1.e_p

   CONNECT VoltageSignal_1.e_n TO Ground_1.e_p

   CONNECT VoltageSignal_1_1.e_n TO Ground_1_1.e_p

   CONNECT VoltageSignal_1_1.e_p TO Resistor_1_1.e_p

   CONNECT VoltageSignal_1_1_1.e_p TO Capacitor_1_2.e_p

   CONNECT VoltageSignal_1_1_1.e_n TO Ground_1_1_1.e_p



INIT
		Capacitor_1.v = 0
		Capacitor_1_1.v = 0
END COMPONENT