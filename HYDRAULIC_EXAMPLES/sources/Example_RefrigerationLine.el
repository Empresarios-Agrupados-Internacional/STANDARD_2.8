-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE HYDRAULIC
USE THERMAL
USE CONTROL



COMPONENT Example_RefrigerationLine 

PORTS



TOPOLOGY
   HYDRAULIC.HydTank_Th HydTank2(
         z_in = 0,
         z_out = 0,
         A = 0.1*0.1,  -- Non default value.
         p_atm = 101325,
         To = 273.15+20,  -- Non default value.
         Ho = 0.1  -- Non default value.
   )
   HYDRAULIC.HydPipe_Th HydPipe(
         z_in = 0,
         z_out = 0,
         l = 2,  -- Non default value.
         d = 0.02,  -- Non default value.
         f = 0.02,
         dp_lam = 1000,
         To = 273.15+20  -- Non default value.
   )
   HYDRAULIC.Fluid(
         user_defined = FALSE,
         fluid = Water_Glycol_6040   -- Non default value.
   ) Fluid(
         rho_user_defined = 1000,
         cp_user_defined = 4186)
   THERMAL.BNode(
         n = 1   ) amb(
         Label = "Node Label",
         qi = 0)
   THERMAL.Heater(
         n = 1   ) Heater
   HYDRAULIC.Inlet(
         dyn = TRUE   -- Non default value.
   ) Inlet(
         tau = 2  -- Non default value.
   )
   HYDRAULIC.Outlet(
         dyn = TRUE   -- Non default value.
   ) Outlet(
         tau = 4  -- Non default value.
   )
   THERMAL.GL(
         n = 1   ) GL(
         cond = 20  -- Non default value.
   )
   CONTROL.AnalogSource(
         n_out = 1   ) T_amb(
         source = Source_Ramp,  -- Non default value.
         Amp = 35,  -- Non default value.
         Tstart = 10,  -- Non default value.
         Offset = 273.15+20,  -- Non default value.
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 120,  -- Non default value.
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) P_th(
         source = Source_Ramp,  -- Non default value.
         Amp = 1000,  -- Non default value.
         Tstart = 10,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 120,  -- Non default value.
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })

   CONNECT Fluid.hp_out TO HydPipe.hp_in

   CONNECT HydPipe.hp_out TO HydTank2.hp_in

   CONNECT HydTank2.hp_out TO Outlet.f_in

   CONNECT Inlet.f_out TO Fluid.hp_in

   CONNECT GL.tp_in TO amb.tp_in

   CONNECT T_amb.s_out TO amb.s_temperature

   CONNECT P_th.s_out TO Heater.s_power

   CONNECT Heater.tp_out TO HydPipe.tp_in

   CONNECT GL.tp_out TO HydTank2.tp_in



END COMPONENT