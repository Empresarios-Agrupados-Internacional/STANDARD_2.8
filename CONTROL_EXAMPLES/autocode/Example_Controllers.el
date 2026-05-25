-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE CONTROL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Example_Controllers 

PORTS


DECLS
		REAL error_p
		REAL error_pi
		REAL error_pid
	
	
TOPOLOGY
   CONTROL.Addition(
         n = 1   ) Addition_1
   CONTROL.Addition(
         n = 1   ) Addition_2
   CONTROL.Addition(
         n = 1   ) Addition_3
   CONTROL.AnalogSource(
         n_out = 1   ) Set_point(
         source = Source_Step,  -- Non default value.
         Amp = 1,
         Tstart = 5,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Signal(
         source = Source_Pulse,  -- Non default value.
         Amp = 2,  -- Non default value.
         Tstart = 8,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 1000,  -- Non default value.
         pulseWidth = 1,  -- Non default value.
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.Cntrl_P(
         n = 1   ) P_Cntrl(
         k = 10,  -- Non default value.
         u_min = -100,  -- Non default value.
         u_max = 100  -- Non default value.
   )
   CONTROL.Cntrl_PI(
         n = 1   ) PI_Cntrl(
         k = 10,  -- Non default value.
         u_min = -100,  -- Non default value.
         u_max = 100,  -- Non default value.
         end_pos = end_I,
         Ti = 10,  -- Non default value.
         gamma = 0.1,
         beta = 1)
   CONTROL.Cntrl_PID(
         n = 1   ) PID_Cntrl(
         k = 10,  -- Non default value.
         u_min = -100,  -- Non default value.
         u_max = 100,  -- Non default value.
         end_pos = end_I,
         Ti = 10,  -- Non default value.
         gamma = 0.1,
         beta = 1,
         Td = 1,  -- Non default value.
         alpha = 0.1)
   CONTROL.TF_2ndOrder(
         n = 1   ) Plant(
         frec = 2,  -- Non default value.
         damp = 0.25,  -- Non default value.
         gain = 0.25,  -- Non default value.
         output_o = 0)
   CONTROL.TF_2ndOrder(
         n = 1   ) Plant_1(
         frec = 2,  -- Non default value.
         damp = 0.25,  -- Non default value.
         gain = 0.25,  -- Non default value.
         output_o = 0)
   CONTROL.TF_2ndOrder(
         n = 1   ) Plant_2(
         frec = 2,  -- Non default value.
         damp = 0.25,  -- Non default value.
         gain = 0.25,  -- Non default value.
         output_o = 0)

   CONNECT Addition_1.s_out TO Plant.s_in

   CONNECT Addition_2.s_out TO Plant_1.s_in

   CONNECT Addition_3.s_out TO Plant_2.s_in

   CONNECT Set_point.s_out TO P_Cntrl.s_set

   CONNECT Set_point.s_out TO PI_Cntrl.s_set

   CONNECT Set_point.s_out TO PID_Cntrl.s_set

   CONNECT Signal.s_out TO Addition_1.s_in_1

   CONNECT Signal.s_out TO Addition_2.s_in_1

   CONNECT Signal.s_out TO Addition_3.s_in_1

   CONNECT P_Cntrl.s_out TO Addition_3.s_in_2

   CONNECT PI_Cntrl.s_out TO Addition_1.s_in_2

   CONNECT PID_Cntrl.s_out TO Addition_2.s_in_2

   CONNECT Plant.s_out TO PI_Cntrl.s_var

   CONNECT Plant_1.s_out TO PID_Cntrl.s_var

   CONNECT Plant_2.s_out TO P_Cntrl.s_var



CONTINUOUS
		error_p = abs (Plant_2.s_out.signal[1] - Set_point.s_out.signal[1])
		error_pi = abs(Plant.s_out.signal[1] - Set_point.s_out.signal[1])
		error_pid = abs(Plant_1.s_out.signal[1] - Set_point.s_out.signal[1])
		
END COMPONENT