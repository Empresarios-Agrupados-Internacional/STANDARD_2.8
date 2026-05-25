-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE THERMAL
USE SYSTEM_MDL_LIB VERSION "1.1"



COMPONENT View_Factors_Model 

PORTS



TOPOLOGY
   THERMAL.BNode(
         n = 1   ) N1(
         Label = "Node Label",
         qi = 0)
   THERMAL.BNode(
         n = 1   ) N2(
         Label = "Node Label",
         qi = 0)
   THERMAL.BNode(
         n = 1   ) N3(
         Label = "Node Label",
         qi = 0)
   THERMAL.DNode(
         n = 1   ) N4(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 0.001)
   THERMAL.DNode(
         n = 1   ) N5(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 0.001)
   THERMAL.DNode(
         n = 1   ) N6(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 0.001)
   THERMAL.View_Factors(
         nports = 6   -- Non default value.
   ) view_factors(
         VF = { { 0,0.33371,0.08365,0.08365,0.33371,0.16527} ,{ 0.16686,0,0.07865,0.07865,0.50899,0.16686} ,{ 0.16731,0.3146,0,0.03618,0.3146,0.16731} ,{ 0.16731,0.3146,0.03618,0,0.3146,0.16731} ,{ 0.16686,0.50899,0.07865,0.07865,0,0.16686} ,{ 0.16527,0.33371,0.08365,0.08365,0.33371,0} },  -- Non default value.
         e = { 0.9,0.75,0.8,0.0001,0.0001,0.0001},  -- Non default value.
         A = { 4,8,2,2,8,4}  -- Non default value.
   )

   CONNECT view_factors.tp_in[1] TO N1.tp_in

   CONNECT view_factors.tp_in[2] TO N2.tp_in

   CONNECT view_factors.tp_in[3] TO N3.tp_in

   CONNECT view_factors.tp_in[4] TO N4.tp_in

   CONNECT view_factors.tp_in[5] TO N5.tp_in

   CONNECT view_factors.tp_in[6] TO N6.tp_in



END COMPONENT