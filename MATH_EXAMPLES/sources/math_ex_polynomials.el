/*-----------------------------------------------------------------------------------------
 FILE: math_ex_polynomials
 DESCRIPTION: Usage examples of the functions of the MATH library
 CREATION DATE: 20/01/2026
-----------------------------------------------------------------------------------------*/
USE MATH

-----------------------------------------------------------------------------------------
-- Example: fac function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        y = fac(n)
--    to compute the factorial of an integer n:
--
--       n! = n · (n−1) · … · 2 · 1
--
-- Example in this component:
--    - n = 7
--    - y = fac(7) = 5040
--    The result is printed in the message window as: "7! = 5040".
-----------------------------------------------------------------------------------------
COMPONENT fac_ex
   DATA
      INTEGER n = 7
   DECLS
      INTEGER y
   
   INIT
      y = fac(n)
      PRINT("$n! = $y")
   
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: poly function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        y = poly(x, n, A)
--    to evaluate a polynomial
--
--       p(x) = A[1] + A[2]*x + A[3]*x^2 + ... + A[n]*x^(n-1)
--
--    using Horner's method.
--
-- Example polynomial in this component:
--    n = 4,  A = {1, -3, 2, 0.5}
--
--    so that:
--       p(x) = 1 - 3*x + 2*x^2 + 0.5*x^3
--
--    The component evaluates p(x) for a time-varying input
--       x(TIME) = sin(TIME)
--    and stores the result in y_poly.
-----------------------------------------------------------------------------------------
COMPONENT poly_ex "Example component using the poly function"

   DATA
      INTEGER n = 4     UNITS no_units          "Order of the polynomial plus 1 (number of coefficients)"
      REAL A[4] = {1., -3., 2., 0.5}   UNITS no_units    "Polynomial coefficients: p(x) = A[1] + A[2]*x + A[3]*x^2 + A[4]*x^3"

   DECLS
      REAL x_input      UNITS no_units          "Input variable at which the polynomial is evaluated"
      REAL y_poly       UNITS no_units          "Polynomial value p(x_input) = poly(x_input, n, A)"

   CONTINUOUS
      -- Time-varying input: here a simple sinusoidal signal
      x_input = sin(TIME)

      -- Evaluate the polynomial p(x_input) with the MATH.poly function
      y_poly = poly(x_input, n, A)

END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: poly_dx_int function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        y = poly_dx_int(x, n, A)
--    to evaluate the integral of p(x)/x, for a given polynomial
--
--       p(x) = A[1] + A[2]*x + A[3]*x^2 + ... + A[n]*x^(n-1)
--
-- Example polynomial in this component:
--    n = 4,  A = {1, -3, 2, 0.5}
--
--    so that:
--       p(x) = 1 - 3*x + 2*x^2 + 0.5*x^3
--       y(x) = ln(x) - 3 + x^3 + 1/6*x^2
--
--    The component evaluates y(x) for a time-varying input
--       x(TIME) = sin(TIME)
--    and stores the result in y.
-----------------------------------------------------------------------------------------
COMPONENT poly_dx_int_ex "Example component using the poly_dx_int function"

   DATA
      INTEGER n = 4     UNITS no_units          "Order of the polynomial plus 1 (number of coefficients)"
      REAL A[4] = {1., -3., 2., 0.5}   UNITS no_units    "Polynomial coefficients: p(x) = A[1] + A[2]*x + A[3]*x^2 + A[4]*x^3"

   DECLS
      REAL x_input      UNITS no_units          "Input variable at which the polynomial is evaluated"
      REAL y            UNITS no_units          "Output value y = poly_dx_int(x_input, n, A)"

   CONTINUOUS
      -- Time-varying input: here a simple sinusoidal signal
      x_input = sin(TIME)+2

      -- Evaluate the integral of p(x_input)/x_input with the MATH.poly_dx_int function
      y = poly_dx_int(x_input, n, A)

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: poly_int function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        y = poly_int(x, n, A)
--    to evaluate the integral of a given polynomial
--
--       p(x) = A[1] + A[2]*x + A[3]*x^2 + ... + A[n]*x^(n-1)
--
--    using Horner's method.
--
-- Example polynomial in this component:
--    n = 4,  A = {1, -3, 2, 0.5}
--
--    so that:
--       p(x) = 1 - 3*x + 2*x^2 + 0.5*x^3
--       y(x) = x - 3/2*x^2 + 2/3*x^3 + 1/8*x^4
--
--    The component evaluates y(x) for a time-varying input
--       x(TIME) = sin(TIME)
--    and stores the result in y.
-----------------------------------------------------------------------------------------
COMPONENT poly_int_ex     "Example component using the poly_int function"

   DATA
      INTEGER n = 4        UNITS no_units          "Order of the polynomial plus 1 (number of coefficients)"
      REAL A[4] = {1., -3., 2., 0.5}   UNITS no_units    "Polynomial coefficients: p(x) = A[1] + A[2]*x + A[3]*x^2 + A[4]*x^3"

   DECLS
      REAL x_input         UNITS no_units          "Input variable at which the polynomial is evaluated"
      REAL y               UNITS no_units          "Output value y = poly_int(x_input, n, A)"

   CONTINUOUS
      -- Time-varying input: here a simple sinusoidal signal
      x_input = sin(TIME)

      -- Evaluate the integral of the polynomial p(x_input) with the MATH.poly_int function
      y = poly_int(x_input, n, A)

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: PolyMult function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        PolyMult(k, a, l, b, n, c)
--    to compute the product of two polynomials:
--
--       a(x) = a[1] + a[2]*x + ... + a[k]*x^(k-1)
--       b(x) = b[1] + b[2]*x + ... + b[l]*x^(l-1)
--
--    The result is:
--       c(x) = a(x) * b(x) = c[1] + c[2]*x + ... + c[n]*x^(n-1)
--
-- Example in this component:
--    a(x) = 1 + 2*x + 3*x^2
--    b(x) = 1 - x
--
--    PolyMult returns:
--       n = k + l = 5  (number of coefficients of c)
--       c[1..5] = coefficients of c(x) = a(x)*b(x)
--    The resulting coefficients are printed for inspection.
-----------------------------------------------------------------------------------------
COMPONENT poly_mult_ex "Example component using the PolyMult function"
   DATA
      INTEGER k = 3              UNITS no_units       "Number of coefficients of polynomial a(x)"
      INTEGER l = 2              UNITS no_units       "Number of coefficients of polynomial b(x)"
      REAL a[3] = {1., 2., 3.}   UNITS no_units       "Coefficients of a(x) = 1 + 2*x + 3*x^2"
      REAL b[2] = {1., -1.}      UNITS no_units       "Coefficients of b(x) = 1 - x"

   DECLS
      INTEGER n                  UNITS no_units       "Number of coefficients of the product polynomial c(x)"
      DISCR REAL c[4]            UNITS no_units       "Coefficient array of c(x) = a(x)*b(x); only c[1..n] are used"
      STRING result = ""
      
   INIT
      
      -- Compute the product polynomial c(x) = a(x)*b(x)
      PolyMult(k, a, l, b, n, c)

      -- Report the result:
      --   n  : number of coefficients of c(x)
      --   c[i]: coefficients of c(x) = c[1] + c[2]*x + ... + c[n]*x^(n-1)
      PRINT("PolyMult example: a(x) = $a[1] + $a[2]*x + $a[3]*x^2, b(x) = $b[1] + $b[2]*x")
      PRINT("Number of coefficients of c(x): n = $n")
      IF (abs(c[1]) > tol) THEN
         result = realToString(c[1])
      END IF
      FOR (i IN 2,n)
         IF (c[i] > tol) THEN
            result = result + " + " + realToString(c[i]) + "*x^" + integerToString(i-1)
         ELSEIF (c[i] < -tol) THEN
            result = result + " - " + realToString(-c[i]) + "*x^" + integerToString(i-1)
         END IF
      END FOR
      PRINT("Result: c(x) = $result\n")

END COMPONENT
