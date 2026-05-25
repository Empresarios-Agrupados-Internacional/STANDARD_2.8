-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL



-- EL code of the schematic.

COMPONENT PlateBC 

PORTS



TOPOLOGY
   THERMAL.Insulation(
         n = 10   -- Non default value.
   ) Insulation
   THERMAL.Plate(
         nx = 10,   -- Non default value.
         ny = 10   -- Non default value.
   ) Plate(
         L = 1,
         W = 1,
         e = 0.001,  -- Non default value.
         mat = Copper,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })

   CONNECT Insulation.tp TO Plate.tpx_in



END COMPONENT