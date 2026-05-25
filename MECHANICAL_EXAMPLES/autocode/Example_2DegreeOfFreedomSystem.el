-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Example_2DegreeOfFreedomSystem 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) Force_val(
         source = Source_Constant,
         Amp = 20,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   MECHANICAL.T_ActuatorForce Force
   MECHANICAL.T_FixedPosition Wall(
         s0 = 0)
   MECHANICAL.T_SlidingMass Mass_1(
         m = 1,
         s0 = 1,  -- Non default value.
         v0 = 0)
   MECHANICAL.T_SlidingMass Mass_2(
         m = 1,
         s0 = 2,  -- Non default value.
         v0 = 0)
   MECHANICAL.T_Spring Spring(
         k = 1,  -- Non default value.
         s_rel0 = 1  -- Non default value.
   )
   MECHANICAL.T_SpringDamper SpringDamper(
         d = 1,  -- Non default value.
         k = 1,  -- Non default value.
         s_rel0 = 1  -- Non default value.
   )

   CONNECT Force_val.s_out TO Force.s_in

   CONNECT Force.m_out TO Mass_2.m_in

   CONNECT Wall.m_out TO SpringDamper.m_in

   CONNECT Mass_1.m_out TO Spring.m_in

   CONNECT Spring.m_out TO Mass_2.m_in

   CONNECT SpringDamper.m_out TO Mass_1.m_in



END COMPONENT