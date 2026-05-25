/*-----------------------------------------------------------------------------------------
 FILE: math_ex_fluids
 DESCRIPTION: Usage examples of the functions of the MATH library
 CREATION DATE: 16/12/2025
-----------------------------------------------------------------------------------------*/
USE MATH

-----------------------------------------------------------------------------------------
-- Example: div_safe function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use div_safe(num, den, y) to perform a numerically
--    safe division that avoids division by zero or by very small denominators.
--
-- Behaviour:
--    - If |den| > math_tol:
--         y = num / den
--      (div_safe updates y with the new division result)
--    - If |den| <= math_tol:
--         y keeps its previous value
--      (div_safe leaves y unchanged and returns the previous result)
--
-- Notes:
--    - y acts as an IN/OUT variable:
--         * On entry:  contains the previous valid division result.
--         * On exit:   contains the updated result (or the previous one if
--                     the division is not safe).
--    - In this example:
--         * num is kept constant.
--         * den is driven through zero with sin(TIME), so we can see regions
--           where the division would be unsafe and y is held.
-----------------------------------------------------------------------------------------
COMPONENT div_safe_ex "Example component using the div_safe function for safe division"

   DATA
      REAL num_init = 1.0     "Initial value for the numerator"

   DECLS
      DISCR REAL num          "Numerator used in the division"
      REAL den                "Denominator used in the division"
      REAL y_safe             "Result of the safe division num/den using div_safe"
      REAL y_safe2            "Result of the safe division num/den using div_safe2"
      REAL y                  "Result of the division num/den"

   INIT
      -- Initialise numerator and denominator
      num = num_init

      -- Initial value of y (used when division is not safe)
      y = 0.0

   CONTINUOUS
      -- Example time-varying denominator that crosses zero:
      --   den oscillates between -1 and +1.
      den = sin(TIME)

      -- Regular division
      y = num/den
      
      -- Safe division:
      --   - If |den| > math_tol, y is updated as num / den.
      --   - Otherwise, y keeps its previous value.
      
      -- Using div_safe:
      div_safe(num, den, y_safe)
      
      -- Using div_safe2:
      y_safe2 = div_safe2(num, den)
      

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: deadband function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        y = deadband(x, x_up, x_low)
--    to filter out small variations of a signal around zero (or around
--    a small interval), creating a “dead band”.
--
-- Behaviour:
--    - If x is outside the interval [x_low, x_up], the output y is x
--      (the signal passes through).
--    - If x is inside the interval [x_low, x_up], the output y is 0
--      (the signal is suppressed).
--
-- Example in this component:
--    - Input signal:
--         u(TIME) = sin(TIME)
--    - Dead band:
--         x_low = -0.2
--         x_up  =  0.2
--    - Effect:
--         * For |sin(TIME)| <= 0.2, y = 0.
--         * For |sin(TIME)|  > 0.2, y = sin(TIME).
--
-- Typical use cases:
--    - Removing small noise around zero from sensor signals.
--    - Implementing thresholds / insensitivity zones in control logic.
-----------------------------------------------------------------------------------------
COMPONENT deadband_ex "Example component using the deadband function"

   DATA
      REAL x_low = -0.2   "Lower limit of the dead band"
      REAL x_up  =  0.2   "Upper limit of the dead band"

   DECLS
      REAL u              "Raw input signal, e.g. noisy measurement"
      REAL y              "Output after applying the dead band"

   CONTINUOUS
      -- Example input signal: sinusoidal variation over time
      u = sin(TIME)

      -- Apply dead band:
      --   - y = 0 when u is within [x_low, x_up]
      --   - y = u when u is outside [x_low, x_up]
      y = deadband(u, x_up, x_low)

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: donor_cell function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        prop_int = donor_cell(flow, upstream_prop, downstream_prop)
--    to compute the convected value of a fluid property at an interface
--    using the donor-cell (upwind) scheme.
--
-- Physical interpretation:
--    - flow > 0  =>  fluid moves from upstream to downstream:
--          interface property ≈ upstream_prop
--    - flow < 0  =>  fluid moves from downstream to upstream:
--          interface property ≈ downstream_prop
--    - Around flow ≈ 0, a small tolerance "math_tol" is used to regularise the
--      sign of the flow and avoid division-by-zero issues.
--
-- Example in this component:
--    - We consider a 1D “interface” between two cells:
--         * upstream cell with property upstream_prop (e.g. temperature)
--         * downstream cell with property downstream_prop
--    - The flow is time-varying:
--         flow(TIME) = flow_amp * sin(2*PI*f_flow*TIME)
--      so it periodically changes direction.
--    - prop_int is computed with donor_cell and shows:
--         * when flow > 0  ->  prop_int ~ upstream_prop
--         * when flow < 0  ->  prop_int ~ downstream_prop
-----------------------------------------------------------------------------------------
COMPONENT donor_cell_ex "Example component using the donor_cell function (upwind scheme)"

   DATA
      REAL upstream_prop   = 300      "Upstream property, e.g. temperature in K"
      REAL downstream_prop = 350      "Downstream property, e.g. temperature in K"

      REAL flow_amp        = 1.0      "Amplitude of the flow rate"
      REAL f_flow          = 0.1      "Frequency (Hz) of the flow oscillation"

   DECLS
      REAL flow                       "Time-varying flow rate. Defines flow direction"
      REAL prop_int                   "Property at the interface"

   CONTINUOUS
      -- Example: sinusoidal flow that changes direction over time
      --   flow(TIME) > 0  =>  convection from upstream to downstream
      --   flow(TIME) < 0  =>  convection from downstream to upstream
      flow = flow_amp * sin(2*PI*f_flow*TIME)

      -- Compute the convected property at the interface using donor_cell:
      --   - uses upstream_prop when flow > 0,
      --   - uses downstream_prop when flow < 0,
      --   - uses a smoothed sign around flow close to 0 (controlled by math_tol).
      prop_int = donor_cell(flow, upstream_prop, downstream_prop)

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: fpow_gt_one function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        x_reg = fpow_gt_one(y, ylam, n)
--    to compute a signed power with a smooth (quadratic) regularisation
--    zone around y = 0, for exponents n >= 1.
--
-- Idea:
--    - We compare the regularised power x_reg with the standard power
--      x_std = y^n.
--    - For |y| > ylam:
--         fpow_gt_one behaves like sign(y)*|y|^n (non-regularised).
--    - For |y| <= ylam:
--         fpow_gt_one uses a quadratic expression that:
--           * avoids sharp corners at y = 0,
--           * ensures smooth behaviour and continuous derivatives.
--
-- Example in this component:
--    - Input signal:
--         y(TIME) = A * sin(2*pi*f*TIME)
--    - Regularisation zone:
--         |y| <= ylam  (small amplitude region around 0)
--    - We compute:
--         x_reg(TIME) = fpow_gt_one(y, ylam, n)
--         x_std(TIME) = y^n
--      so you can plot/compare both and see the effect of the
--      regularisation near y = 0.
-----------------------------------------------------------------------------------------
COMPONENT fpow_gt_one_ex "Example component using fpow_gt_one (n >= 1)"

   DATA
      REAL n    = 2.0      "Exponent (n >= 1, e.g. squared behaviour)"
      REAL ylam = 0.3      "Half-width of the linear/regularisation zone"

   DECLS
      REAL y               "Input signal to be raised to power n"
      REAL x_reg           "Regularised signed power: fpow_gt_one(y, ylam, n)"
      REAL x_std           "Standard signed power y^n (for comparison)"

   CONTINUOUS
      -- Time-varying input signal (can be negative and positive)
      y = sin(2*PI*TIME)

      -- Regularised power:
      --   - For |y| > ylam or ylam == 0:   x_reg near sign(y)*|y|^n
      --   - For |y| <= ylam:               smooth quadratic regularisation
      x_reg = fpow_gt_one(y, ylam, n)

      -- Non-regularised reference: standard power
      x_std = sign(y)*y**n

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: fpow_lt_one function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        x_reg = fpow_lt_one(y, ylam, n)
--    to compute a signed power with a smooth linear/polynomial
--    regularisation near y = 0, for exponents 0 <= n <= 1.
--
-- Idea:
--    - We compare the regularised power x_reg with the standard power
--      y_std = sign(y)*|y|^n.
--    - For |y| > ylam:
--         fpow_lt_one behaves like sign(y)*|y|^n (no regularisation).
--    - For |y| <= ylam:
--         fpow_lt_one uses a polynomial that keeps y and dy/dx continuous
--         at |y| = ylam, avoiding sharp corners and numerical issues
--         around zero.
--
-- Example in this component:
--    - Input signal:
--         y(TIME) = A * sin(2*pi*f*TIME)
--    - Regularisation zone:
--         |y| <= ylam
--    - We compute:
--         x_reg(TIME) = fpow_lt_one(y, ylam, n)
--         x_std(TIME) = sign(y) * |y|^n
--      so both can be plotted/compared to see the effect of the
--      regularisation near zero.
-----------------------------------------------------------------------------------------
COMPONENT fpow_lt_one_ex "Example component using fpow_lt_one (0 <= n <= 1)"

   DATA
      REAL n    = 0.5    "Exponent (0 <= n <= 1, e.g. square root with sign)"
      REAL ylam = 0.3    "Half-width of the linear/regularisation zone around zero"
   DECLS
      REAL y                 "Input signal to be raised to power n"
      REAL x_reg             "Regularised signed power: fpow_lt_one(y, ylam, n)"
      REAL x_std             "Standard signed power sign(y)*|y|^n (for comparison)"

   CONTINUOUS
      -- Time-varying input signal (changes sign and passes through zero)
      y = sin(2*PI*TIME)

      -- Regularised power:
      --   - For |x| > xlam or xlam == 0: y_reg near sign(x)*|x|^n
      --   - For |x| <= xlam:             smooth polynomial regularisation
      x_reg = fpow_lt_one(y, ylam, n)

      -- Non-regularised reference: signed power
      x_std = sign(y) * abs(y)**n

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: fpow function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        x_reg = fpow(y, ylam, n)
--    as a unified wrapper around fpow_lt_one and fpow_gt_one to compute
--    a signed power with linear / smooth regularisation near zero for
--    arbitrary exponents n >= 0.
--
-- Behaviour (inside fpow):
--    - If n = 1:
--         x = y
--    - If n > 1:
--         x = fpow_gt_one(y, ylam, n)
--    - If 0 <= n < 1:
--         x = fpow_lt_one(y, ylam, n)
--
-- Example in this component:
--    - Input signal:
--         y(TIME) = A * sin(2*pi*f*TIME)
--      so y changes sign and crosses zero periodically.
--    - Regularisation zone:
--         controlled by ylam (half-width around y = 0).
--    - We compute:
--         x_reg(TIME) = fpow(y, ylam, n)
--         x_std(TIME) = sign(y) * |y|^n
--
--    By changing n in DATA:
--       * 0 <  n < 1  ->  "root-like" behaviour with regularisation (fpow_lt_one path)
--       * n = 1       ->  identity (x_reg = y)
--       * n > 1       ->  "power-like" behaviour with regularisation (fpow_gt_one path)
-----------------------------------------------------------------------------------------
COMPONENT fpow_ex "Example component using the fpow wrapper (n >= 0)"

   DATA
      REAL n    = 0.5      "Exponent (n >= 0). Try n=0.5, 1.0, 2.0 to see different behaviours"
      REAL ylam = 0.3      "Width of the regularisation zone around zero"

   DECLS
      REAL y               "Input signal to be raised to power n"
      REAL x_reg           "Regularised signed power"
      REAL x_std           "Standard signed power sign(y)*|y|^n"

   CONTINUOUS
      -- Time-varying input: can be positive, negative, and pass through zero
      y = sin(2*PI*TIME)

      -- Unified regularised signed power:
      --   - n = 1:   x_reg = y
      --   - n > 1:   fpow_gt_one path (power-like with regularisation)
      --   - 0<=n<1:  fpow_lt_one path (root-like with regularisation)
      x_reg = fpow(y, ylam, n)

      -- Non-regularised reference: signed power (useful for plotting comparison)
      x_std = sign(y) * abs(y)**n

END COMPONENT

-----------------------------------------------------------------------------------------
-- Example: rev_fri function
-----------------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate how to use:
--        f_fric = rev_fri(v, fc1, fc2)
--    to model asymmetric Coulomb friction with a smooth transition around zero
--    velocity in a simple 1-DOF translational system.
--
-- Model:
--    A mass m is subjected to:
--      - An external sinusoidal force F_ext(t),
--      - A viscous damping force cv * v,
--      - A Coulomb friction force computed by rev_fri(v, fc1, fc2).
--
--    The equation of motion is:
--       m * v' = F_ext - cv * v + f_fric
--
-- Behaviour of rev_fri:
--    - For v > 0: friction tends to -fc1 (direct motion),
--    - For v < 0: friction tends to -fc2 (reverse motion),
--    - Around v ≈ 0: tanh(v*1.e4) provides a smooth, differentiable transition.
-----------------------------------------------------------------------------------------
COMPONENT rev_fri_ex "Example component using rev_fri for asymmetric Coulomb friction"

   DATA
      REAL m    = 1.0      UNITS u_kg        "Mass"
      REAL cv   = 0.5      UNITS no_units    "Viscous damping coefficient"

      REAL fc1  = 10.0     UNITS u_N         "Coulomb friction for positive velocity"
      REAL fc2  = 15.0     UNITS u_N         "Coulomb friction for negative velocity"

      REAL A_for = 20.0    UNITS u_N         "Amplitude of external sinusoidal force"
      REAL f_for = 0.5     UNITS u_Hz        "Frequency of external force"

   DECLS
      REAL x               UNITS u_m         "Position"
      REAL v               UNITS u_m_s       "Velocity, unit from MATH/DEFAULT units"
      REAL F_ext           UNITS u_N         "External force"
      REAL F_fric          UNITS u_N         "Coulomb friction force"

   INIT
      -- Initial conditions
      x = 0.0
      v = 0.0

   CONTINUOUS
      -- Time-varying external excitation force
      F_ext = A_for * sin(2 * PI * f_for * TIME)

      -- Asymmetric Coulomb friction with smooth transition near v = 0
      F_fric = rev_fri(v, fc1, fc2)

      -- Equation of motion:
      m * v' = F_ext - cv * v + F_fric

      -- Kinematic relation
      x' = v

END COMPONENT
