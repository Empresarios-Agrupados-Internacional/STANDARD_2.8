/*-----------------------------------------------------------------------------------------
 FILE: math_ex_equations
 DESCRIPTION: Usage examples of the functions of the MATH library
 CREATION DATE: 15/11/2025
-----------------------------------------------------------------------------------------*/
USE MATH


-----------------------------------------------------------------------------------------
-- Example: EcoNonLinearEqnSolver (2x2 nonlinear system, reverse communication)
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use EcoNonLinearEqnSolver with reverse communication
--    to solve a small nonlinear system of 2 equations and 2 unknowns.
--
-- Problem solved:
--    Find (x, y) such that:
--       f1(x,y) = x^2 + y^2 - 1 = 0       (unit circle)
--       f2(x,y) = x - y           = 0     (line x = y)
--
--    The system has two real solutions: (x, y) = (±1/sqrt(2), ±1/sqrt(2)).
--    With the chosen initial guess, the solver converges to one of them.
--
-- Reverse communication logic:
--    1. ILAST is initialized <= 0 and the solver is called once.
--    2. While ILAST > 0:
--         - The solver requests function (and optionally Jacobian) evaluations.
--         - The user:
--              * Updates FVEC (and FJAC if IOPT=1).
--              * Calls EcoNonLinearEqnSolver again with ILAST unchanged.
--    3. When ILAST == 0, the solver has finished. INFO contains the termination
--       status and X contains the solution approximation.
--
-- Notes:
--    - IOPT = 2 means the Jacobian is internally approximated by finite
--      differences (FJAC is then used only as workspace).
--    - EPSFCN is used as a finite-difference step control parameter.
--    - This example encapsulates the iterative reverse-communication loop
--      inside INIT, so the solution is computed at initialisation time.
-----------------------------------------------------------------------------------------
COMPONENT EcoNonLinearEqnSolver_2eq_ex
   (
      INTEGER N    = 2  "Number of equations/unknowns",
      INTEGER LDUM = 50 "Work array length (must be >= 20 + (N^2+13N)/2; for N=2 -> >= 35)"
   )
"Example: Solve a 2x2 nonlinear system with EcoNonLinearEqnSolver using reverse communication"

   DATA
      INTEGER IOPT   = 2      "2 = solver approximates Jacobian by finite differences (no user Jacobian)"
      REAL tol       = 1e-10  "Convergence tolerance"
      REAL EPSFCN    = 1e-8   "Step control for finite-difference Jacobian"

   DECLS
      INTEGER ILAST           "Reverse communication flag (INFREV in the documentation)"
      INTEGER INFO            "Termination / internal status"

      DISCR REAL X[N]         "Unknowns vector: X[1]=x, X[2]=y"
      DISCR REAL FVEC[N]      "Nonlinear functions vector f(X)"
      DISCR REAL FJAC[N,N]    "Jacobian matrix (required only when IOPT=1; otherwise used as work array)"

      DISCR REAL DUM[LDUM]    "Real work array"
      INTEGER IDUM[20]        "Integer work array (length 20)"

      INTEGER iter            "Safety counter for reverse-communication iterations"

   INIT
      -- Initial guess (chosen near -1/sqrt(2) to converge to the negative solution)
      X[1] = -0.7
      X[2] = -0.7

      -- Initialize work arrays (recommended good practice)
      FOR (i IN 1, LDUM)
         DUM[i] = 0.
      END FOR

      FOR (i IN 1, 20)
         IDUM[i] = 0
      END FOR

      -- Start reverse-communication process (ILAST must be <= 0 initially)
      ILAST = -1
      INFO  = 0
      iter  = 0

      -- First call: solver will return requesting FVEC/FJAC evaluations (ILAST > 0)
      EcoNonLinearEqnSolver(ILAST, IOPT, N, X, FVEC, FJAC, tol, INFO, DUM, LDUM, IDUM, EPSFCN)

      -- Reverse-communication loop:
      --    while ILAST > 0, compute FVEC (and optionally FJAC) and call again
      WHILE (ILAST > 0)

         PRINT("EcoNonLinearEqnSolver in progress. steps = $iter, ILAST = $ILAST, INFO = $INFO")

         -- Compute FVEC at the current X requested by the solver
         -- f1(x,y) = x^2 + y^2 - 1  (unit circle)
         FVEC[1] = X[1]*X[1] + X[2]*X[2] - 1.
         -- f2(x,y) = x - y         (line x = y)
         FVEC[2] = X[1] - X[2]

         -- If IOPT=1, the solver may return ILAST=2 and require the Jacobian FJAC:
         IF (ILAST == 2 AND IOPT == 1) THEN
            -- J = [ df1/dx  df1/dy ]
            --     [ df2/dx  df2/dy ]
            FJAC[1,1] = 2.*X[1]
            FJAC[1,2] = 2.*X[2]
            FJAC[2,1] = 1.
            FJAC[2,2] = -1.
         END IF

         -- Recall the solver with ILAST unchanged (reverse communication)
         EcoNonLinearEqnSolver(ILAST, IOPT, N, X, FVEC, FJAC, tol, INFO, DUM, LDUM, IDUM, EPSFCN)

         iter = iter + 1
         IF (iter > 2000) THEN
            STOP "EcoNonLinearEqnSolver: too many reverse-communication steps"
         END IF

      END WHILE

      -- At this point ILAST == 0 => solver has terminated.
      -- INFO contains the termination status (convergence, failure, etc.).
      PRINT("EcoNonLinearEqnSolver finished. INFO = $INFO, x = $X[1],  y = $X[2],  steps = $iter, INFO = $INFO")

END COMPONENT


/*--------------------------------------------------------------------------------
 Example: testFFT component
 ---------------------------------------------------------------------------------
 Purpose:
    Define a simple mass–spring–damper system with a harmonic excitation that will
    be used to compute transfer functions by FFT in the experiment exp1.

 Model:
    y(t) : excitation signal (harmonic input)
    z(t) : displacement of the mass

    Equation of motion:
       m*z'' + cv*z' + K_spr*z = for*x

    where:
       m      = mass
       cv     = viscous damping coefficient
       K_spr  = spring constant
       for*x  = external forcing (x is defined in the experiment).

 Usage:
    This component is used as the base model in experiment default.exp1,
    which shows how to record time histories and call treatfft to obtain
    transfer functions between signals (e.g. y/x, z/x).
--------------------------------------------------------------------------------*/
COMPONENT testFFT 
   PORTS

   DATA  
      REAL f      = 10     UNITS u_Hz        "Excitation frequency (Hz)"
      REAL phase  = 10     UNITS u_deg       "Phase (deg) of input signal"
      REAL m      = 1      UNITS u_kg        "Mass (kg)"
      REAL K_spr  = 1      UNITS u_N_m       "Spring constant (N/m)"
      REAL cv     = 1.0    UNITS u_N_ms      "Viscous friction coefficient (N/(m*s))"
      REAL for    = 1      UNITS no_units    "Force gain factor"
   DECLS
      REAL x               UNITS no_units    "Auxiliary input (used in experiment)"
      REAL y               UNITS no_units    "Excitation signal"
      REAL z               UNITS u_m         "Displacement of the mass"
   INIT
   DISCRETE

   CONTINUOUS
      -- Harmonic input signal (can be combined with other harmonics if needed)
      y = 1 + sin(2*PI*f*TIME + phase/180*PI) -- + sin(4*PI*f*TIME)

      -- Mass-spring-damper equation in differential form:
      --    m*z'' = -K_spr*z - cv*z' + for*x
      m*z'' = -K_spr*z - cv*z' + for*x

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: solveNonLinearSystem
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use solveNonLinearSystem inside a component
--    to solve a small nonlinear system of 2 equations and 2 unknowns.
--
-- Problem solved:
--    Find (x1, x2) such that:
--       f1(x1,x2) = x1^2 + x2 - 37 = 0
--       f2(x1,x2) = x1 - x2^2 - 5 = 0
--
--    One solution of this system is:
--       (x1, x2) = (6, 1)
--
--    With the chosen initial guess, the solver converges to this solution.
--
-- Reverse communication logic:
--    1. ilast is initialized with a value <= 0 and the solver is called once.
--    2. While ilast > 0:
--         - The solver requests function evaluations, and optionally
--           Jacobian evaluations depending on iopt.
--         - The user code:
--              * Updates fvec.
--              * Updates fjac only if requested.
--              * Calls solveNonLinearSystem again with ilast unchanged.
--    3. When ilast == 0, the solver has finished. info contains the
--       termination status and x contains the solution approximation.
--
-- Notes:
--    - iopt = 2 means the Jacobian is internally approximated by finite
--      differences, so fjac is mainly used as workspace.
--    - epsfcn is used to control the finite-difference perturbation size.
--    - solveNonLinearSystem is a protected wrapper around
--      EcoNonLinearEqnSolver. If NaN or Inf values are detected in the
--      solution vector, the function restores the previous values,
--      forces ilast = 0, and returns FALSE.
--    - In this example, the reverse-communication loop is placed inside
--      INIT, so the nonlinear system is solved during component initialization.
-----------------------------------------------------------------------------------------

COMPONENT solveNonLinearSystem_ex (
      INTEGER n = 2                          "Number of nonlinear equations and unknowns",
      INTEGER ldum = 35                      "Length of the real work array required by the solver"
   ) "Example component that solves a nonlinear system using solveNonLinearSystem"

   DECLS
      DISCR REAL x1                          "First solution variable"
      DISCR REAL x2                          "Second solution variable"
      INTEGER solver_info                    "Solver termination status"

      INTEGER ilast                          "Reverse communication status flag"
      INTEGER info                           "Internal solver status code"
      INTEGER iopt                           "Jacobian evaluation option"
      INTEGER idum[20]                       "Integer work array"

      DISCR REAL tol                         "Relative convergence tolerance"
      DISCR REAL epsfcn                      "Finite-difference step control parameter"

      DISCR REAL x[n]                        "Current estimate of the solution vector"
      DISCR REAL fvec[n]                     "Residual vector evaluated at the current solution"
      DISCR REAL fjac[n,n]                   "Jacobian matrix or real workspace depending on iopt"
      DISCR REAL dum[ldum]                   "Real work array used by the solver"

      BOOLEAN ok                             "TRUE if the solver step completed without NaN/Inf detection"

   INIT
      -- Solver configuration
      ilast = -1
      info = 0
      iopt = 2
      tol = 1.e-8
      epsfcn = 1.e-8
      ok = TRUE

      -- Initialize integer work array
      FOR(i IN 1,20)
         idum[i] = 0
      END FOR

      -- Initialize real work arrays
      FOR(i IN 1,n)
         fvec[i] = 0.
         x[i] = 0.
         FOR(j IN 1,n)
            fjac[i,j] = 0.
         END FOR
      END FOR

      FOR(i IN 1,ldum)
         dum[i] = 0.
      END FOR

      -- Initial guess
      x[1] = 5.
      x[2] = 1.

      -- Reverse communication loop
      WHILE (ilast != 0 AND ok == TRUE)

         ok = solveNonLinearSystem(ilast, iopt, n, x, fvec, fjac, tol, info, dum, ldum, idum, epsfcn)

         IF (ok == FALSE) THEN
            WRITE("NaN/Inf detected during nonlinear solve\n")
            BREAK
         END IF

         IF (ilast == 1 OR ilast == 3 OR ilast == 4) THEN
            -- Evaluate the residual vector at the current point
            fvec[1] = x[1]**2 + x[2] - 37.
            fvec[2] = x[1] - x[2]**2 - 5.

         ELSEIF (ilast == 2) THEN
            -- Evaluate residuals
            fvec[1] = x[1]**2 + x[2] - 37.
            fvec[2] = x[1] - x[2]**2 - 5.

            -- Evaluate the Jacobian if requested
            fjac[1,1] = 2. * x[1]
            fjac[1,2] = 1.
            fjac[2,1] = 1.
            fjac[2,2] = -2. * x[2]
         END IF

      END WHILE

      -- Store results
      x1 = x[1]
      x2 = x[2]
      solver_info = info

      IF (ok == TRUE AND info == 1) THEN
         WRITE("Successful convergence\n")
         WRITE("x1 = %g\n", x1)
         WRITE("x2 = %g\n", x2)
      ELSE
         WRITE("Solver finished with info = %d\n", solver_info)
         WRITE("Last value: x1 = %g, x2 = %g\n", x1, x2)
      END IF

END COMPONENT