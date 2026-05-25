-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE ELECTRICAL



COMPONENT basicCircuit 

PORTS
   IN PORTS_LIB.elec Elec1 CARDINALITY 0,2147483647
   IN PORTS_LIB.elec Elec2 CARDINALITY 0,2147483647



TOPOLOGY
   ELECTRICAL.VoltageSine VAC1(
         Vpeak = 10,  -- Non default value.
         Voffset = 0,
         freqHz = 50,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.Capacitor C1(
         C = 5e-005  -- Non default value.
   )
   ELECTRICAL.Resistor R1(
         R = 5500  -- Non default value.
   )
   ELECTRICAL.Ground G1

   CONNECT VAC1.e_p TO C1.e_p

   CONNECT C1.e_n TO R1.e_p

   CONNECT R1.e_n TO VAC1.e_n

   CONNECT VAC1.e_n TO G1.e_p

   CONNECT Elec2 TO C1.e_n

   CONNECT Elec1 TO C1.e_p



END COMPONENT