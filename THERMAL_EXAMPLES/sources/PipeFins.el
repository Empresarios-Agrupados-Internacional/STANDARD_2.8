-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL
USE CONTROL



-- EL code of the schematic.

COMPONENT PipeFins 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) Input_T(
         source = Source_Sine,  -- Non default value.
         Amp = 120,  -- Non default value.
         Tstart = 0,
         Offset = 273.15,  -- Non default value.
         Phase = 0,
         Period = 92.68*60,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   THERMAL.BNode(
         n = 1   ) Environment(
         Label = "Node Label",
         qi = 0)
   THERMAL.Cylinder_AI(
         nz = 1,   -- Non default value.
         nr = 1   -- Non default value.
   ) Pipe(
         L = 2,  -- Non default value.
         Di = 0.2,  -- Non default value.
         Do = 0.22,  -- Non default value.
         num = 1,
         mat = Titanium,  -- Non default value.
         k = 0.1,
         rho = 1000,
         cp = 500,
         TemperatureDependance = TRUE,
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.HeatFlowMultiplier(
         n = 1   ) Multiplier(
         k = 1/10  -- Non default value.
   )
   THERMAL.Radiator(
         nx = 5,
         ny = 1   -- Non default value.
   ) Fin(
         mat = Copper,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         n_fin = 1,
         num = 1,
         Lx = 0.3,  -- Non default value.
         Ly = 2,  -- Non default value.
         e = 0.003,  -- Non default value.
         emiss1 = 0.85,
         alpha1 = 0.25,
         F1 = 0.9,
         beta1 = 0,
         emiss2 = 0.85,
         alpha2 = 0.25,
         F2 = 0,
         beta2 = 0,
         To = 290)

   CONNECT Input_T.s_out TO Environment.s_temperature

   CONNECT Pipe.tpr_out TO Multiplier.tp_in

   CONNECT Multiplier.tp_out TO Fin.tp_in

   CONNECT Fin.tp_2 TO Environment.tp_in

   CONNECT Fin.tp_1 TO Environment.tp_in



END COMPONENT