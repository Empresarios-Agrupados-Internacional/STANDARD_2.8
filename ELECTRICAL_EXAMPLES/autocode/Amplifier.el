-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE ELECTRICAL



COMPONENT Amplifier 

PORTS



TOPOLOGY
   ELECTRICAL.VoltageSine V(
         Vpeak = 1,
         Voffset = 0,
         freqHz = 0.25,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.Ground G
   ELECTRICAL.IdealOpAmp A(
         G = 1000000)
   ELECTRICAL.Resistor RI(
         R = 100  -- Non default value.
   )
   ELECTRICAL.Resistor RF(
         R = 400  -- Non default value.
   )
   ELECTRICAL.Resistor Ra(
         R = 0.1  -- Non default value.
   )

   CONNECT G.e_p TO V.e_n

   CONNECT A.e_p1 TO V.e_p

   CONNECT A.e_n2 TO G.e_p

   CONNECT RF.e_n TO RI.e_p

   CONNECT A.e_n1 TO RI.e_p

   CONNECT G.e_p TO RI.e_n

   CONNECT A.e_p2 TO RF.e_p

   CONNECT A.e_p2 TO Ra.e_p

   CONNECT G.e_p TO Ra.e_n



END COMPONENT