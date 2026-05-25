-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE ELECTRICAL
USE SYSTEM_MDL_LIB VERSION "1.1"



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT Transistor 

PORTS



TOPOLOGY
   ELECTRICAL.Ground Ground_1
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
   ELECTRICAL.Resistor Resistor_1(
         R = 100  -- Non default value.
   )
   ELECTRICAL.Resistor Resistor_2(
         R = 1000  -- Non default value.
   )
   ELECTRICAL.VoltageConstant DC_Source(
         V = 3.3  -- Non default value.
   )
   ELECTRICAL.VoltageConstant VoltageConstant_1(
         V = 220  -- Non default value.
   )

   CONNECT NPN_1.e_E TO Resistor_2.e_p

   CONNECT NPN_1.e_C TO VoltageConstant_1.e_n

   CONNECT Resistor_1.e_n TO NPN_1.e_B

   CONNECT Resistor_2.e_n TO Ground_1.e_p

   CONNECT DC_Source.e_n TO Ground_1.e_p

   CONNECT DC_Source.e_p TO Resistor_1.e_p

   CONNECT VoltageConstant_1.e_p TO Ground_1.e_p



END COMPONENT