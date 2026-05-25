-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE MECHANICAL
USE CONTROL



COMPONENT Example_GearFriction1 

PORTS



TOPOLOGY
   MECHANICAL.R_GearFriction gear(
         trans_ratio = 2,
         tab_eta_mf1 = { { 0,1} ,{ 0.5,0.5} },
         tab_eta_mf2 = { { 0,1} ,{ 0.5,0.5} },
         tab_tau_bf1 = { { 0,1} ,{ 0,0} },
         tab_tau_bf2 = { { 0,1} ,{ 0,0} },
         ideal = FALSE)
   MECHANICAL.R_Inertia inertia1(
         I = 1,
         w0 = 0)
   CONTROL.AnalogSource(
         n_out = 1   ) driveSine(
         source = Source_Sine,  -- Non default value.
         Amp = 10,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 1,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) load(
         source = Source_Ramp,  -- Non default value.
         Amp = 5,  -- Non default value.
         Tstart = 0,
         Offset = -10,  -- Non default value.
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 2,  -- Non default value.
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   MECHANICAL.R_Inertia inertia2(
         I = 1.5,  -- Non default value.
         w0 = 0)
   MECHANICAL.R_ActuatorTorque torque1
   MECHANICAL.R_ActuatorTorque torque2

   CONNECT inertia1.m_out TO gear.m_in

   CONNECT gear.m_out TO inertia2.m_in

   CONNECT inertia2.m_out TO torque2.m_out

   CONNECT driveSine.s_out TO torque1.s_in

   CONNECT load.s_out TO torque2.s_in

   CONNECT torque1.m_out TO inertia1.m_in



END COMPONENT