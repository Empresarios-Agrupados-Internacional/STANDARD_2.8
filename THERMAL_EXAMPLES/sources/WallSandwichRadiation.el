-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL
USE CONTROL



-- EL code of the schematic.

COMPONENT WallSandwichRadiation 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) Input_T(
         source = Source_Constant,
         Amp = 280,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   THERMAL.BNode(
         n = 1   ) Environment(
         Label = "Node Label",
         qi = 0)
   THERMAL.GR(
         n = 1   ) Radiation(
         REF = 50  -- Non default value.
   )
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) Inner_wall(
         mat = GCF,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 5,  -- Non default value.
         e = 0.01,  -- Non default value.
         init_mode = Constant_Temp,
         To = 293,  -- Non default value.
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) Middle_wall(
         mat = Titanium,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 5,  -- Non default value.
         e = 0.005,  -- Non default value.
         init_mode = Constant_Temp,
         To = 293,  -- Non default value.
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) Outer_wall(
         mat = GCF,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.01,  -- Non default value.
         TemperatureDependance = TRUE,
         A = 5,  -- Non default value.
         e = 0.01,  -- Non default value.
         init_mode = Constant_Temp,
         To = 293,  -- Non default value.
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })

   CONNECT Input_T.s_out TO Environment.s_temperature

   CONNECT Radiation.tp_out TO Environment.tp_in

   CONNECT Inner_wall.tp_out TO Middle_wall.tp_in

   CONNECT Middle_wall.tp_out TO Outer_wall.tp_in

   CONNECT Outer_wall.tp_out TO Radiation.tp_in



END COMPONENT