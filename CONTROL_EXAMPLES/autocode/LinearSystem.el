-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE CONTROL



COMPONENT LinearSystem 

PORTS



TOPOLOGY
   CONTROL.Addition(
         n = 1   ) summer_1
   CONTROL.Addition(
         n = 1   ) summer_2
   CONTROL.Subtraction(
         n = 1   ) comparator
   CONTROL.Gain(
         n = 1   ) amplifier(
         k = { 1438}  -- Non default value.
   )
   CONTROL.TransferFunction(
         n_num = 2,   -- Non default value.
         n_den = 2   -- Non default value.
   ) compensator(
         p = { 1,2,1},  -- Non default value.
         q = { 1,28,160},  -- Non default value.
         output_o = 0)
   CONTROL.TransferFunction(
         n_num = 0,
         n_den = 3   -- Non default value.
   ) process_plant(
         p = { 1},  -- Non default value.
         q = { 1,3.2,3.56,0},  -- Non default value.
         output_o = 0)

   CONNECT comparator.s_out TO amplifier.s_in

   CONNECT amplifier.s_out TO summer_1.s_in_1

   CONNECT summer_1.s_out TO compensator.s_in

   CONNECT compensator.s_out TO summer_2.s_in_1

   CONNECT summer_2.s_out TO process_plant.s_in

   CONNECT process_plant.s_out TO comparator.s_in_2



END COMPONENT