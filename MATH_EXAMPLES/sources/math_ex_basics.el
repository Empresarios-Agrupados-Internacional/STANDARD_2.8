/*-----------------------------------------------------------------------------------------
 FILE: math_ex_basics
 DESCRIPTION: Usage examples of the basic functions of the MATH library
 CREATION DATE: 11/11/2025
-----------------------------------------------------------------------------------------*/

USE MATH


-----------------------------------------------------------------------------------------
-- Example: bound function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use bound(x, min_value, max_value) to limit a signal
--    to a given interval [min_value, max_value].
--
-- Behaviour:
--    - x is computed as sin(TIME).
--    - bounded_sin is sin(TIME) limited between min_value and max_value.
-----------------------------------------------------------------------------------------
COMPONENT bound_ex
   DATA
      REAL min_value = -0.5   "Lower bound for the signal"
      REAL max_value = 0.5    "Upper bound for the signal"
   DECLS
      REAL x                  "Unbounded signal"
      REAL bounded_sin        "Signal bounded by [min_value, max_value]"
   CONTINUOUS
      x = sin(TIME)
      bounded_sin = bound(x, min_value, max_value)
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: count function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use count(value, x, tol) to count the number of
--    matches (with a tolerance) of a given value in a given array.
-----------------------------------------------------------------------------------------

COMPONENT count_ex (INTEGER N = 5 "Number of elements")
   DATA
      REAL x[5] = {3,2.5,1.92,-1,PI}   "Input array"
      REAL tol = 0.5                   "Tolerance"
      REAL value = 3                   "Value to count"
   
   DECLS
      INTEGER times
      
   INIT
      times = count(value, x, tol)
      
      PRINT("times = $times")
      
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: discr function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Show how to use discr(x) to treat a REAL variable as discrete.
--
-- Behaviour:
--    - If discr_var = FALSE:
--        x is defined by a differential equation:
--           x' = sin(TIME)
--    - If discr_var = TRUE:
--        x is updated only in the DISCRETE block and the value is kept
--        constant between events by calling discr(x).
--
-- DISCRETE logic:
--    - When sint > 0.5, x is set to +1.
--    - When sint < -0.5, x is set to -1.
-----------------------------------------------------------------------------------------
COMPONENT discr_ex (BOOLEAN discr_var = FALSE)
   DECLS
      REAL x      "State variable"
      REAL sint   "Auxiliary signal: sin(TIME)"
   INIT
      x = 1
   DISCRETE
      WHEN sint > 0.5 THEN
         x = 1
      END WHEN
      
      WHEN sint < -0.5 THEN
         x = -1
      END WHEN
      
   CONTINUOUS
      sint = sin(TIME)
   
      IF (NOT discr_var) INSERT
         -- Continuous-time evolution of x
         x' = sin(TIME)
      ELSE
         -- x is handled as a discrete variable
         discr(x)
      END IF
END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: discr_array function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate discr_array(array_var) with an array of REAL variables.
--
-- Behaviour:
--    - If discr_var = FALSE:
--        Each element array_var[i] follows a differential equation:
--           array_var[i]' = i * sin(TIME)
--    - If discr_var = TRUE:
--        The array elements are updated only in the DISCRETE block and
--        held constant between events using discr_array(array_var).
--
-- DISCRETE logic:
--    - At TIME = TSTOP/2, each element of array_var is multiplied by 2.
-----------------------------------------------------------------------------------------
COMPONENT discr_array_ex (BOOLEAN discr_var = TRUE, INTEGER N = 5)
   DECLS
      REAL array_var[N]   "Array of REAL variables"
   INIT
      -- Initialisation of the array
      FOR (i IN 1, N)
         array_var[i] = i
      END FOR
   DISCRETE
      WHEN (TIME == TSTOP/2) THEN
         -- Discrete event: scale all elements by 2
         FOR (i IN 1, N)
            array_var[i] = array_var[i] * 2
         END FOR
      END WHEN
   CONTINUOUS
      IF (NOT discr_var) INSERT
         -- Continuous-time dynamics of each element
         EXPAND (i IN 1, N) array_var[i]' = i * sin(TIME)
      ELSE
         -- The array is handled as discrete
         discr_array(array_var)
      END IF
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: find function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use find(value, x, tol) to find the first index of the array 
--    x[N] that matches a given value with a tolerance.
-----------------------------------------------------------------------------------------

COMPONENT find_ex
   DATA
      REAL x[5] = {3,2.5,1.92,-1,PI}   "Input array"
      REAL tol = 0.1                   "Tolerance"
      REAL value = 2                   "Value to count"
   
   DECLS
      INTEGER idx
      
   INIT
      idx = find(value, x, tol)
      
      PRINT("index = $idx")
      
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: GetRealArrayItem function (1D array)
-----------------------------------------------------------------------------------------
-- Purpose:
--    Select one element from a 1D REAL array by index and use it as a gain.
--
-- Behaviour:
--    - gains contains 3 possible gain values.
--    - sel selects which gain to use (1..3).
--    - y is the product of the selected gain and the input u.
-----------------------------------------------------------------------------------------
COMPONENT GetRealArrayItem_ex
   DATA
      REAL gains[3] = {0.8, 1.0, 1.2}  "Available gains"
      INTEGER sel = 2                  "Selected index (1..3)"
      REAL u = 5.0                     "Input signal (constant for this demo)"
   DECLS
      REAL y                           "Output"
   CONTINUOUS
      y = GetRealArrayItem(gains, sel) * u
END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: GetRealArrayItem function (2D array)
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate that GetRealArrayItem can also be used with 2D REAL arrays.
--
-- Behaviour:
--    - gains is a 2x3 matrix of gains.
--    - sel selects one element of the flattened storage (library behaviour).
--    - item is the value returned by GetRealArrayItem.
--    - y is item multiplied by the input u.
-----------------------------------------------------------------------------------------
COMPONENT GetRealArrayItem_2D_ex
   DATA
      REAL gains[2,3] = {{0.8, 1.0, 1.2},{1.4, 1.6, 1.8}}  "Available gains (2D array)"
      INTEGER sel = 2                                      "Selected index"
      REAL u = 5.0                                         "Input signal (constant for this demo)"
   DECLS
      REAL y                                               "Output"
      REAL item                                            "Selected gain item"
   CONTINUOUS
      item = GetRealArrayItem(gains, sel)
      y = item * u
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: int function
-----------------------------------------------------------------------------------------

COMPONENT int_ex
   DECLS
      DISCR REAL x = 1.2   UNITS no_units       "Input value"
      INTEGER x_int        UNITS no_units       "Integer part of the input"

   INIT
      x_int = int(x)
      PRINT("The integer part of $x is $x_int.")

END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: max function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Show how to use max(x, y) to impose a lower limit on a signal.
--
-- Behaviour:
--    - y = cos(TIME) can be below or above zero.
--    - bounded_y = max(lower_limit, y) ensures the signal does not go below
--      lower_limit.
-----------------------------------------------------------------------------------------
COMPONENT max_ex  "Example: uses max(x,y) to select the largest REAL of two values."
   DATA
      REAL lower_limit = 0.0   "Lower threshold"
   DECLS
      REAL y                   "Original signal"
      REAL bounded_y           "Signal after applying the lower bound"
   CONTINUOUS
      y = cos(TIME)
      bounded_y = max(lower_limit, y)
END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: max_impl function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate max_impl(x, z), which keeps a running maximum of a signal.
--
-- Behaviour:
--    - u = sin(TIME) * TIME^2.
--    - current_max stores the maximum value of u encountered so far.
--    - max_impl(u, current_max) updates current_max in-place.
-----------------------------------------------------------------------------------------
COMPONENT max_impl_ex "Example: uses max_impl(x, z) to keep a running maximum."
   DECLS
      REAL u              "Input signal"
      REAL current_max    "Running maximum of u"
   INIT
      -- Initial value for the running maximum
      current_max = 0     
   CONTINUOUS
      -- max_impl returns max(u, current_max) and ALSO writes the result into 'current_max'
      u = sin(TIME) * TIME**2
      max_impl(u, current_max)
END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: min function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Show how to use min(x, y) to impose an upper limit on a signal.
--
-- Behaviour:
--    - y = cos(TIME) can be above or below zero.
--    - bounded_y = min(upper_limit, y) ensures the signal does not go above
--      upper_limit.
-----------------------------------------------------------------------------------------
COMPONENT min_ex  "Example: uses min(x,y) to select the smallest REAL of two values."
   DATA
      REAL upper_limit = 0.0   "Upper threshold"
   DECLS
      REAL y                   "Original signal"
      REAL bounded_y           "Signal after applying the upper bound"
   CONTINUOUS
      y = cos(TIME)
      bounded_y = min(upper_limit, y)
END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: min_impl function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate min_impl(x, z), which keeps a running minimum of a signal.
--
-- Behaviour:
--    - u = sin(TIME) * TIME^2.
--    - current_min stores the minimum value of u encountered so far.
--    - min_impl(u, current_min) updates current_min in-place.
-----------------------------------------------------------------------------------------
COMPONENT min_impl_ex "Example: uses min_impl(x, z) to keep a running minimum."
   DECLS
      REAL u              "Input signal"
      REAL current_min    "Running minimum of u"
   INIT
      -- Initial value for the running minimum
      current_min = 0     
   CONTINUOUS
      -- min_impl returns min(u, current_min) and ALSO writes the result into 'current_min'
       u = sin(TIME) * TIME**2
       min_impl(u, current_min)
END COMPONENT

--------------------------------------------------------------------------------
-- Example: numDerivReal_ex
--------------------------------------------------------------------------------
-- Purpose:
--    Illustrate how to use numDerivReal to estimate the numerical time
--    derivative of a signal x(TIME) and compare it against its analytical
--    derivative.
--
-- Behaviour:
--    - The signal is chosen as x(TIME) = sin(omega * TIME).
--    - The analytical derivative is x'(TIME) = omega * cos(omega * TIME).
--    - numDerivReal is called at each TIME to obtain a numerical derivative
--      using the current and previous values of x and TIME.
--    - The error between analytical and numerical derivatives is computed.
--------------------------------------------------------------------------------

COMPONENT numDerivReal_ex "Example component using numDerivReal to estimate a numerical derivative"

   DATA
      REAL omega = 1.0           UNITS u_rad_s     "Angular frequency of the input signal"

   DECLS
      -- Continuous signal and its derivatives
      REAL x                     UNITS no_units    "Input signal x(TIME) = sin(omega * TIME)"
      REAL xprime_exact          UNITS u_1_s       "Analytical time derivative: omega * cos(omega * TIME)"
      REAL xprime_numeric        UNITS u_1_s       "Numerical derivative estimated by numDerivReal"
      REAL error_rel             UNITS no_units    "Difference xprime_numeric - xprime_exact"

      -- Internal memory for numDerivReal (previous value and previous time)
      DISCR REAL x_hist[2]      UNITS no_units     "History of x used by numDerivReal (x_old[1], x_old[2])"
      DISCR REAL time_prev      UNITS u_s          "Previous time stamp used by numDerivReal"

   INIT
      -- Initialize time_prev
      time_prev = TIME

   CONTINUOUS
      -------------------------------------------------------------------------
      -- Input signal and derivative
      -------------------------------------------------------------------------
      x            = sin(omega * TIME)
      xprime_exact = omega * cos(omega * TIME)

      -------------------------------------------------------------------------
      -- Call numDerivReal to estimate the numerical derivative of x(TIME)
      -------------------------------------------------------------------------
      numDerivReal(x, xprime_numeric, TIME, x_hist, time_prev)

      -------------------------------------------------------------------------
      -- Error between numerical and analytical derivatives
      -------------------------------------------------------------------------
      error_rel = div_safe2((xprime_numeric - xprime_exact),xprime_exact)

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: remainder function
-----------------------------------------------------------------------------------------

COMPONENT remainder_ex
   DATA
      INTEGER dividend = 15   UNITS no_units       "Dividend"
      INTEGER divisor = 2     UNITS no_units       "Divisor"
      
   DECLS
      INTEGER re              UNITS no_units       "Remainder"

   INIT
      re = remainder(dividend, divisor)
      PRINT("$dividend mod $divisor = $re")

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: reverse function
-----------------------------------------------------------------------------------------

COMPONENT reverse_ex (INTEGER N = 5 "Number of elements")
   DATA
      REAL x[5] = {3,2.5,1.92,-1,PI}         "Input array"
   
   DECLS
      DISCR REAL x_rev[N]     UNITS no_units       "Reversed array"
      STRING result = "x_rev = ("
      
   INIT
      reverse(x,x_rev)
      
      FOR (i IN 1,N-1)
         result += realToString(x_rev[i]) + ", "
      END FOR
      result += realToString(x_rev[N]) + ")"
      
      PRINT(result)
      
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: roundN function
-----------------------------------------------------------------------------------------

COMPONENT roundN_ex
   DATA
      REAL x = 1.2            UNITS no_units       "Input value"
      INTEGER n_dec = 2       UNITS no_units       "Number of decimals"
   
   DECLS
      DISCR REAL x_r = 1.2    UNITS no_units       "Rounded number"

   INIT
      x_r = roundN(x,n_dec)
      PRINT("The number $x rounded with $n_dec decimals is $x_r.")

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: sign function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate sign(x), which returns:
--       -1 if x < 0
--        0 if x = 0
--       +1 if x > 0
--
-- Behaviour:
--    - input is a time-varying signal.
--    - output is the sign of input.
-----------------------------------------------------------------------------------------
COMPONENT sign_ex
   DATA
      REAL y_o = 0        "Unused here (kept for compatibility with other examples)"
   DECLS
      REAL input          "Input signal"
      REAL output         "Sign of the input"
   CONTINUOUS
      input = sin(TIME) * TIME**2
      output = sign(input)
END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: sign2 function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate sign2(x, tol), which behaves like sign(x) but introduces
--    a tolerance band around zero.
--
-- Behaviour (typical library behaviour, for documentation purposes):
--    - If |x| < tol, output is 0 (dead zone around zero).
--    - If x >= tol, output is +1.
--    - If x <= -tol, output is -1.
-----------------------------------------------------------------------------------------
COMPONENT sign2_ex
   DATA
      REAL y_o = 0        "Unused here (kept for compatibility with other examples)"
      REAL tol = 1        "Tolerance band around zero"
   DECLS
      REAL input          "Input signal"
      REAL output         "Result of sign(input)"
      REAL output2        "Result of sign2(input, tol)"
   CONTINUOUS
      input = sin(TIME) * TIME**2
      output = sign(input)
      output2 = sign2(input, tol)
END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: sign3 function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate sign3(x, den, tol), a more advanced sign-like function
--    that can depend on both the input and an additional denominator.
--
-- Behaviour (high-level description):
--    - input is a scaled version of sin(TIME).
--    - den is defined as input + 1 (example auxiliary variable).
--    - res is the simple ratio input/den.
--    - output  = sign(input)
--    - output2 = sign2(input, tol)
--    - output3 = sign3(input, den, tol)
-----------------------------------------------------------------------------------------
COMPONENT sign3_ex
   DATA
      REAL y_o = 0        "Unused here (kept for compatibility with other examples)"
      REAL tol = 1        "Tolerance band around zero for sign2/sign3"
   DECLS
      REAL input          "Input signal"
      REAL den            "Auxiliary denominator"
      REAL res            "Simple ratio input/den"
      REAL output         "Result of sign(input)"
      REAL output2        "Result of sign2(input, tol)"
      REAL output3        "Result of sign3(input, den, tol)"
   CONTINUOUS
      input  = sin(TIME) * TIME**2 / 50
      den    = input + 1
      res    = input / den
      output  = sign(input)
      output2 = sign2(input, tol)
      output3 = sign3(input, den, tol)
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: sort function
-----------------------------------------------------------------------------------------

COMPONENT sort_ex (INTEGER N = 5 "Number of elements")
   DATA
      REAL x[5] = {3,2.5,1.92,-1,PI}      "Input array"  
      BOOLEAN h_to_l = FALSE              "Option to choose to sort the elements from highest to lowest or vice versa"
   
   DECLS
      DISCR REAL x_sorted[N]  UNITS no_units    "Sorted array"
      STRING result = "x_sorted = ("
      
   INIT
      sort(x,x_sorted,h_to_l)
      
      FOR (i IN 1,N-1)
         result += realToString(x_sorted[i]) + ", "
      END FOR
      result += realToString(x_sorted[N]) + ")"
      
      PRINT(result)
      
END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: sum1D function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate sum1D for:
--      - A constant 1D array.
--      - A time-varying 1D array defined with EXPAND.
--
-- Behaviour:
--    - sum_1 = sum of the 5 constant elements in array.
--    - array_var[i] = sin(TIME + i) for i = 1..N.
--    - sum_2 = sum of the N elements of array_var.
-----------------------------------------------------------------------------------------
COMPONENT sum1D_ex (INTEGER N = 4 "Number of elements")
   DATA
      REAL array[5] = {1, 1.7, 8.2, 3, 4/2}  "Example constant array"
   DECLS
      REAL array_var[N]                       "Time-varying array"
      REAL sum_1                              "Sum of constant array"
      REAL sum_2                              "Sum of time-varying array_var"
   CONTINUOUS
      sum_1 = sum1D(5, array)

      EXPAND (i IN 1, N)
         array_var[i] = sin(TIME + i)
      sum_2 = sum1D(N, array_var)
END COMPONENT


-----------------------------------------------------------------------------------------
-- Example: sum2D function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate sum2D for:
--      - A constant 2D array.
--      - A time-varying 2D array defined with EXPAND.
--
-- Behaviour:
--    - sum_1 = sum of all elements in array (2 x 5).
--    - array_var[i, j] = j * sin(TIME + i) for i = 1..Nx, j = 1..Ny.
--    - sum_2 = sum of all elements in array_var.
-----------------------------------------------------------------------------------------
COMPONENT sum2D_ex (INTEGER Nx = 3, INTEGER Ny = 2)
   DATA
      REAL array[2,5] = {{1, 1.7, 8.2, 3, 4/2},
                         {3*0.5, 6, 1.1, 4.3, 2}}  "Example constant 2D array"
   DECLS
      REAL array_var[Nx, Ny]   "Time-varying 2D array"
      REAL sum_1               "Sum of constant 2D array"
      REAL sum_2               "Sum of time-varying 2D array_var"
   CONTINUOUS
      sum_1 = sum2D(2, 5, array)

      EXPAND (i IN 1, Nx) EXPAND (j IN 1, Ny)
         array_var[i, j] = j * sin(TIME + i)

      sum_2 = sum2D(Nx, Ny, array_var)
END COMPONENT
