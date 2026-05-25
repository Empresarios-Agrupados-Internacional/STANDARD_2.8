-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL



-- EL code of the schematic.

COMPONENT Example_FixedVelocity 

PORTS



TOPOLOGY
   MECHANICAL.R_ActuatorTorque Rand_Torque
   MECHANICAL.R_FixedVelocity R_FixedVelocity_1(
         w0 = 0)
   MECHANICAL.R_GearIdeal R_GearIdeal_1(
         ratio = 2  -- Non default value.
   )
   MECHANICAL.R_Inertia R_Inertia_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_2(
         I = 3,  -- Non default value.
         w0 = 0)

   CONNECT Rand_Torque.m_out TO R_Inertia_1.m_in

   CONNECT R_GearIdeal_1.m_out TO R_Inertia_2.m_in

   CONNECT R_Inertia_1.m_out TO R_GearIdeal_1.m_in

   CONNECT R_Inertia_2.m_out TO R_FixedVelocity_1.m_out



CONTINUOUS
		Rand_Torque.s_in.signal[1] = 150
END COMPONENT