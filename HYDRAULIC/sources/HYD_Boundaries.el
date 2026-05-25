/*-----------------------------------------------------------------------------------------
 LIBRARY: HYDRAULIC
 FILE: HYD_Bounds
 AUTHOR: 
 COMPANY: 
 DESCRIPTION: 
 CREATION DATE: 02/07/2024
-----------------------------------------------------------------------------------------*/

USE PORTS_LIB
USE MATH

-------------------------------------------------------------------
-- Inlet component
-------------------------------------------------------------------
COMPONENT Inlet (BOOLEAN dyn = FALSE UNITS no_units "If TRUE, mass flow follows 1st order transfer function using tau parameter")
"Inlet boundary component"

   PORTS
      IN analog_signal s_temp
      IN analog_signal s_press
      IN analog_signal s_mflow
      OUT hyd f_out
   
   DATA
      REAL tau = 0.1  UNITS u_s "Characteristic time to setting up required mass flow"
      
   INIT
      
   CONTINUOUS
      f_out.T = s_temp.signal[1]
      f_out.p = s_press.signal[1]
      IF dyn INSERT
        f_out.w' = (s_mflow.signal[1]-f_out.w)/tau
      ELSE 
        f_out.w = s_mflow.signal[1]
      END IF
      
END COMPONENT

-------------------------------------------------------------------
-- Outlet component
-------------------------------------------------------------------
COMPONENT Outlet (BOOLEAN dyn = FALSE UNITS no_units "If TRUE, mass flow follows 1st order transfer function using tau parameter")
"Outlet boundary component"

   PORTS
      IN analog_signal s_temp
      IN analog_signal s_press
      IN analog_signal s_mflow
      IN hyd f_in
   
   DATA
      REAL tau = 0.1  UNITS u_s "Characteristic time to setting up required mass flow"
      
   INIT
      
   CONTINUOUS
      f_in.T = s_temp.signal[1]
      f_in.p = s_press.signal[1]
      IF dyn INSERT
        f_in.w' = (s_mflow.signal[1]-f_in.w)/tau
      ELSE 
        f_in.w = s_mflow.signal[1]
      END IF
      
END COMPONENT

