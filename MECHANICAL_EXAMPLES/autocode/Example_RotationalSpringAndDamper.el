-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Example_RotationalSpringAndDamper 

PORTS



TOPOLOGY
   MECHANICAL.R_ActuatorTorque Rand_Torque
   MECHANICAL.R_ActuatorTorque Rand_Torque_1
   MECHANICAL.R_ActuatorTorque Rand_Torque_2
   MECHANICAL.R_Damper Damper(
         phi_rel_i = 0,
         d = 0.02  -- Non default value.
   )
   MECHANICAL.R_GearIdeal R_GearIdeal_1(
         ratio = 1)
   MECHANICAL.R_GearIdeal R_GearIdeal_1_1(
         ratio = 1)
   MECHANICAL.R_GearIdeal R_GearIdeal_1_2(
         ratio = 1)
   MECHANICAL.R_Inertia R_Inertia_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_1_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_1_2(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_2(
         I = 3,  -- Non default value.
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_2_1(
         I = 3,  -- Non default value.
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_2_2(
         I = 3,  -- Non default value.
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_3(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_3_1(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Inertia R_Inertia_3_2(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Spring R_Spring_1(
         phi_rel_i = 0,
         c = 50,  -- Non default value.
         phi_rel0 = 0)
   MECHANICAL.R_SpringDamper SpringDamper(
         phi_rel_i = 0,
         d = 0.02,  -- Non default value.
         c = 50,  -- Non default value.
         phi_rel0 = 0)

   CONNECT Rand_Torque.m_out TO R_Inertia_1.m_in

   CONNECT Rand_Torque_1.m_out TO R_Inertia_1_1.m_in

   CONNECT Rand_Torque_2.m_out TO R_Inertia_1_2.m_in

   CONNECT Damper.m_out TO R_Inertia_3.m_in

   CONNECT R_GearIdeal_1.m_out TO R_Inertia_2.m_in

   CONNECT R_GearIdeal_1_1.m_out TO R_Inertia_2_1.m_in

   CONNECT R_GearIdeal_1_2.m_out TO R_Inertia_2_2.m_in

   CONNECT R_Inertia_1.m_out TO R_GearIdeal_1.m_in

   CONNECT R_Inertia_1_1.m_out TO R_GearIdeal_1_1.m_in

   CONNECT R_Inertia_1_2.m_out TO R_GearIdeal_1_2.m_in

   CONNECT R_Inertia_2.m_out TO Damper.m_in

   CONNECT R_Inertia_2_1.m_out TO R_Spring_1.m_in

   CONNECT R_Inertia_2_2.m_out TO SpringDamper.m_in

   CONNECT R_Spring_1.m_out TO R_Inertia_3_1.m_in

   CONNECT SpringDamper.m_out TO R_Inertia_3_2.m_in



CONTINUOUS
		Rand_Torque.s_in.signal[1] = 150
		Rand_Torque_1.s_in.signal[1] = 150
		Rand_Torque_2.s_in.signal[1] = 150
END COMPONENT