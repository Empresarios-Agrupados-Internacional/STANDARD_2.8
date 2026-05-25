--------------------------------------------------------------------------------
-- EA Internacional - EcosimPro Simulation Source Code
--
-- File         : sys_ex_tables.el
-- Library      : MATH
-- Description  : Helper component for 1D table linear interpolation.
--               It keeps the active table cell index to properly handle
--               discontinuities when the input signal crosses table breakpoints.
-- Notes        : Based on the standard EcosimPro MATH library.
-- Author       : Ramon Perez Vara
-- Date         : 12-Jan-2004
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- CompLinearInterp1D
--
-- Purpose:
--   Perform linear interpolation on a 1D table while tracking the current table
--   interval (cell). The interval index is updated discretely when the input
--   crosses a breakpoint, which is essential when the underlying table contains
--   discontinuities.
--
-- Key idea:
--   * cellCrossing1D(...) detects that the input has moved to a different cell.
--   * 'pi' stores the active cell index used by the interpolation routine.
--   * The output is computed continuously using cellLinearInterp1D(...) inside
--     the active cell.
--------------------------------------------------------------------------------

COMPONENT linear_interp_1D
   DATA
      TABLE_1D table = {{0,1}, {0,1}}     "1D table definition (breakpoints and tabulated values)"
      REAL signal_in = 0.5                "Input signal (independent variable)"
      
   DECLS
      INTEGER i            "Cell index detected by the crossing function"
      INTEGER pi           "Active cell index (pointer used by the interpolation)"
      REAL signal_out      "Output signal (interpolated value)"

   DISCRETE
      -- Update the active cell pointer when the input crosses a table breakpoint
      WHEN cellCrossing1D(table, signal_in, pi, i) THEN
         pi = i
      END WHEN

   CONTINUOUS
      -- Linear interpolation within the cell indicated by 'pi'
      signal_out = cellLinearInterp1D(table, signal_in, pi)

END COMPONENT
