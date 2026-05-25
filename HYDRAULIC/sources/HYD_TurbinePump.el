-- Libraries
USE PORTS_LIB 
USE MATH 

CONST REAL C_AngSpeed = 60/(2*MATH.PI)  "Factor to convert from rad/s to rpm"


USE MATH
USE PORTS_LIB

--------------------------------------------------------------------------------
-- Abstract component for Pumps and Turbine
--------------------------------------------------------------------------------
ABSTRACT COMPONENT HydMachines IS_A HydChannel (BOOLEAN RotorFlag = FALSE "Flag to take into account mechanical inertia of pump rotor")
   PORTS
      IN mech_rot sh            "Rotational shaft (torque and angular speed)"
      
   DATA
      REAL V_disp = 1e-4         UNITS u_m3       "Volumetric displacement"
      REAL eta_vol = 0.95        UNITS no_units   "Volumetric efficiency. Losses due to fluid internal leakage."
      REAL eta_hyd = 0.85        UNITS no_units   "Hydraulic efficiency. Losses due to flow friction/turbulence."
      REAL eta_mech = 0.95       UNITS no_units   "Mechanical efficiency. Losses due to friction in moving components"
      REAL I = 0.1               UNITS u_kg_m2    "Rotor moment of inertia"
   
   DECLS
      REAL Q_i                   UNITS u_m3_s      "Ideal volumetric flow rate"
      REAL Q                     UNITS u_m3_s      "Actual volumetric flow rate"
      REAL w                     UNITS u_kg_s      "Actual mass flow rate"
      REAL dP                    UNITS u_Pa        "Pressure difference"
      REAL P_i                   UNITS u_W         "Ideal power"
      REAL P_mech                UNITS u_W         "Mechanical power"
      REAL q_losses              UNITS u_W         "Power losses transformed into heat"
      REAL dT                    UNITS u_K         "Temperature difference between inlet and outlet"
      REAL eta                   UNITS no_units    "Total efficiency"
      REAL T                     UNITS u_Nm        "Torque to/from shaft"
      
      CLOSE z_in = 0
      CLOSE z_out = 0

   CONTINUOUS
      -- Mass and volumetric flow
      Q_i = V_disp * sh.omega / (2*MATH.PI)
      Q = eta_vol * Q_i
      w = Q * rho
      hp_out.w = w
      hp_in.w = hp_out.w

      -- Pressure difference
      dP = (hp_out.p - hp_in.p)
      
      -- Ideal consumed/generated power
      P_i = dP*Q_i
      
      --Total efficiency
      eta = eta_vol*eta_hyd*eta_mech
      
      -- Outlet temperature
      dT = q_losses/(cp * max(1e-4,w))
      hp_out.T = hp_in.T + dT
      
      -- Required/generated torque
      T = P_mech/max(1e-4,sh.omega)

END COMPONENT

--------------------------------------------------------------------------------
-- Component that represents a Pump
--------------------------------------------------------------------------------
COMPONENT HydPump IS_A HydMachines
   "Hydraulic pump"
      
   CONTINUOUS      
      -- Power calculation
      P_mech = P_i/eta
      
      --Thermal losses
      q_losses = abs(P_mech)*(1-eta)
      
      -- Rotor dynamics
      IF (RotorFlag) INSERT
         I * sh.omega' = sh.T - T
      ELSE
         sh.T = T
      END IF

END COMPONENT

--------------------------------------------------------------------------------
-- Component that represents a Turbine
--------------------------------------------------------------------------------
COMPONENT HydTurbine IS_A HydMachines
   "Hydraulic Turbine"

   CONTINUOUS   
      -- Power calculation
      P_mech = P_i*eta
      
      -- Thermal losses
      q_losses = abs(P_mech)*(1/eta-1)
      
      -- Rotor dynamics
      IF (RotorFlag) INSERT
         I * sh.omega' = T - sh.T
      ELSE
         sh.T = T
      END IF
      
END COMPONENT

