-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE CONTROL



-- EL code of the schematic.

COMPONENT Example_PIControlled2DOFSystem 

PORTS



TOPOLOGY
   CONTROL.Cntrl_PID(
         n = 1   ) PID_Cntrl(
         k = 10,  -- Non default value.
         u_min = 0,
         u_max = 50,  -- Non default value.
         end_pos = end_I,
         Ti = 0.1,  -- Non default value.
         gamma = 0.1,
         beta = 1,
         Td = 1,  -- Non default value.
         alpha = 0.1)
   MECHANICAL.T_AbsoluteSensorPosition(
         n_out = 1   ) PositionSensor(
         gain = 1,
         bias = 0)
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

   CONNECT PID_Cntrl.s_out TO Force.s_in

   CONNECT PositionSensor.s_out TO PID_Cntrl.s_var

   CONNECT Force.m_out TO Mass_2.m_in

   CONNECT Wall.m_out TO SpringDamper.m_in

   CONNECT Mass_1.m_out TO Spring.m_in

   CONNECT Mass_2.m_in TO PositionSensor.m_in

   CONNECT Spring.m_out TO Mass_2.m_in

   CONNECT SpringDamper.m_out TO Mass_1.m_in



CONTINUOUS
		PID_Cntrl.s_set.signal[1] = 10
END COMPONENT