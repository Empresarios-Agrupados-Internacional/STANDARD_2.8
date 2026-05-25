-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE HYDRAULIC
USE MECHANICAL
USE CONTROL



-- EL code of the schematic.

COMPONENT Example_HydroTurb_speed 

PORTS



TOPOLOGY
   HYDRAULIC.HydTank Lower_Reservoir(
         z_in = 20,  -- Non default value.
         z_out = 0,
         A = 10,  -- Non default value.
         p_atm = 101325,
         To = 293.15,
         Ho = 10)
   HYDRAULIC.HydTank Upper_Reservoir(
         z_in = 0,
         z_out = 0,
         A = 10,  -- Non default value.
         p_atm = 101325,
         To = 293.15,
         Ho = 10)
   HYDRAULIC.HydPipe penstock(
         z_in = 80,  -- Non default value.
         z_out = 5,  -- Non default value.
         l = 100,  -- Non default value.
         d = 1,  -- Non default value.
         f = 0.02,
         dp_lam = 1000)
   HYDRAULIC.Fluid(
         user_defined = FALSE,
         fluid = Water   ) Fluid(
         rho_user_defined = 1000,
         cp_user_defined = 4186)
   MECHANICAL.R_ActuatorVelocity Generator
   CONTROL.AnalogSource(
         n_out = 1   ) rpm_set(
         source = Source_Constant,
         Amp = 3000,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.Gain(
         n = 1   ) rpm_to_rads(
         k = 0.10472  -- Non default value.
   )
   HYDRAULIC.HydTurbine(
         RotorFlag = FALSE   ) Turbine(
         V_disp = 0.001,  -- Non default value.
         eta_vol = 0.95,
         eta_hyd = 0.85,
         eta_mech = 0.95,
         I = 0.1)
   HYDRAULIC.Outlet(
         dyn = FALSE   ) Outlet(
         tau = 0.1)
   HYDRAULIC.Inlet(
         dyn = FALSE   ) Inlet(
         tau = 0.1)

   CONNECT rpm_to_rads.s_out TO Generator.s_in

   CONNECT rpm_set.s_out TO rpm_to_rads.s_in

   CONNECT Upper_Reservoir.hp_out TO penstock.hp_in

   CONNECT Lower_Reservoir.hp_out TO Fluid.hp_in

   CONNECT penstock.hp_out TO Turbine.hp_in

   CONNECT Turbine.hp_out TO Lower_Reservoir.hp_in

   CONNECT Generator.m_out TO Turbine.sh

   CONNECT Fluid.hp_out TO Outlet.f_in

   CONNECT Inlet.f_out TO Upper_Reservoir.hp_in



END COMPONENT