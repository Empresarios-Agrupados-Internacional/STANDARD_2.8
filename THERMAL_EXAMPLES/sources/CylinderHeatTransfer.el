-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL



-- EL code of the schematic.

COMPONENT CylinderHeatTransfer 

PORTS



TOPOLOGY
   THERMAL.Cylinder(
         nz = 1,   -- Non default value.
         nr = 1   -- Non default value.
   ) Cylinder(
         L = 3,  -- Non default value.
         Di = 0.2,  -- Non default value.
         Do = 0.22,  -- Non default value.
         num = 1,
         mat = Aluminum,  -- Non default value.
         k = 0.1,
         rho = 1000,
         cp = 500,
         TemperatureDependance = TRUE,
         init_mode = Constant_Temp,
         To = 100,  -- Non default value.
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.Insulation(
         n = 1   ) Insulation_l
   THERMAL.Insulation(
         n = 1   ) Insulation_r
   THERMAL.Insulation(
         n = 1   ) Insulation_radial
   THERMAL.Wall(
         n = 1,
         nodes = 10   ) Wall_l(
         mat = None,
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 1,
         e = 0.1,
         init_mode = Constant_Temp,
         To = 100,  -- Non default value.
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.Wall(
         n = 1,
         nodes = 10   ) Wall_r(
         mat = None,
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 1,
         e = 0.1,
         init_mode = Constant_Temp,
         To = 100,  -- Non default value.
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })

   CONNECT Cylinder.tpr_out TO Insulation_radial.tp

   CONNECT Cylinder.tpz_out TO Wall_r.tp_in

   CONNECT Insulation_l.tp TO Wall_l.tp_in

   CONNECT Wall_l.tp_out TO Cylinder.tpz_in

   CONNECT Wall_r.tp_out TO Insulation_r.tp



END COMPONENT