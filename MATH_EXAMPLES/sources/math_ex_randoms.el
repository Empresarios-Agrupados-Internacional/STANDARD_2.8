/*-----------------------------------------------------------------------------------------
 FILE: math_ex_randoms
 DESCRIPTION: Usage examples of the random functions of the MATH library
 CREATION DATE: 22/01/2026
-----------------------------------------------------------------------------------------*/

USE MATH

--------------------------------------------------------------------------------
-- Example: bnldev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from a binomial distribution X ~ Bin(n_trials, p_succ)
--    using the MATH.bnldev function. The work arrays integer_array and
--    real_array keep the RNG state and cached values between calls.
--------------------------------------------------------------------------------
COMPONENT bnldev_ex (INTEGER N = 200 "Number of random numbers generated")
"Example: generate binomial deviates with bnldev"

   DATA
      -- Binomial parameters: X ~ Bin(n_trials, p_succ)
      INTEGER     n_trials = 10        UNITS no_units    "Number of trials in the binomial distribution"
      REAL        p_succ   = 0.3       UNITS no_units    "Probability of success in each trial"

   DECLS
      INTEGER     integer_array[20]    UNITS no_units    "Work array: RNG state and binomial-specific cached data"
      DISCR REAL  real_array[200]      UNITS no_units    "Work array: shuffle table and cached real values"

      DISCR REAL  ran[N]               UNITS no_units    "Binomial samples X ~ Bin(n_trials, p_succ)"
      DISCR REAL  ran_ord[N]           UNITS no_units    "Sorted binomial samples X ~ Bin(n_trials, p_succ)"

   INIT
      -- Reset work arrays (recommended) so the internal state starts from a known value
      FOR (i IN 1, 20)
         integer_array[i] = 0
      END FOR

      FOR (i IN 1, 200)
         real_array[i] = 0.0
      END FOR

      -- Set RNG seed and "not initialised" flag for ran1 (used internally by bnldev)
      --   integer_array[4] < 0  => force initialisation on first call
      --   integer_array[5] = 0  => flag that RNG is not initialised yet
      integer_array[4] = -1
      integer_array[5] = 0

      -- Set binomial parameters for bnldev:
      --   integer_array[6] = n (number of trials)
      --   real_array[101]  = p (probability of success)
      integer_array[6]  = n_trials     -- n
      real_array[101]   = p_succ       -- p
      integer_array[11] = -1           -- Force recache of factorial-related terms in bnldev

      -- Generate N binomial samples with the specified parameters
      FOR (i IN 1, N)
         ran[i] = bnldev(integer_array, real_array)
      END FOR

      -- Sort the samples
      sort(ran, ran_ord)

END COMPONENT

--------------------------------------------------------------------------------
-- Example: c_bnldev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from a binomial distribution X ~ Bin(n_trials, p_succ)
--    using the MATH.c_bnldev function. The work variable seed keep the 
--    RNG state and cached values between calls.
--------------------------------------------------------------------------------
COMPONENT c_bnldev_ex (INTEGER N = 5 "Number of random numbers generated")
"Example: generate binomial deviates with c_bnldev"

   DATA
      -- Binomial parameters: X ~ Bin(n_trials, p_succ)
      INTEGER     n_trials = 10        UNITS no_units    "Number of trials in the binomial distribution"
      REAL        p_succ   = 0.3       UNITS no_units    "Probability of success in each trial"

   DECLS    
      DISCR REAL  ran[N]             UNITS no_units    "Binomial samples X ~ Bin(n_trials, p_succ) using the external function"
      INTEGER     seed                 UNITS no_units    "Seed for the pseudorandom numbers generator"

   INIT
      -- Generate N binomial samples with the specified parameters
      FOR (i IN 1, N)
         ran[i] = c_bnldev(p_succ,n_trials,seed)
         PRINT(realToString(ran[i]))
      END FOR

END COMPONENT

--------------------------------------------------------------------------------
-- Example: expdev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from an exponential distribution with rate lambda
--    (mean 1/lambda) using the MATH.expdev function.
--    expdev(integer_array, real_array) ~ Exp(1), so we scale by 1/lambda
--    to obtain Exp(lambda).
--------------------------------------------------------------------------------
COMPONENT expdev_ex (INTEGER N = 100 "Number of random numbers generated")
"Example component using expdev to generate exponential random deviates"

   DATA
      REAL        lambda = 1           UNITS no_units    "Rate parameter lambda (> 0) of the exponential distribution"

   DECLS
      INTEGER     integer_array[20]    UNITS no_units    "Integer work array storing RNG state (seeds, flags, LCG states)"
      DISCR REAL  real_array[200]      UNITS no_units    "Real work array storing shuffle table and cached values"

      DISCR REAL  ran[N]               UNITS no_units    "Array of exponential samples X ~ Exp(lambda)"
      DISCR REAL  ran_ord[N]           UNITS no_units    "Sorted array of exponential samples X ~ Exp(lambda)"
      

   INIT
      -- Basic consistency check on lambda
      ASSERT (lambda > 0) ERROR "lambda must be positive"

      -- Recommended: initialise work arrays
      FOR (i IN 1, 20)
         integer_array[i] = 0
      END FOR

      FOR (i IN 1, 200)
         real_array[i] = 0.0
      END FOR

      -- Set RNG seed and 'not initialised' flag for ran1
      --   A negative seed forces initialisation on the first call to expdev/ran1.
      integer_array[4] = -1   -- negative seed forces initialisation
      integer_array[5] = 0    -- generator not initialised yet

      -- Generate N exponential random samples using expdev:
      --   expdev(...) ~ Exp(1)  -> scale by 1/lambda to get Exp(lambda)
      FOR (i IN 1, N)
         ran[i] = 1 / lambda * expdev(integer_array, real_array)
      END FOR

      -- Sort the generated samples
      sort(ran, ran_ord)

END COMPONENT


--------------------------------------------------------------------------------
-- Example: c_expdev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from an exponential distribution X ~ Exp(lambda)
--    using the MATH.c_expdev function. The work variable seed keep the 
--    RNG state and cached values between calls.
--------------------------------------------------------------------------------
COMPONENT c_expdev_ex (INTEGER N = 5 "Number of random numbers generated")
"Example: generate exponential deviates with c_expdev"

   DATA
      REAL        lambda = 1           UNITS no_units    "Rate parameter lambda (> 0) of the exponential distribution"

   DECLS    
      DISCR REAL  ran[N]             UNITS no_units      "Exponential samples X ~ Exp(lambda) using the external function"
      INTEGER     seed                 UNITS no_units    "Seed for the pseudorandom numbers generator"

   INIT
      -- Generate N exponential samples with the specified parameters
      FOR (i IN 1, N)
         ran[i] = 1/lambda*c_expdev(seed)
         PRINT(realToString(ran[i]))
      END FOR

END COMPONENT

--------------------------------------------------------------------------------
-- Example: gamdev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate a set of random numbers following a Gamma(k_shape, theta)
--    distribution using the MATH.gamdev function.
--
--    gamdev(integer_array, real_array)  ~ Gamma(k_shape, 1)
--    By multiplying by theta, we obtain Gamma(k_shape, theta).
--------------------------------------------------------------------------------
COMPONENT gamdev_ex (INTEGER N = 100 "Number of random numbers generated")
"Example component using gamdev to generate gamma random deviates"

   DATA
      INTEGER     k_shape = 5          UNITS no_units    "Gamma shape parameter k (integer > 0)"
      REAL        theta   = 2.0        UNITS no_units    "Gamma scale parameter theta (> 0)"

   DECLS
      INTEGER     integer_array[20]    UNITS no_units    "Integer work array storing RNG state and gamma parameters"
      DISCR REAL  real_array[200]      UNITS no_units    "Real work array storing shuffle table and cached values"

      DISCR REAL  ran[N]               UNITS no_units    "Array of gamma samples X ~ Gamma(k_shape, theta)"
      DISCR REAL  ran_ord[N]           UNITS no_units    "Sorted array of gamma samples X ~ Gamma(k_shape, theta)"

   INIT
      -- Basic checks to ensure the parameters are valid
      ASSERT (k_shape > 0) ERROR "k_shape must be positive in gamdev"
      ASSERT (theta   > 0) ERROR "theta must be positive in gamdev"

      -- Initialise work arrays (optional but recommended)
      FOR (i IN 1, 20)
         integer_array[i] = 0
      END FOR

      FOR (i IN 1, 200)
         real_array[i] = 0.0
      END FOR

      -- Set RNG seed and 'not initialised' flag for ran1 (used by gamdev)
      integer_array[4] = -1
      integer_array[5] = 0

      -- Set gamma shape parameter k in integer_array[6] for gamdev
      integer_array[6] = k_shape

      -- Generate N gamma samples:
      --   gamdev(...) ~ Gamma(k_shape, 1)
      --   ran         ~ Gamma(k_shape, theta) after scaling by theta
      FOR (i IN 1, N)
         ran[i] = theta * gamdev(integer_array, real_array)
      END FOR

      -- Sort gamma samples
      sort(ran, ran_ord)

END COMPONENT

--------------------------------------------------------------------------------
-- Example: c_gamdev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from an gamma distribution X ~ Gamma(k_shape, theta)
--    using the MATH.c_gamdev function. The work variable seed keep the 
--    RNG state and cached values between calls.
--------------------------------------------------------------------------------
COMPONENT c_gamdev_ex (INTEGER N = 5 "Number of random numbers generated")
"Example: generate gamma deviates with c_gamdev"

   DATA
      INTEGER     k_shape = 5          UNITS no_units    "Gamma shape parameter k (integer > 0)"
      REAL        theta   = 2.0        UNITS no_units    "Gamma scale parameter theta (> 0)"

   DECLS    
      DISCR REAL  ran[N]               UNITS no_units    "Gamma samples X ~ Gamma(k_shape, theta) using the external function"
      INTEGER     seed                 UNITS no_units    "Seed for the pseudorandom numbers generator"

   INIT
      -- Generate N gamma samples with the specified parameters
      FOR (i IN 1, N)
         ran[i] = theta * c_gamdev(k_shape, seed)
         PRINT(realToString(ran[i]))
      END FOR

END COMPONENT

--------------------------------------------------------------------------------
-- Example: gammln
--------------------------------------------------------------------------------
-- Purpose:
--    Demonstrate the use of gammln(x) to compute ln(Gamma(x)) at a set of
--    predefined points and print the results to the console.
--------------------------------------------------------------------------------
COMPONENT gammln_ex (INTEGER N = 5  UNITS no_units    "Number of points to evaluate")
"Example component using gammln to compute ln(Gamma(x))"

   DATA
      REAL x_values[5] = {1, 2, 3, 4.5, 5}   UNITS no_units    "Input values x > 1 where ln(Gamma(x)) will be evaluated"

   DECLS
      DISCR REAL lgamma_values[N]            UNITS no_units    "Computed values ln(Gamma(x)) = gammln(x)"

   INIT
      -- Compute ln(Gamma(x)) for each point and print the result
      FOR (i IN 1, N)
         lgamma_values[i] = gammln(x_values[i])
         PRINT("ln(Γ(" + realToString(x_values[i]) + ")) = " + realToString(lgamma_values[i]))
      END FOR

END COMPONENT


--------------------------------------------------------------------------------
-- Example: gasdev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from a Gaussian (normal) distribution X ~ N(mu, sigma)
--    using the MATH.gasdev function, which returns standard normal deviates
--    N(0,1). The samples are then scaled and shifted to obtain N(mu, sigma^2).
--------------------------------------------------------------------------------
COMPONENT gasdev_ex (INTEGER N = 100  "Number of samples to generate")
"Example component using gasdev to generate Gaussian random deviates"

   DATA
      REAL        mu    = 0            UNITS no_units    "Mean of the Gaussian distribution"
      REAL        sigma = 1            UNITS no_units    "Standard deviation of the Gaussian distribution"

   DECLS
      INTEGER     integer_array[20]    UNITS no_units    "Integer work array storing RNG state and gasdev internal flag"
      DISCR REAL  real_array[200]      UNITS no_units    "Real work array storing shuffle table and cached values"

      DISCR REAL  ran[N]               UNITS no_units    "Array of Gaussian samples X ~ N(mu, sigma^2)"
      DISCR REAL  ran_ord[N]           UNITS no_units    "Sorted array of Gaussian samples X ~ N(mu, sigma^2)"

   INIT
      -- (Optional) initialise work arrays so the RNG state starts from a known value
      FOR (i IN 1, 20)
         integer_array[i] = 0
      END FOR

      FOR (i IN 1, 200)
         real_array[i] = 0.0
      END FOR

      -- Seed the underlying RNG used by ran1/gasdev
      integer_array[4] = -1
      integer_array[5] = 0

      -- Generate N Gaussian random samples:
      --   gasdev(...) ~ N(0,1)
      --   ran[i]      ~ N(mu, sigma^2) after affine transformation
      FOR (i IN 1, N)
         ran[i] = mu + sigma * gasdev(integer_array, real_array)
      END FOR

      -- Sort Gaussian samples
      sort(ran, ran_ord)

END COMPONENT

--------------------------------------------------------------------------------
-- Example: c_gasdev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from an normal distribution X ~ N(mu, sigma^2)
--    using the MATH.c_gasdev function. The work variable seed keep the 
--    RNG state and cached values between calls.
--------------------------------------------------------------------------------
COMPONENT c_gasdev_ex (INTEGER N = 5 "Number of random numbers generated")
"Example: generate gaussian deviates with c_gasdev"

   DATA
      REAL        mu    = 0            UNITS no_units    "Mean of the Gaussian distribution"
      REAL        sigma = 1            UNITS no_units    "Standard deviation of the Gaussian distribution"

   DECLS    
      DISCR REAL  ran[N]               UNITS no_units    "Gaussian samples X ~N(mu, sigma^2) using the external function"
      INTEGER     seed                 UNITS no_units    "Seed for the pseudorandom numbers generator"

   INIT
      -- Generate N gaussian samples with the specified parameters
      FOR (i IN 1, N)
         ran[i] = sigma * c_gasdev(seed) + mu
         PRINT(realToString(ran[i]))
      END FOR

END COMPONENT


--------------------------------------------------------------------------------
-- Example: poidev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from a Poisson distribution K ~ Poisson(lambda)
--    using the MATH.poidev function. The mean (rate) lambda is provided
--    via real_array[101] and cached for performance.
--------------------------------------------------------------------------------
COMPONENT poidev_ex (INTEGER N = 100    UNITS no_units "Number of Poisson samples to generate")
"Example component using poidev to generate Poisson random deviates"

   DATA
      REAL        lambda = 4.0         UNITS no_units    "Mean (rate) of the Poisson distribution (lambda > 0)"

   DECLS
      INTEGER     integer_array[20]    UNITS no_units    "Integer work array storing RNG state and Poisson-related caches"
      DISCR REAL  real_array[200]      UNITS no_units    "Real work array storing shuffle table and cached values"

      INTEGER     ran[N]               UNITS no_units    "Array of Poisson samples K ~ Poisson(lambda)"
      INTEGER     ran_ord[N]           UNITS no_units    "Sorted array of Poisson samples K ~ Poisson(lambda)"
      
      DISCR REAL  c_ran[N]             UNITS no_units    "Array of Poisson samples K ~ Poisson(lambda) using the external function"
      INTEGER     seed                 UNITS no_units    "Seed for the pseudorandom numbers generator"

   INIT
      -- Check that the input mean is valid
      ASSERT (lambda > 0) ERROR "lambda must be positive in poidev"

      -- Initialise work arrays (optional but recommended)
      FOR (i IN 1, 20)
         integer_array[i] = 0
      END FOR

      FOR (i IN 1, 200)
         real_array[i] = 0.0
      END FOR

      -- Seed the underlying RNG used by ran1/poidev
      integer_array[4] = -1
      integer_array[5] = 0

      -- Set Poisson mean lambda in real_array[101] (required by poidev)
      real_array[101] = lambda

      -- Reset caches so poidev recomputes any cached values for this lambda
      real_array[121] = -1.0

      -- Generate N Poisson samples with mean lambda
      FOR (i IN 1, N)
         ran[i] = poidev(integer_array, real_array)
         c_ran[i] = c_poidev(lambda,seed)
      END FOR

      -- Sort Poisson sample
      sort_int(ran, ran_ord)

END COMPONENT

--------------------------------------------------------------------------------
-- Example: c_poidev
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from an Poisson distribution X ~ Poi(lambda)
--    using the MATH.c_poidev function. The work variable seed keep the 
--    RNG state and cached values between calls.
--------------------------------------------------------------------------------
COMPONENT c_poidev_ex (INTEGER N = 5 "Number of random numbers generated")
"Example: generate Poisson deviates with c_poidev"

   DATA
      REAL        lambda = 4.0         UNITS no_units    "Mean (rate) of the Poisson distribution (lambda > 0)"

   DECLS    
      DISCR REAL  ran[N]               UNITS no_units    "Poisson samples X ~Poi(lambda) using the external function"
      INTEGER     seed                 UNITS no_units    "Seed for the pseudorandom numbers generator"

   INIT
      -- Generate N Poisson samples with the specified parameters
      FOR (i IN 1, N)
         ran[i] = c_poidev(lambda,seed)
         PRINT(realToString(ran[i]))
      END FOR

END COMPONENT


--------------------------------------------------------------------------------
-- Example: ran1
--------------------------------------------------------------------------------
-- Purpose:
--    Show how to use ran1 to generate a sequence of uniform pseudorandom
--    numbers in (min,max) with a single initialisation of the generator.
--
-- Behaviour:
--    - integer_array[4] is set to a negative value to force initialisation.
--    - integer_array[5] is set to 0 to mark the generator as "not initialised".
--    - On the first call to ran1, the shuffle table is built and the internal
--      state is initialised.
--    - Subsequent calls continue the same pseudorandom sequence.
--------------------------------------------------------------------------------
COMPONENT ran1_ex (INTEGER N = 100 "Number of random numbers generated")
"Example component using ran1 to generate uniform random numbers"

   DATA
      REAL        min = 0              UNITS no_units    "Minimum value generated"
      REAL        max = 1              UNITS no_units    "Maximum value generated"

   DECLS
      INTEGER     integer_array[5]     UNITS no_units    "Integer work array storing RNG state: seeds, flags and LCG states"
      DISCR REAL  real_array[97]       UNITS no_units    "Real work array storing the 97-element shuffle table"

      DISCR REAL  ran[N]               UNITS no_units    "Array of uniform random numbers in (0,1) generated by ran1"
      DISCR REAL  ran_ord[N]           UNITS no_units    "Sorted array of uniform random numbers generated by ran1"
      
      DISCR REAL  c_ran[N]             UNITS no_units    "Array of uniform random numbers in (0,1) using the external function"
      INTEGER     seed                 UNITS no_units    "Seed for the pseudorandom numbers generator"

   INIT
      -- Mark generator as 'not initialised' and set a negative seed
      --   integer_array[4] < 0  => force initialisation on first call
      --   integer_array[5] = 0  => flag: RNG not initialised yet
      integer_array[4] = -1
      integer_array[5] = 0

      -- First call (i = 1): initialises the generator and fills the shuffle table
      -- Subsequent calls (i = 2..N): continue the pseudorandom sequence
      FOR (i IN 1, N)
         ran[i] = ran1(integer_array, real_array)*(max - min) + min
         c_ran[i] = c_ran1(seed)*(max - min) + min
      END FOR

      -- Sort the samples.
      sort(ran, ran_ord, FALSE)

END COMPONENT


--------------------------------------------------------------------------------
-- Example: ran1_reset
--------------------------------------------------------------------------------
-- Purpose:
--    Show how resetting the internal state of ran1 with the same seed
--    reproduces the same pseudorandom sequence.
--
-- Behaviour:
--    - First, the generator is initialised with a seed and three random
--      numbers ran[1..3] are generated.
--    - Then the seed is set negative again (integer_array[4] = -1),
--      forcing a reinitialisation on the next call.
--    - After the reset, three more numbers ran[4..6] are generated.
--    - Because the seed and initial conditions are identical, the two
--      sequences match:
--         ran[1] == ran[4], ran[2] == ran[5], ran[3] == ran[6].
--------------------------------------------------------------------------------
COMPONENT ran1_reset_ex
"Example component using ran1 to generate uniform random numbers"

   DECLS
      INTEGER     integer_array[5]     "Integer work array storing RNG state: seeds, flags and LCG states"
      DISCR REAL  real_array[97]       "Real work array storing the 97-element shuffle table"

      DISCR REAL  ran[6]               "Array of random numbers; first 3 before reset, last 3 after reset"

   INIT
      -------------------------------------------------------------------------
      -- First sequence: generate ran[1..3] using initial seed and state
      -------------------------------------------------------------------------
      -- Mark generator as 'not initialised' and set a negative seed
      integer_array[4] = -1
      integer_array[5] = 0

      -- First call (i = 1): initialises the generator and fills the shuffle table
      -- Subsequent calls (i = 2,3): continue the pseudorandom sequence
      FOR (i IN 1, 3)
         ran[i] = ran1(integer_array, real_array)
      END FOR

      -------------------------------------------------------------------------
      -- Reset generator: start the sequence again with the same seed
      -------------------------------------------------------------------------
      -- Setting integer_array[4] to a negative value forces reinitialisation
      -- on the next call to ran1. The existing RNG state will be overwritten.
      integer_array[4] = -1

      -- After reset, ran[4..6] reproduce the first three deviates of the
      -- original sequence (ran[1..3]), because the seed and settings are the same.
      FOR (i IN 4, 6)
         ran[i] = ran1(integer_array, real_array)
      END FOR

END COMPONENT

--------------------------------------------------------------------------------
-- Example: c_ran1
--------------------------------------------------------------------------------
-- Purpose:
--    Generate N samples from an Uniform distribution X ~ U(a,b)
--    using the MATH.c_ran1 function. The work variable seed keep the 
--    RNG state and cached values between calls.
--------------------------------------------------------------------------------
COMPONENT c_ran1_ex (INTEGER N = 5 "Number of random numbers generated")
"Example: generate uniform deviates with c_ran1"

   DATA
      REAL        a = 0                UNITS no_units    "Lower bound of the interval"
      REAL        b = 2                UNITS no_units    "Upper bound of the interval"

   DECLS    
      DISCR REAL  ran[N]               UNITS no_units    "Uniform samples X ~U(a,b) using the external function"
      INTEGER     seed                 UNITS no_units    "Seed for the pseudorandom numbers generator"

   INIT
      -- Generate N uniform samples with the specified parameters
      FOR (i IN 1, N)
         ran[i] = c_ran1(seed)*(b-a) + a
         PRINT(realToString(ran[i]))
      END FOR

END COMPONENT