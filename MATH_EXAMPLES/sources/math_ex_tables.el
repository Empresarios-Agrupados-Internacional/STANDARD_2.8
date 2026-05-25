/*-----------------------------------------------------------------------------------------
 FILE: matrix_ex_tables
 DESCRIPTION: Usage examples of the functions of the MATH library 
 CREATION DATE: 02/03/2026
-----------------------------------------------------------------------------------------*/

USE MATH

--------------------------------------------------------------------------------
-- csv_to_tab1d_ex
----------------------------------------------------------------------------------

COMPONENT csv_to_tab1d_ex

DATA
   FILEPATH fpath = "@MATH_EXAMPLES@/tables/csv_example.csv"
   
DECLS
   REAL y
   
OBJECTS 
   TABLE tab

INIT
   csv_to_tab1d(fpath,1,3,tab,",",0)

CONTINUOUS
   y = tab.interpd1D(TIME)

END COMPONENT


--------------------------------------------------------------------------------
-- csv_to_ntab1d_ex
----------------------------------------------------------------------------------

COMPONENT csv_to_ntab1d_ex

DATA
   FILEPATH fpath = "@MATH_EXAMPLES@/tables/csv_example.csv"
   INTEGER cols[3] = {1,3,4}
   
DECLS
   REAL y
   REAL z
   
OBJECTS 
   TABLE tab[2]

INIT
   csv_to_ntab1d(fpath,cols,tab,",",0)

CONTINUOUS
   y = tab[1].interpd1D(TIME)
   z = tab[2].interpd1D(TIME)

END COMPONENT