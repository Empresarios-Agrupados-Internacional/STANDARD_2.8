-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE THERMAL
USE CONTROL VERSION "5.0.6"
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.

COMPONENT ControlledWallHeating 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) T_amb(
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
   CONTROL.AnalogSource(
         n_out = 1   ) T_set(
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
   CONTROL.Cntrl_PID(
         n = 1   ) PID(
         k = 100,  -- Non default value.
         u_min = 0,
         u_max = 50000,  -- Non default value.
         end_pos = end_I,
         Ti = 100,
         gamma = 0.1,
         beta = 1,
         Td = 0.01,  -- Non default value.
         alpha = 0.1)
   THERMAL.BNode(
         n = 1   ) Ambient(
         Label = "Node Label",
         qi = 0)
   THERMAL.FreeConvec_Plate(
         n = 1,
         position = wall,
         thermal_fluid = Air   ) Convection(
         A = 30,  -- Non default value.
         Lc = 0.1,
         P = 101325,
         Grav = 9.80665)
   THERMAL.GR(
         n = 1   ) Radiation(
         REF = 30  -- Non default value.
   )
   THERMAL.Heater(
         n = 1   ) Heater
   THERMAL.T_sensor(
         n_out = 1,
         n = 1,
         in = 1   ) T_sens(
         gain = 1,
         bias = 0)
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) Inner_wall(
         mat = Aluminum,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 30,  -- Non default value.
         e = 0.1,
         init_mode = Constant_Temp,
         To = 290,
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
         A = 30,  -- Non default value.
         e = 0.2,  -- Non default value.
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })
   THERMAL.Wall(
         n = 1,
         nodes = 1   -- Non default value.
   ) Outer_wall(
         mat = Aluminum,  -- Non default value.
         rho = 1000,
         cp = 500,
         k = 0.1,
         TemperatureDependance = TRUE,
         A = 30,  -- Non default value.
         e = 0.1,
         init_mode = Constant_Temp,
         To = 290,
         To_linear = { 290,290},
         To_table = { { 0,1} ,{ 290,290} })

   CONNECT T_amb.s_out TO Ambient.s_temperature

   CONNECT T_set.s_out TO PID.s_set

   CONNECT PID.s_out TO Heater.s_power

   CONNECT Convection.tp_fluid TO Ambient.tp_in

   CONNECT Radiation.tp_out TO Ambient.tp_in

   CONNECT Heater.tp_out TO Inner_wall.tp_in

   CONNECT T_sens.s_out TO PID.s_var

   CONNECT T_sens.tp_in TO Inner_wall.tp_in

   CONNECT Inner_wall.tp_out TO Middle_wall.tp_in

   CONNECT Middle_wall.tp_out TO Outer_wall.tp_in

   CONNECT Outer_wall.tp_out TO Convection.tp_surface

   CONNECT Outer_wall.tp_out TO Radiation.tp_in



END COMPONENT