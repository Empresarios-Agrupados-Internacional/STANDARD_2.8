-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Example_TranslationalSpringAndDamper 

PORTS



TOPOLOGY
   MECHANICAL.T_Wall Wall_1(
         ws = -1,
         wp = 0,
         cl = 0  -- Non default value.
   )
   MECHANICAL.T_Wall Wall_2(
         ws = -1,
         wp = 0,
         cl = 0  -- Non default value.
   )
   MECHANICAL.T_Wall Wall_3(
         ws = -1,
         wp = 0,
         cl = 0  -- Non default value.
   )
   MECHANICAL.T_Spring Spring(
         k = 1,  -- Non default value.
         s_rel0 = 0)
   MECHANICAL.T_SlidingMass Mass_1(
         m = 1,
         s0 = 0,
         v0 = 0)
   MECHANICAL.T_SlidingMass Mass_2(
         m = 1,
         s0 = 0,
         v0 = 0)
   MECHANICAL.T_SlidingMass Mass_3(
         m = 1,
         s0 = 0,
         v0 = 0)
   MECHANICAL.T_Damper Damper(
         d = 0.1  -- Non default value.
   )
   MECHANICAL.T_ActuatorForce Force_1
   MECHANICAL.T_ActuatorForce Force_2
   MECHANICAL.T_ActuatorForce Force_3
   CONTROL.AnalogSource(
         n_out = 1   ) Force_val(
         source = Source_Pulse,  -- Non default value.
         Amp = 5,  -- Non default value.
         Tstart = 5,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 500,  -- Non default value.
         pulseWidth = 0.1,  -- Non default value.
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   MECHANICAL.T_SpringDamper SpringDamper(
         d = 0.1,  -- Non default value.
         k = 1,  -- Non default value.
         s_rel0 = 0)

   CONNECT Wall_1.m_out TO Spring.m_in

   CONNECT Spring.m_out TO Mass_1.m_in

   CONNECT Wall_3.m_out TO Damper.m_in

   CONNECT Damper.m_out TO Mass_3.m_in

   CONNECT Force_1.m_out TO Mass_1.m_out

   CONNECT Force_2.m_out TO Mass_2.m_out

   CONNECT Force_3.m_out TO Mass_3.m_out

   CONNECT Force_val.s_out TO Force_1.s_in

   CONNECT Force_val.s_out TO Force_2.s_in

   CONNECT Force_val.s_out TO Force_3.s_in

   CONNECT Wall_2.m_out TO SpringDamper.m_in

   CONNECT SpringDamper.m_out TO Mass_2.m_in



END COMPONENT