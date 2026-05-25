-- Generated automatically by - EcosimPro - 7.2.1 


USE MATH VERSION "3.4.8"
USE PORTS_LIB VERSION "1.2.0"
USE SYSTEM_MDL_LIB VERSION "1.1"
USE THERMAL



-- EL code of the schematic.
-- The COMPONENT definition lines are blocked for edition.
-- You can edit the parameters clicking over them.
COMPONENT ThrusterSchematic 

PORTS
   IN PORTS_LIB.thermal(
         n = 1   ) Space CARDINALITY 0,2147483647
   IN PORTS_LIB.thermal(
         n = 1   ) tp_N13 CARDINALITY 0,2147483647


DECLS 
TABLE_1D Cond_Tab =  { {-273.15,  0. , 400. , 2000.  },  
                             {   9.5 ,  9.5,  16.6,   16.6 }}

TOPOLOGY
   THERMAL.BNode(
         n = 1   ) BNode_N105(
         Label = "Node Label",
         qi = 0)
   THERMAL.DNode(
         n = 1   ) DNode_N1(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 4.60  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N10(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 0.065  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N11(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 7.28  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N12(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 12.720  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N13(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 14.6  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N14(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 10.350  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N15(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 54.83  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N2(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 473.15,  -- Non default value.
         C = 0.001)
   THERMAL.DNode(
         n = 1   ) DNode_N3(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 8  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N4(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 3.5  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N5(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 1.9  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N6(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 1.9  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N7(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 1.9  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N8(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 0.176  -- Non default value.
   )
   THERMAL.DNode(
         n = 1   ) DNode_N9(
         Label = "Node Label",
         qi = 0,
         Boundary = FALSE,
         To = 290,
         C = 0.68  -- Non default value.
   )
   THERMAL.GL(
         n = 1   ) GL_1(
         cond = 0.0085  -- Non default value.
   )
   THERMAL.GL(
         n = 1   ) GL_2(
         cond = 0.15  -- Non default value.
   )
   THERMAL.GL(
         n = 1   ) GL_3(
         cond = 0.0041  -- Non default value.
   )
   THERMAL.GL(
         n = 1   ) GL_4(
         cond = 0.0041  -- Non default value.
   )
   THERMAL.GL(
         n = 1   ) GL_5(
         cond = 0.0024  -- Non default value.
   )
   THERMAL.GL(
         n = 1   ) GL_6(
         cond = 0.069  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) GR_1(
         REF = 2.1324e-04  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) GR_2(
         REF = 6.1080e-04  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) GR_3(
         REF = 7.20e-05  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) GR_4(
         REF = 3.90e-05  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) GR_5(
         REF = 3.90e-05  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) GR_6(
         REF = 6.e-06  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) GR_7(
         REF = 2.32e-05  -- Non default value.
   )
   THERMAL.GR(
         n = 1   ) GR_8(
         REF = 2.06e-04  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL1(
         F = 0.0015,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_10(
         F = 4.086e-5,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_11(
         F = 1.518e-4,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_2(
         F = 0.0053,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_3(
         F = 4.32e-3,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_4(
         F = 8.23e-4,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_5(
         F = 8.23e-4,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_6(
         F = 4.32e-3,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_7(
         F = 7.e-3,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_8(
         F = 2.361e-4,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )
   THERMAL.TD_GL(
         n = 1   ) TD_GL_9(
         F = 5.059e-5,  -- Non default value.
         k_table = Cond_Tab  -- Non default value.
   )

   CONNECT DNode_N1.tp_in TO TD_GL1.tp_in

   CONNECT DNode_N13.tp_in TO tp_N13

   CONNECT DNode_N9.tp_in TO GR_7.tp_in

   CONNECT GL_1.tp_in TO DNode_N2.tp_in

   CONNECT GL_1.tp_out TO DNode_N3.tp_in

   CONNECT GL_2.tp_in TO DNode_N14.tp_in

   CONNECT GL_2.tp_out TO DNode_N15.tp_in

   CONNECT GL_3.tp_out TO DNode_N11.tp_in

   CONNECT GL_3.tp_in TO DNode_N2.tp_in

   CONNECT GL_4.tp_in TO DNode_N11.tp_in

   CONNECT GL_4.tp_out TO DNode_N12.tp_in

   CONNECT GL_5.tp_in TO DNode_N12.tp_in

   CONNECT GL_5.tp_out TO DNode_N15.tp_in

   CONNECT GL_6.tp_out TO BNode_N105.tp_in

   CONNECT GL_6.tp_in TO DNode_N14.tp_in

   CONNECT GR_1.tp_out TO Space

   CONNECT GR_1.tp_in TO DNode_N1.tp_in

   CONNECT GR_2.tp_out TO Space

   CONNECT GR_2.tp_in TO DNode_N3.tp_in

   CONNECT GR_3.tp_out TO Space

   CONNECT GR_3.tp_in TO DNode_N4.tp_in

   CONNECT GR_4.tp_out TO Space

   CONNECT GR_4.tp_in TO DNode_N5.tp_in

   CONNECT GR_5.tp_out TO Space

   CONNECT GR_5.tp_in TO DNode_N6.tp_in

   CONNECT GR_6.tp_out TO Space

   CONNECT GR_6.tp_in TO DNode_N8.tp_in

   CONNECT GR_7.tp_out TO Space

   CONNECT GR_8.tp_out TO Space

   CONNECT GR_8.tp_in TO DNode_N11.tp_in

   CONNECT TD_GL1.tp_out TO DNode_N2.tp_in

   CONNECT TD_GL_10.tp_out TO DNode_N10.tp_in

   CONNECT TD_GL_10.tp_in TO DNode_N9.tp_in

   CONNECT TD_GL_11.tp_out TO tp_N13

   CONNECT TD_GL_11.tp_in TO DNode_N10.tp_in

   CONNECT TD_GL_2.tp_in TO DNode_N2.tp_in

   CONNECT TD_GL_2.tp_out TO DNode_N4.tp_in

   CONNECT TD_GL_3.tp_in TO DNode_N4.tp_in

   CONNECT TD_GL_3.tp_out TO DNode_N5.tp_in

   CONNECT TD_GL_4.tp_in TO DNode_N5.tp_in

   CONNECT TD_GL_4.tp_out TO DNode_N6.tp_in

   CONNECT TD_GL_5.tp_in TO DNode_N6.tp_in

   CONNECT TD_GL_5.tp_out TO DNode_N7.tp_in

   CONNECT TD_GL_6.tp_out TO DNode_N13.tp_in

   CONNECT TD_GL_6.tp_in TO DNode_N7.tp_in

   CONNECT TD_GL_7.tp_in TO DNode_N13.tp_in

   CONNECT TD_GL_7.tp_out TO DNode_N14.tp_in

   CONNECT TD_GL_8.tp_in TO DNode_N2.tp_in

   CONNECT TD_GL_8.tp_out TO DNode_N8.tp_in

   CONNECT TD_GL_9.tp_in TO DNode_N8.tp_in

   CONNECT TD_GL_9.tp_out TO DNode_N9.tp_in



END COMPONENT