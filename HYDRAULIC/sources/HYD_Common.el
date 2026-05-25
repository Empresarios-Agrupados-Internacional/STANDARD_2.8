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
USE MATH 

-- Global constant
CONST REAL g = 9.806   UNITS u_m_s2     "Gravity acceleration"

-- Available hydraulic fluids
ENUM hyd_fluid = \
  {
  Water,
  Water_Glycol_6040,
  Water_Glycol_5050,
  Water_Glycol_4060,
  Synthetic_Oil,
  Mineral_Oil
  }
  
-- Density vs fluid
CONST REAL rho_fluid[hyd_fluid] = \
  {
  1000, --Water
  1080, --Water_Glycol_6040
  1100, --Water_Glycol_5050
  1120, --Water_Glycol_4060
  860,  --Synthetic_Oil
  880   --Mineral_Oil
  }
  
-- Specific heat vs fluid
CONST REAL cp_fluid[hyd_fluid] = \
  {
  4186, --Water
  3500, --Water_Glycol_6040
  3300, --Water_Glycol_5050
  3000, --Water_Glycol_4060
  2000, --Synthetic_Oil
  1670  --Mineral_Oil
  }