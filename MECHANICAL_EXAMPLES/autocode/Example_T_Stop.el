-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE MECHANICAL
USE CONTROL



COMPONENT Example_T_Stop 

PORTS



TOPOLOGY
   MECHANICAL.T_Stop T_Stop(
         m = 1,
         smax = 0.9,  -- Non default value.
         smin = -0.9,  -- Non default value.
         F_prop = 1,
         F_Coulomb = 3,  -- Non default value.
         F_Stribeck = 5,  -- Non default value.
         fexp = 2,
         sini = 0)
   MECHANICAL.T_Spring spring(
         k = 500,  -- Non default value.
         s_rel0 = 1  -- Non default value.
   )
   CONTROL.AnalogSource(
         n_out = 1   ) SignalPosition(
         source = Source_Constant,
         Amp = -1.75,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) ForceNull(
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
   MECHANICAL.T_ActuatorForce force
   MECHANICAL.T_ActuatorPosition position

   CONNECT spring.m_out TO T_Stop.m_in

   CONNECT T_Stop.m_out TO force.m_out

   CONNECT position.m_out TO spring.m_in

   CONNECT SignalPosition.s_out TO position.s_in

   CONNECT ForceNull.s_out TO force.s_in



END COMPONENT