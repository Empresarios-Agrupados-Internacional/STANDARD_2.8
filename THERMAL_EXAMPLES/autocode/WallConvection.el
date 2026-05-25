-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT WallConvection 

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
         n = 1   ) Environment(
         Label = "Node Label",
         qi = 0)
   THERMAL.FreeConvec_Plate(
         n = 1,
         position = wall,
         thermal_fluid = Air   ) Convection(
         A = 200,  -- Non default value.
         Lc = 0.1,
         P = 101325,
         Grav = 9.80665)
   THERMAL.Wall(
         n = 1,
         nodes = 10   ) Wall(
         mat = Aluminum,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 200,  -- Non default value.
         e = 0.5,  -- Non default value.
         init_mode = Constant_Temp,
         To = 298,  -- Non default value.
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })

   CONNECT Input_T.s_out TO Environment.s_temperature

   CONNECT Convection.tp_fluid TO Environment.tp_in

   CONNECT Wall.tp_out TO Convection.tp_surface



END COMPONENT