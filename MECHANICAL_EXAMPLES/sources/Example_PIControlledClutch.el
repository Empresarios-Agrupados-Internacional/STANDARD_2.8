-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE CONTROL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.

COMPONENT Example_PIControlledClutch 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_2(
         source = Source_Step,  -- Non default value.
         Amp = 20,  -- Non default value.
         Tstart = 10,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Torque_signal(
         source = Source_Square,  -- Non default value.
         Amp = 50,  -- Non default value.
         Tstart = 0,
         Offset = 25,  -- Non default value.
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.Cntrl_PI(
         n = 1   ) PI_cntrl(
         k = 3,  -- Non default value.
         u_min = -150,  -- Non default value.
         u_max = 150,  -- Non default value.
         end_pos = end_I,
         Ti = 0.05,  -- Non default value.
         gamma = 0.1,
         beta = 1)
   MECHANICAL.R_AbsoluteSensorVelocity(
         n_out = 1   ) Velocity(
         gain = 1,
         bias = 0)
   MECHANICAL.R_ActuatorTorque Rand_Torque
   MECHANICAL.R_ActuatorTorque Torque
   MECHANICAL.R_Clutch Clutch(
         phi_rel_i = 0,
         mue_pos = { { 0,1} ,{ 0.5,0.5} },
         peak = 1.1,
         cgeo = 1,
         fn_max = 20,
         w_rel_i = 1)
   MECHANICAL.R_Inertia R_Inertia_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_2(
         I = 3,  -- Non default value.
         w0 = 0)

   CONNECT AnalogSource_2.s_out TO Clutch.inPort

   CONNECT Torque_signal.s_out TO Rand_Torque.s_in

   CONNECT PI_cntrl.s_out TO Torque.s_in

   CONNECT Velocity.s_out TO PI_cntrl.s_var

   CONNECT Velocity.m_in TO R_Inertia_1.m_in

   CONNECT Rand_Torque.m_out TO R_Inertia_2.m_out

   CONNECT Torque.m_out TO R_Inertia_1.m_in

   CONNECT Clutch.m_out TO R_Inertia_2.m_in

   CONNECT R_Inertia_1.m_out TO Clutch.m_in



CONTINUOUS
		
		PI_cntrl.s_set.signal[1] = 75
		
END COMPONENT