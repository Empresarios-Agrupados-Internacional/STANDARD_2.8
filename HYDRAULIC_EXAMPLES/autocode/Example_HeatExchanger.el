-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE HYDRAULIC



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Example_HeatExchanger 

PORTS



TOPOLOGY
   HYDRAULIC.Fluid(
         user_defined = FALSE,
         fluid = Water   ) Fluid_cold(
         rho_user_defined = 1000,
         cp_user_defined = 4186)
   HYDRAULIC.Fluid(
         user_defined = FALSE,
         fluid = Synthetic_Oil   -- Non default value.
   ) Fluid_hot(
         rho_user_defined = 1000,
         cp_user_defined = 4186)
   HYDRAULIC.HydPipe Pipe1(
         z_in = 0,
         z_out = 0,
         l = 1,
         d = 0.1,
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.HydPipe Pipe2(
         z_in = 0,
         z_out = 0,
         l = 1,
         d = 0.1,
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.HydPipe Pipe4(
         z_in = 0,
         z_out = 0,
         l = 1,
         d = 0.1,
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.HydPipe Pipe3(
         z_in = 0,
         z_out = 0,
         l = 1,
         d = 0.1,
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.Inlet(
         dyn = FALSE   ) Cold_inlet(
         tau = 0.1)
   HYDRAULIC.Inlet(
         dyn = FALSE   ) Hot_inlet(
         tau = 0.1)
   HYDRAULIC.Outlet(
         dyn = FALSE   ) Cold_outlet(
         tau = 0.1)
   HYDRAULIC.Outlet(
         dyn = FALSE   ) Hot_outlet(
         tau = 0.1)
   HYDRAULIC.HydHex Hex(
         l = 1,
         vol_cold = 0.01,  -- Non default value.
         vol_hot = 0.01,  -- Non default value.
         m_dry_hot = 0.01,
         m_dry_cold = 0.01,
         cp_dry = 460,
         w_hot_ref = 10,  -- Non default value.
         w_cold_ref = 10,  -- Non default value.
         dp_lam_hot = 1000,
         dp_lam_cold = 1000,
         f_hot = 0.02,
         f_cold = 0.02,
         const_eff = FALSE,
         eff = 0.9,
         eff_vs_flows = { { 0.095,0.284,0.474,0.664,0.853,1.04} ,{ 0.519,1,1.46,1.89,2.33,2.5} ,{ { 0.999,0.999,0.999,0.999,0.999,0.999} ,{ 0.9948,0.999,0.999,0.999,0.999,0.999} ,{ 0.947,0.9894,0.9948,0.9965,0.9973,0.9975} ,{ 0.8471,0.9625,0.9808,0.987,0.99,0.9907} ,{ 0.7332,0.919,0.9596,0.9703,0.977,0.9787} ,{ 0.6316,0.8652,0.9249,0.9474,0.9589,0.9619} } },
         T_cold_out_i = 293,
         T_hot_out_i = 293)

   CONNECT Fluid_cold.hp_out TO Pipe1.hp_in

   CONNECT Fluid_hot.hp_out TO Pipe3.hp_in

   CONNECT Cold_inlet.f_out TO Fluid_cold.hp_in

   CONNECT Hot_inlet.f_out TO Fluid_hot.hp_in

   CONNECT Pipe2.hp_out TO Cold_outlet.f_in

   CONNECT Pipe4.hp_out TO Hot_outlet.f_in

   CONNECT Pipe3.hp_out TO Hex.hp_hot_in

   CONNECT Pipe1.hp_out TO Hex.hp_cold_in

   CONNECT Hex.hp_hot_out TO Pipe4.hp_in

   CONNECT Hex.hp_cold_out TO Pipe2.hp_in



CONTINUOUS
   /*Hex.hp_cold_out.T = 20
   Hex.hp_hot_out.T = 50*/
END COMPONENT