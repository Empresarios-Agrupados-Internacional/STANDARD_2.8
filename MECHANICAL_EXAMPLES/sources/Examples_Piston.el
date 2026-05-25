-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.

COMPONENT Examples_Piston 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) Air_val(
         source = Source_SawTooth,  -- Non default value.
         Amp = 5000,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) Fext(
         source = Source_Constant,
         Amp = 100,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   MECHANICAL.R_Damper Damper(
         phi_rel_i = 0,
         d = 1  -- Non default value.
   )
   MECHANICAL.R_GearIdealR2T Rot_to_Trans(
         ratio = -5  -- Non default value.
   )
   MECHANICAL.R_Inertia J_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia J_2(
         I = 1,
         w0 = 0)
   MECHANICAL.R_SpringDamper SpringDamper(
         phi_rel_i = 0,
         d = 0.4,  -- Non default value.
         c = 0.4,  -- Non default value.
         phi_rel0 = 0)
   MECHANICAL.T_ActuatorForce Pressurized_air
   MECHANICAL.T_Piston Piston(
         Mp = 1,
         xini = 0,
         xmin = 0,
         xmax = 0.05,
         K_spr = 100000,
         Fpl = 100,
         cv = 20,
         fc1 = 0,
         fc2 = 0)
   MECHANICAL.T_Rod Rod

   CONNECT Air_val.s_out TO Pressurized_air.s_in

   CONNECT Fext.s_out TO Piston.s_Fext

   CONNECT Damper.m_out TO J_2.m_in

   CONNECT Rot_to_Trans.R_m_in TO SpringDamper.m_in

   CONNECT J_1.m_out TO Damper.m_in

   CONNECT SpringDamper.m_out TO J_1.m_in

   CONNECT Pressurized_air.m_out TO Piston.m_in

   CONNECT Piston.m_out TO Rod.m_in

   CONNECT Rod.m_out TO Rot_to_Trans.T_m_out



END COMPONENT