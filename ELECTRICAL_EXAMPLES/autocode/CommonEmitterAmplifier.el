-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"



COMPONENT CommonEmitterAmplifier 

PORTS



TOPOLOGY
   ELECTRICAL.Capacitor Cin(
         C = 1e-005  -- Non default value.
   )
   ELECTRICAL.Capacitor Cout(
         C = 0.0001  -- Non default value.
   )
   ELECTRICAL.VoltageConstant VoltageConstant_1(
         V = 10  -- Non default value.
   )
   ELECTRICAL.Resistor Rc(
         R = 5000  -- Non default value.
   )
   ELECTRICAL.Resistor Re(
         R = 500  -- Non default value.
   )
   ELECTRICAL.Ground Ground_1
   ELECTRICAL.VoltageSine VoltageSine_1(
         Vpeak = 0.25,  -- Non default value.
         Voffset = 0,
         freqHz = 200,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.Resistor R1(
         R = 9000  -- Non default value.
   )
   ELECTRICAL.Resistor R2(
         R = 1000  -- Non default value.
   )
   ELECTRICAL.Resistor Rload(
         R = 50000  -- Non default value.
   )
   ELECTRICAL.NPN NPN_1(
         Bf = 50,
         Br = 0.1,
         Is = 1e-16,
         Vak = 0.02,
         Tauf = 1.2e-10,
         Taur = 5e-09,
         Ccs = 1e-12,
         Cje = 4e-13,
         Cjc = 5e-13,
         Phie = 0.8,
         Me = 0.4,
         Phic = 0.8,
         Mc = 0.333,
         Gbc = 1e-15,
         Gbe = 1e-15,
         Vt = 0.02585)
   ELECTRICAL.Resistor R0(
         R = 0.01  -- Non default value.
   )

   CONNECT Rc.e_p TO VoltageConstant_1.e_p

   CONNECT Ground_1.e_p TO Re.e_n

   CONNECT Ground_1.e_p TO VoltageSine_1.e_n

   CONNECT R1.e_p TO Rc.e_p

   CONNECT Ground_1.e_p TO R2.e_n

   CONNECT Ground_1.e_p TO VoltageConstant_1.e_n

   CONNECT Cin.e_p TO VoltageSine_1.e_p

   CONNECT Cout.e_n TO Rload.e_p

   CONNECT Ground_1.e_p TO Rload.e_n

   CONNECT NPN_1.e_C TO Rc.e_n

   CONNECT Cout.e_p TO NPN_1.e_C

   CONNECT NPN_1.e_B TO R1.e_n

   CONNECT NPN_1.e_B TO R2.e_p

   CONNECT NPN_1.e_E TO Re.e_p

   CONNECT Cin.e_n TO R0.e_p

   CONNECT R0.e_n TO NPN_1.e_B



END COMPONENT