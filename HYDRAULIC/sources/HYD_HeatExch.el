/*-----------------------------------------------------------------------------------------
 LIBRARY: HYDRAULIC
 FILE: HYD_HeatExch
 CREATION DATE: 23/07/2024
-----------------------------------------------------------------------------------------*/

-- Libraries
USE PORTS_LIB 
USE MATH

--------------------------------------------------------------------------------
-- Component that represents a heat exchanger
--------------------------------------------------------------------------------

COMPONENT HydHex_old "Heat exchanger model based on the calculation of the thermal effectiveness"

   PORTS
      IN  hyd hp_hot_in       "Hot inlet" 
      OUT hyd hp_hot_out      "Hot outlet"
      IN  hyd hp_cold_in      "Cold inlet" 
      OUT hyd hp_cold_out     "Cold outlet"

   DATA
      REAL vol_cold = 1.e-3    UNITS u_m3        "Fluid volume of the cold side"
      REAL vol_hot  = 1.e-3    UNITS u_m3        "Fluid volume of the hot side"
      REAL m_dry_hot = 1.e-2   UNITS u_kg        "Mass of material in hot side"
      REAL m_dry_cold = 1.e-2  UNITS u_kg        "Mass of material in cold side"
      REAL w_hot_ref = 0.1     UNITS u_kg_s      "Reference mass flow for hot side dp"
      REAL w_cold_ref = 0.1    UNITS u_kg_s      "Reference mass flow for cold side dp data"
      REAL dp_hot_ref = 100.   UNITS u_bar       "Reference pressure loss in hot side"  
      REAL dp_cold_ref = 100.  UNITS u_bar       "Reference pressure loss in cold side"
      REAL n_hot_exp= 2.       UNITS no_units    "Flow exponent in the pressure loss equation of the hot side"
      REAL n_cold_exp=2.       UNITS no_units    "Flow exponent in the pressure loss equation of the cold side"

      BOOLEAN const_eff = FALSE                   "Option to choose between a constant effectiveness and an interpolation of a 1D table with the effectiveness vs the hot and cold flows"
      REAL eff = 0.9           UNITS no_units    "Heat exchanger effectiveness. Will be taken as 1 if eff > 1 and as 0 if eff < 0."
      TABLE_2D eff_vs_flows = \
             {   {0.095, 0.284, 0.474, 0.664, 0.853, 1.04},
              {0.519, 1.0, 1.46, 1.89, 2.33, 2.5},
       { {0.999 , 0.999 , 0.999 , 0.999 , 0.999 , 0.999} ,
         {0.9948, 0.999 , 0.999 , 0.999 , 0.999 , 0.999} , 
         {0.947 , 0.9894, 0.9948, 0.9965, 0.9973, 0.9975}, 
         {0.8471, 0.9625, 0.9808, 0.987 , 0.990 , 0.9907},
         {0.7332, 0.919 , 0.9596, 0.9703, 0.9770, 0.9787}, 
         {0.6316, 0.8652, 0.9249, 0.9474, 0.9589, 0.9619}
       }
      }  "Table of heat exchanger effectiveness versus adimensional hot fluid flow and cold fluid flow"


     REAL   T_cold_out_i = 293      UNITS u_K   "Initial temperature at cold outlet"  
     REAL   T_hot_out_i =  293      UNITS u_K   "Initial temperature at hot outlet"

   DECLS     
      --heat exchanger section:
      REAL cp_hot    UNITS u_J_kgK  "Cp of hot side fluid (J/kgK)"
      REAL cp_cold   UNITS u_J_kgK  "Cp of cold side fluid (J/kgK)"
      REAL rho_hot   UNITS u_kg_m3  "Density of hot side fluid (kg/m3)"
      REAL rho_cold  UNITS u_kg_m3  "Density of cold side fluid (kg/m3)"
      REAL w_hot     UNITS u_kg_s   "Mass flow in the hot side (kg/s)"
      REAL w_cold    UNITS u_kg_s   "Mass flow in the cold side (kg/s)"
      REAL T_hot_in  UNITS u_K      "Inlet temperature in the hot side (K)"
      REAL T_cold_in UNITS u_K      "Inlet temperature in the cold side (K)"
      REAL hex_eff   UNITS no_units   "Heat exchanger effectiveness (-)"
      REAL qex       UNITS u_W      "Total heat flow exchanged (W)"
      REAL qmax      UNITS u_W      "Maximum limit for the heat flow exchange (W)"
      REAL T_hot     UNITS u_K   "Outlet temperature of the hot side (K)"
      REAL T_cold    UNITS u_K   "Outlet temperature of the cold side (K)"

    INIT
        --Initialisation of cold outlet temperature:
        T_cold = T_cold_out_i
        T_hot = T_hot_out_i
    
    CONTINUOUS
        -----------------------------------------------------------------
        --Ports connections:
        -----------------------------------------------------------------        
        hp_hot_in.cp = hp_hot_out.cp
        hp_cold_in.cp = hp_cold_out.cp
        hp_hot_in.rho = hp_hot_out.rho
        hp_cold_in.rho = hp_cold_out.rho
        
        -----------------------------------------------------------------
        --Auxiliary variables:
        -----------------------------------------------------------------  
        hp_cold_in.w = w_cold
        hp_cold_out.w = w_cold
        hp_hot_in.w = w_hot
        hp_hot_out.w = w_hot
        
        hp_hot_in.cp = cp_hot
        hp_cold_in.cp = cp_cold
        
        hp_hot_in.rho = rho_hot
        hp_cold_in.rho = rho_cold
        
        -----------------------------------------------------------------
        --Energy equations:
        -----------------------------------------------------------------
        T_hot_in = donor_cell(w_hot, hp_hot_in.T, hp_hot_out.T)
        T_cold_in = donor_cell(w_cold, hp_cold_in.T, hp_cold_out.T)

        hex_eff = IF (const_eff) min(1.,max(0.,eff))
                  ELSE min(1., linearInterp2D(eff_vs_flows, abs(w_hot) / w_hot_ref, 
                          abs(w_cold) / w_cold_ref))

        qmax = min(abs(w_hot*cp_hot), abs(w_cold*cp_cold)) * (T_hot_in - T_cold_in)

        qex = hex_eff * qmax
        
        cp_hot*T_hot' = (cp_hot*(hp_hot_in.T - hp_hot_out.T)*w_hot - qex) / \
                  (rho_hot * vol_hot + m_dry_hot) --Review. Cp of dry material might not be the same of the fluid


        cp_cold*T_cold' = (cp_cold*(hp_cold_in.T - hp_cold_out.T)*w_cold + qex) / \  
                  (rho_cold * vol_cold + m_dry_cold) --Review. Cp of dry material might not be the same of the fluid
                  
        hp_cold_out.T = T_cold

        hp_hot_out.T = T_hot
        
       ----------------------------------------------------------------
       --Momentum equations                                          
       ----------------------------------------------------------------
        hp_hot_in.p*1e-5 - hp_hot_out.p*1e-5 - dp_hot_ref * \
            (w_hot * abs(w_hot)**(n_hot_exp-1.) / w_hot_ref**n_hot_exp)  = 0.

        hp_cold_in.p*1e-5 - hp_cold_out.p*1e-5 - dp_cold_ref * \
            (w_cold * abs(w_cold)**(n_cold_exp-1.) / w_cold_ref**n_cold_exp) = 0.
    

END COMPONENT

COMPONENT HydHex "Heat exchanger model based on the calculation of the thermal effectiveness"

   PORTS
      IN  hyd hp_hot_in       "Hot inlet" 
      OUT hyd hp_hot_out      "Hot outlet"
      IN  hyd hp_cold_in      "Cold inlet" 
      OUT hyd hp_cold_out     "Cold outlet"

   DATA
      REAL l = 1.                UNITS u_m         "Lenght"
      REAL vol_cold = 1.e-3      UNITS u_m3        "Fluid volume of the cold side"
      REAL vol_hot  = 1.e-3      UNITS u_m3        "Fluid volume of the hot side"
      REAL m_dry_hot = 1.e-2     UNITS u_kg        "Mass of material in hot side"
      REAL m_dry_cold = 1.e-2    UNITS u_kg        "Mass of material in cold side"
      REAL cp_dry = 460          UNITS u_J_kgK     "Cp of dry material"
      REAL w_hot_ref = 0.1       UNITS u_kg_s      "Reference mass flow for hot side dp and efficiency" -- bloquear si eff = cte
      REAL w_cold_ref = 0.1      UNITS u_kg_s      "Reference mass flow for cold side dp data and efficiency"
      REAL dp_lam_hot = 1000.    UNITS u_Pa        "Pressure drop for laminar flow in hot side"
      REAL dp_lam_cold = 1000.   UNITS u_Pa        "Pressure drop for laminar flow in cold side"
      REAL f_hot = 0.020         UNITS no_units       "Friction factor of the hot side"
      REAL f_cold = 0.020        UNITS no_units       "Friction factor of the cold side"

      BOOLEAN const_eff = FALSE                   "Option to choose between a constant effectiveness and an interpolation of a 1D table with the effectiveness vs the hot and cold flows"
      REAL eff = 0.9           UNITS no_units    "Heat exchanger effectiveness. Will be taken as 1 if eff > 1 and as 0 if eff < 0."
      TABLE_2D eff_vs_flows = \
             {   {0.095, 0.284, 0.474, 0.664, 0.853, 1.04},
              {0.519, 1.0, 1.46, 1.89, 2.33, 2.5},
       { {0.999 , 0.999 , 0.999 , 0.999 , 0.999 , 0.999} ,
         {0.9948, 0.999 , 0.999 , 0.999 , 0.999 , 0.999} , 
         {0.947 , 0.9894, 0.9948, 0.9965, 0.9973, 0.9975}, 
         {0.8471, 0.9625, 0.9808, 0.987 , 0.990 , 0.9907},
         {0.7332, 0.919 , 0.9596, 0.9703, 0.9770, 0.9787}, 
         {0.6316, 0.8652, 0.9249, 0.9474, 0.9589, 0.9619}
       }
      }  "Table of heat exchanger effectiveness versus adimensional hot fluid flow and cold fluid flow"


     REAL   T_cold_out_i = 293      UNITS u_K   "Initial temperature at cold outlet"  
     REAL   T_hot_out_i =  293      UNITS u_K   "Initial temperature at hot outlet"

   DECLS     
      --heat exchanger section:
      REAL cp_hot             UNITS u_J_kgK        "Cp of hot side fluid"
      REAL cp_cold            UNITS u_J_kgK        "Cp of cold side fluid"
      REAL rho_hot            UNITS u_kg_m3        "Density of hot side fluid"
      REAL rho_cold           UNITS u_kg_m3        "Density of cold side fluid"
      REAL w_hot              UNITS u_kg_s         "Mass flow in the hot side"
      REAL w_cold             UNITS u_kg_s         "Mass flow in the cold side"
      REAL T_hot_in           UNITS u_K            "Inlet temperature in the hot side"
      REAL T_cold_in          UNITS u_K            "Inlet temperature in the cold side"
      REAL hex_eff            UNITS no_units       "Heat exchanger effectiveness"
      REAL qex                UNITS u_W            "Total heat flow exchanged"
      REAL qmax               UNITS u_W            "Maximum limit for the heat flow exchange"
      REAL T_hot              UNITS u_K            "Outlet temperature of the hot side"
      REAL T_cold             UNITS u_K            "Outlet temperature of the cold side"
      REAL d_hot              UNITS u_m            "Diameter of the hot side"
      REAL d_cold             UNITS u_m            "Diameter of the cold side"
      
      
   TOPOLOGY
      HydPipe_Th hot_pipe (
      l = l,
      d = d_hot,
      f = f_hot,
      dp_lam = dp_lam_hot,
      To = T_hot_out_i
      )
      
      HydPipe_Th cold_pipe (
      l = l,
      d = d_cold,
      f = f_cold,
      dp_lam = dp_lam_cold,
      To = T_cold_out_i
      )
      
      CONNECT hot_pipe.hp_in TO hp_hot_in
      CONNECT cold_pipe.hp_in TO hp_cold_in
      CONNECT hot_pipe.hp_out TO hp_hot_out
      CONNECT cold_pipe.hp_out TO hp_cold_out
        
   INIT
      -- Initialisation of cold outlet temperature:
      T_cold = T_cold_out_i
      T_hot = T_hot_out_i

   CONTINUOUS
      -----------------------------------------------------------------
      -- Geometry:
      ----------------------------------------------------------------- 
      d_hot = 2*sqrt(vol_hot/l/PI)
      d_cold = 2*sqrt(vol_cold/l/PI)
      
      -----------------------------------------------------------------
      -- Auxiliary variables:
      -----------------------------------------------------------------  
      hp_cold_in.w = w_cold
      hp_hot_in.w = w_hot
      
      hp_hot_in.cp = cp_hot
      hp_cold_in.cp = cp_cold
      
      hp_hot_in.rho = rho_hot
      hp_cold_in.rho = rho_cold
      
      -----------------------------------------------------------------
      -- Energy equations:
      -----------------------------------------------------------------
      T_hot_in = donor_cell(w_hot, hp_hot_in.T, hp_hot_out.T)
      T_cold_in = donor_cell(w_cold, hp_cold_in.T, hp_cold_out.T)
      
      hex_eff = IF (const_eff) min(1.,max(0.,eff))
               ELSE min(1., linearInterp2D(eff_vs_flows, abs(w_hot) / w_hot_ref, 
                       abs(w_cold) / w_cold_ref))
      
      qmax = min(abs(w_hot*cp_hot), abs(w_cold*cp_cold)) * (T_hot_in - T_cold_in)
      
      qex = hex_eff * qmax
               
      hot_pipe.tp_in.q[1] = - qex - T_hot'*cp_dry*m_dry_hot
      cold_pipe.tp_in.q[1] = qex - T_cold'*cp_dry*m_dry_cold
               
      hp_cold_out.T = T_cold
      
      hp_hot_out.T = T_hot
      
END COMPONENT