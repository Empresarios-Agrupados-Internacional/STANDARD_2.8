-- Libraries
USE MATH 
USE PORTS_LIB 
USE THERMAL 
   
COMPONENT Thruster
	PORTS
		OUT thermal Space
		OUT thermal tp_N13
      DECLS
          TABLE_1D Cond_Tab = { {-273.15,  0. , 400. , 2000.  },  
                             {   9.5 ,  9.5,  16.6,   16.6 }}

	TOPOLOGY		
		DNode N1 (C = 4.60, qi = 0)

		DNode N2 (C = 25., qi= 0., To = 473.15)
		
		DNode N3 ( C = 8., qi= 0.)
		
		DNode N4 ( C = 3.5, qi = 0.)
		
		DNode N5 (  C = 1.9, qi= 0.)
		
		DNode N6 ( C = 1.9, qi= 0.)
		
		DNode N7 ( C = 1.9, qi= 0.)
		
		DNode N8 ( C = 0.176, qi = 0.)
		
		DNode N9 ( C = 0.68, qi= 0.)
		
		DNode N10 ( C = 0.065, qi= 0.)
		
		DNode N11 ( C = 7.28, qi= 0.) 

		DNode N12 (  C = 1.2720e+01, qi= 0.)
		
		DNode N13 (  C = 1.46e+01, qi= 0.)
		
		DNode N14 (  C = 1.0350e+01, qi= 0.)
		
		DNode N15 (  C = 54.83, qi= 0.)
	
		--Boundary Nodes
	
		BNode N105
	
		--Modified Linear Conductances
	
		TD_GL TD_GL1 (F = 0.0015, k_table = Cond_Tab)
		CONNECT  N1  TO  TD_GL1  TO N2 
		
		TD_GL TD_GL2 (F = 0.0053, k_table = Cond_Tab)
		CONNECT  N2  TO TD_GL2 TO N4
		
		TD_GL TD_GL3 (F = 4.32e-3, k_table = Cond_Tab)
		CONNECT  N4 TO TD_GL3 TO N5
		
		TD_GL TD_GL4 (F = 8.23e-4, k_table = Cond_Tab)
		CONNECT  N5 TO TD_GL4 TO N6
		
		TD_GL TD_GL5 (F = 8.23e-4, k_table = Cond_Tab)
		CONNECT  N6 TO TD_GL5 TO N7
		
		TD_GL TD_GL6 (F = 4.32e-3, k_table = Cond_Tab)
		CONNECT  N7 TO TD_GL6 TO N13
		
		TD_GL TD_GL7 (F = 7.e-3, k_table = Cond_Tab)
		CONNECT  N13 TO TD_GL7 TO N14
		
		TD_GL TD_GL8 (F = 2.361e-4, k_table = Cond_Tab)
		CONNECT  N2 TO TD_GL8 TO N8 	
			
		TD_GL TD_GL9 (F = 5.059e-5, k_table = Cond_Tab)
		CONNECT  N8 TO TD_GL9 TO N9

		TD_GL TD_GL10 (F = 4.086e-5, k_table = Cond_Tab )
		CONNECT  N9 TO TD_GL10 TO N10
		
		TD_GL TD_GL11 (F = 1.518e-4, k_table = Cond_Tab)
		CONNECT  N10 TO TD_GL11 TO N13
		
		--Linear Conductances 
		
		GL GL1 (cond =  0.0085)
		CONNECT N2 TO GL1 TO N3

		GL GL2 (cond =  0.15)
		CONNECT N14 TO GL2 TO N15

		GL GL3 (cond =  0.0041)
		CONNECT	N2 TO GL3 TO N11
	
		GL GL4 (cond =  0.0041) 
		CONNECT N11 TO GL4 TO N12
		
		GL GL5 (cond =  0.0024)
		CONNECT N12 TO GL5 TO N15
		
		GL GL6 (cond =  0.069)
		CONNECT N14 TO GL6 TO N105
	
		--Radiative Exchange Factors 
	
		GR GR1 (REF =  2.1324e-04)
		CONNECT N1 TO GR1 TO Space
		
		GR GR2 (REF =  6.1080e-04)
		CONNECT N3 TO GR2 TO Space
		
		GR GR3 (REF =  7.20e-05)
		CONNECT N4 TO GR3 TO Space
		
		GR GR4 (REF =  3.90e-05)
		CONNECT N5 TO GR4 TO Space
		
		GR GR5 (REF =  3.90e-05)
		CONNECT N6 TO GR5 TO Space
		
		GR GR6 (REF =  6.e-06)
		CONNECT N8 TO GR6 TO Space
		
		GR GR7 (REF =  2.32e-05)
		CONNECT N9 TO GR7 TO Space
		
		GR GR8 (REF =  2.06e-04)
		CONNECT N11 TO GR8 TO Space 

		--Connection to External Port
	
		CONNECT N13 TO tp_N13
END COMPONENT

COMPONENT two_thrusters

	TOPOLOGY
		Thruster thruster1
		Thruster thruster2
		BNode Space 	
		GR GR_coupling (REF = 0.000005)

		CONNECT thruster1.tp_N13 TO GR_coupling TO thruster2.tp_N13
		CONNECT thruster1.Space TO Space
		CONNECT thruster2.Space TO Space		

END COMPONENT
