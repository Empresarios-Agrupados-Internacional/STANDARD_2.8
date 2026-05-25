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

-- Abstract components
--------------------------------------------------------------------------------
-- Abstract component for definition of hydraulic channels
--------------------------------------------------------------------------------
ABSTRACT COMPONENT HydChannel
   "Abstract component for hydraulic channels"

   PORTS
      IN hyd hp_in          "Inlet hydraulic port" 
      OUT hyd hp_out        "Outlet hydraulic port"

   DATA
      REAL z_in = 0.  UNITS u_m   "Geometric elevation of inlet"
      REAL z_out = 0. UNITS u_m   "Geometric elevation of outlet"
      
   DECLS
      BOUND REAL rho          UNITS u_kg_m3    "Density of hydraulic fluid"
      BOUND REAL cp           UNITS u_J_kgK    "Specific heat of hydraulic fluid"
   
   DISCRETE
      ASSERT (hp_in.p >= 1e-4) FATAL INSTANCE_NAME + " inlet pressure is going below 0 Pa"
      ASSERT (hp_out.p >= 1e-4) FATAL INSTANCE_NAME + " outlet pressure is going below 0 Pa"
    
   CONTINUOUS
      rho = hp_in.rho
      cp = hp_in.cp
      
      hp_out.rho = hp_in.rho
      hp_out.cp = hp_in.cp

END COMPONENT

-- Components
--------------------------------------------------------------------------------
-- Component to define the working fluid
--------------------------------------------------------------------------------
COMPONENT Fluid IS_A HydChannel
  (
    BOOLEAN user_defined = FALSE  UNITS no_units    "If TRUE, cp and rho are defined by the user",
    ENUM hyd_fluid fluid = Water  UNITS no_units    "Working hydraulic fluid"
  )
"Working hydraulic fluid definition"

  DATA
    REAL rho_user_defined = 1000    UNITS u_kg_m3     "User defined density"
    REAL cp_user_defined = 4186     UNITS u_J_kgK     "User defined specific heat"
    
  DECLS
    CLOSE z_in = 0
    CLOSE z_out = 0
    
  INIT
    -- Initialization of fluid properties
    IF user_defined THEN
      hp_in.rho = rho_user_defined
      hp_in.cp = cp_user_defined
    ELSE
      hp_in.rho = rho_fluid[fluid]
      hp_in.cp = cp_fluid[fluid]
    END IF
    
  CONTINUOUS
    -- Fluid properties calculation
    IF user_defined INSERT
      hp_in.rho = rho_user_defined
      hp_in.cp = cp_user_defined
    ELSE
      hp_in.rho = rho_fluid[fluid]
      hp_in.cp = cp_fluid[fluid]
    END IF
    
    -- Conservation of port variables
    hp_out.w = hp_in.w
    hp_out.p = hp_in.p
    hp_out.T = hp_in.T
    
END COMPONENT
