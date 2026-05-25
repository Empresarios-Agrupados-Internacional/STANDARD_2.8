/*-----------------------------------------------------------------------------------------
 FILE: math_ex_ecua3
 DESCRIPTION: Usage examples of the functions of the MATH library
 CREATION DATE: 11/11/2025
-----------------------------------------------------------------------------------------*/
USE MATH

-----------------------------------------------------------------------------------------
-- Example: ecua2 function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate a direct call to:
--        ecua2(a1, a2, a3, r1, r2)
--    to solve a quadratic equation:
--        a1*x^2 + a2*x + a3 = 0
--
-- Example used:
--    a1 = 1, a2 = -5, a3 = 6  =>  x^2 - 5x + 6 = 0
--    Analytic roots:
--       x1 = 2,  x2 = 3
--
-- Behaviour of ecua2:
--    - If |a1| > tol, the function treats the equation as quadratic.
--    - If there are:
--        * two real roots: r1 and r2 are set to the two roots,
--        * one real root:  r1 is set to the root and r2 = 1e40,
--        * no real roots:  r1 = 1e40 (sentinel: "no real solution").
--    - If |a1| <= tol, the equation is treated as linear:
--        a2*x + a3 = 0.
--
-- This component:
--    - Calls ecua2 in INIT.
--    - Checks r1, r2 against the sentinel value 1e40.
--    - Prints a message describing how many real roots have been found.
-----------------------------------------------------------------------------------------
COMPONENT ecua2_ex
"Example: direct call to ecua2(a1,a2,a3,r1,r2) and real-root check"

   DATA
      REAL a1 = 1.      UNITS no_units  "x^2 coefficient"
      REAL a2 = -5.     UNITS no_units  "x^1 coefficient"
      REAL a3 = 6.      UNITS no_units  "x^0 coefficient"

   DECLS
      DISCR REAL r1 UNITS no_units "Root 1 returned by ecua2"
      DISCR REAL r2 UNITS no_units "Root 2 returned by ecua2 (or 1e40 if no second root)"
      
      INTEGER nroots

   INIT
      -- Solve: a1*x^2 + a2*x + a3 = 0
      ecua2(a1, a2, a3, r1, r2, nroots)

      -- Interpret the results using 1e40 as "no solution" sentinel
      IF (nroots == 0) THEN
         PRINT("ecua2: no real roots (r1=1e40)")
      ELSEIF (nroots == 1) THEN
         PRINT("ecua2: one real root: r1=$r1 (r2=1e40)")
      ELSE
         PRINT("ecua2: two real roots: r1=$r1, r2=$r2")
      END IF

END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: ecua3 function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate a direct call to:
--        ecua3(a[4], r1, r2, r3)
--    to solve a cubic equation:
--        a[1]*x^3 + a[2]*x^2 + a[3]*x + a[4] = 0
--
-- Example used:
--    a = {1, -2, 1, 0}  =>  x^3 - 2x^2 + x = 0
--    Factorised form:
--       x^3 - 2x^2 + x = x(x - 1)^2
--    Real roots:
--       x = 0  (simple root)
--       x = 1  (double root, counted twice)
--
-- Behaviour of ecua3:
--    - r1, r2, r3 are initialised to 1e40 inside ecua3.
--    - Depending on the degree and discriminant:
--        * 0 real roots: r1 = 1e40.
--        * 1 real root:  r1 is the root, r2 = r3 = 1e40.
--        * 2 real roots: r1, r2 are the roots, r3 = 1e40.
--        * 3 real roots: r1, r2, r3 are all real roots.
--
-- This component:
--    - Calls ecua3 in INIT.
--    - Checks which roots are different from 1e40.
--    - Prints how many real roots have been found and their values.
-----------------------------------------------------------------------------------------

COMPONENT ecua3_ex
"Example: direct call to ecua3(a[4],r1,r2,r3) and real-root reporting"

   DATA
      REAL a[4] = {1., -2., 1., 0} UNITS no_units  "Coefficients: a1*x^3 + a2*x^2 + a3*x + a4 = 0"

   DECLS
      DISCR REAL r1        UNITS no_units          "Root 1 returned by ecua3"
      DISCR REAL r2        UNITS no_units          "Root 2 returned by ecua3"
      DISCR REAL r3        UNITS no_units          "Root 3 returned by ecua3"
            
      INTEGER nroots

   INIT
      -- Solve: a[1]*x^3 + a[2]*x^2 + a[3]*x + a[4] = 0
      ecua3(a, r1, r2, r3, nroots)

      -- Interpret the results using 1e40 as "no solution" sentinel
      IF (nroots == 0) THEN
         PRINT("ecua3: no real roots detected (r1=1e40)")
      ELSEIF (nroots == 1) THEN
         PRINT("ecua3: one real root: r1=$r1 (r2=1e40)")
      ELSEIF (nroots == 2) THEN
         PRINT("ecua3: two real roots: r1=$r1, r2=$r2 (r3=1e40)")
      ELSE
         PRINT("ecua3: three real roots: r1=$r1, r2=$r2, r3=$r3")
      END IF

END COMPONENT
