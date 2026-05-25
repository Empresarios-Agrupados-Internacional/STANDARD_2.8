-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"
USE CONTROL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Battery_comparison 

PORTS



TOPOLOGY
   ELECTRICAL.Ground Ground
   ELECTRICAL.Ground Ground_1
   ELECTRICAL.IdealBattery Battery_2(
         Q = 4,  -- Non default value.
         V_nom = 3.7,
         V_SOC = { { -0.1,0,0.25,0.9,1,1.1} ,{ 0,0.68,1,1,1.14,1.14} },
         soc0 = 0.1)
   ELECTRICAL_EXAMPLES.Battery_1RC Battery_1(
         Q = 4,
         V_nom = 3.7,
         V_SOC = { { -0.1,0,0.25,0.9,1,1.1} ,{ 0,0.68,1,1,1.14,1.14} },
         soc0 = 0.1,
         C1_v = 0.0015,
         R1_v = 0.05,
         R0_v = 0.025)
   ELECTRICAL.Resistor RL(
         R = 1)
   ELECTRICAL.Resistor RL_1(
         R = 1)
   ELECTRICAL.CurrentSignal CurrentSignal
   ELECTRICAL.CurrentSignal CurrentSignal_1
   ELECTRICAL.IdealSwitch Switch_disch(
         Roff = 1e-05,
         Gon = 1e-05)
   ELECTRICAL.IdealSwitch Switch_disch_1(
         Roff = 1e-05,
         Gon = 1e-05)
   CONTROL.SourcebPulse(
         n_out = 1   ) Discharge(
         Period = 200,  -- Non default value.
         pulseWidth = 100,  -- Non default value.
         Tstart = 100  -- Non default value.
   )
   CONTROL.AnalogSource(
         n_out = 1   ) Charge(
         source = Source_Pulse,  -- Non default value.
         Amp = 3.7,  -- Non default value.
         Tstart = 0,
         Offset = 0,
         Phase = 0,
         Period = 200,  -- Non default value.
         pulseWidth = 100,  -- Non default value.
         rampDuration = 10,
         tabmethod = LinearInterpWithEvents,
         timeTable = { { 0,10} ,{ 0,0} })

   CONNECT RL.e_n TO Ground.e_p

   CONNECT RL_1.e_n TO Ground_1.e_p

   CONNECT Battery_1.e_n TO Ground.e_p

   CONNECT Battery_2.e_n TO Ground_1.e_p

   CONNECT CurrentSignal.e_p TO Ground.e_p

   CONNECT CurrentSignal_1.e_p TO Ground_1.e_p

   CONNECT Battery_1.e_p TO Switch_disch.e_p

   CONNECT Switch_disch.e_n TO RL.e_p

   CONNECT Battery_2.e_p TO Switch_disch_1.e_p

   CONNECT Switch_disch_1.e_n TO RL_1.e_p

   CONNECT Discharge.s_out TO Switch_disch.b_fire

   CONNECT Discharge.s_out TO Switch_disch_1.b_fire

   CONNECT Charge.s_out TO CurrentSignal_1.s_in

   CONNECT Charge.s_out TO CurrentSignal.s_in

   CONNECT CurrentSignal.e_n TO Battery_1.e_p

   CONNECT CurrentSignal_1.e_n TO Battery_2.e_p



END COMPONENT