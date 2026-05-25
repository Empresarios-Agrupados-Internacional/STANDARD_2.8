-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE HYDRAULIC
USE MECHANICAL
USE CONTROL VERSION "5.0.6"



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Example_HydroTurb_torque 

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
   MECHANICAL.R_ActuatorTorque Generator
   MECHANICAL.R_AbsoluteSensorVelocity(
         n_out = 1   ) SensorVelocity_rpm(
         gain = 9.5493,  -- Non default value.
         bias = 0)
   CONTROL.Cntrl_PI(
         n = 1   ) Cntrl_PI(
         k = -0.1,  -- Non default value.
         u_min = -1000,  -- Non default value.
         u_max = 0,  -- Non default value.
         end_pos = end_I,
         Ti = 10,  -- Non default value.
         gamma = 0.1,
         beta = 1)
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
   HYDRAULIC.HydTurbine(
         RotorFlag = TRUE   -- Non default value.
   ) Turbine(
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

   CONNECT Upper_Reservoir.hp_out TO penstock.hp_in

   CONNECT Lower_Reservoir.hp_out TO Fluid.hp_in

   CONNECT Generator.m_out TO SensorVelocity_rpm.m_in

   CONNECT Cntrl_PI.s_out TO Generator.s_in

   CONNECT SensorVelocity_rpm.s_out TO Cntrl_PI.s_var

   CONNECT rpm_set.s_out TO Cntrl_PI.s_set

   CONNECT penstock.hp_out TO Turbine.hp_in

   CONNECT Turbine.hp_out TO Lower_Reservoir.hp_in

   CONNECT Generator.m_out TO Turbine.sh

   CONNECT Fluid.hp_out TO Outlet.f_in

   CONNECT Inlet.f_out TO Upper_Reservoir.hp_in



END COMPONENT