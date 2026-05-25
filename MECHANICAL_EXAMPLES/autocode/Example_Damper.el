-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



COMPONENT Example_Damper 

PORTS



TOPOLOGY
   MECHANICAL.T_SpringDamper damper2(
         d = 25,  -- Non default value.
         k = 1,  -- Non default value.
         s_rel0 = 1  -- Non default value.
   )
   MECHANICAL.T_SlidingMass mass2(
         m = 1,
         s0 = 3.5,  -- Non default value.
         v0 = 10  -- Non default value.
   )
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
   MECHANICAL.T_SlidingMass mass1(
         m = 1,
         s0 = 3.5,  -- Non default value.
         v0 = 10  -- Non default value.
   )
   MECHANICAL.T_Damper damper1(
         d = 25  -- Non default value.
   )
   MECHANICAL.T_SlidingMass mass3(
         m = 1,
         s0 = 3.5,  -- Non default value.
         v0 = 10  -- Non default value.
   )
   MECHANICAL.T_ActuatorForce force2
   MECHANICAL.T_ActuatorForce force3
   MECHANICAL.T_ActuatorForce force1
   MECHANICAL.T_Spring spring(
         k = 1,  -- Non default value.
         s_rel0 = 1  -- Non default value.
   )
   MECHANICAL.T_FixedPosition Fixed2(
         s0 = 4.5  -- Non default value.
   )
   MECHANICAL.T_FixedPosition Fixed1(
         s0 = 4.5  -- Non default value.
   )
   MECHANICAL.T_FixedPosition Fixed3(
         s0 = 4.5  -- Non default value.
   )

   CONNECT Fixed2.m_out TO damper2.m_out

   CONNECT Fixed1.m_out TO damper1.m_out

   CONNECT mass1.m_out TO damper1.m_in

   CONNECT mass2.m_out TO damper2.m_in

   CONNECT force2.m_out TO mass2.m_in

   CONNECT force1.m_out TO mass1.m_in

   CONNECT force3.m_out TO mass3.m_in

   CONNECT ForceNull.s_out TO force2.s_in

   CONNECT ForceNull.s_out TO force1.s_in

   CONNECT ForceNull.s_out TO force3.s_in

   CONNECT Fixed3.m_out TO spring.m_out

   CONNECT mass3.m_out TO spring.m_in



END COMPONENT