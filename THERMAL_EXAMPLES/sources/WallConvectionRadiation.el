-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL
USE CONTROL



-- EL code of the schematic.

COMPONENT WallConvectionRadiation 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) Input_T(
         source = Source_Constant,
         Amp = 1,
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   THERMAL.BNode(
         n = 1   ) Env_parallel(
         Label = "Node Label",
         qi = 0)
   THERMAL.BNode(
         n = 1   ) Env_series(
         Label = "Node Label",
         qi = 0)
   THERMAL.FreeConvec_Plate(
         n = 1,
         position = wall,
         thermal_fluid = Air   ) Convection_parallel(
         A = 50,  -- Non default value.
         Lc = 0.1,
         P = 101325,
         Grav = 9.80665)
   THERMAL.FreeConvec_Plate(
         n = 1,
         position = wall,
         thermal_fluid = Air   ) Convection_series(
         A = 50,  -- Non default value.
         Lc = 0.1,
         P = 101325,
         Grav = 9.80665)
   THERMAL.GR(
         n = 1   ) Radiation_parallel(
         REF = 50  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) Radiation_series(
         REF = 50  -- Non default value.
   )
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) Wall_parallel(
         mat = GCF,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 50,  -- Non default value.
         e = 0.1,
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) Wall_series(
         mat = GCF,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 50,  -- Non default value.
         e = 0.1,
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })

   CONNECT Input_T.s_out TO Env_parallel.s_temperature

   CONNECT Input_T.s_out TO Env_series.s_temperature

   CONNECT Convection_parallel.tp_fluid TO Env_parallel.tp_in

   CONNECT Convection_series.tp_fluid TO Env_series.tp_in

   CONNECT Radiation_parallel.tp_out TO Env_parallel.tp_in

   CONNECT Radiation_series.tp_out TO Convection_series.tp_surface

   CONNECT Wall_parallel.tp_out TO Convection_parallel.tp_surface

   CONNECT Wall_parallel.tp_out TO Radiation_parallel.tp_in

   CONNECT Wall_series.tp_out TO Radiation_series.tp_in



END COMPONENT