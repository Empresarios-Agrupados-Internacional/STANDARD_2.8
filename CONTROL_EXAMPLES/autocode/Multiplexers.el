-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE CONTROL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Multiplexers 
	
PORTS


DECLS
		REAL Period		 UNITS "s"
		REAL Period_2	 UNITS "s"
		INTEGER i = 1
		INTEGER j = 1
		INTEGER start_time = 0
		
	
TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_1(
         source = Source_Constant,
         Amp = 1,
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 1,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_2(
         source = Source_Constant,
         Amp = 2,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 2,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_3(
         source = Source_Constant,
         Amp = 3,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 3,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_4(
         source = Source_Constant,
         Amp = 4,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 4,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_5(
         source = Source_Constant,
         Amp = 5,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 5,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Output_signal(
         source = Source_Sine,  -- Non default value.
         Amp = 1,
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = Period,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Output_signal_2(
         source = Source_Sine,  -- Non default value.
         Amp = 1,
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = Period_2,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_1(
         source = Source_Constant,
         Amp = 4,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 1,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_1_1(
         source = Source_Constant,
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
         n_out = 1   ) Signal_1_2(
         source = Source_Constant,
         Amp = 6,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 3,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_1_3(
         source = Source_Constant,
         Amp = 7,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 4,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_1_4(
         source = Source_Constant,
         Amp = 8,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 5,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_1_5(
         source = Source_Constant,
         Amp = 9,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 6,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_1_6(
         source = Source_Constant,
         Amp = 10,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 7,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal_1_7(
         source = Source_Constant,
         Amp = 11,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 8,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.Mux(
         n_in = 5,   -- Non default value.
         dim_in = 1   ) Mux
   CONTROL.Mux8(
         dim_in = 1   ) Mux8_1

   CONNECT AnalogSource_1.s_out TO Mux.s_in[3]

   CONNECT AnalogSource_2.s_out TO Mux.s_in[2]

   CONNECT AnalogSource_3.s_out TO Mux.s_in[1]

   CONNECT AnalogSource_4.s_out TO Mux.s_in[4]

   CONNECT AnalogSource_5.s_out TO Mux.s_in[5]

   CONNECT Signal_1.s_out TO Mux8_1.s_in[1]

   CONNECT Signal_1_1.s_out TO Mux8_1.s_in[2]

   CONNECT Signal_1_2.s_out TO Mux8_1.s_in[3]

   CONNECT Signal_1_3.s_out TO Mux8_1.s_in[4]

   CONNECT Signal_1_4.s_out TO Mux8_1.s_in[5]

   CONNECT Signal_1_5.s_out TO Mux8_1.s_in[6]

   CONNECT Signal_1_6.s_out TO Mux8_1.s_in[7]

   CONNECT Signal_1_7.s_out TO Mux8_1.s_in[8]



DISCRETE
		WHEN TIME >= start_time THEN 
			Period = Mux8_1.s_out.signal[i]
			Period_2 = Mux.s_out.signal[j]
			i = i + 1
			j = j + 1
			start_time = start_time + 5
		END WHEN
		
		WHEN i > 8 THEN 
			i = 1
		END WHEN
		
		WHEN j > 5 THEN 
			j = 1
		END WHEN
		
	CONTINUOUS
		Output_signal.Period = Period
		Output_signal_2.Period = Period_2
		
END COMPONENT