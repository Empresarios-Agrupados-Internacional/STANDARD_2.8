-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL
USE ELECTRICAL



-- EL code of the schematic.

COMPONENT Peltier 

PORTS



TOPOLOGY
   ELECTRICAL.CurrentConstant CurrentConstant(
         I = 1)
   ELECTRICAL.Ground Ground
   THERMAL.Peltier(
         n = 1   ) Peltier(
         NTE = 127,  -- Non default value.
         G = 0.00072,  -- Non default value.
         a_coef = { 2.2224e-05,9.306e-07,-9.905e-10},
         r_coef = { 5.112e-07,1.634e-08,6.279e-11},
         k_coef = { 6.2605,-0.02777,4.131e-05})

   CONNECT CurrentConstant.e_p TO Ground.e_p

   CONNECT CurrentConstant.e_n TO Peltier.e_p

   CONNECT Peltier.e_n TO Ground.e_p



END COMPONENT