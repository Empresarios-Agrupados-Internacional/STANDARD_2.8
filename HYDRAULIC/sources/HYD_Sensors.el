--------------------------------------------------------------------------------
-- (c) Empresarios Agrupados - EcosimPro Simulation Source Code
-- FILE NAME: HYD_Common.el
-- DESCRIPTION: Defines the common constants, ports, and components for
--    hydraulic simulation
-- NOTES:
-- AUTHOR: Ramon Perez Vara
-- CREATION DATE: 7/12/2000
--------------------------------------------------------------------------------


-- Libraries
USE PORTS_LIB 
USE MATH 
USE CONTROL 

--------------------------------------------------------------------------------
-- Abstract component for definition of hydraulic sensors
--------------------------------------------------------------------------------
ABSTRACT COMPONENT HydFluidMeter IS_A ASensor, HydChannel
   "Abstract component for hydraulic sensors"

   CONTINUOUS
      -- Conservation of port variables
      hp_out.w = hp_in.w
      hp_out.p = hp_in.p
      hp_out.T = hp_in.T

END COMPONENT

--------------------------------------------------------------------------------
-- Component that represents a mass flow meter
--------------------------------------------------------------------------------
COMPONENT HydFlowMeter IS_A HydFluidMeter
   "Mass flow meter"

   CONTINUOUS
      var[1] = hp_in.w

END COMPONENT

--------------------------------------------------------------------------------
-- Component that represents a pressure meter
--------------------------------------------------------------------------------
COMPONENT HydPressureMeter IS_A HydFluidMeter
   "Pressure meter"

   CONTINUOUS
      var[1] = hp_in.p

END COMPONENT

--------------------------------------------------------------------------------
-- Component that represents a temperature meter
--------------------------------------------------------------------------------
COMPONENT HydTemperatureMeter IS_A HydFluidMeter
   "Temperature meter"

   CONTINUOUS
      var[1] = hp_in.T

END COMPONENT