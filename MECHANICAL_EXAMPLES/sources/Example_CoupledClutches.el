-- Generated automatically by - EcosimPro - 7.2.0 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE MECHANICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



COMPONENT Example_CoupledClutches 

PORTS



TOPOLOGY
   MECHANICAL.R_Inertia J1(
         I = 1,
         w0 = 10  -- Non default value.
   )
   MECHANICAL.R_Clutch clutch1(
         phi_rel_i = 0,
         mue_pos = { { 0,1} ,{ 0.5,0.5} },
         peak = 1.1,
         cgeo = 1,
         fn_max = 20,
         w_rel_i = 1)
   CONTROL.AnalogSource(
         n_out = 1   ) signal_clutch3(
         source = Source_Step,  -- Non default value.
         Amp = 1,
         Tstart = 0.9,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 0,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) signal_clutch2(
         source = Source_Step,  -- Non default value.
         Amp = 1,
         Tstart = 0.4,  -- Non default value.
         Offset = 0,
         Phase = 0,
         Period = 0,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) signal_clutch1(
         source = Source_Sine,  -- Non default value.
         Amp = 1,
         Tstart = 0,
         Offset = 0,
         Phase = 1.57,  -- Non default value.
         Period = 5,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) torqueZero(
         source = Source_Constant,
         Amp = 0,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 10,
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   CONTROL.AnalogSource(
         n_out = 1   ) sineSignal(
         source = Source_Sine,  -- Non default value.
         Amp = 10,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 0.2,  -- Non default value.
         pulseWidth = 0.001,
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })
   MECHANICAL.R_ActuatorTorque torque2
   MECHANICAL.R_ActuatorTorque torque1
   MECHANICAL.R_Inertia J2(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Clutch clutch2(
         phi_rel_i = 0,
         mue_pos = { { 0,1} ,{ 0.5,0.5} },
         peak = 1.1,
         cgeo = 1,
         fn_max = 20,
         w_rel_i = 1)
   MECHANICAL.R_Inertia J3(
         I = 1,
         w0 = 0)
   MECHANICAL.R_Clutch clutch3(
         phi_rel_i = 0,
         mue_pos = { { 0,1} ,{ 0.5,0.5} },
         peak = 1.1,
         cgeo = 1,
         fn_max = 20,
         w_rel_i = 1)
   MECHANICAL.R_Inertia J4(
         I = 1,
         w0 = 0)

   CONNECT signal_clutch3.s_out TO clutch3.inPort

   CONNECT signal_clutch2.s_out TO clutch2.inPort

   CONNECT signal_clutch1.s_out TO clutch1.inPort

   CONNECT J4.m_out TO torque2.m_out

   CONNECT torqueZero.s_out TO torque2.s_in

   CONNECT sineSignal.s_out TO torque1.s_in

   CONNECT torque1.m_out TO J1.m_in

   CONNECT clutch3.m_out TO J4.m_in

   CONNECT J3.m_out TO clutch3.m_in

   CONNECT clutch2.m_out TO J3.m_in

   CONNECT J2.m_out TO clutch2.m_in

   CONNECT clutch1.m_out TO J2.m_in

   CONNECT J1.m_out TO clutch1.m_in



END COMPONENT