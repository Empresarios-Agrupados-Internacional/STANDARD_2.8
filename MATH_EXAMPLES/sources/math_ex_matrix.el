/*-----------------------------------------------------------------------------------------
 FILE: math_ex_matrix
 DESCRIPTION: Usage examples of the macros of the MATH library
 CREATION DATE: 03/02/2026
-----------------------------------------------------------------------------------------*/

#include "@MATH@/include/macros.el"

ENUM axes = {X, Y, Z}

/*-----------------------------------------------------------------------------------------
 Example 1: Sum of two 3D vectors
 Description:
    This example shows how to add two vectors defined over an enumeration.
    The result is computed both with an explicit EXPAND loop and with the
    VADD_en macro.
-----------------------------------------------------------------------------------------*/
COMPONENT VelSum3D
DATA
   REAL v_body[axes] = { 10.0, 0.0, 0.0 }       UNITS u_m_s       "Velocity of the body"
   REAL v_wind[axes] = { -2.0, 1.0, 0.0 }       UNITS u_m_s       "Relative velocity of the wind"

DECLS
   REAL v_rel[axes]      UNITS u_m_s       "Relative velocity of the body"
   REAL v_rel_m[axes]    UNITS u_m_s       "Relative velocity of the body (calculated using macros)"

CONTINUOUS
   -- v_rel = v_body + v_wind

   -- Calculation using expand
   EXPAND (i IN axes)
      v_rel[i] = (v_body[i] + v_wind[i])

   -- Calculation using macros
   VADD_en(axes, v_body, v_wind, v_rel_m)

END COMPONENT

/*-----------------------------------------------------------------------------------------
 Example 2: Cross product of two 3D vectors
 Description:
    This example shows how to compute the cross product between a lever arm
    vector and a force vector to obtain the resulting torque. The operation
    is implemented both explicitly and with the CROSS_en macro.
-----------------------------------------------------------------------------------------*/
COMPONENT Torque3D
DATA
   REAL r[axes] = { 0.0, 0.0, 1.0 }    UNITS u_m    "Lever arm of 1 m in Z axis"
   REAL F[axes] = { 5.0, 0.0, 0.0 }    UNITS u_N    "Applied force of 5 N in X axis"

DECLS
   REAL tau[axes]      UNITS u_Nm   "Resulting torque"
   REAL tau_m[axes]    UNITS u_Nm   "Resulting torque (calculated using macros)"

CONTINUOUS
   -- tau = r x F

   -- Calculation using expand
   EXPAND (i IN 1,3)
      tau[setofElem(axes,i)] = (r[setofElem(axes,remainder(i+1,3,FALSE))] * F[setofElem(axes,remainder(i+2,3,FALSE))] \
      - r[setofElem(axes,remainder(i+2,3,FALSE))] * F[setofElem(axes,remainder(i+1,3,FALSE))])

   -- Calculation using macros
   CROSS_en(axes, r, F, tau_m)

END COMPONENT

/*-----------------------------------------------------------------------------------------
 Example 3: Matrix-vector product
 Description:
    This example shows how to compute the product of a square matrix and a
    vector to obtain a generalized force vector. The result is calculated
    both with an explicit summation and with the MV macro.
-----------------------------------------------------------------------------------------*/
COMPONENT GeneralizedForce (INTEGER N = 3 "Number of components")
DATA
   REAL M[3,3] = {{ 1.0, 0.0, 0.0 },
                  { 0.0, 2.0, 0.0 },
                  { 0.0, 0.0, 3.0 }}   UNITS u_kg     "Generalized mass matrix"

   REAL a[3] = { 0.1, 0.2, 0.3 }       UNITS u_m_s2   "Generalized accelerations"

DECLS
   REAL F[N]      UNITS u_N   "Generalized force"
   REAL F_m[N]    UNITS u_N   "Generalized force (calculated using macros)"

CONTINUOUS
   -- F = M · a

   -- Calculation using expand
   EXPAND (i IN 1,N)
      F[i] = SUM(j IN 1,N; M[i,j] * a[j])

   -- Calculation using macros
   MV(N, N, M, a, F_m)

END COMPONENT

/*-----------------------------------------------------------------------------------------
 Example 4: Tensor contraction over x
 Description:
    This example shows how to perform a tensor contraction between two
    third-order tensors along the x direction. The result is obtained both
    with nested EXPAND statements and with the TT_x macro.
-----------------------------------------------------------------------------------------*/
COMPONENT TensorProductX
DATA
   REAL A[3,3,3] = {
      { {1.0, 1.0, 1.0}, {1.0, 1.0, 1.0}, {1.0, 1.0, 1.0} },
      { {1.0, 1.0, 1.0}, {1.0, 1.0, 1.0}, {1.0, 1.0, 1.0} },
      { {1.0, 1.0, 1.0}, {1.0, 1.0, 1.0}, {1.0, 1.0, 1.0} }
   }                     UNITS no_units   "Input tensor A"

   REAL B[3,3,3] = {
      { {1.0, 0.0, 0.0}, {0.0, 1.0, 0.0}, {0.0, 0.0, 1.0} },
      { {1.0, 0.0, 0.0}, {0.0, 1.0, 0.0}, {0.0, 0.0, 1.0} },
      { {1.0, 0.0, 0.0}, {0.0, 1.0, 0.0}, {0.0, 0.0, 1.0} }
   }                     UNITS no_units   "Input tensor B"

DECLS
   REAL T[3,3,3]      UNITS no_units   "Resulting tensor T"
   REAL T_m[3,3,3]    UNITS no_units   "Resulting tensor T (calculated using macros)"

CONTINUOUS

   -- Calculation using expand
   EXPAND (i IN 1,3)
      EXPAND (j IN 1,3)
         EXPAND (k IN 1,3)
            T[i,j,k] = SUM(l IN 1,3; A[i,j,l] * B[i,l,k])

   -- Calculation using macros
   TT_x(3, A, B, T_m)

END COMPONENT
