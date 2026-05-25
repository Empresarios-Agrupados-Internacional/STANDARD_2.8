-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE HYDRAULIC



COMPONENT Example_ThreeTanks "Simple hydraulic circuit example 2" 

PORTS



TOPOLOGY
   HYDRAULIC.HydTank HydTank1(
         z_in = 0,
         z_out = 0,
         A = 1,
         p_atm = 101325,
         To = 273.15+10,  -- Non default value.
         Ho = 4  -- Non default value.
   )
   HYDRAULIC.HydTank HydTank3(
         z_in = 0,
         z_out = 0,
         A = 1,
         p_atm = 101325,
         To = 273.15+50,  -- Non default value.
         Ho = 1  -- Non default value.
   )
   HYDRAULIC.HydTank HydTank2(
         z_in = 0,
         z_out = 0,
         A = 1,
         p_atm = 101325,
         To = 273.15+25,  -- Non default value.
         Ho = 1  -- Non default value.
   )
   HYDRAULIC.Fluid(
         user_defined = FALSE,
         fluid = Water   ) Fluid(
         rho_user_defined = 1000,
         cp_user_defined = 4186)
   HYDRAULIC.HydPipe HydPipe4(
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
   HYDRAULIC.HydPipe HydPipe3(
         z_in = 0,
         z_out = 0,
         l = 1,
         d = 0.1,
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.HydPipe HydPipe2(
         z_in = 0,
         z_out = 0,
         l = 1,
         d = 0.1,
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.Inlet(
         dyn = FALSE   ) Inlet(
         tau = 0.1)
   HYDRAULIC.Outlet(
         dyn = FALSE   ) Outlet_1(
         tau = 0.1)
   HYDRAULIC.Outlet(
         dyn = FALSE   ) Outlet_2(
         tau = 0.1)

   CONNECT HydTank1.hp_out TO Fluid.hp_in

   CONNECT HydPipe2.hp_out TO HydPipe4.hp_in

   CONNECT HydPipe4.hp_out TO HydTank3.hp_in

   CONNECT Fluid.hp_out TO HydPipe1.hp_in

   CONNECT HydPipe1.hp_out TO HydPipe2.hp_in

   CONNECT HydPipe2.hp_out TO HydPipe3.hp_in

   CONNECT HydPipe3.hp_out TO HydTank2.hp_in

   CONNECT Inlet.f_out TO HydTank1.hp_in

   CONNECT HydTank2.hp_out TO Outlet_1.f_in

   CONNECT HydTank3.hp_out TO Outlet_2.f_in



END COMPONENT