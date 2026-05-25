-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



COMPONENT Example_DriveTrain 

PORTS


DATA
	REAL startTime = 0.5 "Start time of step"

TOPOLOGY
   MECHANICAL.R_Inertia inertia3(
         I = 1,
         w0 = 100  -- Non default value.
   )
   MECHANICAL.R_Clutch clutch(
         phi_rel_i = 0,
         mue_pos = { { 0,1} ,{ 0.5,0.5} },
         peak = 1,  -- Non default value.
         cgeo = 1,
         fn_max = 160,  -- Non default value.
         w_rel_i = -10  -- Non default value.
   )
   CONTROL.AnalogSource(
         n_out = 1   ) sineSignal(
         source = Source_Sine,  -- Non default value.
         Amp = 200,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = PI / 50,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) startSignal(
         source = Source_Constant,
         Amp = -1,  -- Non default value.
         Tstart = startTime,  -- Non default value.
         Offset = 1,  -- Non default value.
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) torqueZero(
         source = Source_Constant,
         Amp = 0,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) clutchSignal(
         source = Source_Constant,
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
         n_out = 1   ) brakeSignal(
         source = Source_Step,  -- Non default value.
         Amp = 1,
         Tstart = startTime,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   MECHANICAL.R_Inertia inertia2(
         I = 0.05,  -- Non default value.
         w0 = 90  -- Non default value.
   )
   MECHANICAL.R_ActuatorTorque torque2
   MECHANICAL.R_ActuatorTorque torque1
   MECHANICAL.R_SpringDamper spring(
         phi_rel_i = 0,
         d = 1,  -- Non default value.
         c = 160,  -- Non default value.
         phi_rel0 = 0)
   MECHANICAL.R_Brake brake(
         mue_pos = { { 0,1} ,{ 0.5,0.5} },
         peak = 1,  -- Non default value.
         cgeo = 1,
         fn_max = 1600,  -- Non default value.
         w_i = 90  -- Non default value.
   )
   MECHANICAL.R_Inertia inertia1(
         I = 1,
         w0 = 90  -- Non default value.
   )
   CONTROL.Product(
         n = 1   ) productSignal

   CONNECT spring.m_out TO brake.m_in

   CONNECT brake.m_out TO inertia1.m_in

   CONNECT inertia3.m_out TO clutch.m_in

   CONNECT clutch.m_out TO inertia2.m_in

   CONNECT inertia2.m_out TO spring.m_in

   CONNECT torque1.m_out TO inertia3.m_in

   CONNECT inertia1.m_out TO torque2.m_out

   CONNECT torqueZero.s_out TO torque2.s_in

   CONNECT clutchSignal.s_out TO clutch.inPort

   CONNECT brakeSignal.s_out TO brake.inPort

   CONNECT sineSignal.s_out TO productSignal.s_in_1

   CONNECT startSignal.s_out TO productSignal.s_in_2

   CONNECT productSignal.s_out TO torque1.s_in



END COMPONENT