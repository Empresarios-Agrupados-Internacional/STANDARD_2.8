-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"



COMPONENT diodeBridge 

PORTS



TOPOLOGY
   ELECTRICAL.Ground Ground1
   ELECTRICAL.IdealDiode D4(
         Roff = 0.1,  -- Non default value.
         Gon = 1e-006  -- Non default value.
   )
   ELECTRICAL.IdealDiode D3(
         Roff = 0.1,  -- Non default value.
         Gon = 1e-006  -- Non default value.
   )
   ELECTRICAL.IdealDiode D2(
         Roff = 0.1,  -- Non default value.
         Gon = 1e-006  -- Non default value.
   )
   ELECTRICAL.IdealDiode D1(
         Roff = 0.1,  -- Non default value.
         Gon = 1e-006  -- Non default value.
   )
   ELECTRICAL.VoltageSine VAC1(
         Vpeak = 10,  -- Non default value.
         Voffset = 0,
         freqHz = 50,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.Resistor R1(
         R = 1000  -- Non default value.
   )
   ELECTRICAL.Capacitor C1(
         C = 0.0001  -- Non default value.
   )

   CONNECT C1.e_n TO R1.e_n

   CONNECT D4.e_n TO Ground1.e_p

   CONNECT D3.e_p TO D4.e_n

   CONNECT D1.e_p TO D2.e_n

   CONNECT D4.e_n TO VAC1.e_n

   CONNECT D1.e_n TO R1.e_p

   CONNECT D1.e_n TO D3.e_n

   CONNECT C1.e_p TO D1.e_n

   CONNECT C1.e_n TO D2.e_p

   CONNECT C1.e_n TO D4.e_p

   CONNECT D1.e_p TO VAC1.e_p



END COMPONENT