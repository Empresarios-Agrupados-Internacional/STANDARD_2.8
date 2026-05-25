USE MATH 
USE CONTROL 

COMPONENT Random_generation

DECLS
	REAL x UNITS no_units
	REAL y UNITS no_units
	REAL z UNITS no_units
	REAL u UNITS no_units
	REAL v UNITS no_units
	REAL w UNITS no_units

TOPOLOGY
	RandomSource(random = Uniform, iseed = 1500) Unif(
		a = 0,
		b = 1)

	RandomSource(random = Gaussian, iseed = 1500) Gauss(
		mu = 0,
		sigma = 1)
	
	RandomSource(random = Exponential, iseed = 1500) Expon(
		lambda = 1)
	
	RandomSource(random = Poisson, iseed = 1500) Pois(
		xm = 1)

	RandomSource(random = Gamma, iseed = 1500) Gamm(
		order = 3)

	RandomSource(random = Binomial, iseed = 1500) Binom(
		n = 10, p = 0.5)

CONTINUOUS
	x = Unif.s_out.signal[1]
      y = Gauss.s_out.signal[1]
	z = Pois.s_out.signal[1]	          
	u = Expon.s_out.signal[1]
	v = Gamm.s_out.signal[1]	          
	w = Binom.s_out.signal[1]

END COMPONENT