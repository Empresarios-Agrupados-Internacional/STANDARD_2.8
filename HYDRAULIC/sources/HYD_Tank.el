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

-- Components
--------------------------------------------------------------------------------
-- Component that represents a tank
--------------------------------------------------------------------------------
COMPONENT HydTank IS_A HydChannel
   "Uncovered Tank"

   PORTS
      OUT analog_signal s_level   "Output level signal port"

   DATA
      REAL A = 1            UNITS u_m2          "Cross area of the tank"
      REAL p_atm = 101325   UNITS u_Pa          "Atmospheric pressure"
      REAL To = 293.15      UNITS u_K           "Initial fluid temperature"
      REAL Ho = 10          UNITS u_m           "Initial level"

   DECLS
      REAL H     UNITS u_m        "Level"
      REAL m     UNITS u_kg       "Mass"
      REAL T     UNITS u_K        "Temperature"
      
   INIT
      T = To
      H = Ho
      
   DISCRETE 
      ASSERT (H > -1e8) ERROR INSTANCE_NAME + " tank is empty (H =< 0m)"

   CONTINUOUS
      -- Conservation of mass
      H' = (hp_in.w - hp_out.w) / (rho * A)
      m = H * rho * A

      -- Hydrostatic pressure calculation
      hp_in.p = p_atm + rho * g * max(1e-4,(H - z_in)) --So uncovered inlet port (H < z_in) imposes atmospheric pressure
      hp_out.p = p_atm + rho * g *  max(1e-4,(H - z_out)) --So uncovered outlet (H < z_out) port imposes atmospheric pressure

      -- Conservation of energy
      <E> m * cp * T' + (hp_in.w - hp_out.w) * cp * T = hp_in.wh - hp_out.wh

      hp_out.T = T

      s_level.signal[1] = H

END COMPONENT

--------------------------------------------------------------------------------
-- Component that represents a tank with a thermal port/interface
--------------------------------------------------------------------------------
COMPONENT HydTank_Th IS_A HydTank
   "Tank with a thermal interface"

   PORTS
      IN  thermal (n = 1) tp_in     "Thermal port"
      
   CONTINUOUS
      -- Conservation of energy
      <:E> m * cp * T' + (hp_in.w - hp_out.w) * cp * T = hp_in.wh - hp_out.wh + tp_in.q[1]
      tp_in.Tk[1] = T

END COMPONENT