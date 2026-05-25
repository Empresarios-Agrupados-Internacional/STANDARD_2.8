-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE ELECTRICAL
USE CONTROL VERSION "5.0.6"



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT ElectronicMultiplexer 

PORTS



TOPOLOGY
   ELECTRICAL.VoltageSine VoltageSine_1(
         Vpeak = 5,  -- Non default value.
         Voffset = 0,
         freqHz = 0.5,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.VoltageSine VoltageSine_2(
         Vpeak = 5,  -- Non default value.
         Voffset = 0,
         freqHz = 1,
         phase = 0,
         startTime = 0)
   ELECTRICAL.VoltageSine VoltageSine_3(
         Vpeak = 5,  -- Non default value.
         Voffset = 0,
         freqHz = 1.5,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.VoltageSine VoltageSine_4(
         Vpeak = 5,  -- Non default value.
         Voffset = 0,
         freqHz = 2,  -- Non default value.
         phase = 0,
         startTime = 0)
   ELECTRICAL.Multiplexer electronic_mux_4_1
   ELECTRICAL.Resistor Resistor(
         R = 1)
   ELECTRICAL.Ground Ground

   CONNECT electronic_mux_4_1.out TO Resistor.e_p

   CONNECT VoltageSine_2.e_p TO electronic_mux_4_1.in_2

   CONNECT VoltageSine_3.e_p TO electronic_mux_4_1.in_3

   CONNECT VoltageSine_4.e_p TO electronic_mux_4_1.in_4

   CONNECT Resistor.e_n TO Ground.e_p

   CONNECT VoltageSine_4.e_n TO Ground.e_p

   CONNECT VoltageSine_3.e_n TO Ground.e_p

   CONNECT VoltageSine_2.e_n TO Ground.e_p

   CONNECT VoltageSine_1.e_n TO Ground.e_p

   CONNECT VoltageSine_1.e_p TO electronic_mux_4_1.in_1



END COMPONENT