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

--------------------------------------------------------------------------------
-- Component that represents a valve
--------------------------------------------------------------------------------
COMPONENT HydValve IS_A HydChannel
   "Valve"

   PORTS
      IN analog_signal s_position "Output position signal"

   DATA
      REAL Avo = 0.020  	UNITS u_m2       "Valve area at fully open position"

      REAL dp_lam = 1000.  UNITS u_Pa       "Pressure drop for laminar flow"

   DECLS
      REAL Av              UNITS u_m2      "Valve area"

   CONTINUOUS
      -- Geometry
      Av = Avo * s_position.signal[1]

      -- Conservation of mass
      hp_out.w = hp_in.w

      -- Conservation of momentum
      IMPL(hp_in.w) hp_in.w = Av * sqrt(rho) * \
         fsqrt(hp_in.p - hp_out.p - rho * g * (z_in - z_out), dp_lam)

      -- Conservation of energy
      hp_out.T = hp_in.T

END COMPONENT
