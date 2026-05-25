-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE CONTROL



COMPONENT WindUp_Example 

PORTS



TOPOLOGY
   CONTROL.Cntrl_PI(
         n = 1   ) PI(
         k = { 1},  -- Non default value.
         u_min = { -0.1},  -- Non default value.
         u_max = { 0.1},  -- Non default value.
         end_pos = end_PI,  -- Non default value.
         Ti = { 1},  -- Non default value.
         gamma = { 100000000},  -- Non default value.
         beta = { 1}  -- Non default value.
   )
   CONTROL.Integrator(
         n = 1   ) Integrator(
         output_o = { 0}  -- Non default value.
   )

   CONNECT Integrator.s_out TO PI.s_var

   CONNECT PI.s_out TO Integrator.s_in



END COMPONENT