--------------------------------------------------------------------------------
-- (c) Empresarios Agrupados - EcosimPro Simulation Source Code
-- FILE NAME: HYD_Pipe.el
-- AUTHOR: Ramon Perez Vara
-- CREATION DATE: 7/12/2000
--------------------------------------------------------------------------------

-- Libraries
USE PORTS_LIB 
USE MATH 

--------------------------------------------------------------------------------
-- Component that represents a pipe
--------------------------------------------------------------------------------
COMPONENT HydPipe IS_A HydChannel
   "Pipe"

   DATA
      REAL l = 1.    UNITS u_m             "Lenght"
      REAL d = 0.1   UNITS u_m             "Diameter"

      REAL f = 0.020  UNITS no_units       "Friction factor"

      REAL dp_lam = 1000. UNITS u_Pa       "Pressure drop for laminar flow"

   DECLS
      REAL A      UNITS u_m2               "Area"

      REAL w_lam  UNITS u_kg_s             "Mass flow corresponding to 'dp_lam'"

   CONTINUOUS
      -- Geometry
      A = 0.25 * PI * d**2

      -- Laminar flow condition
      w_lam = A * sqrt(2 * d * dp_lam * rho / (f * l))

      -- Conservation of mass
      hp_out.w = hp_in.w

      -- Conservation of momentum
      hp_in.p - hp_out.p + rho * g * (z_in - z_out) = \
         0.5 * f * l * fpow2(hp_in.w, w_lam) / (d * rho * A**2)

      -- Conservation of energy
      <T>hp_out.T = hp_in.T

END COMPONENT

--------------------------------------------------------------------------------
-- Component that represents a pipe with a thermal port/interface
--------------------------------------------------------------------------------
COMPONENT HydPipe_Th IS_A HydPipe
   "Tank with a thermal interface"

   PORTS
      IN  thermal (n = 1) tp_in     "Thermal port"
      
   DATA
      REAL To = 293.15   UNITS u_K     "Initial temperature"
    
   DECLS
      REAL m    UNITS u_kg    "Liquid mass"
      REAL T    UNITS u_K     "Temperature"
    
   INIT
      T = To
      
   CONTINUOUS
      -- Liquid mass
      m = rho*A*l
      
      -- Conservation of energy
      m * cp * T' + (hp_in.w - hp_out.w) * cp * T = hp_in.wh - hp_out.wh + tp_in.q[1]
      <:T> hp_out.T = T
      tp_in.Tk[1] = T

END COMPONENT