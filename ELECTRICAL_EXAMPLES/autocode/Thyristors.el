-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Thyristors 

PORTS



TOPOLOGY
   CONTROL.SourcebPulse(
         n_out = 1   ) Switch(
         Period = 15,  -- Non default value.
         pulseWidth = 1,  -- Non default value.
         Tstart = 1  -- Non default value.
   )
   CONTROL.SourcebPulse(
         n_out = 1   ) Switch_1(
         Period = 15,  -- Non default value.
         pulseWidth = 1,  -- Non default value.
         Tstart = 1  -- Non default value.
   )
   ELECTRICAL.Ground Ground
   ELECTRICAL.Ground Ground_1
   ELECTRICAL.IdealGTOThyristor GTO_Thyristor(
         Roff = 1e-05,
         Gon = 1e-05)
   ELECTRICAL.IdealThyristor Thyristor(
         Roff = 1e-05,
         Gon = 1e-05)
   ELECTRICAL.Resistor Resistor(
         R = 1)
   ELECTRICAL.Resistor Resistor_1(
         R = 1)
   ELECTRICAL.VoltageSine AC_Current(
         Vpeak = 220,  -- Non default value.
         Voffset = 0,
         freqHz = 10,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.VoltageSine AC_Current_1(
         Vpeak = 220,  -- Non default value.
         Voffset = 0,
         freqHz = 10,  -- Non default value.
         phase = 0,
         startTime = 0)

   CONNECT Switch.s_out TO Thyristor.b_fire

   CONNECT Switch_1.s_out TO GTO_Thyristor.b_fire

   CONNECT GTO_Thyristor.e_n TO Resistor_1.e_p

   CONNECT Thyristor.e_n TO Resistor.e_p

   CONNECT Resistor.e_n TO Ground.e_p

   CONNECT Resistor_1.e_n TO Ground_1.e_p

   CONNECT AC_Current.e_n TO Ground.e_p

   CONNECT AC_Current.e_p TO Thyristor.e_p

   CONNECT AC_Current_1.e_n TO Ground_1.e_p

   CONNECT AC_Current_1.e_p TO GTO_Thyristor.e_p



END COMPONENT