-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT RadiationNodes 

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
   THERMAL.BNode(
         n = 1   ) Amb(
         Label = "Node Label",
         qi = 0)
   THERMAL.BNode(
         n = 1   ) Amb_mat(
         Label = "Node Label",
         qi = 0)
   THERMAL.BNode(
         n = 1   ) Amb_phases(
         Label = "Node Label",
         qi = 0)
   THERMAL.BNode(
         n = 1   ) Amb_room(
         Label = "Node Label",
         qi = 0)
   THERMAL.DNode(
         n = 1   ) DNode(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 3e4  -- Non default value.
   )
   THERMAL.DNodeMat(
         n = 1   ) DNodeMat(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         mat = Aluminum,  -- Non default value.
         mass = 100,  -- Non default value.
         cp = 500)
   THERMAL.DNodeRoom(
         n = 1   ) DNodeRoom(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         V = 200,  -- Non default value.
         P = 101325,
         thermal_fluid = Air)
   THERMAL.DNphases(
         n = 1   ) DNphases(
         Label = "Node Label",
         qi = 0,
         Mass = 100,  -- Non default value.
         To = 290,
         CP_l = 4186,
         CP_s = 2039,
         CP_v = 1805,
         Hfus = 334000,
         Hvap = 2501000,
         T_fusion = 273.15,
         T_boiling = 373.15)
   THERMAL.GR(
         n = 1   ) Rad(
         REF = 30  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) Rad_mat(
         REF = 30  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) Rad_phases(
         REF = 30  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) Rad_room(
         REF = 30  -- Non default value.
   )

   CONNECT T_amb.s_out TO Amb.s_temperature

   CONNECT T_amb.s_out TO Amb_mat.s_temperature

   CONNECT T_amb.s_out TO Amb_phases.s_temperature

   CONNECT T_amb.s_out TO Amb_room.s_temperature

   CONNECT Rad.tp_out TO Amb.tp_in

   CONNECT Rad.tp_in TO DNode.tp_in

   CONNECT Rad_mat.tp_out TO Amb_mat.tp_in

   CONNECT Rad_mat.tp_in TO DNodeMat.tp_in

   CONNECT Rad_phases.tp_out TO Amb_phases.tp_in

   CONNECT Rad_phases.tp_in TO DNphases.tp_in

   CONNECT Rad_room.tp_out TO Amb_room.tp_in

   CONNECT Rad_room.tp_in TO DNodeRoom.tp_in



END COMPONENT