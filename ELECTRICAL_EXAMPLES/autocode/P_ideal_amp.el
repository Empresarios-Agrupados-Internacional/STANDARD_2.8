-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE ELECTRICAL



COMPONENT P_ideal_amp 

PORTS



TOPOLOGY
   ELECTRICAL.VoltageSine V(
         Vpeak = 1,
         Voffset = 0,
         freqHz = 0.25,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.Ground G
   ELECTRICAL.Resistor RI(
         R = 1)
   ELECTRICAL.Resistor RF(
         R = 1)
   ELECTRICAL.Resistor Ra(
         R = 100000000  -- Non default value.
   )
   ELECTRICAL.IdealOpAmp A(
         G = 1000000)

   CONNECT G.e_p TO RI.e_n

   CONNECT G.e_p TO V.e_n

   CONNECT RF.e_n TO RI.e_p

   CONNECT G.e_p TO Ra.e_n

   CONNECT A.e_p2 TO Ra.e_p

   CONNECT A.e_n2 TO RF.e_p

   CONNECT A.e_n1 TO RI.e_p

   CONNECT A.e_p1 TO V.e_p



END COMPONENT