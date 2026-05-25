-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Example_GearChange 

PORTS



TOPOLOGY
   MECHANICAL.R_ActuatorTorque Rand_Torque
   MECHANICAL.R_Inertia R_Inertia_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_GearIdeal R_GearIdeal_1(
         ratio = 1)
   MECHANICAL.R_Inertia R_Inertia_2(
         I = 3,  -- Non default value.
         w0 = 0)

   CONNECT Rand_Torque.m_out TO R_Inertia_1.m_in

   CONNECT R_Inertia_1.m_out TO R_GearIdeal_1.m_in

   CONNECT R_GearIdeal_1.m_out TO R_Inertia_2.m_in



CONTINUOUS
		Rand_Torque.s_in.signal[1] = 150
END COMPONENT