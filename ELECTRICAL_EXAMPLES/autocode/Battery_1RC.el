-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Battery_1RC 

PORTS
   IN PORTS_LIB.elec e_n CARDINALITY 0,2147483647
   IN PORTS_LIB.elec e_p CARDINALITY 0,2147483647


DATA
   REAL Q    = 4           UNITS u_Ah     "Nominal capacity (A*h)"
   REAL V_nom = 3.7        UNITS u_V      "Battery VOC nominal voltage"
   TABLE_1D V_SOC = {{-0.1,0,0.25,0.9,1,1.1}, {0,0.68,1,1,1.14,1.14}}       UNITS "V PU" "Battery open-circuit voltage versus state of charge"
   REAL soc0 = 0.1     UNITS no_units    "Initial state of charge (0..1)"                     
   REAL C1_v = 0.0015     UNITS u_Farad      "RC Capacity"
   REAL R1_v = 0.05       UNITS u_Ohm    "RC Resistance"
   REAL R0_v = 0.025      UNITS u_Ohm    "Inner Resistance"

TOPOLOGY
   ELECTRICAL.Capacitor C1(
         C = C1_v  -- Non default value.
   )
   ELECTRICAL.Resistor R1(
         R = R1_v  -- Non default value.
   )
   ELECTRICAL.Resistor R0(
         R = R0_v  -- Non default value.
   )
   ELECTRICAL.IdealBattery Battery_1(
         Q = Q,  -- Non default value.
         V_nom = V_nom,  -- Non default value.
         V_SOC = V_SOC,  -- Non default value.
         soc0 = soc0  -- Non default value.
   )

   CONNECT R1.e_p TO R0.e_n

   CONNECT R0.e_n TO C1.e_p

   CONNECT C1.e_n TO R1.e_n

   CONNECT Battery_1.e_p TO R0.e_p

   CONNECT e_p TO C1.e_n

   CONNECT e_n TO Battery_1.e_n



END COMPONENT