-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE CONTROL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.

COMPONENT Example_Counters 

PORTS



TOPOLOGY
   CONTROL.AnalogSource(
         n_out = 1   ) PV_Up(
         source = Source_Constant,
         Amp = 5,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.BooleanToReal(
         n = 1   ) BooleanToReal(
         ValueTrue = 1,
         ValueFalse = 0)
   CONTROL.CLK CLK_1(
         Period = 1,  -- Non default value.
         pulseWidth = 0.5,  -- Non default value.
         Tstart = 0)
   CONTROL.Counter_DOWN Counter_DOWN(
         PVmin = 0)
   CONTROL.Counter_UP Counter_UP(
         PVmax = 100)
   CONTROL.Counter_UP_DOWN Counter_UP_DOWN(
         PVmax = 100,
         PVmin = 0)
   CONTROL.Delay(
         n = 1   ) Delay(
         tdelay = 5  -- Non default value.
   )
   CONTROL.RealToBoolean(
         n = 1   ) RealToBoolean(
         ValueTrue = 0.5,
         ValueFalse = 0.5)
   CONTROL.SourcebConstant(
         n_out = 1   ) SourcebConstant_1(
         k = TRUE)
   CONTROL.SourcebPulse(
         n_out = 1   ) OnOff_signal(
         Period = 10,
         pulseWidth = 5,
         Tstart = 0  -- Non default value.
   )

   CONNECT PV_Up.s_out TO Counter_DOWN.s_in

   CONNECT PV_Up.s_out TO Counter_UP.s_in

   CONNECT PV_Up.s_out TO Counter_UP_DOWN.s_in

   CONNECT BooleanToReal.s_out TO Delay.s_in

   CONNECT Counter_DOWN.Q TO Counter_DOWN.LD

   CONNECT Counter_UP.Q TO Counter_UP.RESET

   CONNECT Delay.s_out TO RealToBoolean.s_in

   CONNECT RealToBoolean.s_out TO Counter_UP_DOWN.CD

   CONNECT SourcebConstant_1.s_out TO Counter_DOWN.CD

   CONNECT SourcebConstant_1.s_out TO Counter_UP.CU

   CONNECT OnOff_signal.s_out TO BooleanToReal.s_in

   CONNECT OnOff_signal.s_out TO Counter_UP_DOWN.CU



CONTINUOUS
		
END COMPONENT