-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Example_Brake 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) AnalogSource_1(
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
   MECHANICAL.R_ActuatorTorque Rand_Torque
   MECHANICAL.R_Brake Brake(
         mue_pos = { { 0,1} ,{ 0.5,0.5} },
         peak = 1.1,
         cgeo = 1,
         fn_max = 20,
         w_i = 0  -- Non default value.
   )
   MECHANICAL.R_FixedVelocity R_FixedVelocity_1(
         w0 = 0)
   MECHANICAL.R_GearIdeal R_GearIdeal_1(
         ratio = 1)
   MECHANICAL.R_Inertia R_Inertia_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_2(
         I = 3,  -- Non default value.
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_3(
         I = 1,
         w0 = 0)

   CONNECT AnalogSource_1.s_out TO Brake.inPort

   CONNECT Rand_Torque.m_out TO R_Inertia_1.m_in

   CONNECT R_FixedVelocity_1.m_out TO R_Inertia_3.m_in

   CONNECT R_GearIdeal_1.m_out TO R_Inertia_2.m_in

   CONNECT R_Inertia_1.m_out TO R_GearIdeal_1.m_in

   CONNECT R_Inertia_2.m_out TO Brake.m_in

   CONNECT R_Inertia_3.m_out TO Brake.m_out



CONTINUOUS
		Rand_Torque.s_in.signal[1] = 150
END COMPONENT