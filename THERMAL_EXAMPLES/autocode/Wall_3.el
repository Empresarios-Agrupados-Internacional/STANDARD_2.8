-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE THERMAL
USE SYSTEM_MDL_LIB VERSION "1.1"



COMPONENT Wall_3 

PORTS



TOPOLOGY
   THERMAL.BNode(
         n = 1   ) Environment(
         Label = "Node Label",
         qi = 0)
   THERMAL.GR(
         n = 1   ) GR_1(
         REF = 0.5  -- Non default value.
   )
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) layer1(
         mat = None,
         rho = 1000,
         cp = 500,
         k = 0.001,  -- Non default value.
         TemperatureDependance = TRUE,
         A = 1,
         e = 0.001,  -- Non default value.
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) layer2(
         mat = None,
         rho = 1000,
         cp = 500,
         k = 0.02,  -- Non default value.
         TemperatureDependance = TRUE,
         A = 1,
         e = 0.02,  -- Non default value.
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) layer3(
         mat = GCF,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.001,  -- Non default value.
         TemperatureDependance = TRUE,
         A = 1,
         e = 0.001,  -- Non default value.
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })

   CONNECT GR_1.tp_out TO Environment.tp_in

   CONNECT layer1.tp_out TO layer2.tp_in

   CONNECT layer2.tp_out TO layer3.tp_in

   CONNECT layer3.tp_out TO GR_1.tp_in



END COMPONENT