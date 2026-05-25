-- Generated automatically by - EcosimPro - 7.2.1 


USE CONTROL VERSION "5.0.6"
USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE HYDRAULIC



COMPONENT Example_ValveControl 

PORTS



TOPOLOGY
   CONTROL.Cntrl_PID(
         n = 1   ) Cntrl_PID(
         k = { 1},  -- Non default value.
         u_min = { 0},  -- Non default value.
         u_max = { 1},  -- Non default value.
         end_pos = end_I,
         Ti = { 100},  -- Non default value.
         gamma = { 0.01},  -- Non default value.
         beta = { 1},  -- Non default value.
         Td = { 0.1},  -- Non default value.
         alpha = { 0.1}  -- Non default value.
   )
   HYDRAULIC.HydFlowMeter(
         n_out = 1   ) HydFlowMeter1(
         gain = { 1},  -- Non default value.
         bias = { 0},  -- Non default value.
         z_in = 0,
         z_out = 0)
   HYDRAULIC.HydTank HydTank1(
         z_in = 0,
         z_out = 0,
         A = 1,
         p_atm = 101325,
         To = 288,  -- Non default value.
         Ho = 3  -- Non default value.
   )
   HYDRAULIC.HydTank HydTank2(
         z_in = 0,
         z_out = 0,
         A = 1,
         p_atm = 101325,
         To = 288,  -- Non default value.
         Ho = 1  -- Non default value.
   )
   HYDRAULIC.HydValve HydValve1(
         z_in = 0,
         z_out = 0,
         Avo = 0.02,
         dp_lam = 1000)
   HYDRAULIC.HydPipe HydPipe2(
         z_in = 0,
         z_out = 0,
         l = 1,
         d = 0.1,
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.HydPipe HydPipe1(
         z_in = 0,
         z_out = 0,
         l = 1,
         d = 0.1,
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.Fluid(
         user_defined = FALSE,
         fluid = Water   ) Fluid(
         rho_user_defined = 1000,
         cp_user_defined = 4186)
   HYDRAULIC.Inlet(
         dyn = FALSE   ) Inlet(
         tau = 0.1)
   HYDRAULIC.Outlet(
         dyn = FALSE   ) Outlet(
         tau = 0.1)

   CONNECT HydFlowMeter1.s_out TO Cntrl_PID.s_var

   CONNECT Cntrl_PID.s_out TO HydValve1.s_position

   CONNECT HydValve1.hp_out TO HydFlowMeter1.hp_in

   CONNECT HydFlowMeter1.hp_out TO HydPipe2.hp_in

   CONNECT HydPipe2.hp_out TO HydTank2.hp_in

   CONNECT HydPipe1.hp_out TO HydValve1.hp_in

   CONNECT HydTank1.hp_out TO Fluid.hp_in

   CONNECT Fluid.hp_out TO HydPipe1.hp_in

   CONNECT Inlet.f_out TO HydTank1.hp_in

   CONNECT HydTank2.hp_out TO Outlet.f_in



END COMPONENT