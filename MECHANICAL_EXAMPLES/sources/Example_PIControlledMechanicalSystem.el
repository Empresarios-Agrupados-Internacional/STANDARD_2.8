-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE CONTROL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.

COMPONENT Example_PIControlledMechanicalSystem 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_1(
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
         Ti = 0.1,  -- Non default value.
         gamma = 0.1,
         beta = 1)
   MECHANICAL.R_AbsoluteSensorVelocity(
         n_out = 1   ) Velocity(
         gain = 1,
         bias = 0)
   MECHANICAL.R_ActuatorTorque Rand_Torque
   MECHANICAL.R_ActuatorTorque Torque
   MECHANICAL.R_GearIdeal R_GearIdeal_1(
         ratio = 3  -- Non default value.
   )
   MECHANICAL.R_Inertia R_Inertia_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_2(
         I = 3,  -- Non default value.
         w0 = 0)

   CONNECT AnalogSource_1.s_out TO Rand_Torque.s_in

   CONNECT PI_cntrl.s_out TO Torque.s_in

   CONNECT Velocity.s_out TO PI_cntrl.s_var

   CONNECT Rand_Torque.m_out TO R_Inertia_2.m_out

   CONNECT Torque.m_out TO R_Inertia_1.m_in

   CONNECT R_GearIdeal_1.m_out TO R_Inertia_2.m_in

   CONNECT R_Inertia_1.m_out TO R_GearIdeal_1.m_in

   CONNECT R_Inertia_2.m_out TO Velocity.m_in



CONTINUOUS
		
		PI_cntrl.s_set.signal[1] = 75
		
END COMPONENT