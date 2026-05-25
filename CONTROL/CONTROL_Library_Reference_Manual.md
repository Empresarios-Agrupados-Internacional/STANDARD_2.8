---
input_mode: dir
title: docs \> CONTROL \> source_files \> CONTROL_Library_Reference_Manual
---

# 1 Introduction

## 1.1 Purpose of This Manual

This document is the User Manual for the CONTROL library. The CONTROL library provides the custom items needed to represent analog and digital control systems. It can be used as a stand-alone library or together with other libraries.

This library allows to easily build models dragging and dropping the symbols from the library palette and connecting them.

The manual contains four chapters. The chapter two describes the ports of the library, the enumerative type data defined in the library and a brief description of the available components in the library.

The chapter three provides reference information for all abstract components defined in the library. The abstract components describe a behaviour that alone does not represent any physical component and can only be used as a base component for other components.

The chapter four provides reference information for all CONTROL library components.

## 1.2 Description

CONTROL library provides the typical blocks needed to simulate analog and digital control systems. It can be used as a stand-alone library or together with other libraries. It is a library of basic input/output control blocks (continuous, discrete, logical, table blocks\...)

This library allows to easily building block diagram models dragging and dropping the symbols of the blocks -components - from the library palette and connecting them. A component is the basic simulation unit representing some physical/logical behaviour. These components are used as symbols that can be connected graphically to build more complex models behaving as a new component.

A classic block diagram model of a dynamic system graphically consists of blocks and connection lines (signals). The history of these block diagram model is derived from engineering areas such as Feedback Control Theory and Signal Processing. A block within a block diagram defines a dynamic system in itself. The relationships between each elementary dynamic system in a block diagram are illustrated by the use of signals connecting the blocks. Collectively the blocks and lines in a block diagram describe an overall dynamic system.

Each component in the CONTROL library represents a block and consists of a set of equations. These equations define a relationship between the input signals and output signals. These input signals and output signals are defined in the ports of the component.

Signals represent quantities that change over time. The output signals of one block (component) can be transferred to another block by connecting their respective ports with connection lines. This can be done easily and it is explained in chapter \"Building a Model\".

The following figure depicts a typical block diagram of a typical feedback control system modelled with CONTROL library:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image9.png){width="3.9585367454068243in" height="1.541745406824147in"}

In the diagram you can distinguish the blocks with their ports (the orange small circles) and the connection lines between the blocks (the orange lines).

Typical control boxes that could be frequently used in other more complex models can be built topologically from the basic components, and then considered as new components thanks to the object-oriented programming properties, i.e. Encapsulation, Inheritance and Aggregation.

## 1.3 Change log

+---------+-----------------------------------------------------------------------------------------------------------------------------------+
| Version | New Features                                                                                                                      |
+---------+-----------------------------------------------------------------------------------------------------------------------------------+
| 5.0.0   | - The capability of array of ports is used in Demux, Mux, AdditionMulti and Product Multi                                         |
|         |                                                                                                                                   |
|         | - New components representing PI and PID controller with external tracking have been included                                     |
|         |                                                                                                                                   |
|         | - New component Actuator has been included. It represents an actuator with a limitation of the position and with a speed limiter. |
|         |                                                                                                                                   |
|         | - New component RateLimiter has been included.                                                                                    |
+---------+-----------------------------------------------------------------------------------------------------------------------------------+
| 5.0.1   | - Fixed bug (SPR2631): The variable \"signal\" must be out of the EXPAND_BLOCK to avoid redundancy of equations                   |
+---------+-----------------------------------------------------------------------------------------------------------------------------------+
| 5.0.3   | - Minor changes in Derivative component: The description of the input datum \"output_o\" has been improved (SPR1754)              |
+---------+-----------------------------------------------------------------------------------------------------------------------------------+
| 5.0.4   | - Minor changes in Actuator component (SPR2949)                                                                                   |
+---------+-----------------------------------------------------------------------------------------------------------------------------------+
| 5.0.5   | - Minor changer in Trigger_RE component (SPR3189)                                                                                 |
+---------+-----------------------------------------------------------------------------------------------------------------------------------+
| 5.0.6   | - The symbol of RateLimiter has been updated in order to display with the CONTROL standard size and shapes                        |
+---------+-----------------------------------------------------------------------------------------------------------------------------------+

# 2 CONTROL Library Items

## 2.1 Enumeration Types

### 2.1.1 Enumeration Type EndPosBehaviour

ENUM EndPosBehaviour = {end_I, end_PI}

This is an enumeration type to define the anti-windup behavior of a PI or PID controller. The two possibilities are: end_I meaning only integral behavior at the end position of the controller, and end_PI meaning proportional-integral behaviour at the end position.

### 2.1.2 Enumeration Type InitOption

ENUM InitOption = {InitialStates, InitialOutput}

This is an enumeration type to define how the user wants to initializate the output signal (InitialOutput) or the state variables (InitialStates). This enumeration type is used in the components ZeroPole, dZeroPole and dTransferFunction.

### 2.1.3 Enumeration Type MathOption

ENUM MathOption = {FunAbs, FunSign, FunSqrt, FunSin, FunCos, FunTan,

FunAsin, FunAcos, FunAtan, FunSinh, FunCosh, FunTanh,FunExp,

FunLog, FunLog10}

This type is employed to select the mathematical function to perform on the input signals. This enumeration type is used in the component MathFunction. And the available options are listed in the following table:

  -----------------------------------------------------------------------
  option       Description
  ------------ ----------------------------------------------------------
  FunAbs       To calculate the absolute value of the input signals

  FunSign      To calculate the sign of the input signals

  FunSqrt      To calculate the square root of the input signals

  FunSin       To calculate the sine of the input signals

  FunCos       To calculate the cosine of the input signals

  FunTan       To calculate the tangent of the input signals

  FunAsin      To calculate the arc-sine of the input signals

  FunAcos      To calculate the arc-cosine of the input signals

  FunAtan      To calculate the arc-tangent of the input signals

  FunSinh      To calculate the hyperbolic sine of the input signals

  FunCosh      To calculate the hyperbolic cosine of the input signals

  FunTanh      To calculate the hyperbolic tangent of the input signals

  FunExp       To calculate the exponential of the input signals

  FunLog10     To calculate the base 10 logarithm of the input signals

  FunLog       To calculate the natural logartihm of the input signals
  -----------------------------------------------------------------------

### 2.1.4 Enumeration Type RandomOption

ENUM RandomOption = {Uniform, Binomial, Exponential, Gamma, Gaussian, Poisson}

This type is used to define the probability distribution to generate the random numbers. The different options are:

  -------------------------------------------------------------
  random option          Description
  ---------------------- --------------------------------------
  Uniform                Uniform distribution

  Binomial               Binomial distribution

  Exponential            Exponential distribution

  Gamma                  Gamma distribution

  Gaussian               Gaussian distribution

  Poisson                Poisson distribution
  -------------------------------------------------------------

### 2.1.5 Enumeration Type RelationalOption

ENUM RelationalOption = {Equal, NotEqual, GreaterThan, GreaterEqual, LessThan,

LessEqual}

This enumeration type allows to define the relational operation to perform on the input signals of the component RelationalOperator. The available relational operations are:

  -----------------------------------------------------------------------------------------------------------------
  Relational Operator option   Output signal Value
  ---------------------------- ------------------------------------------------------------------------------------
  Equal                        TRUE if the first input signal is equal to the second input signal

  NotEqual                     TRUE if the first input signal is not equal to the second input signal

  GreaterThan                  TRUE if the first input signal is greater than the second input signal

  GreaterEqual                 TRUE if the first input signal is greater than or equal to the second input signal

  LessThan                     TRUE if the first input signal is less than the second input signal

  LessEqual                    TRUE if the first input signal is less than or equal to the second input signal
  -----------------------------------------------------------------------------------------------------------------

### 2.1.6 Enumeration Type SourceOption

ENUM SourceOption = {Source_Constant, Source_Sine, Source_Pulse, Source_Step,

Source_SawTooth, Source_Square, Source_Ramp, Source_TableStep,

Source_TableInterp}

This enumeration type is used in the component AnalogSource. It allows to select which type of output signal the user wants to generate. The different possibilities are:

  ------------------------------------------------------------------------
  Source option          Description
  ---------------------- -------------------------------------------------
  Source_Constant        To generate constant signals

  Source_Sine            To generate sinusoidal signals

  Source_Pulse           To general pulse signals

  Source_Step            To generate step signals

  Source_SawTooth        To generate saw tooth signals

  Source_Square          To generate square signals

  Source_Ramp            To generate ramp signals

  Source_Table           To generate signals by interpolation in a table
  ------------------------------------------------------------------------

### 2.1.7 Enumeration Type dIntegMethod

ENUM dIntegMethod = {ForwardEuler, BackwardEuler, Trapezoidal}

This enumerative type is used in the component dIntegrator. It allows to specify the integration method used to calculate the discrete-time integration of the input signal.

### 2.1.8 Enumeration Type state_type

ENUM state_type = {OFF, ON}

This type is employed to represent the state of the Relay components.

### 2.1.9 Enumeration Type tableMethod

ENUM tableMethod = {LinearInterpWithEvents, LinearInterpWithoutEvents, SplineInterp,

StepConnect}

This type represents the available methods to interpolate or connect the table points. It is used in the AnalogSource and the SourceDataFile components.

## 2.2 Port Types

### 2.2.1 analog_signal

**Description**

This port type represents an 1-dimension array of analog signals

**Limitations**

SINGLE IN

\"SINGLE IN\" in the declaration of the signal port types means that multiple connections to signal input ports are forbidden. However, it is possible to make multiple connection from an outlet signal port, i.e it is possible to broadcast an outlet signal.

**Parameters**

  --------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION                     UNITS
  -------------- --------------- --------- ------------------------------- -------
  n              CONST INTEGER   1         Dimension of the signal array   \-

  --------------------------------------------------------------------------------

**Variables**

  ----------------------------------------------------------------------------------
  NAME          TYPE             INITIAL     RANGE     DESCRIPTION           UNITS
  ------------- ---------------- ----------- --------- --------------------- -------
  signal\[n\]   EQUAL OUT REAL                         Real variable array   \-

  ----------------------------------------------------------------------------------

The EQUAL OUT type for the variable especifies that it is possible to connect an output port to multiple input ports and the values of the signals of the connected ports are equal.

### 2.2.2 bool_signal

**Description**

This port type represents an 1-dimension array of Boolean signals

**Limitations**

SINGLE IN

\"SINGLE IN\" in the declaration of the signal port types means that multiple connections to signal input ports are forbidden. However, it is possible to make multiple connection from an outlet signal port, i.e it is possible to broadcast an outlet signal.

**Parameters**

  --------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION                     UNITS
  -------------- --------------- --------- ------------------------------- -------
  n              CONST INTEGER   1         Dimension of the signal array   \-

  --------------------------------------------------------------------------------

**Variables**

  ----------------------------------------------------------------------------------------
  NAME          TYPE                INITIAL     RANGE     DESCRIPTION              UNITS
  ------------- ------------------- ----------- --------- ------------------------ -------
  signal\[n\]   EQUAL OUT BOOLEAN                         Boolean variable array   \-

  ----------------------------------------------------------------------------------------

The EQUAL OUT type for the variable specifies that it is possible to connect an output port to multiple input ports and the values of the signals of the connected ports are equal.

## 2.3 Component Types

The following tables list the names and a brief description of the components available in the CONTROL library.

**Abstract Components**

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Name   Description
  ---------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ASensor          Abstract sensor to derive sensors using multiple inheritance

  Controller       Abstract definition of Controllers

  MI2MOs           Control component with two multiple inputs analog ports and one multiple output analog port of the same dimension

  MIMO             Control component with one multiple input analog port and one multiple output analog port of different dimension

  MIMOs            Control component with one multiple input analog port and one multiple output analog port of the same dimension

  MO               Control component with one multiple output analog port

  SI2SO            Control component with two single input analog signal port and one single output analog signal port

  SI2bSO           Control component with two single input analog signal port and one single output Boolean signal port

  SISO             Control component with one single input analog signal port and one single ouput analog port

  SO               Control component with one single output analog signal port

  Sampler          Control component that samples the input signals

  bMI2MOs          Control component with two multiple input Boolean signal ports and one multiple output Boolean signal port of the same dimension

  bMIMO            Control component with one multiple input Boolean signal port and one multiple output Boolean signal port of different dimensions

  bMIMOs           Control component with one multiple input Boolean signal ports and one multiple output Boolean signal port of the same dimension

  bMO              Control component with one multiple output Boolean signal port

  bSI2SO           Control component with two single input Boolean signal ports and one single output Boolean signal port

  bSISO            Control component with one single input Boolean signal ports and one single output Boolean signal port

  bSO              Control component with one single output Boolean signal port

  dMIMO            Control component with one multiple input analog signal port and one multiple output analog signal port with different dimension where the input signals are sampled

  dMIMOs           Control component with one multiple input analog signal port and one multiple output analog signal port with the same dimension where the input signals are sampled

  dSISO            Control component with one single input analog signal port and one single output analog signal port where the input signals are sampled
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Operative Components**

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Symbol                                                                                                                                                                                           Component Name      Description
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------- -----------------------------------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image10.png){width="0.32640529308836397in" height="0.6875349956255468in"}   Actuator            Control component that represents an actuator with a limitation of the position and with a speed limiter.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image11.png){width="0.5903083989501312in" height="0.451411854768154in"}     Addition            Control component that generates the sum of two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image12.png){width="0.5903083989501312in" height="0.33335083114610675in"}   AdditionMulti       Control component that performs addition or subtraction on its multiple inputs.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image13.png){width="0.451411854768154in" height="0.3194608486439195in"}     AnalogSource        Control component that can generate different waveforms

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image14.png){width="0.5903083989501312in" height="0.3194608486439195in"}    BooleanToReal       Control component that converts a Boolean signal to an analog signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image15.png){width="0.5903083989501312in" height="0.3125164041994751in"}    ButterLow           Control component that filters the input signals with a low pass Butterworth filter of any order

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image16.png){width="0.3194608486439195in" height="0.3194608486439195in"}    CLK                 Control component to generate a boolean-type signal to synchronize digital components.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image17.png){width="0.451411854768154in" height="0.3194608486439195in"}     Clock               Control component that provides the simulation time

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image18.png){width="0.5903083989501312in" height="0.34029527559055117in"}   Cntrl_DigitalPID    Control component that represents a digital proportional integral derivative (PID) controller

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image19.png){width="0.5903083989501312in" height="0.34723972003499565in"}   Cntrl_P             Control component that represents a standard proportional (P) controller
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Symbol                                                                                                                                                                                           Component Name       Description
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------- -----------------------------------------------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image20.png){width="0.5903083989501312in" height="0.34723972003499565in"}   Cntrl_PI             Control component that represents a standard proportional integral (PI) controller

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image21.png){width="0.5903083989501312in" height="0.34723972003499565in"}   Cntrl_PID            Control component that represents a standard proportional integral derivative (PID) controller

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image22.png){width="0.5903083989501312in" height="0.48613626421697287in"}   Cntrl_PID_ExtTrack   Control component that represents a standard proportional integral derivative (PID) controller with external tracking

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image23.png){width="0.5903083989501312in" height="0.48613626421697287in"}   Cntrl_PI_ExtTrack    Control component that represents a standard proportional integral (PI) controller with external tracking

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image24.png){width="0.5903083989501312in" height="0.5278051181102362in"}    Counter_DOWN         Control component that represents a digital down-counter

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image25.png){width="0.5903083989501312in" height="0.5278051181102362in"}    Counter_UP           Control component that represents a digital up-counter

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image26.png){width="0.5903083989501312in" height="0.7361493875765529in"}    Counter_UP-DOWN      Control component that represents a digital up-counter

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image27.png){width="0.5903083989501312in" height="0.3194608486439195in"}    CritDamping          Control component that filters the input signal with an n-th order filter with critical damping

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image28.png){width="0.5903083989501312in" height="0.3194608486439195in"}    DeadZone             Control component that provides a region of zero output

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image29.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Delay                Control component that delays the input signal by a fixed time interval

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image30.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Demux                Control component that separates the input vector signal into N output signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image31.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Demux2               Control component that separates the input vector signal into two output signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image32.png){width="0.5903083989501312in" height="0.36807414698162727in"}   Demux3               Control component that separates the input vector signal into three output signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image33.png){width="0.5903083989501312in" height="0.47919181977252845in"}   Demux4               Control component that separates the input vector signal into four output signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image34.png){width="0.5903083989501312in" height="0.5903083989501312in"}    Demux5               Control component that separates the input vector signal into five output signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image35.png){width="0.5903083989501312in" height="0.7014249781277341in"}    Demux6               Control component that separates the input vector signal into six output signals
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Symbol                                                                                                                                                                                           Component Name      Description
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------- -----------------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image36.png){width="0.5903083989501312in" height="0.826431539807524in"}     Demux7              Control component that separates the input vector signal into seven output signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image37.png){width="0.5903083989501312in" height="0.9236581364829396in"}    Demux8              Control component that separates the input vector signal into eight output signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image38.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Derivative          Control component that computes the time derivative of the input signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image39.png){width="0.7014249781277341in" height="0.7708727034120735in"}    Digital_ramp        Control component that generates a time-based ramp

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image40.png){width="0.5903083989501312in" height="0.35418525809273843in"}   EQ                  Control component that represents the standard comparison \'equal than\'

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image41.png){width="0.5903083989501312in" height="0.3194608486439195in"}    FirstOrderHold      Control component that implements a first order sample and hold latch

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image42.png){width="0.5903083989501312in" height="0.35418525809273843in"}   GE                  Control component that represents the function \'greater or equal to\'

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image43.png){width="0.5903083989501312in" height="0.36807414698162727in"}   GT                  Control component that represents the function \'greater than\'

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image44.png){width="0.5903083989501312in" height="0.3125164041994751in"}    Gain                Control component that multiplies the input signal by a constant

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image45.png){width="0.5903083989501312in" height="0.3055708661417323in"}    Gate_AND            Control component that performs the logical operation AND between the two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image46.png){width="0.5903083989501312in" height="0.3125164041994751in"}    Gate_NOT            Control component that performs the logical operation NOT in the input signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image47.png){width="0.5903083989501312in" height="0.3055708661417323in"}    Gate_OR             Control component that performs the logical operation OR between the two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image48.png){width="0.5903083989501312in" height="0.35418525809273843in"}   Gate_XOR            Control component that performs the logical operation XOR between the two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image49.png){width="0.5903083989501312in" height="0.36807414698162727in"}   Hysteresis          Control component that implements boolean hysteresis.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image50.png){width="0.5903083989501312in" height="0.34029527559055117in"}   Integrator          Control component that integrates the input signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image51.png){width="0.5903083989501312in" height="0.34029527559055117in"}   Inverse             Control component that calculates the inverse of the input signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image52.png){width="0.5903083989501312in" height="0.35418525809273843in"}   LE                  Control components that implements the function \'lower or equal to\'
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Symbol                                                                                                                                                                                           Component Name      Description
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------- -----------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image53.png){width="0.5903083989501312in" height="0.35418525809273843in"}   LT                  Control components that implements the function \'lower than\'

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image54.png){width="0.7014249781277341in" height="0.4305774278215223in"}    LogicalSwitch       Control component that swithches depending on the boolean port (the middle one)

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image55.png){width="0.5903083989501312in" height="0.3194608486439195in"}    MathFunction        Control component that performs basic mathematical functions to the input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image56.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Maximum             Control component that calculates the maximum value between two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image57.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Minimum             Control component that calculates the minimum value between two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image58.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Module              Control component that calculates the module of a division of two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image59.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Move                Control component that represents the standard arithmetic operation MOVE

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image60.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Mux                 Control component that combines N input signals into a vector output port

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image61.png){width="0.5903083989501312in" height="0.33335083114610675in"}   Mux2                Control component that combines two input signals into a vector output port

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image62.png){width="0.5903083989501312in" height="0.36807414698162727in"}   Mux3                Control component that combines three input signals into a vector output port

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image63.png){width="0.5903083989501312in" height="0.47919181977252845in"}   Mux4                Control component that combines four input signals into a vector output port

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image64.png){width="0.5903083989501312in" height="0.5903083989501312in"}    Mux5                Control component that combines five input signals into a vector output port

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image65.png){width="0.5903083989501312in" height="0.7014249781277341in"}    Mux6                Control component that combines six input signals into a vector output port

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image66.png){width="0.5903083989501312in" height="0.8125415573053368in"}    Mux7                Control component that combines seven input signals into a vector output port

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image67.png){width="0.5903083989501312in" height="0.9236581364829396in"}    Mux8                Control component that combines eight input signals into a vector output port
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Symbol                                                                                                                                                                                           Component Name         Description
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------- ---------------------------------------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image68.png){width="0.5903083989501312in" height="0.3194608486439195in"}    NEQ                    Control component that represents the function \'non equal to\'

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image69.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Product                Control component that calculates the product between the two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image70.png){width="0.5903083989501312in" height="0.34723972003499565in"}   ProductMulti           Control component that performs product or division on its multiple input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image71.png){width="0.5903083989501312in" height="0.3194608486439195in"}    RS_Bistable            Control component that represents a reset dominant biestable

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image72.png){width="0.451411854768154in" height="0.3194608486439195in"}     RandomSource           Control component that generates normally distributed random numbers

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image73.png){width="0.5903083989501312in" height="0.3125164041994751in"}    RateLimiter            Control component that limits the rate of change of the input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image74.png){width="0.5903083989501312in" height="0.3194608486439195in"}    RealToBoolean          Control component that converts an analogical signal into a Boolean signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image75.png){width="0.5903083989501312in" height="0.34723972003499565in"}   RelationalOperator     Control component that performs specified relational operation on the input signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image76.png){width="0.5903083989501312in" height="0.34029527559055117in"}   Relay                  Control component that switches the output signal between two values

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image77.png){width="0.5903083989501312in" height="0.3194608486439195in"}    SR_Bistable            Control component that represents a set dominant bistable

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image78.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Saturation             Control component that limits excursion of a signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image79.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Scaling                Control component to scale the input signal to a range

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image80.png){width="0.5903083989501312in" height="0.3194608486439195in"}    Selector               Control component that extracts signals from an input signal port

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image81.png){width="0.451411854768154in" height="0.3125164041994751in"}     SourceChirp            Control component that generates sine wave with increasing frequency

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image82.png){width="0.451411854768154in" height="0.3194608486439195in"}     SourceDataFile         Control component that generates an output signal interpolating in a table loaded from an external ASCII file

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image83.png){width="0.451411854768154in" height="0.3194608486439195in"}     SourceExp              Control component that generates a rising and falling exponential analog signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image84.png){width="0.451411854768154in" height="0.3194608486439195in"}     SourceExpSine          Control component that generates exponentially damped sine analog signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image85.png){width="0.451411854768154in" height="0.3194608486439195in"}     SourcebConstant        Control component that generates Boolean constant signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image86.png){width="0.451411854768154in" height="0.3194608486439195in"}     SourcebPulse           Control component that generates Boolean pulse signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image87.png){width="0.451411854768154in" height="0.3194608486439195in"}     SourcebSampleTrigger   Control component that generates sample triggers

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image88.png){width="0.451411854768154in" height="0.33335083114610675in"}    SourcebStep            Control component that generates Boolean step signals
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Symbol                                                                                                                                                                                            Component Name      Description
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------- ---------------------------------------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image89.png){width="0.8125415573053368in" height="0.3194608486439195in"}     StateSpace          Control component that implements a linear state-space system

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image90.png){width="0.5903083989501312in" height="0.451411854768154in"}      Subtraction         Control component that performs the subtraction between the two input analog signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image91.png){width="0.7014249781277341in" height="0.4305774278215223in"}     Switch              Control component that switches between two input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image92.png){width="0.5903083989501312in" height="0.3194608486439195in"}     TF_1stOrder         Control component that defines a first order transfer function between the input signal and the output signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image93.png){width="0.5903083989501312in" height="0.3194608486439195in"}     TF_2ndOrder         Control component that defines a second order transfer function between the input signal and the ouput signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image94.png){width="0.6429341644794401in" height="0.312082239720035in"}      Table1DFunction     Control component to perform a linear mapping (table interpolation) of the input signals

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image95.png){width="0.5903083989501312in" height="0.3194608486439195in"}     Timer_TOFF          Control component that represents a timer to delay a signal on deactivation

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image96.png){width="0.5903083989501312in" height="0.3194608486439195in"}     Timer_TON           Control component that represents a timer to delay a signal on activation

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image97.png){width="0.5903083989501312in" height="0.3194608486439195in"}     Timer_TP            Control component that represents a timer to delay a signal on deactivation

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image98.png){width="0.5903083989501312in" height="0.3194608486439195in"}     TransferFunction    Control component that implements a linear transfer function

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image99.png){width="0.6528116797900263in" height="0.34029527559055117in"}    Trigger_FE          This component implements falling edge detection based in IEC 61131-3 International Standard

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image100.png){width="0.6528116797900263in" height="0.34029527559055117in"}   Trigger_RE          This component implements rising edge detection based in IEC 61131-3 International Standard

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image101.png){width="0.5903083989501312in" height="0.32640529308836397in"}   UnitDelay           Control component that delays a signal one sample period

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image102.png){width="0.5903083989501312in" height="0.33335083114610675in"}   VarDelay            Control component that delays the input signals by a variable amount of time

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image103.png){width="0.5903083989501312in" height="0.3194608486439195in"}    ZeroOrderHold       Control component that implements a zero-order hold of one sample period

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image104.png){width="1.1458923884514436in" height="0.3194608486439195in"}    ZeroPole            Control component that implements a transfer function specified in terms of poles and zeros

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image105.png){width="0.7014249781277341in" height="0.3194608486439195in"}    dFilter             Control component that implements a discrete filter

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image106.png){width="0.5903083989501312in" height="0.32640529308836397in"}   dIntegrator         Control component that performs a discrete-time integration of a signal

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image107.png){width="1.1458923884514436in" height="0.32640529308836397in"}   dStateSpace         Control component that implements a discrete state-space system
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Symbol                                                                                                                                                                                           Component Name      Description
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------- -----------------------------------------------------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image108.png){width="0.5903083989501312in" height="0.3194608486439195in"}   dTransferFunction   Control component that implements a discrete transfer function

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image109.png){width="1.1458923884514436in" height="0.3194608486439195in"}   dZeroPole           Control component that implements a discrete tranfer function in terms of poles and zeros

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image110.png){width="0.5903083989501312in" height="0.3194608486439195in"}   iDivision           Component that calculates the integer part of the division of two input signals based in IEC 61131-3 International Standard
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# 3 Abstract Components

## 3.1 ASensor

### 3.1.1 Description

This component is used for deriving sensors by inheritance.

### 3.1.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 3.1.3 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal

  ----------------------------------------------------------------------------------

### 3.1.4 Data

  -----------------------------------------------------------------------------
  NAME            TYPE        DEFAULT     DESCRIPTION                   UNITS
  --------------- ----------- ----------- ----------------------------- -------
  bias\[n_out\]   REAL                    Bias                          \-

  gain\[n_out\]   REAL                    Gain                          \-
  -----------------------------------------------------------------------------

### 3.1.5 Variables

  ----------------------------------------------------------------------------
  NAME           TYPE        INITIAL   DESCRIPTION                     UNITS
  -------------- ----------- --------- ------------------------------- -------
  var\[n_out\]   REAL                  Measured variable               \-

  ----------------------------------------------------------------------------

### 3.1.6 Formulation

The value of the output signals is calculated by applying the sensor gain and the sensor bias to the measured variable:

$$s\_ out.signal\lbrack i\rbrack = \ gain\lbrack i\rbrack \cdot var\lbrack i\rbrack + bias\lbrack i\rbrack$$

## 3.2 Controller

### 3.2.1 Description

This abstract component is used for deriving controllers of different types by inheritance.

### 3.2.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 3.2.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = n)      OUT         Controlled output signal

  s_set       analog_signal   (n = n)      IN          Set point signal

  s_var       analog_signal   (n = n)      IN          Controlled variable signal
  ---------------------------------------------------------------------------------

### 3.2.4 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  e\[n\]      REAL                  Input error                     \-

  r\[n\]      REAL                  Set point                       \-

  u\[n\]      REAL                  Output                          \-

  y\[n\]      REAL                  Measured variable               \-
  -------------------------------------------------------------------------

### 3.2.5 Formulation

The set-point and the measured variable are equivalent to the s_set.signal and the s_var.signal respectively:

$$r\lbrack i\rbrack = s\_ set.signal\lbrack i\rbrack$$

$$y\lbrack i\rbrack = s\_ var.signal\lbrack i\rbrack$$

The error is calculated as follows:

$$e\lbrack i\rbrack = r\lbrack i\rbrack - y\lbrack i\rbrack$$

The variable u is equivalent to the s_out.signal:

$$u\lbrack i\rbrack = s\_ out.signal\lbrack i\rbrack$$

## 3.3 MI2MOs

### 3.3.1 Description

This abstract component is used for deriving components with two multiple input analog ports and one multiple output analog port of the same dimension.

### 3.3.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 3.3.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in_1      analog_signal   (n = n)      IN          Inlet signal

  s_in_2      analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

## 3.4 MIMO

### 3.4.1 Description

This abstract component is used for deriving components with one multiple input analog port and one multiple output analog port. The dimension of the input port signals can be different to the dimension of output port signals.

### 3.4.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_in           CONST INTEGER   1         Dimension of inputs

  n_out          CONST INTEGER   1         Dimension of outputs
  --------------------------------------------------------------------------

### 3.4.3 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_in        analog_signal   (n = n_in)    IN          Inlet signal

  s_out       analog_signal   (n = n_out)   OUT         Outlet signal
  ----------------------------------------------------------------------------------

## 3.5 MIMOs

### 3.5.1 Description

This abstract component is used for deriving components with one multiple input analog port and one multiple output analog port. The dimension of the input port signals and the output port signals are the same.

### 3.5.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 3.5.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

## 3.6 MO

### 3.6.1 Description

This abstract component is used for deriving components with only one multiple output analog port.

### 3.6.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 3.6.3 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal

  ----------------------------------------------------------------------------------

## 3.7 SI2SO

### 3.7.1 Description

This abstract component inherited from the abstract component MI2MO. It is used for deriving components with two single input analog ports and one single output analog port.

### 3.7.2 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in_1      analog_signal   (n = n)      IN          First inlet signal

  s_in_2      analog_signal   (n = n)      IN          Second inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 3.7.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

## 3.8 SI2bSO

### 3.8.1 Description

This abstract class is used for the definition of a control component with two single analog input ports and one single boolean output port.

### 3.8.2 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in_1      analog_signal   (n = n)      IN          First inlet signal

  s_in_2      analog_signal   (n = n)      IN          Second inlet signal

  s_out       bool_signal     (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 3.8.3 Closed Parameters

  ---------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ----------------------------------
  n              CONST INTEGER   1         Dimensions of inputs and outputs

  ---------------------------------------------------------------------------

## 3.9 SISO

### 3.9.1 Description

This abstract component inherits from the abstract component MIMOs. It is used for deriving components with one single input analog port and one single output analog port.

### 3.9.2 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 3.9.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            VALUE     DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

## 3.10 SO

### 3.10.1 Description

This abstract component inherits from the abstract component MO. It is used for deriving components with only one single output analog port.

### 3.10.2 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal

  ----------------------------------------------------------------------------------

### 3.10.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            VALUE     DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

## 3.11 Sampler

### 3.11.1 Description

This abstract component is used for deriving components that needs to sample the input signals.

### 3.11.2 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  dt          REAL        0.1         Sample time                   s

  -------------------------------------------------------------------------

### 3.11.3 Variables

  --------------------------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                                        UNITS
  ----------- ----------- --------- -------------------------------------------------- -------
  sample      BOOLEAN     FALSE     Boolean variable to know the sample time instant   \-

  --------------------------------------------------------------------------------------------

### 3.11.4 Formulation

To sample at time 0 the following EcosimPro Language (EL language) WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

The Boolean variable sample is set to FALSE when it is detected that its value is TRUE and it is again set to TRUE after passing dt seconds.

## 3.12 bMI2MOs

### 3.12.1 Description

This abstract component is used for deriving components with two multiple input Boolean ports and one multiple output Boolean port. The inlet ports and the outlet ports have the same dimension.

### 3.12.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 3.12.3 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in_1      bool_signal   (n = n)      IN          First inlet signal

  s_in_2      bool_signal   (n = n)      IN          Second inlet signal

  s_out       bool_signal   (n = n)      OUT         Outlet signal
  -------------------------------------------------------------------------------

## 3.13 bMIMO

### 3.13.1 Description

This abstract component is used for deriving components with one multiple input Boolean port and one multiple output Boolean port. The dimension of input port signals can be different to the dimension of output port signals.

### 3.13.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_in           CONST INTEGER   1         Dimension of inputs

  n_out          CONST INTEGER   1         Dimension of outputs
  --------------------------------------------------------------------------

### 3.13.3 Ports

  --------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS    DIRECTION   DESCRIPTION
  ----------- ------------- ------------- ----------- ----------------------------
  s_in        bool_signal   (n = n_in)    IN          Inlet signal

  s_out       bool_signal   (n = n_out)   OUT         Outlet signal
  --------------------------------------------------------------------------------

## 3.14 bMIMOs

### 3.14.1 Description

This abstract component is used for deriving components with one multiple input Boolean port and one multiple output Boolean port. The dimension of the input port signals and the output port signals are the same.

### 3.14.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  N              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 3.14.3 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in        bool_signal   (n = n)      IN          Inlet signal

  s_out       bool_signal   (n = n)      OUT         Outlet signal
  -------------------------------------------------------------------------------

## 3.15 bMO

### 3.15.1 Description

This abstract component is used for deriving components with one multiple output Boolean port.

### 3.15.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 3.15.3 Ports

  --------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS    DIRECTION   DESCRIPTION
  ----------- ------------- ------------- ----------- ----------------------------
  s_out       bool_signal   (n = n_out)   OUT         Outlet signal

  --------------------------------------------------------------------------------

## 3.16 bSI2SO

### 3.16.1 Description

This abstract component inherits from the abstract component bMI2MOs. It is used for deriving components with two single input Boolean ports and one single output Boolean port.

### 3.16.2 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in_1      bool_signal   (n = n)      IN          First inlet signal

  s_in_2      bool_signal   (n = n)      IN          Second inlet signal

  s_out       bool_signal   (n = n)      OUT         Outlet signal
  -------------------------------------------------------------------------------

### 3.16.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            VALUE     DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

## 3.17 bSISO

### 3.17.1 Description

This abstract component inherits from the abstract component bMIMOs. It is used for deriving components with one single input Boolean port and one single output Boolean port.

### 3.17.2 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in        bool_signal   (n = n)      IN          Inlet signal

  s_out       bool_signal   (n = n)      OUT         Outlet signal
  -------------------------------------------------------------------------------

### 3.17.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            VALUE     DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

## 3.18 bSO

### 3.18.1 Description

This abstract component inherits from the abstract component bMO. It is used for deriving components with one single output Boolean port.

### 3.18.2 Ports

  --------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS    DIRECTION   DESCRIPTION
  ----------- ------------- ------------- ----------- ----------------------------
  s_out       bool_signal   (n = n_out)   OUT         Outlet signal

  --------------------------------------------------------------------------------

### 3.18.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

## 3.19 dMIMO

### 3.19.1 Description

This abstract component inherits from the abstract component Sampler. It is used for deriving components with one multiple input analog port and one multiple output analog port. The input signals are sampled at each sample time period dt. The dimension of input port signals can be different to the dimension of output port signals.

### 3.19.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_in           CONST INTEGER   1         Dimension of inputs

  n_out          CONST INTEGER   1         Dimension of outputs
  --------------------------------------------------------------------------

### 3.19.3 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_in        analog_signal   (n = n_in)    IN          Inlet signal

  s_out       analog_signal   (n = n_out)   OUT         Outlet signal
  ----------------------------------------------------------------------------------

### 3.19.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  dt          REAL        0.1         Sample time                   s

  -------------------------------------------------------------------------

### 3.19.5 Variables

  -----------------------------------------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                                                       UNITS
  ----------- ----------- --------- ----------------------------------------------------------------- -------
  sample      BOOLEAN     FALSE     Boolean variable to know when the input signals must be sampled   

  -----------------------------------------------------------------------------------------------------------

### 3.19.6 Formulation

To sample at time 0, the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

## 3.20 dMIMOs

### 3.20.1 Description

This abstract component inherits from the abstract component Sampler. It is used for deriving components with one multiple input analog port and one multiple output analog port. The input signals are sampled at each sample time period dt. The dimension of input port signals and the dimension of output port signals are the same.

### 3.20.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 3.20.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal ()

  s_out       analog_signal   (n = n)      OUT         Outlet signal ()
  ---------------------------------------------------------------------------------

### 3.20.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  dt          REAL        0.1         Sample time                   s

  -------------------------------------------------------------------------

### 3.20.5 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  sample      BOOLEAN     FALSE                                     

  -------------------------------------------------------------------------

### 3.20.6 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

## 3.21 dSISO

### 3.21.1 Description

This abstract component inherits from the abstract component dMIMOs. It is used for deriving components with one single input analog port and one single output analog port. The input signal is sampled at each sample time period dt.

### 3.21.2 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 3.21.3 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  dt          REAL        0.1         Sample time                   s

  -------------------------------------------------------------------------

### 3.21.4 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            VALUE     DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 3.21.5 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  sample      BOOLEAN     FALSE                                     

  -------------------------------------------------------------------------

### 3.21.6 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

# 4 CONTROL Components

## 4.1 Actuator

### 4.1.1 Description

This component represents an actuator with a limitation of the position and with a speed limiter.

### 4.1.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image111.png){width="0.47224628171478567in" height="0.6458661417322835in"}

### 4.1.3 Ports

  -----------------------------------------------------------------------------------
  NAME           TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  -------------- --------------- ------------ ----------- ---------------------------
  s_pos_dem      analog_signal   (n = 1)      IN          Demanded position

  s_pos_actual   analog_signal   (n = 1)      OUT         Actual position
  -----------------------------------------------------------------------------------

### 4.1.4 Data

  -----------------------------------------------------------------------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                                                                                        UNITS
  ------------ ----------- ----------- -------------------------------------------------------------------------------------------------- -------
  Tc           REAL        1           Actuator time constant                                                                             s

  v_up_max     REAL        0           Speed limiter when the actuator position is increasing                                             pos/s

  V_down_max   REAL        10          Speed limiter when the actuator position is lowering                                               pos/s

  Y_min        REAL        0           Minimum allowed actuator position                                                                  

  Y_max        REAL        100         Maximum allowed actuator position                                                                  

  init_flag    BOOLEAN     FALSE       If TRUE, initial actuator position is Y_o. If FALSE, initial position is bounded demand position   

  Y_o          REAL        50          Initial actuator position                                                                          
  -----------------------------------------------------------------------------------------------------------------------------------------------

### 4.1.5 Variables

  --------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME          TYPE        INITIAL   DESCRIPTION                                                                                                  UNITS
  ------------- ----------- --------- ------------------------------------------------------------------------------------------------------------ -------
  v_bound       REAL                  Bounded position rate                                                                                        pos/s

  v_unbound     REAL                  Unbounded position rate                                                                                      pos/s

  Y_dem_bound   REAL                  Bounded demand position                                                                                      pos/s

  Y             REAL                  Actuator position                                                                                            

  init_event    BOOLEAN               Event to execute the DISCRETE block at the beginning of the simulation to initialize the actuator position   
  --------------------------------------------------------------------------------------------------------------------------------------------------------

### 4.1.6 Formulation

The position of the actuator can be initialized in two ways: using the input signal at the beginning of the simulation (init_flag=FALSE), or using the data Y_o (init_flag=TRUE):

WHEN(init_event == TRUE AND init_flag == FALSE) THEN

init_event = FALSE

IF (s_pos_dem.signal\[1\] \> Y_max) THEN

Y = Y_max

ELSEIF (s_pos_dem.signal\[1\] \< Y_min) THEN

Y = Y_min

ELSE

Y = s_pos_dem.signal\[1\]

END IF

END WHEN

The demanded input signal is limited between a minimum and maximum allowed value:

$$Y\_ dem\_ bound\  = \ \left\{ \begin{matrix}
Y\_ max & if\ s\_ pos\_ dem.signal\lbrack 1\rbrack > \ Y\_ max \\
Y\_ min & if\ s\_ pos\_ dem.signal\lbrack 1\rbrack < \ Y\_ min \\
s\_ pos\_ dem.signal\lbrack 1\rbrack & if\ Y\_ min \leq s\_ pos\_ dem.signal\lbrack 1\rbrack \leq \ Y\_ max
\end{matrix} \right.\ $$

The actuator component limits the first derivative of the signal passing through and limits the output signal between an upper limit and lower limit defined by the user.

The unbounded position rate is given by:

$$v_{unbound} = (Y\_ dem\_ bound\  - Y)/T_{c}$$

However, the actual position rate is limited between two limits, one when the position is increasing ($v\_ up\_ max$) and one when the position is lowering ($v\_ down\_ max$):

$$v\_ bound\  = \ \left\{ \begin{matrix}
v\_ up\_ max & if\ v\_ unbound > \ v\_ up\_ max \\
v\_ down\_ max & if\ v\_ unbound < \ v\_ down\_ max \\
v\_ unbound & if\ v\_ down\_ max \leq v\_ unbound \leq \ v\_ up\_ max
\end{matrix} \right.\ $$

The actual position is calculated by the following differential equation:

$$\frac{\partial Y}{\partial t} = v\_ bound$$

$$s\_ pos\_ actual.signal\lbrack 1\rbrack = Y$$

## 4.2 Addition

### 4.2.1 Description

This component is inherited from component MI2MOs. It represents an adder unit tipically employed in control systems. It calculates an output signal that is the algebraic sum of the two input signals.

### 4.2.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image112.png){width="0.5903083989501312in" height="0.6180872703412074in"}

### 4.2.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.2.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in_1      analog_signal   (n = n)      IN          Inlet signal

  s_in_2      analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.2.5 Formulation

The output signals responds instantaneously to changes of the input signals. The equation associated to this component is the following:

$$s\_ out.signal\lbrack i\rbrack = \ \ s\_ in\_ 1.signal\lbrack i\rbrack\  + s\_ in\_ 2.signal\lbrack i\rbrack$$

## 4.3 AdditionMulti

### 4.3.1 Description

This component performs addition or subtraction on its input signals. The user specifies the operations of the component with the operation enumerative parameter. Plus and Minus indicate the operations to be performed on the input signals. The number of operations must equal the number of input signals. The dimension of the input and output signal vector is 1.

### 4.3.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image113.png){width="0.6528116797900263in" height="0.5000251531058618in"}

### 4.3.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_input        CONST INTEGER   2         Number of input signals

  --------------------------------------------------------------------------

### 4.3.4 Ports

  --------------------------------------------------------------------------------------
  NAME              TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------------- --------------- ------------ ----------- ---------------------------
  s_in\[n_input\]   analog_signal   (n = 1)      IN          Inlet signals

  s_out             analog_signal   (n = 1)      OUT         Outlet signal
  --------------------------------------------------------------------------------------

### 4.3.5 Data

  ---------------------------------------------------------------------------------------------------------------
  NAME                   TYPE                DEFAULT     DESCRIPTION                                      UNITS
  ---------------------- ------------------- ----------- ------------------------------------------------ -------
  operation\[n_input\]   ENUM AddOperation   Plus        Operation to be performed on each input signal   \-

  ---------------------------------------------------------------------------------------------------------------

### 4.3.6 Formulation

The output signals responds instantaneously to changes of the input signals. The equation associated to this component is the following:

s_out.signal\[1\] = 0

FOR(j = 1; j \<= n_input; j = j+1)

s_out.signal\[1\] = s_out.signal\[1\] + s_in\[j\].signal\[1\]

## 4.4 AnalogSource

### 4.4.1 Description

This component is inherited from component MO. It represents a signal generator and can produce one of the following different waveforms:

- Constant signal

- Sine signal

- Pulse signal

- Step signal

- Sawtooth signal

- Square signal

- Ramp signal

- Signal by linear interpolation with detection of events in a data table

- Signal by linear interpolation without detection of events in a data table

- Signal by spline interpolation in a table of data

- Step signal generated by interpolation in a table of data

This component is vectorized that means that the ouput signal is a vector of signals of the same type and with the same parameters.

### 4.4.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image114.png){width="0.6944805336832895in" height="0.48613626421697287in"}

### 4.4.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.4.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal

  ----------------------------------------------------------------------------------

### 4.4.5 Data

  -----------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                DEFAULT                  DESCRIPTION                                         UNITS
  -------------- ------------------- ------------------------ --------------------------------------------------- -------
  Amp            REAL                1                        Signal amplitude or height                          \-

  Offset         REAL                0                        Offset of output signal                             \-

  Period         REAL                10                       Period of sine, pulse, sawtooth, or square source   s

  Phase          REAL                0                        Phase of sine source                                rad

  Tstart         REAL                0                        Starting time of signal generation                  s

  pulseWidth     REAL                0.001                    Pulse width of pulse wave                           s

  rampDuration   REAL                10                       Duration of the ramp                                s

  source         ENUM SourceOption   Source_Constant          Waveform                                            

  tabmehod       ENUM tableMethod    LinearInterpWithEvents   Method to interpolate or connect the table points   

  timeTable      TABLE_1D                                     Table for table source                              \-
  -----------------------------------------------------------------------------------------------------------------------

### 4.4.6 Guidelines

The user defines the type of signals changing the value of the data source. Not all the data are applicable to a specific type of source. The following data are applicable to all the types of sources:

- Amp: Signal amplitude or height

- Offset: Offset of the output signals

- Tstart: Start time of the signal, for time less than this data, the ouput is set to the offset value

The rest of the data is applicable depending on the type of source, this is explained in the description of the corresponding data.

The type of source that the user can define is shown in the following table:

  -------------------------------------------------------------------------------------------------
  source option          Description
  ---------------------- --------------------------------------------------------------------------
  Source_Constant        To generate constant signals

  Source_Sine            To generate sinusoidal signals

  Source_Pulse           To general pulse signals

  Source_Step            To generate step signals

  Source_Square          To generate square signals

  Source_Ramp            To generate ramp signals

  Source_Table           To generate signals by interpolation in a table (linear, splines, steps)
  -------------------------------------------------------------------------------------------------

If the user defines the source type called Source_Table, then the user can specify the method of interpolating in the table (or connecting the points of the table) with the enumerative data type named tabmethod. There are four methods listed in the following table:

  ------------------------------------------------------------------------------
  Method                      Description
  --------------------------- --------------------------------------------------
  LinearInterpWithEvents      Linear interpolation with event detection

  LinearInterpWithoutEvents   Linear interpolation without event detection

  SplineInterp                Spline interpolation

  StepConnect                 Connection of the table points by means of steps
  ------------------------------------------------------------------------------

The output signals will depend on the interpolation method chosen by the user.

### 4.4.7 Formulation

As we have explained above the output signals depends on the value of the parameter source defined by the user. In the following table the expressions used to calculate the ouput signals are depicted depending on the type of source choosen.

+-----------------+-----------------------------------------------------------------------------------------------------+
| source option   | Equation                                                                                            |
+=================+===========================================+=========================================================+
| Source_Constant | Amp + Offset                                                                                        |
+-----------------+-----------------------------------------------------------------------------------------------------+
| Source_Sine     | Amp \* sin(2 \* PI /Period \* (TIME - Tstart) + Phase) + Offset                                     |
+-----------------+-----------------------------------------------------------------------------------------------------+
| Source_Pulse    | pulse(TIME-Tstart, Period, pulseWidth) + Offset                                                     |
+-----------------+-----------------------------------------------------------------------------------------------------+
| Source_Step     | Amp \* step(TIME, Tstart) + Offset                                                                  |
+-----------------+-----------------------------------------------------------------------------------------------------+
| Source_SawTooth | Amp \* ramp(TIME-Tstart, Period) / Period + Offset                                                  |
+-----------------+-----------------------------------------------------------------------------------------------------+
| Source_Square   | Amp \* square(TIME-Tstart, Period) + Offset                                                         |
+-----------------+-----------------------------------------------------------------------------------------------------+
| Source_Ramp     | Amp / rampDuration \* (TIME - Tstart) \* (1- step(TIME, Tstart + rampDuration)) +                   |
|                 |                                                                                                     |
|                 | Amp \* step(TIME, Tstart + rampDuration) + Offset                                                   |
+-----------------+-------------------------------------------+---------------------------------------------------------+
| Source_Table    | tabmehod                                  | Equation                                                |
|                 +-------------------------------------------+---------------------------------------------------------+
|                 | LinearInterpWithEvents                    | Amp \* timeTableInterp(TIME-Tstart, timeTable) + Offset |
|                 +-------------------------------------------+---------------------------------------------------------+
|                 | LinearInterpWithoutEvents                 | Amp \* linearInterp1D( timeTable, TIME-Tstart) + Offset |
|                 +-------------------------------------------+---------------------------------------------------------+
|                 | SplineInterp                              | Amp \* splineInterp1D (timeTable ,TIME-Tstart) + Offset |
|                 +-------------------------------------------+---------------------------------------------------------+
|                 | StepConnect                               | Amp \* timeTableStep(TIME-Tstart, timeTable) + Offset   |
+-----------------+-------------------------------------------+---------------------------------------------------------+

These expressions are applied when the simulation time is greater than Tstart, if not the output signals are equal to Offset.

## 4.5 BooleanToReal

### 4.5.1 Description

This component transforms Boolean signals to analog signals. The user defines the value of the output signals when the input signals are TRUE or FALSE.

### 4.5.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image115.png){width="0.7292038495188101in" height="0.48613626421697287in"}

### 4.5.3 Parameters

  -----------------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ------------------------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs signal vectors

  -----------------------------------------------------------------------------------------

### 4.5.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        bool_signal     (n = n)      IN          Boolean inlet signal

  s_out       analog_signal   (n = n)      OUT         Analog outlet signal
  ---------------------------------------------------------------------------------

### 4.5.5 Data

  -------------------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                                    UNITS
  ------------ ----------- ----------- ---------------------------------------------- -------
  ValueFalse   REAL        0           Output analog signal for FALSE Boolean input   \-

  ValueTrue    REAL        1           Output analog signal for TRUE Boolean input    \-
  -------------------------------------------------------------------------------------------

### 4.5.6 Formulation

If the Boolean input signal is TRUE, the output analog signal takes the value of the data ValueTrue, otherwise the output analog signal takes the value of the data ValueFalse.

$$s\_ out.signal\lbrack i\rbrack\  = \left\{ \begin{matrix}
ValueTrue & if & s\_ in.signal\lbrack i\rbrack = = TRUE \\
ValueFalse & if & s\_ in.signal\lbrack i\rbrack = = FALSE
\end{matrix} \right.\ $$

## 4.6 ButterLow

### 4.6.1 Description

This component is inherited from component SISO. The component defines the transfer function between the input signal and the output signal as an n_f-th order low pass filter with Butterworth characteristics and cut-off frequency defined by the data freq. It is implemented as a series of second order filters and a first order filter.

Butterworth or maximally flat lowpass filters have a monotonic amplitude frequency response which is maximally flat at zero frequency response and the amplitude frequency response decreases logarithmically with increasing frequency. The butterworth filter has minimal phase shift over the filter\'s band pass when it is compared to other conventional filters

### 4.6.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image116.png){width="0.5903083989501312in" height="0.47919181977252845in"}

### 4.6.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_f            CONST INTEGER   2         Order of the filter

  --------------------------------------------------------------------------

### 4.6.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.6.5 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  freq        REAL        1           Cut-off frequency             Hz

  -------------------------------------------------------------------------

### 4.6.6 Closed Parameters

  ----------------------------------------------------------------------------
  NAME           TYPE            DEFAULT     DESCRIPTION
  -------------- --------------- ----------- ---------------------------------
  m              CONST INTEGER   (n_f+1)/2   

  ----------------------------------------------------------------------------

### 4.6.7 Variables

  ---------------------------------------------------------------------------------------------------
  NAME            TYPE        INITIAL   DESCRIPTION                                           UNITS
  --------------- ----------- --------- ----------------------------------------------------- -------
  D\[m\]          REAL                                                                        

  T               REAL                                                                        

  k1              REAL                                                                        

  k2\[m\]         REAL                                                                        

  poleimag\[m\]   REAL                  Imaginary part of the poles                           

  polereal\[m\]   REAL                  Real part of the poles                                

  realpol         REAL                                                                        

  w               REAL                                                                        

  w0\[m\]         REAL                                                                        

  x1\[m\]         REAL                  States 1 of second order filters                      

  x2\[m\]         REAL                  States 2 of second order filters                      

  xr              REAL                  State of real pole for uneven order otherwise dummy   

  z\[m + 1\]      REAL                                                                        
  ---------------------------------------------------------------------------------------------------

### 4.6.8 Formulation

Butterworth poles lie along a circle and are spaced at equal angular distances around a circle.

The nth order Butterworth filter will have n poles and no finite zeros. The pole locations correspond to the Butterworth response are defined by the equation:

$$1 + {({- s}^{2})}^{n} = 0$$

The pole locations so defined are located on the unit circle in the s plane and are symmetrical to the real axis. For example: for an order of the filter of 5, all the poles will be:

-1.0000, -0.8090 ± 0.5878 i, - 0.3090 ± 0.9511, 0.3090 ± 0.9511, 0.8090 ± 0.5878 i, 1.0000

The angular frequency is calculated as follows:

$$\omega = 2 \cdot \pi \cdot f$$

where f is the cut-off frequency.

The imaginary part and the real part of the poles are calculated with the following expressions:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image117.png){width="2.8259120734908136in" height="0.6507272528433946in"}

where $n_{f}\$is the order of the filter and m is equal to $(n_{f} + 1)/2$

From these values the second order filter coefficients are calculated:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image118.png){width="2.747683727034121in" height="0.8426706036745407in"}

where:

$\omega_{o} =$ Angular frequency in the second order filters

$D\lbrack i\rbrack = \$Damping in the second order filters

The output signals depends on the order of the filter (even or odd)

Even order

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image119.png){width="3.5057917760279964in" height="1.6591786964129485in"}

Odd order

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image120.png){width="3.470483377077865in" height="2.320463692038495in"}

where k1 is equal to 1 and T is equal to $1/\omega\$

## 4.7 CLK

### 4.7.1 Description

This component represents a clock generator. It generates a boolean-type clock signal to synchronize digital components of the library. It manages the value of the global variable Clock_signal

### 4.7.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image121.png){width="0.3194608486439195in" height="0.48613626421697287in"}

### 4.7.3 Data

  ---------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                          UNITS
  ------------ ----------- ----------- ------------------------------------ -------
  Period       REAL        10          Period of pulse                      s

  pulseWidth   REAL        5           Pulse width                          s

  Tstart       REAL        0           Starting time of signal generation   s
  ---------------------------------------------------------------------------------

### 4.7.4 Guidelines

Circuits using the clock signal for synchronization may become active at either the rising edge, falling edge or, in the case of [double data rate](http://en.wikipedia.org/wiki/Double_data_rate), both at the rising and at the falling edges of the clock cycle.

### 4.7.5 Formulation

This component is modelled by means of discrete events that change the value of the global variable Clock_signal to generate a signal with the period and width defined by the user. The defined events are the following:

WHEN(TIME \> Tstart) THEN

State = TRUE

Clock_signal = TRUE

END WHEN

WHEN(State) THEN

State = FALSE AFTER pulseWidth

Clock_signal = FALSE AFTER pulseWidth

END WHEN

WHEN(State==FALSE AND TIME \> Tstart) THEN

State = TRUE AFTER (Period - pulseWidth)

Clock_signal = TRUE AFTER (Period - pulseWidth)

END WHEN

## 4.8 Clock

### 4.8.1 Description

This component is inherited from component MO. It generates output signals equal to the simulation model time plus an offset.

### 4.8.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image122.png){width="0.451411854768154in" height="0.48613626421697287in"}

### 4.8.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.8.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal ()

  ----------------------------------------------------------------------------------

### 4.8.5 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  Offset      REAL        0           Offset of output signal       \-

  -------------------------------------------------------------------------

### 4.8.6 Guidelines

### 4.8.7 Formulation

This component has only an equation that makes the value of the output signal equal to the simulation time plus an offset defined by the user:

State = FALSE

Clock_signal = FALSE

DISCRETE

WHEN(TIME \> Tstart) THEN

State = TRUE

Clock_signal = TRUE

END WHEN

WHEN(State) THEN

State = FALSE AFTER pulseWidth

Clock_signal = FALSE AFTER pulseWidth

END WHEN

WHEN(State==FALSE AND TIME \> Tstart) THEN

State = TRUE AFTER (Period - pulseWidth)

Clock_signal = TRUE AFTER (Period - pulseWidth)

END WHEN

## 4.9 Cntrl_DigitalPID

### 4.9.1 Description

This component is inherited from component Controller. It represents a digital controller of the PID type.

### 4.9.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image123.png){width="0.7639282589676291in" height="0.5069706911636046in"}

### 4.9.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = n)      OUT         Controlled output signal

  s_set       analog_signal   (n = n)      IN          Set point signal

  s_var       analog_signal   (n = n)      IN          Controlled variable signal
  ---------------------------------------------------------------------------------

### 4.9.4 Data

  --------------------------------------------------------------------------------------
  NAME               TYPE        DEFAULT     DESCRIPTION                         UNITS
  ------------------ ----------- ----------- ----------------------------------- -------
  eps\[1\]           REAL                    Minimum step of the output signal   \-

  eps_in\[1\]        REAL                    Dead band of the input signal       \-

  input_bits\[1\]    INTEGER                 Size of the input signal            bits

  max_input\[1\]     REAL                    High limit of input                 \-

  max_output\[1\]    REAL                    High limit of output                \-

  min_input\[1\]     REAL                    Low limit of input                  \-

  min_output\[1\]    REAL                    Low limit of output                 \-

  output_bits\[1\]   INTEGER                 Size of the output signal           bits

  output_i\[1\]      REAL                    Initial output value                \-

  period\[1\]        REAL                    Sampling Period                     s

  prop_gain\[1\]     REAL                    Controller proportional gain        \-

  rate_time\[1\]     REAL                    Rate or derivative time             \-

  reset_time\[1\]    REAL                    Reset or integral time              \-
  --------------------------------------------------------------------------------------

### 4.9.5 Closed Parameters

  -------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- --------------------------------------
  n              CONST INTEGER   1         Dimension of input and ouput signals

  -------------------------------------------------------------------------------

### 4.9.6 Variables

  --------------------------------------------------------------------------------------
  NAME                    TYPE       INITIAL   DESCRIPTION                       UNITS
  ----------------------- ---------- --------- --------------------------------- -------
  e\[n\]                  REAL                 Input error                       \-

  error0\[1\]             REAL                 Input error at time t             \-

  error1\[1\]             REAL                 Input error at time t-dt          \-

  error2\[1\]             REAL                 Input error at time t-2\*dt       \-

  frac\[1\]               REAL                 Period fraction                   s

  input_set\[1\]          REAL                 Quantizied set point signal       \-

  input_var\[1\]          REAL                 Quantizied variable signal        \-

  int_out0\[1\]           REAL                 Integral output at time t         

  int_out1\[1\]           REAL                 Integral output at time t -- dt   

  new_out\[1\]            REAL                                                   

  output0\[1\]            REAL                 Output at time t                  \-

  output1\[1\]            REAL                 Output at time t-dt               \-

  prop_out\[1\]           REAL                 Proportional output               

  r\[n\]                  REAL                 Set point                         \-

  rate_out\[1\]           REAL                                                   

  start\[1\]              REAL                                                   

  step_size_input\[1\]    REAL                                                   

  step_size_output\[1\]   REAL                                                   

  u\[n\]                  REAL                 Output                            \-

  y\[n\]                  REAL                 Measured variable                 \-
  --------------------------------------------------------------------------------------

### 4.9.7 Guidelines

### 4.9.8 Formulation

At each sample time, the errors at previous times are passed to variables that store old values

$$\varepsilon t - 2\mathrm{\Delta}t = \ \varepsilon t - \mathrm{\Delta}t$$

$$\varepsilon t - \mathrm{\Delta}t = \ \varepsilon$$

The positive and negative input signals are quantizied taking into account the number of bits of the input signal with the function quantzr.

$$input\_ pos\  = quantzr(step\_ size\_ input,\ s\_ in\_ pos.signal)$$

$$input\_ neg\  = quantzr(step\_ size\_ input,\ s\_ in\_ neg.signal)$$

$$\varepsilon t = \ input\_ pos\  - input\_ neg$$

A dead band is applied to the input error:

$$\varepsilon^{t} = \left\{ \begin{matrix}
\varepsilon^{t} - \varepsilon_{db} & if & \varepsilon^{t} > \varepsilon_{db} \\
\varepsilon^{t} + \ \varepsilon_{db} & if & \varepsilon^{t} < {- \varepsilon}_{db} \\
0 & if & {- \varepsilon}_{db} \leq \varepsilon^{t} \leq \varepsilon_{db}
\end{matrix} \right.\ $$

The proportional, derivative, and integral part of the controller output are calculated respectively with the following equations:

$$s_{prop} = K_{G} \cdot \varepsilon^{t}$$

$$s_{rate} = K_{G} \cdot T_{D}\left( \frac{\varepsilon^{t} - \varepsilon^{t - \mathrm{\Delta}t}}{T_{S}} \right)$$

$$s_{int}^{t} = s_{int}^{t - \mathrm{\Delta}t} + \frac{K_{G}T_{S}}{2T_{R}}\left( \varepsilon^{t} + \varepsilon^{t - \mathrm{\Delta}t} \right)$$

The new output is calculated as:

$$s_{new}^{t} = s_{prop}^{t} + s_{rate}^{t} + s_{int}^{t}$$

The output is limited to avoid control saturation according to the following formulas:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image124.png){width="2.1066841644794403in" height="0.8888167104111986in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image125.png){width="2.133432852143482in" height="0.8689140419947506in"}

If the output signal is between the limits, a dead band is applied to the control signal:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image126.png){width="1.7241043307086614in" height="1.3646095800524933in"}

A last correction is applied to the output signal the quantization error that depends on the number of bits of the output signal.

## 4.10 Cntrl_P

### 4.10.1 Description

This component is inherited from component Controller. This component type named Cntrl_p, represents a standard proportional (P) control. It obtains an error signal from an input signal and a set-point and produces an output signal consisting of the error signal multiplied by a proportional gain.

### 4.10.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image127.png){width="0.5903083989501312in" height="0.513915135608049in"}

### 4.10.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.10.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = n)      OUT         Controlled output signal

  s_set       analog_signal   (n = n)      IN          Set point signal

  s_var       analog_signal   (n = n)      IN          Controlled variable signal
  ---------------------------------------------------------------------------------

### 4.10.5 Data

  ----------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                           UNITS
  ------------ ----------- ----------- ------------------------------------- -------
  k\[n\]       REAL                    Proportional gain of the controller   \-

  u_max\[n\]   REAL                    High limit of output                  \-

  u_min\[n\]   REAL                    Low limit of output                   \-
  ----------------------------------------------------------------------------------

### 4.10.6 Variables

  ------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                    UNITS
  ------------ ---------- --------- ------------------------------ -------
  e\[n\]       REAL                 Input error                    \-

  r\[n\]       REAL                 Set point                      \-

  u\[n\]       REAL                 Output                         \-

  v\[n\]       REAL                 Unbounded output               \-

  y\[n\]       REAL                 Measured variable              \-
  ------------------------------------------------------------------------

### 4.10.7 Guidelines

The controller gain, k, can be a positive number or a negative number. When k\>0, the controller is direct-acting. In this case, the controller output decreases if the controlled variable increases. A typical case of direct-acting control is the temperature control of heat exchanger, because if the outlet temperature increases, the controller must close the vapour inlet valve to reduce the heating power.

If k\<0, the controller is inverse-acting, and the controller output increases if the controlled variable increases. A typical case is a level control where if the level of liquid in a tank increases due to an increase of the inlet flow, the controller must increase the position of the tank exit valve to re-establish the level.

### 4.10.8 Formulation

The two input signals to the controller are the set-point and the controlled process variable:

$$r = s\_ set.signal$$

$$y = s\_ var.signal$$

The error signal is equal to:

$$e = r - y$$

The unbounded proportional output is obtained multiplying the proportional gain of the controller and the error:

$$v = k \cdot e$$

The output is limited between u_max and u_min values:

$$u = \left\{ \begin{matrix}
u & if & u\_ min\  < \ u\  < \ u\_ max \\
u\_ min & if & u < u\_ min\  \\
u\_ max & if & u > u\_ max\ 
\end{matrix} \right.\ $$

$$s\_ out.signal = u$$

## 4.11 Cntrl_PI

### 4.11.1 Description

This component is inherited from component Controller. This component type, named Cntrl_pi, represents a standard proportional integral (PI) control. It obtains an error by taking the difference between two input signals, and it produces an output signal with two components: a proportional part and an integral part.

Any controller with integral action can exhibit a non-linear phenomenon called reset windup or integrator build-up when overdriven. If there is a large initial error, the integrator does not respond immediately, but it integrates the error and produces a large signal some time later. The integral control action continues to increase as long as the error has not changed sign even though the controlled output may be close to the desired value. If the error remains large for a sufficiently long time, the integral mode can cause saturation even when the current value of the error is small. Consequently, a large overshoot can result.

Most controllers have an anti-reset windup option that limits the contribution of integral action so that the addition of proportional output plus integral output does not exceed specified limits on either ends of the output range. The component type Cntrl_pi includes the anti-reset windup option of current controllers, a negative feedback that modifies the integrator input to prevent the windup.

The gamma datum is the ratio between the time constant for the antiwindup and the integration time. The time constant for the antiwindup is the time constant of the negative feedback applied to the integrator demand in order to prevent windup. A heuristic rule for tuning gamma is to take gamma = 0.1.

### 4.11.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image128.png){width="0.5903083989501312in" height="0.513915135608049in"}

### 4.11.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.11.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = n)      OUT         Controlled output signal

  s_set       analog_signal   (n = n)      IN          Set point signal

  s_var       analog_signal   (n = n)      IN          Controlled variable signal
  ---------------------------------------------------------------------------------

### 4.11.5 Data

  -------------------------------------------------------------------------------------------------------------------------------------
  NAME         TYPE                   DEFAULT     DESCRIPTION                                                                   UNITS
  ------------ ---------------------- ----------- ----------------------------------------------------------------------------- -------
  Ti\[n\]      REAL                               Integrator time or reset time                                                 s

  beta\[n\]    REAL                   0,1         Weight factor for set point changes in P output                               \-

  end_pos      ENUM EndPosBehaviour   end_I       End position behaviour                                                        \-

  gamma\[n\]   REAL                               Ratio between the time constant for the antiwindup and the integration time   \-

  k\[n\]       REAL                               Proportional gain of the controller                                           \-

  u_max\[n\]   REAL                               High limit of output                                                          \-

  u_min\[n\]   REAL                               Low limit of output                                                           \-
  -------------------------------------------------------------------------------------------------------------------------------------

### 4.11.6 Variables

  -------------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                           UNITS
  ------------ ---------- --------- ------------------------------------- -------
  e\[n\]       REAL                 Input error                           \-

  es\[n\]      REAL                 Saturation error                      \-

  r\[n\]       REAL                 Set point                             \-

  u\[n\]       REAL                 Output                                \-

  v\[n\]       REAL                 Unbounded output                      \-

  vi\[n\]      REAL                 Integral part of the output           \-

  vil\[n\]     REAL                 Limited integral part of the output   \-

  y\[n\]       REAL                 Measured variable                     \-
  -------------------------------------------------------------------------------

### 4.11.7 Guidelines

**Controller Gain, k**

The controller gain, k, can be a positive number or a negative number. When k\>0, the controller is direct-acting. In this case, the controller output decreases if the controlled variable increases. A typical case of direct-acting control is the temperature control of heat exchanger, ie if the outlet temperature increases, the controller closes the vapour inlet valve to reduce the heating power.

If k\<0, the controller is inverse-acting, and the controller output increases if the controlled variable increases. A typical case is a level control where if the level of liquid in a tank increases due to an increase of the inlet flow, the controller must increase the position of the tank exit valve to re-establish the level.

**End Position Behaviour, end_pos**

This data represents the end position behaviour, it is an enumeration type (see Section 2.1), and can take two values

I (for integral end position behaviour)

PI (for proportional-integral end position behaviour)

In the following example a change of the error in the positive direction leads to a P-jump of the controller output in the case of PI end position behaviour. However, since the error is still negative, the controller integrates again to the end position. The resultant effect, e.g. brief opening of a valve, is in general undesirable, if the error remains negative. With I behaviour in the end position this effect is suppressed, because the controller carries out the P-jump only after a sign change of the error.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image129.png){width="2.7181463254593177in" height="1.8178073053368329in"}

Controller error

The output with PI end position behaviour will be:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image130.png){width="2.971067366579178in" height="1.7842957130358705in"}

Controller output with PI behaviour

The output with I end position behaviour will be:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image131.png){width="3.1666666666666665in" height="2.3797156605424323in"}

Controller output with I behaviour

**Weight Factor for Set-point Changes, beta**

In many current controllers, the proportional part gain only acts over the measured process variables. This avoids high control signals when the set-point is suddenly changed. This controller architecture is called I-P. The following formula covers the two architectures the PI when $\beta = 1$, and the I-P when $\beta = 0$

$$u(t) = K\left( \beta r(t) - y(t) + \frac{1}{T_{i}}\int_{}^{}{e(t)dt} \right)$$

### 4.11.8 Formulation

**Structure of the Controller**

The component Cntrl_pi represents a non-interactive control structure PI with a weight factor β to avoid the effect of brusque changes of the set-point, and a feedback loop to avoid the effect of saturation on the integral action whose error signal is applied to the output of the integral action or to the output of the global action depending on whether EndPos behaviour is I or PI respectively and in accordance with the following control diagram (for a justification of this structure, see Appendix A).

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image132.png){width="6.5in" height="3.2916666666666665in"}

**Equations**

The two input signals to the controller are the set-point and the controlled process variable:

$$r = s\_ set.signal$$

$$y = s\_ var.signal$$

The error signal is equal to:

$$e = r - y\ $$

The feedback into the integrator to avoid saturation is

$$es = \left\{ \begin{matrix}
u - v & if\  & end\_ position\_ behaviour\  = PI \\
vil - vi & if & end\_ position\_ behaviour\  = \ I
\end{matrix} \right.\ $$

The integral part of the output is calculated from

$$vi = \ \int_{}^{}{\left( \frac{k}{T_{i}}e + \frac{es}{T_{r}} \right)dt}$$

The limited integral output is

$$vil = \left\{ \begin{matrix}
vi & if & u\_ min\  < \ vi\  < \ u\_ max \\
u\_ min & if & vi < u\_ min\  \\
u\_ max & if & vi > u\_ max\ 
\end{matrix} \right.\ $$

The unlimited output is the sum of the proportional output and the integral output

$$v = k(\beta r - y) + vi$$

The output is limited between u_max and u_min

$$u = \left\{ \begin{matrix}
u & if & u\_ min\  < \ u\  < \ u\_ max \\
u\_ min & if & u < u\_ min\  \\
u\_ max & if & u > u\_ max\ 
\end{matrix} \right.\ $$

$$s\_ out.signal = u$$

## 4.12 Cntrl_PI_ExtTrack

### 4.12.1 Description

This component is inherited from component Controller. This component type, named Cntrl_PI_ExtTrack, represents a standard proportional integral (PI) control with external tracking. It obtains an error by taking the difference between two input signals, and it produces an output signal with two components: a proportional part and an integral part.

Any controller with integral action can exhibit a non-linear phenomenon called reset windup or integrator build-up when overdriven. If there is a large initial error, the integrator does not respond immediately, but it integrates the error and produces a large signal some time later. The integral control action continues to increase as long as the error has not changed sign even though the controlled output may be close to the desired value. If the error remains large for a sufficiently long time, the integral mode can cause saturation even when the current value of the error is small. Consequently, a large overshoot can result.

Most controllers have an anti-reset windup option that limits the contribution of integral action so that the addition of proportional output plus integral output does not exceed specified limits on either ends of the output range. The component type Cntrl_PI_ExtTrack includes the anti-reset windup option of current controllers, a negative feedback that modifies the integrator input to prevent the windup.

The gamma datum is the ratio between the time constant for the anti-windup and the integration time. The time constant for the anti-windup is the time constant of the negative feedback applied to the integrator demand in order to prevent windup. A heuristic rule for tuning gamma is to take gamma = 0.1.

### 4.12.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image133.png){width="0.8611548556430446in" height="0.6528116797900263in"}

### 4.12.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.12.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = n)      OUT         Controlled output signal

  s_set       analog_signal   (n = n)      IN          Set point signal

  s_var       analog_signal   (n = n)      IN          Controlled variable signal

  s_track     analog_signal   (n = n)      IN          Tracking signal
  ---------------------------------------------------------------------------------

### 4.12.5 Data

  ---------------------------------------------------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                                                                    UNITS
  ------------ ----------- ----------- ------------------------------------------------------------------------------ -------
  Ti\[n\]      REAL        100         Integrator time or reset time                                                  s

  beta\[n\]    REAL        0,1         Weight factor for set point changes in P output                                \-

  gamma\[n\]   REAL        0.1         Ratio between the time constant for the anti-windup and the integration time   \-

  k\[n\]       REAL        1           Proportional gain of the controller                                            \-

  u_max\[n\]   REAL        1           High limit of output                                                           \-

  u_min\[n\]   REAL        0           Low limit of output                                                            \-
  ---------------------------------------------------------------------------------------------------------------------------

### 4.12.6 Variables

  ------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                    UNITS
  ------------ ---------- --------- ------------------------------ -------
  e\[n\]       REAL                 Input error                    \-

  es\[n\]      REAL                 Saturation error               \-

  r\[n\]       REAL                 Set point                      \-

  u\[n\]       REAL                 Output                         \-

  v\[n\]       REAL                 Unbounded output               \-

  vi\[n\]      REAL                 Integral part of the output    \-

  y\[n\]       REAL                 Measured variable              \-
  ------------------------------------------------------------------------

### 4.12.7 Guidelines

**Controller Gain, k**

The controller gain, k, can be a positive number or a negative number. When k\>0, the controller is direct-acting. In this case, the controller output decreases if the controlled variable increases. A typical case of direct-acting control is the temperature control of heat exchanger, ie if the outlet temperature increases, the controller closes the vapour inlet valve to reduce the heating power.

If k\<0, the controller is inverse-acting, and the controller output increases if the controlled variable increases. A typical case is a level control where if the level of liquid in a tank increases due to an increase of the inlet flow, the controller must increase the position of the tank exit valve to re-establish the level.

**Weight Factor for Set-point Changes, beta**

In many current controllers, the proportional part gain only acts over the measured process variables. This avoids high control signals when the set-point is suddenly changed. This controller architecture is called I-P. The following formula covers the two architectures the PI when $\beta = 1$, and the I-P when $\beta = 0$

$$u(t) = K\left( \beta r(t) - y(t) + \frac{1}{T_{i}}\int_{}^{}{e(t)dt} \right)$$

### 4.12.8 Formulation

**Structure of the Controller**

The component Cntrl_pi represents a non-interactive control structure PI with a weight factor β to avoid the effect of brusque changes of the set-point, and a feedback loop to avoid the effect of saturation on the integral action whose error signal is applied to the output of the global action.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image132.png){width="6.5in" height="3.1458333333333335in"}

**Equations**

The two input signals to the controller are the set-point and the controlled process variable:

$$r = s\_ set.signal$$

$$y = s\_ var.signal$$

The error signal is equal to:

$$e = r - y\ $$

The feedback into the integrator to avoid saturation is:

$$es = s\_ track.signal - v\ $$

The integral part of the output is calculated from

$$vi = \ \int_{}^{}{\left( \frac{k}{T_{i}}e + \frac{es}{T_{r}} \right)dt}$$

The unlimited output is the sum of the proportional output and the integral output

$$v = k(\beta r - y) + vi$$

The output is limited between **u_max** and u_min

$$u = \left\{ \begin{matrix}
u & if & u\_ min\  < \ u\  < \ u\_ max \\
u\_ min & if & u < u\_ min\  \\
u\_ max & if & u > u\_ max\ 
\end{matrix} \right.\ $$

$$s\_ out.signal = u$$

## 4.13 Cntrl_PID

### 4.13.1 Description

This component is inherited from component Controller. This component type, named Cntrl_pid, represents a standard proportional integral derivative (PID) control. It obtains an error signal from an input signal and a set-point and produces an output signal with three components: a proportional part, an integral part, and a derivative part.

Any controller with integral action can exhibit a non-linear phenomena called reset windup or integrator build-up when overdriven. If there is a large initial error, the integrator does not respond immediately, but it integrates the error and produces a large signal some time later. The integral control action continues to increase as long as the error has not changed sign even if the controlled output may be close to the desired value. If the error remains large for a sufficiently long time, the integral mode can cause saturation even when the current value of the error is small. Consequently, a large overshoot can result.

Most controllers have an anti-reset windup option that limits the contribution of integral action so that the sum of the proportional output and the integral output does not exceed specified limits on either end of the output range. There is a negative feedback that modifies the integrator input error to prevent the windup.

Current PID controllers have a low-pass filter inserted in cascade with the differentiator. The reason for this filter is that the input signal always contains some high frequency noise, which has large slopes compared with the more slowly varying primary signal, and it would dominate the output of the differentiator. The low-pass filter inserted in cascade with differentiator solves the problem.

The component type Cntrl_pid includes the anti-reset windup option and the low-pass filter of current controllers.

### 4.13.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image134.png){width="0.5903083989501312in" height="0.513915135608049in"}

### 4.13.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.13.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = n)      OUT         Controlled output signal

  s_set       analog_signal   (n = n)      IN          Set point signal

  s_var       analog_signal   (n = n)      IN          Controlled variable signal
  ---------------------------------------------------------------------------------

### 4.13.5 Data

  -------------------------------------------------------------------------------------------------------------------------------------
  NAME         TYPE                   DEFAULT     DESCRIPTION                                                                   UNITS
  ------------ ---------------------- ----------- ----------------------------------------------------------------------------- -------
  Td\[n\]      REAL                               Rate or derivative time                                                       s

  Ti\[n\]      REAL                               Integrator time or reset time                                                 s

  alpha\[n\]   REAL                   0,1         Derivative filter parameter                                                   \-

  beta\[n\]    REAL                   0,1         Weight factor for set point changes in P output                               \-

  end_pos      ENUM EndPosBehaviour   end_I       End position behaviour                                                        \-

  gamma\[n\]   REAL                               Ratio between the time constant for the antiwindup and the integration time   \-

  k\[n\]       REAL                               Proportional gain of the controller                                           \-

  u_max\[n\]   REAL                               High limit of output                                                          \-

  u_min\[n\]   REAL                               Low limit of output                                                           \-
  -------------------------------------------------------------------------------------------------------------------------------------

### 4.13.6 Variables

  -------------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                           UNITS
  ------------ ---------- --------- ------------------------------------- -------
  e\[n\]       REAL                 Input error                           \-

  es\[n\]      REAL                 Saturation error                      \-

  r\[n\]       REAL                 Set point                             \-

  u\[n\]       REAL                 Output                                \-

  v\[n\]       REAL                 Unbounded output                      \-

  vi\[n\]      REAL                 Integral part of the output           \-

  vil\[n\]     REAL                 Limited integral part of the output   \-

  y\[n\]       REAL                 Measured variable                     \-

  yf\[n\]      REAL                 Filtered variable                     \-
  -------------------------------------------------------------------------------

### 4.13.7 Guidelines

**Controller Gain, k**

The controller gain, k, can be a positive number or a negative number. When k\>0, the controller is direct-acting. In this case, the controller output decreases if the controlled variable increases. A typical case of direct-acting control is the temperature control of heat exchanger, ie if the outlet temperature increases, the controller closes the vapour inlet valve to reduce the heating power.

If k\<0, the controller is inverse-acting, and the controller output increases if the controlled variable increases. A typical case is a level control where if the level of liquid in a tank increases due to an increase of the inlet flow, the controller must increase the position of the tank exit valve to re-establish the level.

**End Position Behaviour, end_pos**

This data represents the end position behaviour, and it is of an enumeration type (see Section 2.1), and it can takes two values

end_I (for integral end position behaviour)

end_PI (for proportional-integral end position behaviour)

In the following example a change of the error in the positive direction leads to a P-jump of the controller output in the case of PI end position behaviour. However, since the error is still negative, the controller integrates again to the end position. The resultant effect, e.g. brief opening of a valve, is in general undesirable, if the error remains negative. With I behaviour in the end position this effect is suppressed, because the controller carries out the P-jump only after a sign change of the error.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image135.png){width="2.53240813648294in" height="1.707697944006999in"}

Controller error

The output with PI end position behaviour will be:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image136.png){width="2.8657403762029747in" height="1.713665791776028in"}

Controller output with PI behaviour

The output with I end position behaviour will be:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image137.png){width="2.5925929571303588in" height="1.92167760279965in"}

Controller output with I behaviour

**Weight Factor for Set-point Changes, beta**

In many current controllers, the proportional part gain only acts over the measured process variables. This avoids high control signals when the set-point is suddenly changed. This controller architecture is called I-P. The following formula covers the two architectures the PI when $\beta = 1$, and the I-P when $\beta = 0$

$$u(t) = K\left( \beta r(t) - y(t) + \frac{1}{T_{i}}\int_{}^{}{e(t)dt} \right)$$

**Derivative Filter Factor, alpha**

In order to limit high frequency outputs (i.e. noise) the following transfer function is used, which includes a low-pass filter where α \< 1 is the derivative filter which takes typical values between 0.05 and 0.1:

$$\frac{u_{d}(s)}{E(s)} = \frac{K_{p}T_{D}s}{\alpha T_{D}s + 1}$$

With this filter, the high frequency gain is limited to $\frac{K_{p}}{\alpha}$

### 4.13.8 Formulation

**Structure of the Controller**

The component Cntrl_pid has a non-interactive PID control structure with derivative filter factor α during derivative action to avoid noise amplification at low frequencies, a weight factor β to avoid the effects of brusque changes of the set-point, and a feedback loop to avoid the effects of saturation on the integral action. The anti-windup error signal is applied to the output of the integral action or of the global action depending on whether the end position behaviour is end_I or end_PI respectively, and in accordance with the following control diagram:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image138.png){width="5.469758311461067in" height="3.1874759405074364in"}

**Equations**

The two input signals to the controller are the set-point and the controlled process variable:

$$r = s\_ set.signal$$

$$y = s\_ var.signal$$

The error signal is equal to:

$$e = r - y\ $$

The correction to the error going into the integrator to avoid saturation is

$$es = \left\{ \begin{matrix}
u - v & if\  & end\_ position\_ behaviour\  = PI \\
vil - vi & if & end\_ position\_ behaviour\  = \ I
\end{matrix} \right.\ $$

The integral part of the output is calculated from

$$vi = \ \int_{}^{}{\left( \frac{k}{T_{i}}e + \frac{es}{T_{r}} \right)dt}$$

The limited integral output is

$$vil = \left\{ \begin{matrix}
vi & if & u\_ min\  < \ vi\  < \ u\_ max \\
u\_ min & if & vi < u\_ min\  \\
u\_ max & if & vi > u\_ max\ 
\end{matrix} \right.\ $$

The output of the derivative filter is calculated from

$$\frac{dy_{f}}{dt} = \frac{y - y_{f}}{\alpha T_{d}}\ $$

The unlimited output is the sum of the proportional output, the integral output and the derivative output:

$$v = k\left( \beta r - y - T_{d}\frac{{dy}_{f}}{dt\ } \right) + v_{i,lim}$$

The output is limited between u_max and u_min:

$$u = \left\{ \begin{matrix}
u & if & u\_ min\  < \ u\  < \ u\_ max \\
u\_ min & if & u < u\_ min\  \\
u\_ max & if & u > u\_ max\ 
\end{matrix} \right.\ $$

$$s\_ out.signal = u$$

## 4.14 Cntrl_PID_ExtTrack

### 4.14.1 Description

This component is inherited from component Controller. This component type, named Cntrl_PID_ExtTrack, represents a standard proportional integral derivative (PID) control with external tracking. It obtains an error signal from an input signal and a set-point and produces an output signal with three components: a proportional part, an integral part, and a derivative part.

Any controller with integral action can exhibit a non-linear phenomena called reset windup or integrator build-up when overdriven. If there is a large initial error, the integrator does not respond immediately, but it integrates the error and produces a large signal some time later. The integral control action continues to increase as long as the error has not changed sign even if the controlled output may be close to the desired value. If the error remains large for a sufficiently long time, the integral mode can cause saturation even when the current value of the error is small. Consequently, a large overshoot can result.

Most controllers have an anti-reset windup option that limits the contribution of integral action so that the sum of the proportional output and the integral output does not exceed specified limits on either end of the output range. There is a negative feedback that modifies the integrator input error to prevent the windup.

Current PID controllers have a low-pass filter inserted in cascade with the differentiator. The reason for this filter is that the input signal always contains some high frequency noise, which has large slopes compared with the more slowly varying primary signal, and it would dominate the output of the differentiator. The low-pass filter inserted in cascade with differentiator solves the problem.

The component type Cntrl_PID_ExtTrack includes the anti-reset windup option and the low-pass filter of current controllers.

### 4.14.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image139.png){width="0.9236581364829396in" height="0.6528116797900263in"}

### 4.14.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.14.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = n)      OUT         Controlled output signal

  s_set       analog_signal   (n = n)      IN          Set point signal

  s_var       analog_signal   (n = n)      IN          Controlled variable signal

  s_track     analog_signal   (n = n)      IN          Tracking signal
  ---------------------------------------------------------------------------------

### 4.14.5 Data

  --------------------------------------------------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                                                                   UNITS
  ------------ ----------- ----------- ----------------------------------------------------------------------------- -------
  Td\[n\]      REAL        0.1         Rate or derivative time                                                       s

  Ti\[n\]      REAL        100\.       Integrator time or reset time                                                 s

  alpha\[n\]   REAL        0,1         Derivative filter parameter                                                   \-

  beta\[n\]    REAL        0,1         Weight factor for set point changes in P output                               \-

  gamma\[n\]   REAL        0.1         Ratio between the time constant for the antiwindup and the integration time   \-

  k\[n\]       REAL        1           Proportional gain of the controller                                           \-

  u_max\[n\]   REAL        0           High limit of output                                                          \-

  u_min\[n\]   REAL        1           Low limit of output                                                           \-
  --------------------------------------------------------------------------------------------------------------------------

### 4.14.6 Variables

  ------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                    UNITS
  ------------ ---------- --------- ------------------------------ -------
  e\[n\]       REAL                 Input error                    \-

  es\[n\]      REAL                 Saturation error               \-

  r\[n\]       REAL                 Set point                      \-

  u\[n\]       REAL                 Output                         \-

  v\[n\]       REAL                 Unbounded output               \-

  vi\[n\]      REAL                 Integral part of the output    \-

  y\[n\]       REAL                 Measured variable              \-

  yf\[n\]      REAL                 Filtered variable              \-
  ------------------------------------------------------------------------

### 4.14.7 Guidelines

**Controller Gain, k**

The controller gain, k, can be a positive number or a negative number. When k\>0, the controller is direct-acting. In this case, the controller output decreases if the controlled variable increases. A typical case of direct-acting control is the temperature control of heat exchanger, ie if the outlet temperature increases, the controller closes the vapour inlet valve to reduce the heating power.

If k\<0, the controller is inverse-acting, and the controller output increases if the controlled variable increases. A typical case is a level control where if the level of liquid in a tank increases due to an increase of the inlet flow, the controller must increase the position of the tank exit valve to re-establish the level.

**Weight Factor for Set-point Changes, beta**

In many current controllers, the proportional part gain only acts over the measured process variables. This avoids high control signals when the set-point is suddenly changed. This controller architecture is called I-P. The following formula covers the two architectures the PI when $\beta = 1$, and the I-P when $\beta = 0$

$$u(t) = K\left( \beta r(t) - y(t) + \frac{1}{T_{i}}\int_{}^{}{e(t)dt} \right)$$

**Derivative Filter Factor, alpha**

In order to limit high frequency outputs (i.e. noise) the following transfer function is used, which includes a low-pass filter where α \< 1 is the deriviative filter which takes typical values between 0.05 and 0.1:

$$\frac{u_{d}(s)}{E(s)} = \frac{K_{p}T_{D}s}{\alpha T_{D}s + 1}$$

With this filter, the high frequency gain is limited to $\frac{K_{p}}{\alpha}$

### 4.14.8 Formulation

**Structure of the Controller**

The component Cntrl_pid has a non-interactive PID control structure with derivative filter factor α during derivative action to avoid noise amplification at low frequencies, a weight factor β to avoid the effects of brusque changes of the set-point, and a feedback loop to avoid the effects of saturation on the integral action. The anti-windup error signal is applied to the output of the global action:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image140.png){width="4.330092957130359in" height="2.2777777777777777in"}

**Equations**

The two input signals to the controller are the set-point and the controlled process variable:

$$r = s\_ set.signal$$

$$y = s\_ var.signal$$

The error signal is equal to:

$$e = r - y\ $$

The correction to the error going into the integrator to avoid saturation is

$$es = s\_ track.signal\  - v$$

The integral part of the output is calculated from

$$vi = \ \int_{}^{}{\left( \frac{k}{T_{i}}e + \frac{es}{T_{r}} \right)dt}$$

The output of the derivative filter is calculated from

$$\frac{{dy}_{f}}{dt} = \frac{(y - y_{f})}{\alpha T_{d}}$$

The unlimited output is the sum of the proportional output, the integral output and the derivative output:

$$v = k\left( \beta r - y - T_{d}\frac{{dy}_{f}}{dt\ } \right) + v_{i,lim}$$

The output is limited between u_max and u_min:

$$u = \left\{ \begin{matrix}
u & if & u\_ min\  < \ u\  < \ u\_ max \\
u\_ min & if & u < u\_ min\  \\
u\_ max & if & u > u\_ max\ 
\end{matrix} \right.\ $$

$$s\_ out.signal = u$$

## 4.15 Counter_DOWN

### 4.15.1 Description

This component is inherited from component SISO. It represents digital down-counter as defined in IEC 61131-3.

### 4.15.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image141.png){width="0.7778182414698163in" height="0.6944805336832895in"}

### 4.15.3 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  CD          bool_signal   (n = 1)      IN          Counter activation

  LD          bool_signal   (n = 1)      IN          Load signal

  Q           bool_signal   (n = 1)      OUT         Output
  -------------------------------------------------------------------------------

### 4.15.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE       DEFAULT        DESCRIPTION                 UNITS
  ----------- ---------- -------------- --------------------------- -------
  PVmin       INTEGER    0              Minimun limit               \-

  -------------------------------------------------------------------------

### 4.15.5 Variables

  ----------------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                              UNITS
  ----------- ----------- --------- ---------------------------------------- -------
  PV          INTEGER     \--       Maximum value the counter can count to   \--

  CV          INTEGER     \--       Counter                                  \--

  t           INTEGER     0         Internal variable                        \--
  ----------------------------------------------------------------------------------

### 4.15.6 Guidelines

The signal CD is a synchronous entry so the user must define a clock signal in the schematic diagram (CLK component). The CD signal becomes active at the rising edge of the clock signal.

The numerical values of the limit variable PVmin are implementation dependent.

### 4.15.7 Formulation

The component is implemented as a continuous equation that defines the value of CV as equal to the output and a set of discrete events defined as follows:

WHEN(Clock_signal == TRUE)THEN

PV = s_in.signal\[1\]

IF (CD.signal\[1\]==TRUE AND CV \>PVmin AND CV \> 0)THEN

IF (t ==0) THEN

CV = PV

t += 1

ELSE

CV = CV -1

END IF

END IF

IF(CV \<= 0)THEN

Q.signal\[1\] =TRUE

ELSE

Q.signal\[1\] = FALSE

END IF

END WHEN

WHEN (LD.signal\[1\]== TRUE) THEN

CV= PV

t = 0

Q.signal\[1\] = FALSE

END WHEN

## 4.16 Counter_UP

### 4.16.1 Description

This component is inherited from component SISO. It represents a digital up-counter as defined in IEC 61131-3.

### 4.16.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image142.png){width="0.6180872703412074in" height="0.6944805336832895in"}

### 4.16.3 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  CU          bool_signal   (n = 1)      IN          Counter activation

  RESET       bool_signal   (n = 1)      IN          Reset signal

  Q           bool_signal   (n = 1)      OUT         Output
  -------------------------------------------------------------------------------

### 4.16.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE       DEFAULT        DESCRIPTION                 UNITS
  ----------- ---------- -------------- --------------------------- -------
  PVmax       INTEGER    100            Limit                       \-

  -------------------------------------------------------------------------

### 4.16.5 Variables

  ----------------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                              UNITS
  ----------- ----------- --------- ---------------------------------------- -------
  PV          INTEGER     \--       Maximum value the counter can count to   

  CV          INTEGER     \--       Counter                                  

  T           INTEGER     0         Internal variable                        
  ----------------------------------------------------------------------------------

### 4.16.6 Guidelines

The signal CU is a synchronous entrance so the user must define a clock signal in the schematic diagram (CLK component). The CU signal becomes active at the rising edge of the clock signal.

The numerical values of the limit variable PVmax are implementation dependent.

### 4.16.7 Formulation

The component is implemented as a continuous equation that defines the value of CV as equal to the output and a set of discrete events defined as follows:

WHEN(Clock_signal == TRUE) THEN

PV = s_in.signal\[1\]

IF (CU.signal\[1\]==TRUE AND CV \< PVmax)THEN

IF (t ==0) THEN

CV = 0

t += 1

ELSE

CV +=1

END IF

END IF

IF(CV \>= PV)THEN

Q.signal\[1\] =TRUE

ELSE

Q.signal\[1\] = FALSE

END IF

END WHEN

WHEN (RESET.signal\[1\]== TRUE) THEN

CV = 0

t = 0

Q.signal\[1\] = FALSE

END WHEN

## 4.17 Counter_UP-DOWN

### 4.17.1 Description

This component is inherited from component SISO. It represents digital up-down-counter as defined in IEC 61131-3.

### 4.17.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image143.png){width="0.9514381014873141in" height="0.902823709536308in"}

### 4.17.3 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  CU          bool_signal   (n = 1)      IN          Up-counter

  CD          bool_signal   (n = 1)      IN          Down-counter

  RESET       bool_signal   (n = 1)      IN          Reset signal

  LD          bool_signal   (n = 1)      IN          Load

  QU          bool_signal   (n = 1)      OUT         Output

  QD          bool_signal   (n = 1)      OUT         Output
  -------------------------------------------------------------------------------

### 4.17.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE       DEFAULT        DESCRIPTION                 UNITS
  ----------- ---------- -------------- --------------------------- -------
  PVmax       INTEGER    100            Upper limit                 \-

  PVmin       INTEGER    0              Lower limit                 \-
  -------------------------------------------------------------------------

### 4.17.5 Variables

  ----------------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                              UNITS
  ----------- ----------- --------- ---------------------------------------- -------
  PV          INTEGER     \--       Maximum value the counter can count to   

  CV          INTEGER     \--       Counter                                  
  ----------------------------------------------------------------------------------

### 4.17.6 Guidelines

Signals CU and CD are synchronous so the user must define a clock signal in the schematic diagram (CLK component). The CU signal becomes active at the rising edge of the clock signal.

The numerical values of the limit variables PVmax and PVmin are implementation dependent.

### 4.17.7 Formulation

The component is implemented as a continuous equation that defines the value of CV as equal to the output and a set of discrete events defined as follows:

WHEN (Clock_signal ==TRUE)THEN

PV = s_in.signal\[1\]

IF (CU.signal\[1\]== TRUE OR CD.signal\[1\]==TRUE)THEN

IF (CU.signal\[1\]==TRUE AND CV \< PVmax) THEN

CV = CV +1

ELSEIF (CD.signal\[1\]==TRUE AND CV \>PVmin)THEN

CV = CV -1

END IF

END IF

IF(CV \>= PV)THEN

QU.signal\[1\] =TRUE

ELSE

QU.signal\[1\] = FALSE

END IF

IF(CV \<= 0)THEN

QD.signal\[1\] =TRUE

ELSE

QD.signal\[1\] = FALSE

END IF

END WHEN

WHEN (RESET.signal\[1\]== TRUE) THEN

CV= 0

QU.signal\[1\] = FALSE

END WHEN

WHEN (LD.signal\[1\]== TRUE) THEN

CV = PV

QD.signal\[1\] = FALSE

END WHEN

## 4.18 CritDamping

### 4.18.1 Description

This component is inherited from component SISO. It defines the transfer function between the input signal and the output signal as an n_f-order filter with critical damping characteristics and cut-off frequency freq. It is implemented as a series of first order filters.

### 4.18.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image144.png){width="0.6250317147856518in" height="0.48613626421697287in"}

### 4.18.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_f            CONST INTEGER   1         Order of filter

  --------------------------------------------------------------------------

### 4.18.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal ()

  s_out       analog_signal   (n = n)      OUT         Outlet signal ()
  ---------------------------------------------------------------------------------

### 4.18.5 Data

  ------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                  UNITS
  ----------- ----------- ----------- ---------------------------- -------
  freq        REAL        1           Cut-off frequency            Hz

  ------------------------------------------------------------------------

### 4.18.6 Closed Parameters

  -------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- --------------------------------------
  n              CONST INTEGER   1         Dimension of input and ouput signals

  -------------------------------------------------------------------------------

### 4.18.7 Variables

  --------------------------------------------------------------------------
  NAME           TYPE       INITIAL   DESCRIPTION                    UNITS
  -------------- ---------- --------- ------------------------------ -------
  w              REAL                                                

  x\[n_f + 1\]   REAL                 State variables                
  --------------------------------------------------------------------------

### 4.18.8 Formulation

The angular frequency is calculated with the cut-off frequency (f):

$$\omega = 2 \cdot \pi \cdot f$$

The output signal is given by the following equation sequence where the state variables are computed:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image145.png){width="2.273148512685914in" height="1.1597692475940506in"}

Where $x\lbrack i\rbrack$ are the state variables and $n_{f}\$is the order of the filter

## 4.19 DeadZone

### 4.19.1 Description

This component is inherited from component MIMOs. It generates zero output signal within a specified region called dead zone. The lower and upper limit of the the dead zone are specified by the user with the data output_max and output_min.

This component generates output signals according to the input and dead zone:

- If the input signal is greater than the lower limit and less than the upper limit, the output signal is zero.

- If the input signal is greater than the upper limit, the output signal is the upper limit minus the input signal.

- If the input signal is less than the lower limit, the output signal is the input signal minus the lower limit

- If the lower and upper limits are equal, the output signal is the value of the input signal minus the dead zone value

### 4.19.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image146.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.19.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.19.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.19.5 Data

  --------------------------------------------------------------------------------
  NAME              TYPE        DEFAULT     DESCRIPTION                    UNITS
  ----------------- ----------- ----------- ------------------------------ -------
  output_max\[n\]   REAL                    Upper limit of the dead zone   

  output_min\[n\]   REAL                    Lower limit of the dead zone   
  --------------------------------------------------------------------------------

### 4.19.6 Formulation

The output signal is computed as follows:

$$s\_ out.signal\lbrack i\rbrack = \ \left\{ \begin{matrix}
s\_ in.signal\lbrack i\rbrack - output\_ max\lbrack i\rbrack & if & s\_ in.signal\lbrack i\rbrack > output\_ max\lbrack i\rbrack \\
s\_ in.signal\lbrack i\rbrack - output\_ min\lbrack i\rbrack & if & s\_ in.signal\lbrack i\rbrack < output\_ min\lbrack i\rbrack \\
0.0 & if & output\_\min\lbrack i\rbrack \leq s\_ in.signal\lbrack i\rbrack \leq output\_ max\lbrack i\rbrack
\end{matrix} \right.\ $$

If the input signal is within the dead zone, i.e. between output_min and output_max, the output signal is zero. Outside this region, the output signal is a linear function of the input signal with a slope of one.

## 4.20 Delay

### 4.20.1 Description

This component is inherited from component MIMOs and can be used to simulate a time delay. It delays the input by a specified amount of time specified by the user with the data tdelay.

At the start of the simulation the component outputs the initial value of the input signals until the simulation time exceeds the time specified with tdelay data, then the component outputs the delayed input signals.

### 4.20.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image147.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.20.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.20.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.20.5 Data

  --------------------------------------------------------------------------
  NAME          TYPE        DEFAULT     DESCRIPTION                  UNITS
  ------------- ----------- ----------- ---------------------------- -------
  tdelay\[n\]   REAL                    Delay time                   s

  --------------------------------------------------------------------------

### 4.20.6 Guidelines

The parameter tdelay is a vector whose size is that of the output and input signals. The user can define different delay times for the different output signals.

### 4.20.7 Formulation

The output signals are computed using the EL function called delay:

$$s\_ out.signal\lbrack i\rbrack\  = delay(s\_ in.signal\lbrack i\rbrack,max(tdelay\lbrack i\rbrack,1.0e - 12))$$

The minimum delay time is limited to 1e-12 seconds.

## 4.21 Demux

### 4.21.1 Description

This component separates an input signal vector into N output signals of the same dimension. The user specifies the dimension of the output signals, then the input signal shall have a dimension of N times the dimension of the output signals. The number of output signal is specified by the parameter n_out.

The input signal is splitted up into N output signals. The dimensions of the output signals are explicitly defined by the parameter dim_out.

In addition, this component is used for deriving demultiplexer of a fixed number of output signals by inheritance.

### 4.21.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image148.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.21.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  dim_out        CONST INTEGER   1         Dimension of outlet signals

  n_out          CONST INTEGER   1         Number of output signals
  --------------------------------------------------------------------------

### 4.21.4 Ports

  -------------------------------------------------------------------------------------------------
  NAME             TYPE            PARAMETERS               DIRECTION   DESCRIPTION
  ---------------- --------------- ------------------------ ----------- ---------------------------
  s_in             analog_signal   (n = n_out \* dim_out)   IN          Inlet port

  s_out\[n_out\]   analog_signal   (n = dim_out)            OUT         Outlet ports
  -------------------------------------------------------------------------------------------------

### 4.21.5 Guidelines

The output signals have the same dimension. The user specifies the dimension of the outlet signal and the dimension of the input signal is determined multiplying the dimension of the output signals by the number of output signals that is set by the input parameter n_out.

### 4.21.6 Formulation

The elements of the input signal vector is divided in element set of the same dimension depending the number of the output signals. The first output signal is the first set of elements, the second output signal is the second set of elements and so on.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image149.png){width="4.15740813648294in" height="0.6248195538057743in"}

where:

$n\_ out\  =$ number of output signals

$dim\_ out\  =$ dimension of the output signals

$s\_ out\lbrack i\rbrack.signal\lbrack j\rbrack =$ element j of the outlet port i

$s\_ in.signal\lbrack j\rbrack$ = element j of the inlet port

## 4.22 DemuxN (Demux2, ..., Demux8)

### 4.22.1 Description

These components are inherited from component Demux. Each of these components separate an input signal vector into N (2 to 8) output signals of the same dimension. The user specifies the dimension of the output signals, then the input signal shall have a dimension of N (2 to 8) times the dimension of the output signals.

The input signal is splitted up into N (2 to 8) output signals. The dimensions of the output signals are explicitly defined by the parameter dim_out.

### 4.22.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image150.png){width="5.9655839895013125in" height="1.1875612423447068in"}

### 4.22.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  dim_out        CONST INTEGER   1         Dimension of outlet signals

  --------------------------------------------------------------------------

### 4.22.4 Ports

  -------------------------------------------------------------------------------------------
  NAME             TYPE            PARAMETERS         DIRECTION   DESCRIPTION
  ---------------- --------------- ------------------ ----------- ---------------------------
  s_in             analog_signal   n=n_out\*dim_out   IN          Inlet port

  s_out\[n_out\]   analog_signal   n = dim_out        OUT         Outlet ports
  -------------------------------------------------------------------------------------------

### 4.22.5 Closed Parameters

  --------------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------------------
  n_out          CONST INTEGER   2 to 8    Number of outputs of each type of component

  --------------------------------------------------------------------------------------

### 4.22.6 Guidelines

The output signals have the same dimension. The user specifies the dimension of the outlet signal and the dimension of the input signal is determined multiplying the dimension of the output signals by the number of output signals, in this case depending on the type of component (2 to 8).

### 4.22.7 Formulation

The elements of the input signal vector is divided in sets of elements of the same dimension depending on the number of the output signals, in this case depending on the type of component (2 to 8). The first output signal is the first set of elements and the second output signal is the second set of elements.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image149.png){width="4.15740813648294in" height="0.6248195538057743in"}

where:

$n\_ out\  =$ number of output signals

$dim\_ out\  =$ dimension of the output signals

## 4.23 Derivative

### 4.23.1 Description

This component is inherited from component MIMOs. It approximates the derivative of the input signals by calculating:

$$\frac{\mathrm{\Delta}u}{\mathrm{\Delta}t}$$

where ∆u is the increment of the input signal in the increment of time $\mathrm{\Delta}t.$

This transfer function defined in this component between the input signal and the output signal is the following:

$$s\_ out.signal\lbrack i\rbrack = \frac{s}{T_{f}\lbrack i\rbrack \cdot s + 1} \cdot s\_ in.signal\lbrack i\rbrack$$

### 4.23.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image151.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.23.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.23.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.23.5 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  Tf\[n\]     REAL                    Filter time                   s

  -------------------------------------------------------------------------

### 4.23.6 Variables

  -------------------------------------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                                                   UNITS
  ----------- ----------- --------- ------------------------------------------------------------- -------
  yf\[n\]     REAL                  Auxiliary variable to calculate the approximated derivative   \-

  -------------------------------------------------------------------------------------------------------

### 4.23.7 Guidelines

The accuracy of the results depends on the size of the filter time Tf. Smaller values of this parameter allow smoother and more accurate output signals.

### 4.23.8 Formulation

The approximated derivative is calculated with the following expressions:

$$\frac{dy_{f}}{dt} = \frac{s\_ in.signal\lbrack i\rbrack - y_{f}}{T_{f}}\ \ $$

$$s\_ out.signal\lbrack i\rbrack = \ \frac{dy_{f}\ }{dt}\ \ $$

where:

$y_{f}$ = the auxiliary variable to calculate the approximated derivative.

$T_{f}$ = the time constant

## 4.24 Digital_ramp

### 4.24.1 Description

This component represents the time-based ramp function that is described in IEC 61131-3.

### 4.24.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image152.png){width="0.7014249781277341in" height="0.9375481189851269in"}

### 4.24.3 Ports

  ----------------------------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- -----------------------------------------------
  RUN         analog_signal   (n = 1)      IN          Signal of activation\_ 1 = TRUE, 0 = FALSE

  X0          analog_signal   (n = 1)      IN          Default value

  X1          analog_signal   (n = 1)      IN          Initial value

  TR          analog_signal   (n = 1)      IN          Ramp duration

  CYCLE       analog_signal   (n = 1)      IN          Sampling time

  XOUT        analog_signal   (n = 1)      OUT         Output signal

  BUSY        analog_signal   (n = 1)      OUT         Boolean to determine if the ramp is activated
  ----------------------------------------------------------------------------------------------------

### 4.24.4 Variables

  --------------------------------------------------------------------------
  NAME        TYPE         INITIAL   DESCRIPTION                     UNITS
  ----------- ------------ --------- ------------------------------- -------
  XI          DISCR REAL   \--       Initial value                   \--

  T           DISCR REAL   \--       Time                            S

  xout        DISCR REAL   \--       Output                          \--

  Tstart      DISCR REAL   \--       Initial time                    s
  --------------------------------------------------------------------------

### 4.24.5 Formulation

The component is modelled with a continuous equation that defines the value of the output as being equal to the value of the variable xout and a set of discrete events that are the following:

WHEN(TIME-Tstart \>= CYCLE.signal\[1\])THEN

Tstart = TIME

IF (RUN.signal\[1\] == 1) THEN

BUSY.signal\[1\] = TRUE

IF (T \>= TR.signal\[1\]) THEN

xout = X1.signal\[1\]

ELSE

xout = XI + (X1.signal\[1\] - XI) \* T/ TR.signal\[1\]

T = T + CYCLE.signal\[1\]

END IF

ELSEIF (RUN.signal\[1\]==0) THEN

BUSY.signal\[1\] = FALSE

xout = X0.signal\[1\]

XI = X0.signal\[1\]

T = 0

ELSE

ASSERT (FALSE) FATAL \"RUN can only take values 0 and 1\"

END IF

END WHEN

## 4.25 iDivision

### 4.25.1 Description

This component is inherited from component MI2MOs. It calculates the integer part of the division of two input signals fractional quotients are rounded toward zero to the nearest integers.

### 4.25.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image153.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.25.3 Formulation

The equation associated with this component is the following:

$$s\_ out.signal = int\left( \frac{s\_ in1.signal}{s\_ in2.signal} \right)$$

## 4.26 EQ

### 4.26.1 Description

This component is inherited from component SI2bSO. It represents the standard comparison function \'equal to\'.

### 4.26.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image154.png){width="0.5903083989501312in" height="0.5208595800524934in"}

### 4.26.3 Formulation

The equation associated with this component is the following:

WHEN (abs(s_in_1.signal\[1\] - s_in_2.signal\[1\]) \> 0) THEN

s_out.signal\[1\] = FALSE

END WHEN

WHEN (NOT abs(s_in_1.signal\[1\] - s_in_2.signal\[1\]) \> 0) THEN

s_out.signal\[1\] = TRUE

END WHEN

## 4.27 FirstOrderHold

### 4.27.1 Description

This component is inherited from component dMIMOs. The output signals of this component is the extrapolation through the values of the last two sampled input signals.

This component implements a first-order sample and hold that works at the specified sample time dt defined by the user.

### 4.27.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image155.png){width="0.7153149606299213in" height="0.48613626421697287in"}

### 4.27.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.27.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.27.5 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  dt          REAL        0.1         Sample time                   s

  -------------------------------------------------------------------------

### 4.27.6 Variables

  ---------------------------------------------------------------------------------------------------------
  NAME            TYPE        INITIAL   DESCRIPTION                                                 UNITS
  --------------- ----------- --------- ----------------------------------------------------------- -------
  To              REAL                  Current sample time                                         s

  sample          BOOLEAN     FALSE                                                                 

  signal_1\[n\]   REAL                  Array with values of the last sampled input signal          \-

  signal_2\[n\]   REAL                  Array with values of the penultimate sampled input signal   \-
  ---------------------------------------------------------------------------------------------------------

### 4.27.7 Guidelines

The sample time dt is the time interval between samples. This data is a scalar and it is used for all the signals.

### 4.27.8 Formulation

The input signals are sampled in the DISCRETE block of the component with WHEN blocks. The input signals are sampled every time sampling interval dt:

WHEN (sample == TRUE) THEN

sample = FALSE

sample = TRUE AFTER dt

END WHEN

where sample is a Boolean variable that indicates to the component when it must sample

WHEN (sample == TRUE) THEN

to = FALSE

FOR (i=0,i\<=n,i=i+1)

signal_2\[i\] = signal_1\[i\]

signal_1\[i\] = s_in.signal\[i\]

END FOR

END WHEN

The output signals are computed as follows:

$$s\_ out\ .signal\lbrack i\rbrack = signal\_ 1\ \lbrack i\rbrack + (signal\_ 1\lbrack i\rbrack - signal\_ 2\lbrack i\rbrack) \cdot \frac{{TIME - T}_{o}}{dt}\ $$

where:

$signal\_ 1\ \lbrack i\rbrack\$= the value of the last sampled input signal

$signal\_ 2\ \lbrack i\rbrack\$= the value of the input signal that was sampled two sample times ago

$T_{o}$ = the current sample time

$dt$ = the sample time

## 4.28 GE

### 4.28.1 Description

This component is inherited from component SI2bSO. It represents the standard comparison function \'greater than or equal to\'.

### 4.28.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image156.png){width="0.5903083989501312in" height="0.5208595800524934in"}

### 4.28.3 Formulation

The equation associated with this component is the following:

$$s\_ out.signal\lbrack 1\rbrack = \ \left\{ \begin{matrix}
FALSE & if & s\_ in\_ 1.signal\lbrack 1\rbrack < \ s\_ in\_ 2.signal\lbrack 1\rbrack \\
TRUE & if & s\_ in\_ 1.signal\lbrack 1\rbrack \geq \ s\_ in\_ 2.signal\lbrack 1\rbrack
\end{matrix} \right.\ $$

## 4.29 GT

### 4.29.1 Description

This component is inherited from component SI2bSO. It represents the standard comparison function \'greater than\'.

### 4.29.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image157.png){width="0.5903083989501312in" height="0.5347495625546806in"}

### 4.29.3 Formulation

The equation associated with this component is the following:

$$s\_ out.signal\lbrack 1\rbrack = \ \left\{ \begin{matrix}
FALSE & if & s\_ in\_ 1.signal\lbrack 1\rbrack \leq \ s\_ in\_ 2.signal\lbrack 1\rbrack \\
TRUE & if & s\_ in\_ 1.signal\lbrack 1\rbrack > \ s\_ in\_ 2.signal\lbrack 1\rbrack
\end{matrix} \right.\ $$

## 4.30 Gain

This component is inherited from component MIMOs. It generates the output signals by multiplying the input signals by a contant specified by the user.

### 4.30.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image158.png){width="0.5903083989501312in" height="0.47919181977252845in"}

### 4.30.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.30.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.30.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------- ----------- ----------- ----------------------------- -------
  k\[n\]      REAL                    Gain                          \-

  -------------------------------------------------------------------------

### 4.30.5 Guidelines

The gain data k is a vector of the same size as the size of the input and output signals. Each element of the input signal vector is multiplied by the corresponding element of the gain vector to generate the elements of the output signal vector.

### 4.30.6 Formulation

The output signals are calculating multiplying the input signals by the corresponding contant of the gain vector, as follows:

$$s\_ out\ .signal\lbrack i\rbrack = k\lbrack i\rbrack \cdot s\_ in.signal\lbrack i\rbrack$$

where $k\lbrack i\rbrack$ is the gain

## 4.31 Gate_AND

This component is inherited from component bSI2SO. It defines a logical gate AND. The output signal is TRUE if both input signals are true, otherwise the output signal is FALSE.

### 4.31.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image159.png){width="0.5903083989501312in" height="0.47224628171478567in"}

### 4.31.2 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in_1      bool_signal   (n = n)      IN          Inlet signal

  s_in_2      bool_signal   (n = n)      IN          Inlet signal

  s_out       bool_signal   (n = n)      OUT         Outlet signal
  -------------------------------------------------------------------------------

### 4.31.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.31.4 Formulation

The output signal is TRUE only when the two input signals are TRUE.

$$s\_ out\ .signal\lbrack i\rbrack = \ \left\{ \begin{array}{r}
\begin{matrix}
TRUE & \begin{matrix}
if\ s_{in_{1}}.signal\lbrack i\rbrack = = TRUE & AND\ \ 
\end{matrix}
\end{matrix}\ \begin{matrix}
s\_ in\_ 2\ .signal\lbrack i\rbrack = = TRUE & 
\end{matrix} \\
\begin{matrix}
FALSE & \begin{matrix}
if\ s\_ in\_ 1.signal\lbrack i\rbrack = = FALSE & \ OR\ \begin{matrix}
s\_ in\_ 2.signal\lbrack i\rbrack = = FALSE & 
\end{matrix}\ 
\end{matrix}
\end{matrix}
\end{array} \right.\ $$

## 4.32 Gate_NOT

This component is inherited from component bSISO. It defines a logical gate NOT. This component inverts the value of the input signal.

This component performs the NOT logical operation.

### 4.32.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image160.png){width="0.5903083989501312in" height="0.47919181977252845in"}

### 4.32.2 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in        bool_signal   (n = n)      IN          Inlet signal

  s_out       bool_signal   (n = n)      OUT         Outlet signal
  -------------------------------------------------------------------------------

### 4.32.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.32.4 Formulation

The output signal will be TRUE if the input signal is FALSE. And the output signal will be FALSE if the input signal is TRUE.

$$s\_ out\ .signal\lbrack i\rbrack = \ \left\{ \begin{array}{r}
\begin{matrix}
TRUE & \begin{matrix}
if & s\_ in\ .signal\lbrack i\rbrack = = FALSE
\end{matrix}
\end{matrix} \\
\begin{matrix}
FALSE & \begin{matrix}
if & s\_ in.signal\lbrack i\rbrack\  = = TRUE
\end{matrix}
\end{matrix}
\end{array} \right.\ $$

## 4.33 Gate_OR

This component is inherited from component bSI2SO. It represent a logical operator OR. The output signal is only FALSE if both input signals are FALSE, otherwise the output signal is TRUE.

### 4.33.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image161.png){width="0.5903083989501312in" height="0.47224628171478567in"}

### 4.33.2 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in_1      bool_signal   (n = n)      IN          Inlet signal

  s_in_2      bool_signal   (n = n)      IN          Inlet signal

  s_out       bool_signal   (n = n)      OUT         Outlet signal
  -------------------------------------------------------------------------------

### 4.33.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.33.4 Formulation

The output signal is FALSE only when the two input signals are FALSE otherwise the output signal is TRUE.

$$s\_ out\ .signal\lbrack i\rbrack = \ \left\{ \begin{array}{r}
\begin{matrix}
TRUE & \begin{matrix}
if\ s\_ in\_ 1\ .signal\lbrack i\rbrack = = TRUE\  & \begin{matrix}
OR & s\_ in\_ 2\ .signal\lbrack i\rbrack = = TRUE
\end{matrix}\ 
\end{matrix}
\end{matrix} \\
\begin{matrix}
FALSE & \begin{matrix}
if\ s\_ in\_ 1.signal\lbrack i\rbrack\  = = FALSE & \ AND\ s\_ in\_ 2.signal\lbrack i\rbrack = = FALSE\ 
\end{matrix}
\end{matrix}
\end{array} \right.\ $$

## 4.34 Gate_XOR

This component is inherited from component bSI2SO. It represent a logical operator XOR. The otuput signal is FALSE if the input signals are both FALSE or both TRUE, otherwise the output signal is TRUE.

### 4.34.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image162.png){width="0.5903083989501312in" height="0.5208595800524934in"}

### 4.34.2 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in_1      bool_signal   (n = n)      IN          Inlet signal

  s_in_2      bool_signal   (n = n)      IN          Inlet signal

  s_out       bool_signal   (n = n)      OUT         Outlet signal
  -------------------------------------------------------------------------------

### 4.34.3 Closed Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.34.4 Formulation

The output signal is only FALSE if the input signals have the same value, both are FALSE or both are TRUE, otherwise the output signal is TRUE.

$$s\_ out.signal\lbrack i\rbrack = \ \left\{ \begin{matrix}
FALSE & if & s\_ in\_ 1.signal\lbrack i\rbrack = = \ s\_ in\_ 2.signal\lbrack i\rbrack \\
TRUE & if & s\_ in\_ 1.signal\lbrack i\rbrack \neq \ s\_ in\_ 2.signal\lbrack i\rbrack
\end{matrix} \right.\ $$

## 4.35 Hysteresis

### 4.35.1 Description

This component is inherited from component SI2bSO. It implements Boolean hysteresis on the difference of REAL inputs.

### 4.35.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image163.png){width="0.5903083989501312in" height="0.5347495625546806in"}

### 4.35.3 Ports

  -----------------------------------------------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ------------------------------------------------------------------
  eps         analog_signal   (n = 1)      IN          Epsilon value defined by the user. The values must be possitive.

  -----------------------------------------------------------------------------------------------------------------------

### 4.35.4 Formulation

The component is implemented as a set of discrete events defined as follows:

$$s\_ out.signal\lbrack 1\rbrack = \ \left\{ \begin{matrix}
FALSE & if & s\_ in\_ 1.signal\lbrack 1\rbrack < \ s\_ in\_ 2.signal\lbrack 1\rbrack\ \  - eps.signal\lbrack 1\rbrack \\
TRUE & if & s\_ in\_ 1.signal\lbrack 1\rbrack > \ s\_ in\_ 2.signal\lbrack 1\rbrack\ \  + eps.signal\lbrack 1\rbrack
\end{matrix} \right.\ $$

## 4.36 Integrator

This component is inherited from component MIMOs. It represents an integrator unit typically employed in control systems.

The component calculates an output signal that is simply the integral of the input signal.

### 4.36.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image164.png){width="0.5903083989501312in" height="0.5069706911636046in"}

### 4.36.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.36.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.36.4 Data

  ----------------------------------------------------------------------------------
  NAME            TYPE        DEFAULT     DESCRIPTION                        UNITS
  --------------- ----------- ----------- ---------------------------------- -------
  output_o\[n\]   REAL                    Initial values of output signals   s

  ----------------------------------------------------------------------------------

### 4.36.5 Guidelines

This component allows to initialize the output signals by means of the data vector named output_o. The n-th element of the input signal vector is integrated with the initial value specified by the n-th element of the initial value vector named output_o to produce the n-th element of the output signal vector.

### 4.36.6 Formulation

The derivative of the output signal responds instantaneously to changes of the input signal.

$$\frac{\partial s_{out}}{\partial t} = s_{in}$$

where

$s_{out}\$= the value of the output signal

$s_{in}\$= the value of the input signal.

## 4.37 Inverse

This component is inherited from component MIMOs. It calculates the inverse of the input analog signals.

### 4.37.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image165.png){width="0.5903083989501312in" height="0.5069706911636046in"}

### 4.37.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.37.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.37.4 Formulation

The output signals are calculated as the inverse of the input signals:

$$s\_ out.signal\lbrack i\rbrack = \ \frac{1}{s\_ in.signal\lbrack i\rbrack}$$

## 4.38 LE

### 4.38.1 Description

This component is inherited from component SI2bSO. It represents the standard comparison function \'lower than or equal to\'.

### 4.38.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image166.png){width="0.5903083989501312in" height="0.5208595800524934in"}

### 4.38.3 Formulation

The equation associated with this component is the following:

$$s\_ out.signal\lbrack 1\rbrack = \ \left\{ \begin{matrix}
FALSE & if & s\_ in\_ 1.signal\lbrack 1\rbrack > \ s\_ in\_ 2.signal\lbrack 1\rbrack \\
TRUE & if & s\_ in\_ 1.signal\lbrack 1\rbrack \leq \ s\_ in\_ 2.signal\lbrack 1\rbrack
\end{matrix} \right.\ $$

## 4.39 LT

### 4.39.1 Description

This component is inherited from component SI2bSO. It represents the standard comparison function \'lower than\'.

### 4.39.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image167.png){width="0.5903083989501312in" height="0.5208595800524934in"}

### 4.39.3 Formulation

The equation associated with this component is the following:

$$s\_ out.signal\lbrack 1\rbrack = \ \left\{ \begin{matrix}
FALSE & if & s\_ in\_ 1.signal\lbrack 1\rbrack \geq \ s\_ in\_ 2.signal\lbrack 1\rbrack \\
TRUE & if & s\_ in\_ 1.signal\lbrack 1\rbrack < \ s\_ in\_ 2.signal\lbrack 1\rbrack
\end{matrix} \right.\ $$

## 4.40 LogicalSwitch

This component switches depending on the value of the input signal of port s_in\[2\] between two possible input signals correponding to ports s_in\[1\] and s_in\[3\]. If the signal of port s_in\[2\] is TRUE, the output signal will be equal to the input signal of port s_in\[1\] otherwise the output signal will be equal to the input signal of port s_in\[3\].

### 4.40.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image168.png){width="0.7014249781277341in" height="0.5972528433945756in"}

### 4.40.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.40.3 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  s_in\[3\]   bool_signal   (n = n)      IN          Boolean inlet signal

  s_out       bool_signal   (n = n)      OUT         Boolean outlet signal
  -------------------------------------------------------------------------------

### 4.40.4 Formulation

The output signals are computed as follows:

$$s\_ out.signal\lbrack i\rbrack = \ \left\{ \begin{matrix}
s\_ in\lbrack 1\rbrack.signal\lbrack i\rbrack & if & s\_ in\lbrack 2\rbrack.signal\lbrack i\rbrack = = TRUE \\
s\_ in\lbrack 3\rbrack.signal\lbrack i\rbrack & if & s\_ in\lbrack 2\rbrack.signal\lbrack i\rbrack = = FALSE
\end{matrix} \right.\ $$

## 4.41 MathFunction

This component is inherited from component MIMOs. It performs basic mathematical functions to the input signals. The user can specify the mathematical operation with the parameter option. The mathematical functions available in this component are the following:

  -----------------------------------------------------------------------
  option       Description
  ------------ ----------------------------------------------------------
  FunAbs       To calculate the absolute value of the input signals

  FunSign      To calculate the sign of the input signals

  FunSqrt      To calculate the square root of the input signals

  FunSin       To calculate the sine of the input signals

  FunCos       To calculate the cosine of the input signals

  FunTan       To calculate the tangent of the input signals

  FunAsin      To calculate the arc-sine of the input signals

  FunAcos      To calculate the arc-cosine of the input signals

  FunAtan      To calculate the arc-tangent of the input signals

  FunSinh      To calculate the hyperbolic sine of the input signals

  FunCosh      To calculate the hyperbolic cosine of the input signals

  FunTanh      To calculate the hyperbolic tangent of the input signals

  FunExp       To calculate the exponential of the input signals

  FunLog10     To calculate the base 10 logarithm of the input signals

  FunLog       To calculate the natural logartihm of the input signals
  -----------------------------------------------------------------------

### 4.41.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image169.png){width="0.6805905511811023in" height="0.48613626421697287in"}

### 4.41.2 Parameters

  ----------------------------------------------------------------------------------
  NAME           TYPE                    DEFAULT   DESCRIPTION
  -------------- ----------------------- --------- ---------------------------------
  n              CONST INTEGER           1         Dimension of inputs and outputs

  option         CONST ENUM MathOption   FunSin    Mathematical function
  ----------------------------------------------------------------------------------

### 4.41.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.41.4 Guidelines

The users specificy the mathematical functions they want to apply to the input signals with the parameter option.

The exceptions of the mathematical functions of this component are not protected. The exceptions of the mathematical functions will be detected by the compiler.

### 4.41.5 Formulation

The mathematical function performed to the input signals depends on the option choosen by the user:

  --------------------------------------
  option       Equation applied
  ------------ -------------------------
  FunAbs       abs(s_in.signal\[i\])

  FunSign      sign(s_in.signal\[i\])

  FunSqrt      sqrt(s_in.signal\[i\])

  FunSin       sin(s_in.signal\[i\])

  FunCos       cos(s_in.signal\[i\])

  FunTan       tan(s_in.signal\[i\])

  FunAsin      asin(s_in.signal\[i\])

  FunAcos      acos(s_in.signal\[i\])

  FunAtan      atan(s_in.signal\[i\])

  FunSinh      sinh(s_in.signal\[i\])

  FunCosh      cosh(s_in.signal\[i\])

  FunTanh      tanh(s_in.signal\[i\])

  FunExp       exp(s_in.signal\[i\])

  FunLog10     log10(s_in.signal\[i\])

  FunLog       log(s_in.signal\[i\])
  --------------------------------------

All these functions (abs, sign, sqrt, sin, cos...) are EL language global functions.

## 4.42 Maximum

This component is inherited from component MI2MOs. It calculates which is the maximum value between the two input signals.

### 4.42.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image170.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.42.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.42.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in_1      analog_signal   (n = n)      IN          First inlet signal

  s_in_2      analog_signal   (n = n)      IN          Second inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.42.4 Formulation

If the first input signal is greater than the second input signal then the value of the output signal will be the value of the first input signal, otherwise the value of the output signal will be the value of the second input signal.

$$s\_ out.signal\lbrack i\rbrack = \ \left\{ \begin{matrix}
s\_ in\_ 1.signal\lbrack i\rbrack & if & s\_ in\_ 1.signal\lbrack i\rbrack > s\_ in\_ 2.signal\lbrack i\rbrack \\
s\_ in\_ 2.signal\lbrack i\rbrack & if & s\_ in\_ 1.signal\lbrack i\rbrack \leq s\_ in\_ 2.signal\lbrack i\rbrack
\end{matrix} \right.\ $$

## 4.43 Minimum

This component is inherited from component MI2MOs. It calculates which is the minimum value between the two input signals.

### 4.43.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image171.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.43.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.43.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in_1      analog_signal   (n = n)      IN          First inlet signal

  s_in_2      analog_signal   (n = n)      IN          Second inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.43.4 Formulation

If the first input signal is lower than the second input signal then the value of the output signal will be the value of the first input signal, otherwise the value of the output signal will be the value of the second input signal.

$$s\_ out.signal\lbrack i\rbrack = \ \left\{ \begin{matrix}
s\_ in\_ 1.signal\lbrack i\rbrack & if & s\_ in\_ 1.signal\lbrack i\rbrack < s\_ in\_ 2.signal\lbrack i\rbrack \\
s\_ in\_ 2.signal\lbrack i\rbrack & if & s\_ in\_ 1.signal\lbrack i\rbrack \geq s\_ in\_ 2.signal\lbrack i\rbrack
\end{matrix} \right.\ $$

## 4.44 Module

### 4.44.1 Description

This component is inherited from component MI2MOs. It represents an output signal that is the module of a division of two input signals.

### 4.44.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image172.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.44.3 Formulation

The equation associated with this component is as follows. If $s\_ in\_ 2.signal\lbrack i\rbrack$ is not 0:

$$s\_ out.signal\lbrack i\rbrack = \ s\_ in\_ 1.signal\lbrack i\rbrack - int\left( \frac{s\_ in\_ 1.signal\lbrack i\rbrack}{s\_ in\_ 2.signal\lbrack i\rbrack} \right)*s\_ in\_ 2.signal\lbrack i\rbrack$$

If $s\_ in\_ 2.signal\lbrack i\rbrack$ is 0 the output is 0.

$int()$ is the function implemented in MATH library that returns the integer of the input value.

## 4.45 Move

### 4.45.1 Description

This component is inherited from component SISO. It represents the standard arithmetic operation MOVE (IEC1131-3). It puts the same signal that is connected to the input at the output.

### 4.45.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image173.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.45.3 Ports

  -------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ----------- ------------- ------------ ----------- ----------------------------
  EN          bool_signal   (n = 1)      IN          Enable signal

  -------------------------------------------------------------------------------

### 4.45.4 Formulation

The output signals respond instantaneously to changes of the input signals if the enable signal is true. The equation associated with this component is the following:

$$s\_ out.signal\lbrack 1\rbrack = \ s\_ in.signal\lbrack 1\rbrack$$

## 4.46 Mux

### 4.46.1 Description

This component combines N input signal ports of the same dimension into only one output signal port.

The user specifies the dimension of the input signal ports, then the output signal port shall have a dimension of N times the dimension of the input signal ports defined by the input parameter n_in.

The N input signal ports are combined into an only output signal port. The dimensions of the input signal ports are explicitly defined by the parameter dim_in.

In addition, this component is used for deriving multiplexers of different number of inputs by inheritance.

### 4.46.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image174.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.46.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  dim_in         CONST INTEGER   1         Dimension of input signals

  n_in           CONST INTEGER   1         Number of inputs
  --------------------------------------------------------------------------

### 4.46.4 Ports

  ---------------------------------------------------------------------------------------
  NAME           TYPE            PARAMETERS       DIRECTION   DESCRIPTION
  -------------- --------------- ---------------- ----------- ---------------------------
  s_in\[n_in\]   analog_signal   n = dim_in       IN          Inlet ports

  s_out          analog_signal   n=n_in\*dim_in   OUT         Outlet port
  ---------------------------------------------------------------------------------------

### 4.46.5 Guidelines

All the input signal ports have the same dimension. The user specifies the dimension of the input signal ports and the dimension of the output signal port is determined multiplying the dimension of the input signals port by the number of input signal ports given by the parameter n_in.

### 4.46.6 Formulation

The output signal vector is built concatenating the elements of the input ports. The first dim_in elements of the output signal port will be the set of elements of the first input signal port, the second dim_in elements of the output signal port will be the set of elements of the second input signal port and so on.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image175.png){width="3.8995363079615046in" height="0.6327066929133859in"}

where:

n_in = number of input signal ports

dim_in = dimension of the input signal ports

s_in\[i\].signal\[j\] = signal j of the input port i

s_out.signal\[j\] = signal j of the output port

## 4.47 MuxN (Mux2, ..., Mux8)

These components are inherited from component Mux. Each of these components combine several input signal ports of the same dimension into only one output signal port

The user specifies the dimension of the input signal ports, then the output signal port shall have a dimension of N (2 to 8) times the dimension of the input signal ports.

The two input signal ports are combined into an only output signal port. The dimensions of the input signal ports are explicitly defined by the parameter dim_in.

### 4.47.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image176.png){width="5.868357392825897in" height="1.3542366579177603in"}

### 4.47.2 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  dim_in         CONST INTEGER   1         Dimension of input signals

  --------------------------------------------------------------------------

### 4.47.3 Ports

  --------------------------------------------------------------------------------------
  NAME           TYPE            PARAMETERS      DIRECTION   DESCRIPTION
  -------------- --------------- --------------- ----------- ---------------------------
  s_in\[n_in\]   analog_signal   n = dim_in      IN          Inlet signal ports

  s_out          analog_signal   n=n_in·dim_in   OUT         Outlet signal port
  --------------------------------------------------------------------------------------

### 4.47.4 Closed Parameters

  --------------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------------------
  n_in           CONST INTEGER   2 to 8    Number of outputs of each type of component

  --------------------------------------------------------------------------------------

### 4.47.5 Guidelines

All the input signal ports have the same dimension. The user specifies the dimension of the input signal ports and the dimension of the output signal port is determined multiplying the dimension of the input signals port by the number of input signal port, in this case depending on the type of component (2 to 8).

### 4.47.6 Formulation

The output signal vector is built concatenating the elements of the input ports. The first dim_in elements of the output signal port will be the set of elements of the first input signal port, the second dim_in elements of the output signal port will be the set of elements of the second input signal port and so on.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image175.png){width="3.8995363079615046in" height="0.6327066929133859in"}

where:

n_in = number of input signal ports

dim_in = dimension of the input signal ports

## 4.48 NEQ

### 4.48.1 Description

This component is inherited from component SI2bSO. It represents the standard comparison function \'not equal to\'.

### 4.48.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image177.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.48.3 Formulation

The equation associated with this component is the following:

$$s\_ out.signal\lbrack i\rbrack = \ \left\{ \begin{matrix}
TRUE & if & s\_ in\_ 1.signal\lbrack 1\rbrack \neq s\_ in\_ 2.signal\lbrack 1\rbrack \\
FALSE & if & s\_ in\_ 1.signal\lbrack 1\rbrack = = s\_ in\_ 2.signal\lbrack 1\rbrack
\end{matrix} \right.\ $$

## 4.49 Product

### 4.49.1 Description

This component is inherited from component MI2MOs. It represents a multiplier unit tipically employed in control systems.

The component calculates an output signal that is the product of the two input signals.

### 4.49.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image178.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.49.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.49.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in_1      analog_signal   (n = n)      IN          Inlet signal

  s_in_2      analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.49.5 Guidelines

### 4.49.6 Formulation

The output signals respond instantaneously to changes of the input signals. It calculates the output signal elements as the product of the corresponding elements of the two input signal ports.

$$s\_ out.signal\lbrack i\rbrack = \ s\_ in\_ 1.signal\lbrack i\rbrack \cdot s\_ in\_ 2.signal\lbrack i\rbrack$$

## 4.50 ProductMulti

### 4.50.1 Description

This component performs multiplication or division of its input signals depending on the value of the operation input parameter. Multiplication and Division indicate the operations to be performed on the input signals. The number of operations must equal the number of input signals. The dimension of the input and output signal vectors is 1.

### 4.50.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image179.png){width="0.638921697287839in" height="0.513915135608049in"}

### 4.50.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_input        CONST INTEGER   1         Number of input signals

  --------------------------------------------------------------------------

### 4.50.4 Ports

  --------------------------------------------------------------------------------------
  NAME              TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------------- --------------- ------------ ----------- ---------------------------
  s_in\[n_input\]   analog_signal   (n = 1)      IN          Inlet signals

  s_out             analog_signal   (n = 1)      OUT         Outlet signal
  --------------------------------------------------------------------------------------

### 4.50.5 Data

  ------------------------------------------------------------------------------------------------------------------------
  NAME                   TYPE                    DEFAULT          DESCRIPTION                                      UNITS
  ---------------------- ----------------------- ---------------- ------------------------------------------------ -------
  operation\[n_input\]   ENUM ProductOperation   Multiplication   Operation to be performed on each input signal   \-

  ------------------------------------------------------------------------------------------------------------------------

### 4.50.6 Variables

  -------------------------------------------------------------------------------------------------------
  NAME                TYPE        INITIAL   DESCRIPTION                                           UNITS
  ------------------- ----------- --------- ----------------------------------------------------- -------
  factor\[n_input\]   REAL                  Auxiliary variable to calculate product or division   \-

  -------------------------------------------------------------------------------------------------------

### 4.50.7 Formulation

The output signals respond instantaneously to changes of the input signals. It calculates the output signal elements as the product or division of the signals of the input ports.

s_out.signal\[1\] = 1

FOR(i IN 1, n_input)

s_out.signal\[1\] = s_out.signal\[1\] \* factor\[i\]

END FOR

Where the value of factor\[1\] depends on the operation defined in the input parameter operation for each input signal port:

FOR(i IN 1, n_input)

factor\[i\] = IF(operation\[i\] == Multiplication) s_in\[i\].signal\[1\]

ELSE 1/s_in\[i\].signal\[1\]

END FOR

## 4.51 RS_Bistable

### 4.51.1 Description

This component is inherited from component bMI2MOs. It represents a reset dominant bistable as defined in IEC 61131-3.

### 4.51.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image180.png){width="0.6319772528433946in" height="0.48613626421697287in"}

### 4.51.3 Data

  -------------------------------------------------------------------------
  NAME        TYPE       DEFAULT        DESCRIPTION                 UNITS
  ----------- ---------- -------------- --------------------------- -------
  init_val    BOOLEAN    FALSE          Initial output value        \-

  -------------------------------------------------------------------------

### 4.51.4 Formulation

WHEN((s_in_1.signal\[1\] == TRUE OR s_out.signal\[1\] == TRUE) AND s_in_2.signal\[1\] == FALSE) THEN

s_out.signal\[1\] = TRUE

END WHEN

WHEN(s_in_1.signal\[1\] == FALSE AND s_out.signal\[1\] == FALSE AND s_in_2.signal\[1\] == FALSE) THEN

s_out.signal\[1\] = FALSE

END WHEN

WHEN (s_in_2.signal\[1\] == TRUE) THEN

s_out.signal\[1\] = FALSE

END WHEN

## 4.52 RandomSource

### 4.52.1 Description

This component is inherited from component SO. It generates random numbers following various probability distributions depending on the value of the parameter random.

It generates normally distributed random numbers. The user specifies the starting seed value to generate the random numbers with the parameter iseed.

### 4.52.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image181.png){width="0.7500382764654419in" height="0.48613626421697287in"}

### 4.52.3 Parameters

  ------------------------------------------------------------------------------------
  NAME           TYPE                      DEFAULT   DESCRIPTION
  -------------- ------------------------- --------- ---------------------------------
  iseed          CONST INTEGER             1200      Integer seed

  random         CONST ENUM RandomOption   Uniform   Probability distribution
  ------------------------------------------------------------------------------------

### 4.52.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal

  ----------------------------------------------------------------------------------

### 4.52.5 Data

  ----------------------------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                                        UNITS
  ----------- ----------- ----------- -------------------------------------------------- -------
  a           REAL        0           Lower limit of interval on uniform distribution    \-

  b           REAL        1           Higher limit of interval on uniform distribution   \-

  dt          REAL        0.1         Time between samples                               s

  lambda      REAL        1           Mean of exponential distribution                   \-

  mu          REAL        0           Mean of gaussian distribution                      \-

  n           INTEGER     10          Number of tries on binomial distribution           \-

  order       INTEGER     3           Order of gamma distribution                        \-

  p           REAL        0.5         Success probability on binomial distribution       \-

  sigma       REAL        1           Typical deviation of gaussian distribution         \-

  xm          REAL        1           Mean of Poisson distribution                       \-
  ----------------------------------------------------------------------------------------------

### 4.52.6 Closed Parameters

  ------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- -------------------------------------
  n_out          CONST INTEGER   1         Dimension of the outlet signal port

  ------------------------------------------------------------------------------

### 4.52.7 Variables

  ---------------------------------------------------------------------------------
  NAME             TYPE       INITIAL   DESCRIPTION                    UNITS
  ---------------- ---------- --------- ------------------------------ ------------
  Sample           BOOLEAN    TRUE      Sampler                        TRUE/FALSE

  i_array\[15\]    INTEGER              Auxiliar array of integers     \-

  r_array\[150\]   REAL                 Auxiliar array                 \-

  x                REAL                 Random numbers                 \-
  ---------------------------------------------------------------------------------

### 4.52.8 Guidelines

The users can choose the probability distribution type that they want to use to generate the random numbers with the parameter random. The types of probability distribution available in this component are shown in the following table:

  -------------------------------------------------------------
  random option          Description
  ---------------------- --------------------------------------
  Uniform                Uniform distribution

  Binomial               Binomial distribution

  Exponential            Exponential distribution

  Gamma                  Gamma distribution

  Gaussian               Gaussian distribution

  Poisson                Poisson distribution
  -------------------------------------------------------------

Defines a component generating random numbers following various probability distributions, depending on the value of variable random.

+----------------+---------------------------------------------------------------------+
| random option  | Equation                                                            |
+================+=====================================================================+
| Uniform        | if(a \< x \<b) p(x) = 1 / (b - a) when (a \< x \< b)                |
|                |                                                                     |
|                | else p(x) = 0                                                       |
+----------------+---------------------------------------------------------------------+
| Binomial       | Pnp(j) = (n over j) \* p\*\*j \* (1 - p)\*\*(n - j)                 |
+----------------+---------------------------------------------------------------------+
| Exponential    | p(x) = exp(-lambda \* x)                                            |
+----------------+---------------------------------------------------------------------+
| Gamma          | p(x) = x\*\*(a - 1) \* exp(-x) / gamma(a)                           |
+----------------+---------------------------------------------------------------------+
| Gaussian       | p(x) = 1 / sqrt(2 \* PI \* sigma) \* exp(- ((x - mu) / sigma)\*\*2) |
+----------------+---------------------------------------------------------------------+
| Poisson        | Px(j) = x\*\*j \* exp(-x) / j!                                      |
+----------------+---------------------------------------------------------------------+

**Notes:**

Random functions need two arrays (one of integer parameters and other ofreal parameters). This arrays are over dimensioned, and their function is:

i_array\[15\]: Components 1 to 5 are needed by uniform random number generator function and represent the modules and two flags which tell wether the function is called the first time or it has been already called. Components 6 to 10 represent integer parameters of the distribution, such as, for example, the number of tries \"n\" on Binomial distribution. Components 11 to 15 are flags. This flags may save values obtained from integer parameters of the last call, such as old value of \"n\" on binomial distribution, or simple flags.

i_array\[11\]: On gaussian case, which indicates wheter is neccessary to calculate or not.

r_array\[150\]: Components 1 to 98 are needed by uniform random number generator function to save the history of the generation. Components 99 to 100 are not used. Components 101 to 120 represent real parameters, such as the probability of success \"p\" on binomial distribution. Components 121 to 150 are flags saving some values obtained from parameters, such as the old value of \"p\" (r_array\[121\]) on binomial distribution.

### 4.52.9 Formulation

This component generates random numbers following various probability distrributions, depending on the value of variable \"random\".

+----------------+---------------------------------------------------------------------+
| random option  | Equation                                                            |
+================+=====================================================================+
| Uniform        | if(a \< x \<b) p(x) = 1 / (b - a) when (a \< x \< b)                |
|                |                                                                     |
|                | else p(x) = 0                                                       |
+----------------+---------------------------------------------------------------------+
| Binomial       | Pnp(j) = (n over j) \* p\*\*j \* (1 - p)\*\*(n - j)                 |
+----------------+---------------------------------------------------------------------+
| Exponential    | p(x) = exp(-lambda \* x)                                            |
+----------------+---------------------------------------------------------------------+
| Gamma          | p(x) = x\*\*(a - 1) \* exp(-x) / gamma(a)                           |
+----------------+---------------------------------------------------------------------+
| Gaussian       | p(x) = 1 / sqrt(2 \* PI \* sigma) \* exp(- ((x - mu) / sigma)\*\*2) |
+----------------+---------------------------------------------------------------------+
| Poisson        | Px(j) = x\*\*j \* exp(-x) / j!                                      |
+----------------+---------------------------------------------------------------------+

**Notes:**

Random functions need two arrays (one of integer parameters and other ofreal parameters). This arrays are over dimensioned, and their function is:

i_array\[15\]: Components 1 to 5 are needed by uniform random number generator function and represent the modules and two flags which tell wether the function is called the first time or it has been already called. Components 6 to 10 represent integer parameters of the distribution, such as, for example, the number of tries \"n\" on Binomial distribution. Components 11 to 15 are flags. This flags may save values obtained from integer parameters of the last call, such as old value of \"n\" on binomial distribution, or simple flags.

i_array\[11\]: On gaussian case, which indicates wheter is neccessary to calculate or not.

r_array\[150\]: Components 1 to 98 are needed by uniform random number generator function to save the history of the generation. Components 99 to 100 are not used. Components 101 to 120 represent real parameters, such as the probability of success \"p\" on binomial distribution. Components 121 to 150 are flags saving some values obtained from parameters, such as the old value of \"p\" (r_array\[121\]) on binomial distribution.

## 4.53 RateLimiter

### 4.53.1 Description

This component represents a rate limiter that limits the first derivative of the signal passing through it.

### 4.53.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image182.png){width="0.5972528433945756in" height="0.47919181977252845in"}

### 4.53.3 Ports

  --------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ---------------------------
  s_in        analog_signal   (n = 1)      IN          Input signal

  s_out       analog_signal   (n = 1)      OUT         Output signal
  --------------------------------------------------------------------------------

### 4.53.4 Data

  ----------------------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                                       UNITS
  ------------ ----------- ----------- ------------------------------------------------- -------
  Tc           REAL        0.1         Filter time to calculate the derivative           s

  v_up_max     REAL        1           Upper limit of the rate of change of the signal   pos/s

  v_down_max   REAL        -1          Lower limit of the rate of change of the signal   pos/s

  y_o          REAL        0           Initial actuator position                         
  ----------------------------------------------------------------------------------------------

### 4.53.5 Variables

  -------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME         TYPE        INITIAL   DESCRIPTION                                                                                                  UNITS
  ------------ ----------- --------- ------------------------------------------------------------------------------------------------------------ -------
  v_bound      REAL                  Bounded rate                                                                                                 pos/s

  v_unbound    REAL                  Unbounded rate                                                                                               pos/s

  y            REAL                  Output signal                                                                                                

  init_event   BOOLEAN               Event to execute the DISCRETE block at the beginning of the simulation to initialize the actuator position   
  -------------------------------------------------------------------------------------------------------------------------------------------------------

### 4.53.6 Formulation

The output signal is initialized to the input signal at the beginning of the simulation:

WHEN (init_event) THEN

y = s_in.signal\[1\]

s_out.signal\[1\] = s_in.signal\[1\]

init_event = FALSE

END WHEN

The rate limiter component limits the first derivative of the signal passing through. The unbounded position rate is given by:

$$v\_ unbound\  = \frac{s\_ in\ .signal\lbrack 1\rbrack - y}{T_{c}}$$

However, the change rate is limited between two limits, one when the position is increasing (v_up_max) and one when the position is lowering (v_down_max):

$$v\_ bound\  = \ \left\{ \begin{matrix}
v\_ up\_ max \\
v\_ down\_ max \\
v\_ unbound
\end{matrix}\begin{array}{r}
\begin{matrix}
if & v\_ unbound\  > v\_ up\_ max & 
\end{matrix} \\
\begin{matrix}
if & v\_ unbound\  < v\_ down\_ max & 
\end{matrix} \\
\begin{matrix}
 & if & v\_ down\_ max \leq \ 
\end{matrix}v\_ unbound\  \leq v\_ up\_ max
\end{array} \right.\ $$

The output signal is calculated by the following differential equation:

$$\frac{dy}{dt} = \ v\_ bound$$

$$s\_ out.signal\lbrack 1\rbrack = y$$

## 4.54 RealToBoolean

### 4.54.1 Description

This component transforms analog signals to Boolena signals. The user defines the upper and lower limit to switch the Boolean ouput to TRUE and FALSE.

### 4.54.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image183.png){width="0.7292038495188101in" height="0.48613626421697287in"}

### 4.54.3 Parameters

  -----------------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ------------------------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs signal vectors

  -----------------------------------------------------------------------------------------

### 4.54.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Analog inlet signal

  s_out       bool_signal     (n = n)      OUT         Boolean outlet signal
  ---------------------------------------------------------------------------------

### 4.54.5 Data

  ----------------------------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                                             UNITS
  ------------ ----------- ----------- ------------------------------------------------------- -------
  ValueFalse   REAL        0.5         Upper limit for switching the Boolean output to FALSE   \-

  ValueTrue    REAL        0.5         Lower limit for switching the Boolean output to TRUE    \-
  ----------------------------------------------------------------------------------------------------

### 4.54.6 Formulation

When the analog signal is greater than the data ValueTrue specified by the user the output Boolean signal will be TRUE and when the analog signal is lower than the data ValueFalse the output Boolean signal will be FALSE:

$$s\_ out.signal\lbrack i\rbrack\  = \left\{ \begin{matrix}
TRUE & if & s\_ in.signal\lbrack i\rbrack > ValueTrue \\
FALSE & if & s_{in}.signal\lbrack i\rbrack < ValueFalse
\end{matrix} \right.\ $$

## 4.55 RelationalOperator

### 4.55.1 Description

This component is inherited from component SI2bSO. It performs a relational operation on its two input signal ports and generates Boolean output signals according to the relational operation specified by the user with the parameter option. The following table shows the available relational operations and a description of the output signal generated:

  -----------------------------------------------------------------------------------------------------------------
  Relational Operator option   Output signal Value
  ---------------------------- ------------------------------------------------------------------------------------
  Equal                        TRUE if the first input signal is equal to the second input signal

  NotEqual                     TRUE if the first input signal is not equal to the second input signal

  GreaterThan                  TRUE if the first input signal is greater than the second input signal

  GreaterEqual                 TRUE if the first input signal is greater than or equal to the second input signal

  LessTahn                     TRUE if the first input signal is less than the second input signal

  LessEqual                    TRUE if the first input signal is less than or equal to the second input signal
  -----------------------------------------------------------------------------------------------------------------

The first input signal port in the symbol of the component is the upper port and the second input signal port in the simbol of the component is the lower port.

### 4.55.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image184.png){width="0.8750448381452318in" height="0.513915135608049in"}

### 4.55.3 Parameters

  ----------------------------------------------------------------------------------------
  NAME           TYPE                          DEFAULT   DESCRIPTION
  -------------- ----------------------------- --------- ---------------------------------
  n              CONST INTEGER                 1         Dimension of inputs and outputs

  option         CONST ENUM RelationalOption   Equal     Relational Operation
  ----------------------------------------------------------------------------------------

### 4.55.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in_1      analog_signal   (n = n)      IN          Inlet signal

  s_in_2      analog_signal   (n = n)      IN          Inlet signal

  s_out       bool_signal     (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.55.5 Formulation

Depending on the value of the Relational Operator option the mathematical expression applied to the component will be the following:

+----------------------------+-----------------------------------------------------------------------+
| Relational Operator option | Output signal Value                                                   |
+============================+=======================================================================+
| Equal                      | IF(s_in_1.signal\[i\] == s_in_2.signal\[i\]) s_out.signal\[i\] = TRUE |
|                            |                                                                       |
|                            | ELSE s_out.signal\[i\] = FALSE                                        |
+----------------------------+-----------------------------------------------------------------------+
| NotEqual                   | IF(s_in_1.signal\[i\] != s_in_2.signal\[i\]) s_out.signal\[i\] = TRUE |
|                            |                                                                       |
|                            | ELSE s_out.signal\[i\] = FALSE                                        |
+----------------------------+-----------------------------------------------------------------------+
| GreaterThan                | IF(s_in_1.signal\[i\] \> s_in_2.signal\[i\]) s_out.signal\[i\] = TRUE |
|                            |                                                                       |
|                            | ELSE s_out.signal\[i\] = FALSE                                        |
+----------------------------+-----------------------------------------------------------------------+
| GreaterEqual               | IF(s_in_1.signal\[i\] ≥ s_in_2.signal\[i\]) s_out.signal\[i\] = TRUE  |
|                            |                                                                       |
|                            | ELSE s_out.signal\[i\] = FALSE                                        |
+----------------------------+-----------------------------------------------------------------------+
| LessThan                   | IF(s_in_1.signal\[i\] \< s_in_2.signal\[i\]) s_out.signal\[i\] = TRUE |
|                            |                                                                       |
|                            | ELSE s_out.signal\[i\] = FALSE                                        |
+----------------------------+-----------------------------------------------------------------------+
| LessEqual                  | IF(s_in_1.signal\[i\] ≤ s_in_2.signal\[i\]) s_out.signal\[i\] = TRUE  |
|                            |                                                                       |
|                            | ELSE s_out.signal\[i\] = FALSE                                        |
+----------------------------+-----------------------------------------------------------------------+

## 4.56 Relay

### 4.56.1 Description

This component is inherited from component Controller. It allows the output signal to switch between two specified values. When the relay is ON state, it remains in this state until the difference between the setpoint signal and controlled variable signal drops below the specified value of the e_off data. And when the relay is in OFF state, it remains in this state until the difference between the setpoint signal and the controlled variable signal is greater than the specified value of the e_on data.

### 4.56.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image185.png){width="0.5903083989501312in" height="0.5069706911636046in"}

### 4.56.3 Parameters

  --------------------------------------------------------------------------
  y              TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.56.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = n)      OUT         Controlled output signal

  s_set       analog_signal   (n = n)      IN          Set point signal

  s_var       analog_signal   (n = n)      IN          Controlled variable signal
  ---------------------------------------------------------------------------------

### 4.56.5 Data

  ----------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                           UNITS
  ------------ ----------- ----------- ------------------------------------- -------
  e_off\[n\]   REAL                    Error for switching to OFF state      \-

  e_on\[n\]    REAL                    Error for switching to ON state       \-

  u_off\[n\]   REAL                    Value of controller output when OFF   \-

  u_on\[n\]    REAL                    Value of controller output when ON    \-
  ----------------------------------------------------------------------------------

### 4.56.6 Variables

  ---------------------------------------------------------------------------------
  NAME         TYPE              INITIAL   DESCRIPTION                     UNITS
  ------------ ----------------- --------- ------------------------------- --------
  e\[n\]       REAL                        Input error                     \-

  r\[n\]       REAL                        Set point                       \-

  state\[n\]   ENUM state_type             State of controller             ON/OFF

  u\[n\]       REAL                        Output                          \-

  y\[n\]       REAL                        Measured variable               \-
  ---------------------------------------------------------------------------------

### 4.56.7 Guidelines

If the users specify the e_on value greater than the e_off value, they are going to model hysteresis, whereas if they specify equal values for these data, they are going to model a switch with a threshold at that value.

### 4.56.8 Formulation

When the relay is ON the output signal is equal to the u_on data value, and when the relay is OFF the output signal is equal to the u_off data value.

The component obtains the exact time at which the state changes for each element of the array of the controlled process variables by means of two WHEN statements:

WHEN (e\[i\] \> e_on\[i\]) THEN

state\[i\] = ON

END WHEN

WHEN (e\[i\] \< e_off\[i\])THEN

state\[i\] = OFF

END WHEN

The two input signals to the Relay component are the set-point and the controlled process variable:

$$r\lbrack i\rbrack = s\_ set.signal\lbrack i\rbrack$$

$$y\lbrack i\rbrack = s\_ var.signal\lbrack i\rbrack$$

The error signal is calculated as follows:

$$e\lbrack i\rbrack = r\lbrack i\rbrack - y\lbrack i\rbrack$$

The output is a function of the variable state:

$$u\lbrack i\rbrack = \ \left\{ \begin{matrix}
u\_ on\lbrack i\rbrack & if & state\lbrack i\rbrack = = ON\rbrack \\
u\_ off\lbrack i\rbrack & if & state\lbrack i\rbrack = = OFF
\end{matrix} \right.\ $$

$$s\_ out.signal\lbrack i\rbrack = u\lbrack i\rbrack$$

## 4.57 SR_Bistable

### 4.57.1 Description

This component is inherited from component bMI2MOs. It represents a set dominant bistable as defined in IEC 61131-3.

### 4.57.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image186.png){width="0.6319772528433946in" height="0.48613626421697287in"}

### 4.57.3 Data

  -------------------------------------------------------------------------
  NAME        TYPE       DEFAULT        DESCRIPTION                 UNITS
  ----------- ---------- -------------- --------------------------- -------
  init_val    BOOLEAN    FALSE          Initial output value        \-

  -------------------------------------------------------------------------

### 4.57.4 Formulation

The logic algorithm implemented is the following:

WHEN(s_in_2.signal\[1\] == TRUE OR (s_out.signal\[1\] == TRUE AND s_in_1.signal\[1\] == FALSE)) THEN

s_out.signal\[1\] = TRUE

END WHEN

WHEN(s_in_2.signal\[1\] == FALSE AND s_in_1.signal\[1\] == FALSE ) THEN

s_out.signal\[1\] = FALSE

END WHEN

WHEN(s_in_2.signal\[1\] == FALSE AND s_out.signal\[1\] == FALSE ) THEN

s_out.signal\[1\] = FALSE

END WHEN

## 4.58 Saturation

### 4.58.1 Description

This component is inherited from component MIMOs. It imposes upper and lower bounds or limits on the output signal.

This component passes the input signal as output signal as long as the input signal is within the specified upper and lower bounds. If not, the defined limits are passes as the output signal.

### 4.58.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image187.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.58.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.58.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.58.5 Data

  -------------------------------------------------------------------------------
  NAME              TYPE        DEFAULT     DESCRIPTION                   UNITS
  ----------------- ----------- ----------- ----------------------------- -------
  output_max\[n\]   REAL                    Upper limit of input signal   

  output_min\[n\]   REAL                    Lower limit of input signal   
  -------------------------------------------------------------------------------

### 4.58.6 Guidelines

If the users set the upper and lower limit to the same value, the output signals are going to be always equal to this value.

### 4.58.7 Formulation

The output signals are computed as follows:

$$s\_ out.signal\lbrack i\rbrack = \ \left\{ \begin{matrix}
output\_ max\lbrack i\rbrack & if & s\_ out.signal\lbrack i\rbrack\ \  > output\_ max\lbrack i\rbrack \\
output\_ min\lbrack i\rbrack & if & s\_ out.signal\lbrack i\rbrack\ \  < output\_ min\lbrack i\rbrack \\
s\_ in.\ signal\lbrack i\rbrack & if & output\_ min\lbrack i\rbrack \leq s\_ out.signal\lbrack i\rbrack\ \  \leq output\_ max\lbrack i\rbrack
\end{matrix} \right.\ $$

The component passes the input signals as the output signals when the input signals are within the upper and lower limits, if not the output signals will be equal to the corresponding limit.

## 4.59 Scaling

### 4.59.1 Description

This component represents a scaling of the input signal to a range defined by the user.

### 4.59.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image188.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.59.3 Data

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  in_min      REAL        0         Minimum of input range          

  in_max      REAL        100       Maximum of input range          

  out_min     REAL        0         Minimum of output range         

  out_max     REAL        100       Maximum of output range         
  -------------------------------------------------------------------------

### 4.59.4 Formulation

The equation that defines the output of the component is the following:

$$s\_ out.signal\  = \ \frac{(s\_ in.signal - in\_ min) \cdot \left( out\_\max{- \ out\_ min} \right)}{in\_ max - in\_ min} + out\_ min$$

## 4.60 Selector

### 4.60.1 Description

This component is inherited from component MIMO. It extracts signals from the input port and transfers them to the output port.

### 4.60.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image189.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.60.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_in           CONST INTEGER   1         Dimension of inputs

  n_out          CONST INTEGER   1         Dimension of the outputs
  --------------------------------------------------------------------------

### 4.60.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_in        analog_signal   (n = n_in)    IN          Inlet signal

  s_out       analog_signal   (n = n_out)   OUT         Outlet signal
  ----------------------------------------------------------------------------------

### 4.60.5 Data

  -----------------------------------------------------------------------------------------------------
  NAME                   TYPE        DEFAULT     DESCRIPTION                                    UNITS
  ---------------------- ----------- ----------- ---------------------------------------------- -------
  SelElements\[n_out\]   INTEGER                 Elements to be included in the output vector   

  -----------------------------------------------------------------------------------------------------

### 4.60.6 Guidelines

The user specifies with the vector called SelElements which input signals are taken and in which order they are transferred to the output signal vector. The dimension of the vector SelElements has to match with the dimension of the output signal port.

The component checks that the value of the elements defined in the SelElements vector has to be lower than or equal to the dimension of the input signal port and greater than zero.

### 4.60.7 Formulation

The input signals transferred to the output signal vector are specified by the integer vector SelElements:

$$s\_ out.signal\lbrack i\rbrack\  = s\_ in.signal\lbrack SelElements\lbrack i\rbrack\rbrack$$

## 4.61 SourceChirp

### 4.61.1 Description

This component is inherited from component MO. It generates a sine wave whose frequency increases at a linear rate with time. The user specifies the parameters for the sine wave and the initial signal frequency and the frequency linear rate with time.

### 4.61.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image190.png){width="0.6250317147856518in" height="0.47919181977252845in"}

### 4.61.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.61.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal

  ----------------------------------------------------------------------------------

### 4.61.5 Data

  ----------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                          UNITS
  ------------ ----------- ----------- ------------------------------------ --------
  Amp          REAL        1           Signal amplitude                     \-

  Offset       REAL        0           Offset of output signal              \-

  Phase        REAL        0           Signal phase                         rad

  Tstart       REAL        0           Starting time of signal generation   s

  frec_o       REAL        0.1         Initial signal frequency             Hz

  frec_slope   REAL        0.1         Frequency linear rate with time      1/s\^2
  ----------------------------------------------------------------------------------

### 4.61.6 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  frec        REAL                  Signal frecuency                Hz

  -------------------------------------------------------------------------

### 4.61.7 Guidelines

The user can use this component for spectral analysis of nonlinear systems.

### 4.61.8 Formulation

The output signals of this component are generated as follows:

$$s\_ out.signal\lbrack i\rbrack\  = \left\{ \begin{matrix}
Offset & if & TIME < Tstart \\
Offset + A \cdot sin\left( 2 \cdot \pi \cdot f \cdot (TIME - Tstart + \phi) \right) & if & TIME \geq Tstart
\end{matrix} \right.\ $$

where:

$Offset$ = the offset of the output signal

$A$ = the signal amplitude

$Tstart$ = the starting time of the signal generation

φ = the signal phase

$f$ = the signal frequency. This frequency is linearly variable with time:

$$\frac{\partial f}{\partial t}\  = \left\{ \begin{matrix}
0.0 & if & TIME < Tstart \\
f_{slope} & if & TIME \geq Tstart
\end{matrix} \right.\ $$

$f_{slope}$= the frequency linear rate with time

## 4.62 SourceDataFile

### 4.62.1 Description

This component is inherited from component SO. It generates an analog signal interpolating in a table that is read from a ASCII file specified by the user.

### 4.62.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image191.png){width="0.7500382764654419in" height="0.48613626421697287in"}

### 4.62.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_out       analog_signal   (n = 1)      OUT         Outlet signal

  ---------------------------------------------------------------------------------

### 4.62.4 Data

  ---------------------------------------------------------------------------------------------------------------------------------
  NAME        TYPE       DEFAULT                  DESCRIPTION                                                               UNITS
  ----------- ---------- ------------------------ ------------------------------------------------------------------------- -------
  tabmethod   ENUM       LinearInterpWithEvents   Method to interpolate or connect the table points                         \-

  nt          INTEGER    1                        Number of the column of time data in the file                             \-

  ny          INTEGER    2                        Number of the column of the dependent variable in the file                \-

  filename    STRING                              Pathname of the ASCII file, for example: C:\\\\DataFiles\\\\myTable.txt   \-
  ---------------------------------------------------------------------------------------------------------------------------------

### 4.62.5 Variables

  --------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                      UNITS
  ----------- ----------- --------- -------------------------------- -------
  timeTable   TABLE_1D              Name of the table to filled in   \-

  --------------------------------------------------------------------------

### 4.62.6 Guidelines

If the file path is absolute, it is important to ensure that the slash symbols in the pathname are doubled in the string data called filename. For example:

\"C:\\\\DataFiles\\\\myTable.txt\"

### 4.62.7 Formulation 

In the INIT block of the component, the EL function EcoReadTAble1D is called and loads the nt column of the file in the independent variable of the table timeTable, and the ny column of the file in the dependent variable of the table timeTable. The call of the function is the following:

EcoReadTable1D(filename ,nt, ny, timeTable)

The way of interpolating in the table is specified by the user with the enumerative data named tabmethod. We have defined four ways of "interpolating" in the table:

  ------------------------------------------------------------------------------
  Method                      Description
  --------------------------- --------------------------------------------------
  LinearInterpWithEvents      Linear interpolation with event detection

  LinearInterpWithoutEvents   Linear interpolation without event detection

  SplineInterp                Spline interpolation

  StepConnect                 Connection of the table points by means of steps
  ------------------------------------------------------------------------------

Then the output signal will depend on the interpolation method chosen by the user:

$$\_ out.signal\lbrack i\rbrack\  = \left\{ \begin{matrix}
timeTableInterp(timeTable,TIME)\ \ if\ tabmethod = = LinearInterpWithEvents \\
linearInterp1D(timeTable,TIME)\ if\ tabmethod = = LinearInterpWithoutEvents \\
\begin{matrix}
splineInterp1D(timeTable,TIME)\ if\ tabmethod = = SplineInterp \\
timeTableStep(TIME,\ timeTable)\ if\ tabmethod = = \{ other\ values\}
\end{matrix}
\end{matrix} \right.\ $$

## 4.63 SourceExp

### 4.63.1 Description

This component is inherited from component MO. It generates rising and falling exponential signals.

### 4.63.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image192.png){width="0.576418416447944in" height="0.48613626421697287in"}

### 4.63.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.63.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal

  ----------------------------------------------------------------------------------

### 4.63.5 Data

  ----------------------------------------------------------------------------------------
  NAME            TYPE        DEFAULT     DESCRIPTION                              UNITS
  --------------- ----------- ----------- ---------------------------------------- -------
  Offset          REAL        0           Offset of output signal                  \-

  Tstart          REAL        0.5         Starting time of signal generation       s

  fallTimeConst   REAL        0.1         Fall time constant                       s

  outMax          REAL        1           Height of output for infinite riseTime   \-

  riseTime        REAL        0.5         Rise Time                                s

  riseTimeConst   REAL        0.1         Rise time constant                       s
  ----------------------------------------------------------------------------------------

### 4.63.6 Variables

  ---------------------------------------------------------------------------------------------
  NAME         TYPE        INITIAL   DESCRIPTION                                        UNITS
  ------------ ----------- --------- -------------------------------------------------- -------
  y_riseTime   REAL                  Maximum height reached by the exponential signal   

  ---------------------------------------------------------------------------------------------

### 4.63.7 Formulation 

The output signals are calculated with the following expression:

$$s\_ out.signal\lbrack i\rbrack\  = \left\{ \begin{matrix}
Offset & if & TIME < Tstart \\
Offset + s\_ out\_ max \cdot \left( 1 - e^{- \left( \frac{TIME - Tstart}{k_{r}} \right)} \right) & if & TIME < Tstart\  + t_{rise} \\
Offset + y_{r} \cdot e^{- \left( \frac{TIME - Tstart - t_{rise}}{k_{f}} \right)} & if & TIME \geq Tstart\  + t_{rise}
\end{matrix} \right.\ $$

where:

$Offset$ = the signal offset

$s\_ out\_ max$ = the height of the output signal for infinity rise time (trise)

$k_{r}$ = the rise time constant

$k_{f}$ = the fall time constant

$t_{rise}$= the rise time

$y_{r}$ = the maximum height reached by the exponential signal:

$$y_{r} = s\_ out\_ max \cdot \left( 1 - e^{- \left( \frac{t_{rise}}{k_{r}} \right)} \right)\ $$

## 4.64 SourceExpSine

### 4.64.1 Description

This component is inherited from component MO. It generates exponentially damped sine signals.

### 4.64.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image193.png){width="0.7569838145231846in" height="0.48613626421697287in"}

### 4.64.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.64.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_out       analog_signal   (n = n_out)   OUT         Outlet signal

  ----------------------------------------------------------------------------------

### 4.64.5 Data

  ------------------------------------------------------------------------------------
  NAME        TYPE        DEFAULT         DESCRIPTION                          UNITS
  ----------- ----------- --------------- ------------------------------------ -------
  Amp         REAL        1               Signal amplitude                     \-

  Damping     REAL        1               Damping coefficients of sine waves   1/s

  Offset      REAL        0               Offset of output signal              \-

  Phase       REAL        0               Signal phase                         rad

  Tstart      REAL        0               Starting time of signal generation   s

  frec        REAL        1 / (2 \* PI)   Signal frecuency                     Hz
  ------------------------------------------------------------------------------------

### 4.64.6 Formulation

The output signal is determined by:

$$s\_ out.signal\lbrack i\rbrack\  = \left\{ \begin{matrix}
\begin{matrix}
Offset & if & TIME < Tstart
\end{matrix} \\
Offset + A \cdot e^{- (TIME - Tstart)\delta} \cdot sin\left( 2 \cdot \pi \cdot f \cdot (TIME - Tstart) + \phi \right)if\ TIME \geq Tstart
\end{matrix} \right.\ $$

where:

$Offset$ = offset of the output signal

$A$ = the signal amplitude

$Tstart$ = the starting time of the signal generation

φ = the signal phase

f = the signal frequency

δ = the damping coefficient of the sine wave

## 4.65 SourcebConstant

### 4.65.1 Description

This component is inherited from component bMO. It generates constant Boolean signals. The component outputs the value defined by the user in the Boolean data k.

### 4.65.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image194.png){width="0.826431539807524in" height="0.48613626421697287in"}

### 4.65.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.65.4 Ports

  --------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS    DIRECTION   DESCRIPTION
  ----------- ------------- ------------- ----------- ----------------------------
  s_out       bool_signal   (n = n_out)   OUT         Outlet signal

  --------------------------------------------------------------------------------

### 4.65.5 Data

  ---------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                     UNITS
  ----------- ----------- ----------- ------------------------------- -------
  k           BOOLEAN     TRUE        Constant output Boolean value   \-

  ---------------------------------------------------------------------------

### 4.65.6 Formulation

The output signals will take the value of the Boolean data k

$$s\_ out.signal\lbrack i\rbrack\  = \left\{ \begin{matrix}
TRUE & if & k = = TRUE \\
FALSE & if & k = = FALSE
\end{matrix} \right.\ $$

## 4.66 SourcebPulse

### 4.66.1 Description

This component is inherited from component bMO. It generates Boolean pulse signals.

### 4.66.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image195.png){width="0.6944805336832895in" height="0.48613626421697287in"}

### 4.66.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.66.4 Ports

  --------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS    DIRECTION   DESCRIPTION
  ----------- ------------- ------------- ----------- ----------------------------
  s_out       bool_signal   (n = n_out)   OUT         Outlet signal

  --------------------------------------------------------------------------------

### 4.66.5 Data

  ---------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT     DESCRIPTION                          UNITS
  ------------ ----------- ----------- ------------------------------------ -------
  Period       REAL        10          Period of the pulse                  s

  Tstart       REAL        5           Starting time of signal generation   s

  pulseWidth   REAL        5           Pulse width                          s
  ---------------------------------------------------------------------------------

### 4.66.6 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  State       BOOLEAN               Auxiliar Boolean variable       \-

  -------------------------------------------------------------------------

### 4.66.7 Guidelines

The users specify the pulse width, the period of the pulse and the starting time for the signal generation. Before the starting time data Tstart, the outlet signals generated are FALSE.

### 4.66.8 Formulation

The first TRUE pulse occurs when the simulation time is greater than the paremeter named Tstart.

WHEN (TIME \> Tstart) THEN

State = TRUE

s_out.signal\[i\] = TRUE

END WHEN

The duration of the TRUE pulses is defined with the data named pulseWidth and they are generated with a period of time defined by the data named Period. The modelling of this component is given by the following discrete sentences:

WHEN (State == TRUE) THEN

State = FALSE AFTER pulseWidth

s_out.signal\[i\] = FALSE AFTER pulseWidth

END WHEN

WHEN (State==FALSE AND TIME \> Tstart) THEN

State = TRUE AFTER (Period - pulseWidth)

s_out.signal\[i\] = TRUE AFTER (Period - pulseWidth)

END WHEN

## 4.67 SourcebSampleTrigger

### 4.67.1 Description

This component is inherited from component bMO. It generates Boolean sample trigger signals.

### 4.67.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image196.png){width="1.0417202537182852in" height="0.48613626421697287in"}

### 4.67.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.67.4 Ports

  --------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS    DIRECTION   DESCRIPTION
  ----------- ------------- ------------- ----------- ----------------------------
  s_out       bool_signal   (n = n_out)   OUT         Outlet signal

  --------------------------------------------------------------------------------

### 4.67.5 Data

  --------------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                          UNITS
  ----------- ----------- ----------- ------------------------------------ -------
  Period      REAL        2           Period of sample                     s

  Tstart      REAL        1           Starting time of signal generation   s
  --------------------------------------------------------------------------------

### 4.67.6 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  state       BOOLEAN               Auxiliar Boolean variable       \-

  -------------------------------------------------------------------------

### 4.67.7 Guidelines

The users specify the starting time for the signal generation and the period at which the users want to sample the signals. Before the starting time the outlet signals generated are FALSE.

### 4.67.8 Formulation

The first sample trigger pulse occurs when the simulation time is greater than the paremeter named Tstart.

WHEN (TIME \> Tstart) THEN

State = TRUE

s_out.signal\[i\] = TRUE

END WHEN

TRUE sample trigger pulse signals will be generated every time period defined with the data Period. The modelling of this component is given by the following discrete sentences:

WHEN (State == TRUE) THEN

s_out.signal\[i\] = TRUE

State = FALSE

State = TRUE AFTER Period

END WHEN

WHEN (State == FALSE) THEN

s_out.signal\[i\] = TRUE AFTER 10\*\*-6

END WHEN

where State is an auxiliary Boolean variable.

## 4.68 SourcebStep

### 4.68.1 Description

This component is inherited from component bMO. It generates Boolean step signals.

### 4.68.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image197.png){width="0.6528116797900263in" height="0.5000251531058618in"}

### 4.68.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_out          CONST INTEGER   1         Dimension of outputs

  --------------------------------------------------------------------------

### 4.68.4 Ports

  --------------------------------------------------------------------------------
  NAME        TYPE          PARAMETERS    DIRECTION   DESCRIPTION
  ----------- ------------- ------------- ----------- ----------------------------
  s_out       bool_signal   (n = n_out)   OUT         Outlet signal

  --------------------------------------------------------------------------------

### 4.68.5 Data

  --------------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                          UNITS
  ----------- ----------- ----------- ------------------------------------ -------
  Tstart      REAL        1           Starting time of signal generation   s

  --------------------------------------------------------------------------------

### 4.68.6 Guidelines

The users specify the starting time for the signal generation. Before this starting time the outlet signals generated are FALSE.

### 4.68.7 Formulation

This component generates a TRUE signal when the time is greater than the starting time set by the user, otherwise the output signal will be FALSE.

WHEN (TIME \> Tstart) THEN

s_out.signal\[i\] = TRUE

END WHEN

where:

Tstart = the starting time for the generation of the output TRUE signal

## 4.69 StateSpace

### 4.69.1 Description

This component is inherited from component MIMO. It defines the relationship between the input port signals and the output port signals in a state space form.

It implements a system whose behavior is defined by the following equation system:

$$x' = A.x + B.u$$

$$y = C.x + D.u$$

where x is the state vector, u is the input vector and y is the output vector.

### 4.69.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image198.png){width="0.8125415573053368in" height="0.48613626421697287in"}

### 4.69.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER             Number of states

  n_in           CONST INTEGER   1         Dimension of inputs

  n_out          CONST INTEGER   1         Dimension of outputs
  --------------------------------------------------------------------------

### 4.69.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_in        analog_signal   (n = n_in)    IN          Inlet signal

  s_out       analog_signal   (n = n_out)   OUT         Outlet signal
  ----------------------------------------------------------------------------------

### 4.69.5 Data

  ------------------------------------------------------------------------------
  NAME              TYPE        DEFAULT     DESCRIPTION                  UNITS
  ----------------- ----------- ----------- ---------------------------- -------
  A\[n,n\]          REAL                    Matrix A                     

  B\[n,n_in\]       REAL                    Matrix B                     

  C\[n_out,n\]      REAL                    Matrix C                     

  D\[n_out,n_in\]   REAL                    Matrix D                     

  x_o\[n\]          REAL                    Initial condition vector     
  ------------------------------------------------------------------------------

### 4.69.6 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  x\[n\]      REAL                  States                          

  -------------------------------------------------------------------------

### 4.69.7 Guidelines

The dimension of the outputs can be different to the dimension of the inputs. The matrix has the following dimensions:

A must be an n by n matrix, where n is the number of states.

B must be an n by n_in matrix, where n_in is the number of inputs

C must be a n_out by n matrix, where n_out is the number of outputs

D must be a n_out by n_in matrix

The initial conditions of state variables are defined by means of the vector x_o.

### 4.69.8 Formulation

The output signals are calculated according to the following equations:

$$\frac{\partial x_{i}}{\partial t} = \sum_{j = 1}^{j = n}{A_{i,j} \cdot x_{j} + \sum_{j = 1}^{j = n_{in}}{B_{i,j} \cdot s_{in,j}}}$$

$$s_{out,i} = \sum_{j = 1}^{j = n}{C_{i,j} \cdot x_{j} + \sum_{j = 1}^{j = n_{in}}{D_{i,j} \cdot s_{in,j}}}$$

where:

$s_{in,j}$ = input signals

$s_{out,i}$ = output signals

$x_{j}$ = state variables

$A,\ B,\ C\ and\ D$ = state matrices

## 4.70 Subtraction

### 4.70.1 Description

This component is inherited from component MI2MOs.

This component calculates the output signals as the substraction between the analog signals of the first input port and the analog signals of the second input port.

### 4.70.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image199.png){width="0.5903083989501312in" height="0.6180872703412074in"}

### 4.70.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.70.4 Ports

  --------------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ---------------------------------
  s_in_1      analog_signal   (n = n)      IN          First inlet analog signal port

  s_in_2      analog_signal   (n = n)      IN          Second inlet analog signal port

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  --------------------------------------------------------------------------------------

### 4.70.5 Guidelines

The output signal responds instantaneously to changes in the input signals

### 4.70.6 Formulation

The output is computed as the subtraction between the two input signals

$$s\_ out.signal\lbrack i\rbrack = s\_ in\_ 1.signal\lbrack i\rbrack - s\_ in\_ 2.signal\lbrack i\rbrack$$

## 4.71 Switch

### 4.71.1 Description

This component propagates one of the analog inputs to the analog output depending on the value of the Boolean input (the middle port). If the signal of the second input port (middle port) is TRUE the component propagates the first input signal (upper port), otherwise, it propagates the third input signal (lower port).

### 4.71.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image200.png){width="0.7014249781277341in" height="0.5972528433945756in"}

### 4.71.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.71.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_b_in      bool_signal     (n = n)      IN          Boolean inlet signal

  s_in\[2\]   analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.71.5 Formulation

If the s_b_in port signal is TRUE, the output signal is set to the value of s_in\[1\] port signal, otherwise it is set to the value of s_in\[2\] port signal.

$$s\_ out.signal\lbrack i\rbrack = \left\{ \begin{matrix}
s\_ in\lbrack 1\rbrack.signal\lbrack i\rbrack & if & s\_ b\_ in.signal\lbrack i\rbrack = = TRUE \\
s\_ in\lbrack 2\rbrack.signal\lbrack i\rbrack & if & s\_ b\_ in.signal\lbrack i\rbrack = = FALSE
\end{matrix} \right.\ $$

## 4.72 TF_1stOrder

### 4.72.1 Description

This component is inherited from component MIMOs. It represents a first order transfer function between the input port signals and the output port signals.

### 4.72.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image201.png){width="0.6319772528433946in" height="0.48613626421697287in"}

### 4.72.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER             Number of states

  n_in           CONST INTEGER   1         Dimension of inputs

  n_out          CONST INTEGER   1         Dimension of outputs
  --------------------------------------------------------------------------

### 4.72.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet analog signal port

  s_out       analog_signal   (n = n)      OUT         Outlet analog signal port
  ---------------------------------------------------------------------------------

### 4.72.5 Data

  -----------------------------------------------------------------------------
  NAME            TYPE        DEFAULT     DESCRIPTION                   UNITS
  --------------- ----------- ----------- ----------------------------- -------
  gain\[n\]       REAL                    Gain                          \-

  output_o\[n\]   REAL                    Initial output                \-

  tau\[n\]        REAL                    Time constant                 s
  -----------------------------------------------------------------------------

### 4.72.6 Guidelines

The users can use this component to represent a first order lag.

### 4.72.7 Formulation

The outlet signals are calculated as follows:

$$\frac{ds_{out}}{dt} = \frac{k \cdot s_{in} - s_{out}}{\tau}$$

where:

$s_{in}$= the value of the input signal

$s_{out}$= the value of the output signal

$\tau$ = the value of the time constant

$k$ = the gain

## 4.73 TF_2ndOrder

### 4.73.1 Description

This component is inherited from component MIMOs. It represents a second order transfer function between the input port signals and the output port signals.

$$y = \frac{k}{\left( \frac{s}{\omega} \right)^{2} + 2 \cdot \partial\left( \frac{s}{\omega} \right) + 1} \cdot u$$

where:

$y$ = the outlet signal

$u$ = the input signal

$k$ = the gain

$\omega$ = the angular frequency

δ = the damping

### 4.73.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image202.png){width="0.6528116797900263in" height="0.48613626421697287in"}

### 4.73.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER             Number of states

  n_in           CONST INTEGER   1         Dimension of inputs

  n_out          CONST INTEGER   1         Dimension of outputs
  --------------------------------------------------------------------------

### 4.73.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.73.5 Data

  -----------------------------------------------------------------------------
  NAME            TYPE        DEFAULT     DESCRIPTION                   UNITS
  --------------- ----------- ----------- ----------------------------- -------
  damp\[n\]       REAL                    Damping                       \-

  frec\[n\]       REAL                    Angular frecuency             Hz

  gain\[n\]       REAL                    Gain                          \-

  output_o\[n\]   REAL                    Initial values of output      
  -----------------------------------------------------------------------------

### 4.73.6 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  z\[n\]      REAL                  Array of dynamic variables      \-

  -------------------------------------------------------------------------

### 4.73.7 Guidelines

The users can use this component to represent a second order lag.

### 4.73.8 Formulation

The outlet signals are calculated as follows:

$$y^{''} = \omega^{2} \cdot \left( k \cdot u - \left( \frac{2 \cdot \partial}{\omega} \right) \cdot y' - y \right)$$

where:

$y^{''}$ = the second derivative of the outlet signal

$y'$ = the first derivative of the outlet signal

$y$ = the outlet signal

$u$ = the input signal

$k$ = the gain

$\omega$ = the angular frequency

$\partial$ = the damping

## 4.74 Timer_TOFF

### 4.74.1 Description

This component is inherited from component bSISO. It represents a timer to delay a signal on deactivation.

### 4.74.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image203.png){width="0.6319772528433946in" height="0.48613626421697287in"}

### 4.74.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  ET          analog_signal   (n = 1)      OUT         Output

  ---------------------------------------------------------------------------------

### 4.74.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE       DEFAULT        DESCRIPTION                 UNITS
  ----------- ---------- -------------- --------------------------- -------
  PT          INTEGER    2              Time                        s

  -------------------------------------------------------------------------

### 4.74.5 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  TSTART      REAL        \--       Start time                      s

  count       BOOLEAN     \--       Internal variable               \--
  -------------------------------------------------------------------------

### 4.74.6 Guidelines

The timing diagram of the output as a function of the inputs is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image204.png){width="3.4182939632545932in" height="2.2531419510061244in"}

### 4.74.7 Formulation

The logic algorithm implemented is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image205.png){width="3.9815682414698164in" height="3.521862423447069in"}

## 4.75 Timer_TON

### 4.75.1 Description

This component is inherited from component bSISO. It represents a timer to delay a signal on activation.

### 4.75.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image206.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.75.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  ET          analog_signal   (n = 1)      OUT         Output

  ---------------------------------------------------------------------------------

### 4.75.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE       DEFAULT        DESCRIPTION                 UNITS
  ----------- ---------- -------------- --------------------------- -------
  PT          INTEGER    2              Time                        s

  -------------------------------------------------------------------------

### 4.75.5 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  TSTART      REAL        \--       Start time                      s

  count       BOOLEAN     \--       Internal variable               \--
  -------------------------------------------------------------------------

### 4.75.6 Guidelines

The timing diagram of the output as a function of the inputs is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image207.png){width="3.5321555118110237in" height="2.2649245406824146in"}

### 4.75.7 Formulation

The logic algorithm implemented is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image208.png){width="4.508019466316711in" height="3.490173884514436in"}

## 4.76 Timer_TP

### 4.76.1 Description

This component is inherited from component bSISO. It represents a timer to delay a signal on deactivation as defined in IEC 61131-1.

### 4.76.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image209.png){width="0.5903083989501312in" height="0.48613626421697287in"}

### 4.76.3 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  ET          analog_signal   (n = 1)      OUT         Output

  ---------------------------------------------------------------------------------

### 4.76.4 Data

  -------------------------------------------------------------------------
  NAME        TYPE       DEFAULT        DESCRIPTION                 UNITS
  ----------- ---------- -------------- --------------------------- -------
  PT          INTEGER    2              Time                        s

  -------------------------------------------------------------------------

### 4.76.5 Variables

  -------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                     UNITS
  ----------- ----------- --------- ------------------------------- -------
  TSTART      REAL        \--       Start time                      

  count       BOOLEAN     \--       Internal variable               
  -------------------------------------------------------------------------

### 4.76.6 Guidelines

The timing diagram of the output as a function of the inputs is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image210.png){width="3.297729658792651in" height="2.4205850831146107in"}

### 4.76.7 Formulation

The logic algorithm implemented is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image211.png){width="4.496819772528434in" height="3.5353455818022748in"}

## 4.77 TransferFunction

### 4.77.1 Description

This component is inherited from component SISO.

This component type, named TransferFcn, provides a representation of linear transfer functions in the form of a ratio of polynomials in the Laplace operator, s.

There is no limit on the numerator and denominator orders, provided that the overall order of the numerator is less than or equal to the order of the denominator.

Transfer Function Theory

If the differential equation that describes a block of the system is known and is linear, the ratio of the Laplace transform of the output to the Laplace transform of the input is called the transfer function.

Let us suppose that the following linear differential equation with constant coefficients relates the input x to the output y of one block of the system.

$$q_{3}\frac{d^{3}y}{dt^{3}} + \ q_{2}\frac{d^{2}y}{dt^{2}} + q_{1}\frac{dy}{dt} + q_{o}y = p_{1}\frac{dx}{dt} + p_{0}x\ $$

The Laplace transform (transfer function) will be:

$$H(s) = \frac{Y(s)}{X(s)} = \frac{p_{1}s + p_{0}}{q_{3}s^{3} + q_{2}s^{2} + q_{1}s + q_{0}}\ $$

All initial conditions are taken as zero.

### 4.77.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image212.png){width="0.798652668416448in" height="0.48613626421697287in"}

### 4.77.3 Parameters

  ------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- -------------------------------------
  n_den          CONST INTEGER   1         Order of the denominator polynomial

  n_num          CONST INTEGER   0         Order of the numerator polynomial
  ------------------------------------------------------------------------------

### 4.77.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.77.5 Data

  ---------------------------------------------------------------------------------------------------------------------
  NAME             TYPE        DEFAULT     DESCRIPTION                                                          UNITS
  ---------------- ----------- ----------- -------------------------------------------------------------------- -------
  output_o         REAL        0           Initial value of the output                                          \-

  p\[n_num + 1\]   REAL                    Coefficients of numerator polynomial: p\[1\]\*s\^n+\...+p\[n+1\]     \-

  q\[n_den + 1\]   REAL                    Coefficients of denominator polynomial: q\[1\]\*s\^n+\...+q\[n+1\]   \-
  ---------------------------------------------------------------------------------------------------------------------

### 4.77.6 Closed Parameters

  -------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- --------------------------------------
  n              CONST INTEGER   1         Dimension of input and ouput signals

  -------------------------------------------------------------------------------

### 4.77.7 Variables

  ------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                    UNITS
  ------------ ---------- --------- ------------------------------ -------
  j            INTEGER                                             

  z\[n_den\]   REAL                 Array of dynamic variables     \-
  ------------------------------------------------------------------------

### 4.77.8 Guidelines

The users have to take care and set an order of the numerator that must be lower than the order of the denominator. The highest order coefficient in the denominator can not be zero.

The user provides the value of the order of the numerator polynomial, n_num, the value of the order of the denominator polynomial, n_dem, and the values of the coefficients of the numerator and denominator polynomials p\[n_num+1\] and q\[n_dem+1\], respectively.

The transfer function polynomials are in the form of the constant term first, and the higher order terms after, with any missing term being given as a zero coefficient. For example, the transfer function, $\frac{s}{s^{2} + 4}$ is defined by:

TransferFunction (nnum=1, ndem=2) transfun(p={0, 1}, q ={4,0,1}, output_o = 0)

where:

p = the coefficients of the numerator polynomial

q = the coefficients of the denominator polynomial

### 4.77.9 Formulation

Let us assume that the transfer function is:

$$\frac{y(s)}{x(s)} = \ \frac{p_{m}s^{m} + {p_{m - 1}s^{m - 1} + \ldots + p_{1s} + p}_{0}}{q_{n}s^{n} + q_{n - 1}s^{n - 1} + q_{1}s + q_{0}}$$

with x(t) being the input signal and y(t) being the output signal.

We will see how the solution of the above problem can be built from the solution of this other problem:

$$\frac{y_{0}(s)}{x(s)} = \ \frac{1}{q_{n}s^{n} + q_{n - 1}s^{n - 1} + q_{1}s + q_{0}}\ \ \ \ (1)$$

that represents the following ordinary differential equation:

$$q_{n}\frac{d^{n}y_{0}}{dt^{n}} + q_{n - 1}\frac{d^{n - 1}y_{0}}{dt^{n - 1}} + \ldots + q_{1}\frac{dy_{0}}{dt} + q_{0}y_{0}\ \ \ \ \ (2)$$

The solution of this ordinary differential equation can be rewritten as a set of n coupled first order differential equations by making the following change of variables:

$$y_{0}(t) = z_{1}$$

$$\frac{dy_{0}(t)}{dt} = \frac{dz_{1}(t)}{dt} = z_{2}$$

$$\frac{d^{2}y_{0}(t)}{dt^{2}} = \frac{dz_{2}(t)}{dt} = z_{3}$$

$$\ldots$$

$$\frac{d^{n - 1}y_{0}(t)}{dt^{n - 1}} = \frac{dz_{n - 1}(t)}{dt} = z_{n}$$

$$\frac{d^{n}y_{0}(t)}{dt^{n}} = \frac{dz_{n}(t)}{dt}$$

which yields, making substitutions in (2), the following differential equation:

$$q_{n}\frac{dz_{n}(t)}{dt} + q_{n - 1}z_{n(t)} + \ldots + q_{2}z_{3}(t) + q_{1}z_{2}(t) + q_{0}z_{1}(t) = x(t)$$

The above equations can be taken as a system of n first order differential equations:

$$\frac{dz_{1}}{dt} = z_{2}$$

$$\frac{dz_{2}}{dt} = z_{3}(t)$$

$$\ldots$$

$$\frac{dz_{n}}{dt} = \frac{1}{q_{n}}\left\lbrack x(t) - q_{n - 1}z_{n}(t) - q_{n - 2}z_{n - 1}(t) - \ldots - q_{2}z_{3}(t) - q_{1}z_{2}(t) - q_{0}z_{1}(t) \right\rbrack$$

This system can be solved using any numerical resolution method and the results would be:

$$z_{n}(t),\ z_{n - 1}(t),\ \ldots,\ z_{3}(t),z_{2}(t)\ and\ z_{1}(t)$$

And for our first problem (I):

$$y_{o}(t) = z_{1}(t)$$

Now the solution of the complete equation

$$q_{n}\frac{d^{n}y}{dt^{n}} + q_{n - 1}\frac{d^{n - 1}y}{dt^{n - 1}} + \ldots + q_{1}\frac{dy}{dt} + q_{0}y = p_{m}\frac{d^{m}x}{dt^{m}} + p_{m - 1}\frac{d^{m - 1}x}{dt^{m - 1}} + \ldots + p_{1}\frac{dx}{dt} + p_{0}x$$

can be written as a sum of the solutions for the different right terms because of the linearity of the equation

$$y(t) = A_{0}y_{0}(t) + \ A_{1}y_{1}(t) + \ldots + \ A_{m - 1}y_{m - 1}(t) + \ A_{m}y_{m}(t)$$

where $y_{0}(t)$,$\ y_{1}(t)$, \..., $y_{m\_ 1}(t)$ and $\ y_{m}(t)$ are the solutions for the following equations:

$$q_{n}\frac{d^{n}y_{0}(t)}{dt^{n}} + q_{n - 1}\frac{d^{n - 1}y_{0}(t)}{dt^{n - 1}} + \ldots + q_{1}\frac{dy_{0}(t)}{dt} + q_{0}y_{0}(t) = x(t)$$

$$q_{n}\frac{d^{n}y_{1}(t)}{dt^{n}} + q_{n - 1}\frac{d^{n - 1}y_{1}(t)}{dt^{n - 1}} + \ldots + q_{1}\frac{dy_{1}(t)}{dt} + q_{0}y_{1}(t) = \frac{dx(t)}{dt}$$

$$\ldots$$

$$q_{n}\frac{d^{n}y_{m - 1}(t)}{dt^{n}} + q_{n - 1}\frac{d^{n - 1}y_{m - 1}(t)}{dt^{n - 1}} + \ldots + q_{1}\frac{dy_{m - 1}(t)}{dt} + q_{0}y_{m - 1}(t) = \frac{d_{m - 1}x(t)}{dt^{m - 1}}$$

$$q_{n}\frac{d^{n}y_{m}(t)}{dt^{n}} + q_{n - 1}\frac{d^{n - 1}y_{m}(t)}{dt^{n - 1}} + \ldots + q_{1}\frac{dy_{m}(t)}{dt} + q_{0}y_{m}(t) = \frac{d_{m}x(t)}{dt^{m}}$$

The solution of the first equation has been already calculated, and it is

$$y_{o}(t) = z_{1}$$

Making the derivative of the first equation, it is possible to see the solution of the second equations:

$$\frac{d}{dt}\left\lbrack q_{n}\frac{d^{n}y_{0}}{dt^{n}} + q_{n - 1}\frac{d^{n - 1}y_{0}}{dt^{n - 1}} + \ldots + q_{1}\frac{dy_{0}}{dt} + q_{0}y_{0} \right\rbrack = d\frac{x(t)}{dt}$$

$$q_{n}\frac{d^{n}}{dt^{n}}\left\lbrack \frac{dy_{0}}{dt} \right\rbrack + q_{n - 1}\frac{d^{n - 1}}{dt^{n - 1}}\left\lbrack \frac{dy_{0}}{dt} \right\rbrack + \ldots + q_{1}\frac{d}{dt}\left\lbrack \frac{dy_{0}}{dt} \right\rbrack + q_{0}\left\lbrack \frac{dy_{0}}{dt} \right\rbrack = \frac{dx(t)}{dt}$$

It can be checked that $\frac{dy_{0}}{dt}$ satisfies the second equations, so

$$y_{1} = \ \frac{dy_{0}}{dt} = z_{2}$$

And finally:

$$y_{0} = z_{1}(t)$$

$$y_{1} = z_{2}(t)$$

$$y_{n - 1} = z_{m - 1}(t)$$

$$y_{n} = z_{m}(t)$$

$z_{m - 1}(t)$ has been obtained with the solution of our first differential equation system, because:

$$y(t) = {p_{0}z}_{1}(t) + {p_{1}z}_{2}(t) + \ldots + \ {p_{m -}z}_{m}(t) + p_{m}\frac{dz_{m}(t)}{dt}$$

$$\frac{dz_{m}(t)}{Dt}\ will\ be\ z_{m + 1}(t)\ if\ m < n\ or\ \frac{dz_{m}(t)}{dt}\ if\ m = n$$

$$\frac{dz_{m}(t)}{dt} = \frac{x(t) - q_{n - 1}z_{n}(t) - \ldots - q_{0}z_{1}(t)}{B_{n}}$$

$$z_{nd - 1} = \frac{x(t) - \sum_{i = 1}^{nd - 2}{z_{i} \cdot q_{i}}}{q_{nd}}$$

$$z_{nd} = 0$$

$$output\_ var\  = \left\{ \begin{array}{r}
\begin{matrix}
\sum_{i = 1}^{nn - 1}{p_{i} \cdot z_{i} + p_{nn} \cdot z_{nn}} & if & nn < nd
\end{matrix} \\
\begin{matrix}
\sum_{i = 1}^{nn - 1}{p_{i} \cdot z_{i} + p_{nn} \cdot z_{nn - 1}} & if & nn = = nd
\end{matrix}
\end{array} \right.\ $$

## 4.78 Trigger_FE

### 4.78.1 Description

This component is inherited from component bSISO. It represents a component that detects falling edges in boolean signals.

### 4.78.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image213.png){width="0.6528116797900263in" height="0.5069706911636046in"}

### 4.78.3 Variables

  ----------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                        UNITS
  ----------- ----------- --------- ---------------------------------- -------
  CLK_OLD     BOOLEAN     FALSE     Last value of the input signal     

  frac        REAL        \--       Number of checked time intervals   

  start       REAL        \--       Start time                         
  ----------------------------------------------------------------------------

### 4.78.4 Guidelines

The behaviour of the component corresponds to the following rule:

- The Q output of an F_TRIG function block shall stand at the boolean-value 1 from one execution of the function block to the next, following the 1 to 0 transition of the CLK input, and shall return to 0 at the next execution.

### 4.78.5 Formulation

The logic algorithm implemented is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image214.png){width="2.1723359580052493in" height="5.430839895013123in"}

## 4.79 Trigger_RE

### 4.79.1 Description

This component is inherited from component bSISO. It represents a component that detects rising edges in boolean signals.

### 4.79.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image215.png){width="0.6528116797900263in" height="0.5069706911636046in"}

### 4.79.3 Variables

  ----------------------------------------------------------------------------
  NAME        TYPE        INITIAL   DESCRIPTION                        UNITS
  ----------- ----------- --------- ---------------------------------- -------
  CLK_OLD     BOOLEAN     \--       Last value of the input signal     

  frac        REAL        \--       Number of checked time intervals   

  start       REAL        \--       Start time                         
  ----------------------------------------------------------------------------

### 4.79.4 Guidelines

The behaviour of the component corresponds to the following rule:

- The Q output of an R_TRIG function block shall stand at the boolean-value 1 from one execution of the function block to the next, following the 0 to 1 transition of the CLK input, and shall return to 0 at the next execution.

### 4.79.5 Formulation

The logic algorithm implemented is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image216.png){width="1.828400043744532in" height="5.277308617672791in"}

## 4.80 UnitDelay

### 4.80.1 Description

This component is inherited from component dMIMOs. It delays the input signal one sample period. The output signal will be the input signal of the previous sample time. This component is equivalent to the z-1 discrete-time operator.

### 4.80.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image217.png){width="0.5903083989501312in" height="0.49308070866141734in"}

### 4.80.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.80.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.80.5 Data

  ------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                  UNITS
  ----------- ----------- ----------- ---------------------------- -------
  dt          REAL        0.1         Sample time                  s

  y_o\[n\]    REAL                    Initial condition            
  ------------------------------------------------------------------------

### 4.80.6 Variables

  ------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                    UNITS
  ------------ ---------- --------- ------------------------------ -------
  sample       BOOLEAN    FALSE                                    

  ------------------------------------------------------------------------

### 4.80.7 Guidelines

If the users desire an undelayed sample and hold function, then they must use a ZeroOrderHold component, or if a delay of greater than one sample period time is desired, they must use the dTransferFunction component.

### 4.80.8 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

When the sample is TRUE the new output signal is calculated as the input signal delayed a time period (dt). The when block to compute this is shown next:

WHEN (sample == TRUE) THEN

FOR(i IN 1, n)

s_out.signal\[i\] = s_in.signal\[i\] AFTER dt

END FOR

END WHEN

## 4.81 VarDelay

### 4.81.1 Description

This component is inherited from component MIMOs. It can be used to simulate a variable time delay. The component has two inputs: the first input is the signal that passes through the component and the second input is the time delay.

The time delay is limited by a maximum delay time data called tdelay_max.

### 4.81.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image218.png){width="0.5903083989501312in" height="0.5000251531058618in"}

### 4.81.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.81.4 Ports

  ----------------------------------------------------------------------------------
  NAME          TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ------------- --------------- ------------ ----------- ---------------------------
  s_TimeDelay   analog_signal   (n = n)      IN          Time delay port

  s_in          analog_signal   (n = n)      IN          Inlet signals

  s_out         analog_signal   (n = n)      OUT         Outlet signals
  ----------------------------------------------------------------------------------

### 4.81.5 Data

  ------------------------------------------------------------------------------
  NAME              TYPE        DEFAULT     DESCRIPTION                  UNITS
  ----------------- ----------- ----------- ---------------------------- -------
  tdelay_max\[n\]   REAL                    Maximum delay time           s

  ------------------------------------------------------------------------------

### 4.81.6 Formulation

The output signals are computed delaying the input signals with the signals of the port s_TimeDelay. The value of the signals of the s_TimeDelay is limited by a maximum delay time defined by the data tdelay_max:

s_out.signal\[i\] = delay(s_in.signal\[i\], bound(s_TimeDelay.signal\[i\], 1e-12, tdelay_max\[i\])

## 4.82 ZeroOrderHold

### 4.82.1 Description

This component is inherited from component dMIMOs. It implements a sample-and--hold function that operates at the specified sample time.

This component can be used for discretizing one or more signals. The output signals are identical to the sampled input signal at the sample time instants and the component holds the output signals at the value of the last sample instant during the sample period.

### 4.82.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image219.png){width="0.7083694225721785in" height="0.48613626421697287in"}

### 4.82.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n              CONST INTEGER   1         Dimension of inputs and outputs

  --------------------------------------------------------------------------

### 4.82.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.82.5 Data

  ------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                  UNITS
  ----------- ----------- ----------- ---------------------------- -------
  dt          REAL        0.1         Sample time                  s

  ------------------------------------------------------------------------

### 4.82.6 Variables

  ------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                    UNITS
  ------------ ---------- --------- ------------------------------ -------
  sample       BOOLEAN    FALSE                                    

  ------------------------------------------------------------------------

### 4.82.7 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

When the sample time instant takes place the input signals are sampled and the output signals are equal to the input signals at that sample time instant:

WHEN (sample == TRUE) THEN

FOR (i IN 1, n)

s_out.signal\[i\] = s_in.signal\[i\]

END FOR

END WHEN

## 4.83 ZeroPole

### 4.83.1 Description

This component is inherited from component SISO. It implements a system with the specified zeros, poles and gain in terms of the Laplace operator s.

A transfer function can be expressed in factored or zero-pole-gain form:

$$K \cdot \frac{\left( s - Z(1) \right) \cdot \left( s - Z(2) \right) \cdot \ldots \cdot (s - Z(n))}{\left( s - P(1) \right) \cdot \left( s - P(2) \right) \cdot \ldots \cdot (s - P(n))}$$

where:

$Z$ represents the zeros

$P$ represents the poles

$K$ represents the gain

### 4.83.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image220.png){width="1.1458923884514436in" height="0.48613626421697287in"}

### 4.83.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  npoles         CONST INTEGER   1         Number of poles

  nzeros         CONST INTEGER   1         Number of zeros
  --------------------------------------------------------------------------

### 4.83.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.83.5 Data

  ----------------------------------------------------------------------------------------------------------------------
  NAME                TYPE              DEFAULT         DESCRIPTION                                              UNITS
  ------------------- ----------------- --------------- -------------------------------------------------------- -------
  K                   REAL              1               Gain                                                     

  option              ENUM InitOption   InitialStates   Initialization of discrete component: states or output   

  poles\[npoles,2\]   REAL                              Values of the poles: real part, imaginary part           

  x_o\[npoles\]       REAL                              Array with initial values of the states                  

  y_o                 REAL              0               Initial value for the output                             

  zeros\[nzeros,2\]   REAL                              Values of the zeros: real part, imaginary part           
  ----------------------------------------------------------------------------------------------------------------------

### 4.83.6 Closed Parameters

  -------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- --------------------------------------
  n              CONST INTEGER   1         Dimension of input and ouput signals

  -------------------------------------------------------------------------------

### 4.83.7 Variables

  ----------------------------------------------------------------------------------------------------------
  NAME              TYPE       INITIAL   DESCRIPTION                                                 UNITS
  ----------------- ---------- --------- ----------------------------------------------------------- -------
  j                 INTEGER              Index                                                       

  p\[nzeros + 1\]   REAL                 Coefficients of the numerator in increasing powers of s     

  q\[npoles + 1\]   REAL                 Coefficients of the denominator in increasing powers of s   

  x\[npoles + 1\]   REAL                 State variables                                             
  ----------------------------------------------------------------------------------------------------------

### 4.83.8 Guidelines

The user can specify how to initialized the component with the data named option:

  ---------------------------------------------------------------------------
  option             Description
  ------------------ --------------------------------------------------------
  InitialStates      Initialization of the state variables of the component

  InitialOutput      Initialization of the output signal of the component
  ---------------------------------------------------------------------------

### 4.83.9 Formulation

The derivative of the state variable j is equal to the state variable j+1:

$$x(j + 1) = \frac{\partial x(j)}{\partial t}$$

The value of the input signals must be equal to the sum of the state variables multiplied by the corresponding denominator coefficient

$$s\_ in.signal\lbrack 1\rbrack = \sum_{1}^{npoles + 1}{x\lbrack i\rbrack \cdot q\lbrack i\rbrack}$$

And the value of the output signas must be equal to the sum of the states variables multiplied by the corresponding numerator coefficient and the gain:

$$s\_ out.signal\lbrack 1\rbrack = \sum_{1}^{nzeros + 1}{x\lbrack i\rbrack \cdot q\lbrack i\rbrack}$$

## 4.84 dFilter

### 4.84.1 Description

This component is inherited from component dSISO. It implements a discrete filter.

### 4.84.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image221.png){width="0.7014249781277341in" height="0.48613626421697287in"}

### 4.84.3 Parameters

  --------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------------
  n_den          CONST INTEGER   1         Order of denominator polinomial (1/z)

  n_num          CONST INTEGER   0         Order of numerator polinomial (1/z)
  --------------------------------------------------------------------------------

### 4.84.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.84.5 Data

  ----------------------------------------------------------------------------------------------------------------------
  NAME               TYPE        DEFAULT     DESCRIPTION                                                         UNITS
  ------------------ ----------- ----------- ------------------------------------------------------------------- -------
  dt                 REAL        0.1         Sample time                                                         s

  pdata\[n_num+1\]   REAL                    Coefficients of numerator polinomial in ascending powers of 1/z     

  qdata\[n_den+1\]   REAL                    Coefficients of denominator polinomial in ascending powers of 1/z   
  ----------------------------------------------------------------------------------------------------------------------

### 4.84.6 Closed Parameters

  -------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- --------------------------------------
  n              CONST INTEGER   1         Dimension of input and ouput signals

  -------------------------------------------------------------------------------

### 4.84.7 Variables

  ---------------------------------------------------------------------------------------------------------------
  NAME             TYPE       INITIAL   DESCRIPTION                                                       UNITS
  ---------------- ---------- --------- ----------------------------------------------------------------- -------
  p\[n_den + 1\]   REAL                 Coefficients of numerator polynomial in ascending powers of 1/z   

  sample           BOOLEAN    FALSE                                                                       

  x\[n_den + 1\]   REAL                 Values of states                                                  
  ---------------------------------------------------------------------------------------------------------------

### 4.84.8 Guidelines

The users specify the coefficients of the numerator and denominator polynomials in ascending power of z-1 as vectors using the pdata and qdata parameters.

The order of the denominator must be greater than or equal to the order of the numerator.

This component represents the method typically used by signal processing engineers who describe systems using polynomials in z-1 (the delay operator).

### 4.84.9 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

The coefficients of numerator polynomial in ascending powers of z-1 are computed as follows:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image222.png){width="2.2015015310586175in" height="0.9583825459317585in"}

When the sample time instant takes place the output signal is calculated as follows:

The state variable x\[1\] is calculated before the output signal by:

$$x\lbrack 1\rbrack = \frac{s\_ in.signal\lbrack 1\rbrack - \ \sum_{j = 2}^{n\_ den + 1}{x\lbrack j\rbrack \cdot qdata\lbrack j\rbrack}}{qdata\lbrack 1\rbrack}$$

$$s\_ out.signal\lbrack 1\rbrack = \ \sum_{j = 1}^{n\_ num + 1}{x\lbrack j\rbrack \cdot p\lbrack j\rbrack}$$

And the remainder of states variables are calculated as:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image223.png){width="2.8543132108486438in" height="0.48613626421697287in"}

## 4.85 dIntegrator

### 4.85.1 Description

This component is inherited from component dMIMOs. It represents a discrete integration scheme equivalent to the following z-domanin transfer function:

$$y = \frac{1}{z - 1} \cdot u$$

where y is the output signal and u is the input signal.

This component can be used in place of the continuous Integrator component when building a purely discrete system.

The user can select the following integration method to calculate the output signals:

- ForwardEuler

- BackwardEuler

- Trapezoidal

### 4.85.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image224.png){width="0.5903083989501312in" height="0.49308070866141734in"}

### 4.85.3 Parameters

  -----------------------------------------------------------------------------------------
  NAME           TYPE                      DEFAULT        DESCRIPTION
  -------------- ------------------------- -------------- ---------------------------------
  Method         CONST ENUM dIntegMethod   ForwardEuler   Integration method

  n              CONST INTEGER             1              Dimension of inputs and outputs
  -----------------------------------------------------------------------------------------

### 4.85.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal ()

  s_out       analog_signal   (n = n)      OUT         Outlet signal ()
  ---------------------------------------------------------------------------------

### 4.85.5 Data

  ------------------------------------------------------------------------------
  NAME        TYPE        DEFAULT     DESCRIPTION                        UNITS
  ----------- ----------- ----------- ---------------------------------- -------
  dt          REAL        0.1         Sample time                        s

  y_o\[n\]    REAL                    Initial condition for the output   
  ------------------------------------------------------------------------------

### 4.85.6 Closed Parameters

  -------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- --------------------------------------
  n              CONST INTEGER   1         Dimension of input and ouput signals

  -------------------------------------------------------------------------------

### 4.85.7 Variables

  ------------------------------------------------------------------------
  NAME         TYPE       INITIAL   DESCRIPTION                    UNITS
  ------------ ---------- --------- ------------------------------ -------
  sample       BOOLEAN    FALSE                                    

  x\[n\]       REAL                 Values of states               
  ------------------------------------------------------------------------

### 4.85.8 Guidelines

The user chooses the numerical integration method with the construction parameter Method:

ForwardEuler: Forward Euler method also known as Forward Rectangular, or left-hand approximation is a first order single-step method.

BackwardEuler: Euler backward integration method is also a first order single-step method.

Trapezoidal: The trapezoidal rule integration method is a second order single-step method.

### 4.85.9 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

The output signals are calculated at each sample time instant depending on the integration method selected by the user:

+--------------------+-------------------------------------------------------------------------------------------------------------+
| Integration Method | Equations                                                                                                   |
+====================+=============================================================================================================+
| ForwardEuler       | $$s\_ out.signal\lbrack i\rbrack = x\lbrack i\rbrack$$                                                      |
|                    |                                                                                                             |
|                    | $$x\lbrack i\rbrack = \ s\_ out.signal\lbrack i\rbrack + dt \cdot s\_ in.signal\lbrack i\rbrack$$           |
+--------------------+-------------------------------------------------------------------------------------------------------------+
| BackwardEuler      | $$s\_ out.signal\lbrack i\rbrack\  = \ \left\{ \begin{array}{r}                                             |
|                    | \begin{matrix}                                                                                              |
|                    | x\lbrack i\rbrack & if & TIME = = 0                                                                         |
|                    | \end{matrix} \\                                                                                             |
|                    | \begin{matrix}                                                                                              |
|                    | x\lbrack i\rbrack + dt \cdot s\_ in.signal\lbrack i\rbrack & if & TIME\  \neq 0                             |
|                    | \end{matrix}                                                                                                |
|                    | \end{array} \right.\ \ \ $$                                                                                 |
|                    |                                                                                                             |
|                    | $$x\lbrack i\rbrack = \ s\_ out.signal\lbrack i\rbrack$$                                                    |
+--------------------+-------------------------------------------------------------------------------------------------------------+
| Trapezoidal        | $$s\_ out.signal\lbrack i\rbrack\  = \ \left\{ \begin{array}{r}                                             |
|                    | \begin{matrix}                                                                                              |
|                    | x\lbrack i\rbrack & if & TIME = = 0                                                                         |
|                    | \end{matrix} \\                                                                                             |
|                    | \begin{matrix}                                                                                              |
|                    | x\lbrack i\rbrack + \frac{dt}{2} \cdot s\_ in.signal\lbrack i\rbrack & if & TIME\  \neq 0                   |
|                    | \end{matrix}                                                                                                |
|                    | \end{array} \right.\ \ \ $$                                                                                 |
|                    |                                                                                                             |
|                    | $$x\lbrack i\rbrack = \ s\_ out.signal\lbrack i\rbrack + \frac{dt}{2} \cdot s\_ in.signal\lbrack i\rbrack$$ |
+--------------------+-------------------------------------------------------------------------------------------------------------+

## 4.86 dStateSpace

### 4.86.1 Description

This component is inherited from component dMIMO. It represents a discrete time approximation of a state space system.

It implements a system whose behavior is define by the following equation system:

$$x(n + 1) = A \cdot x(n) + B \cdot u(n)$$

$$y(n) = C \cdot x(n) + D \cdot u(n)$$

where x is the state vector, u is the input vector and y is the output vector.

### 4.86.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image225.png){width="1.1458923884514436in" height="0.49308070866141734in"}

### 4.86.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_states       CONST INTEGER             Number of states

  n_in           CONST INTEGER   1         Dimension of inputs

  n_out          CONST INTEGER   1         Dimension of outputs
  --------------------------------------------------------------------------

### 4.86.4 Ports

  ----------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS    DIRECTION   DESCRIPTION
  ----------- --------------- ------------- ----------- ----------------------------
  s_in        analog_signal   (n = n_in)    IN          Inlet signal

  s_out       analog_signal   (n = n_out)   OUT         Outlet signal
  ----------------------------------------------------------------------------------

### 4.86.5 Data

  ---------------------------------------------------------------------------------------------
  NAME                     TYPE       DEFAULT     DESCRIPTION                           UNITS
  ------------------------ ---------- ----------- ------------------------------------- -------
  A\[n_states,n_states\]   REAL                   Matrix A of state space model         

  B\[n_states,n_in\]       REAL                   Matrix B of state space model         

  C\[n_out,n_states\]      REAL                   Matrix C of state space model         

  D\[n_out,n_in\]          REAL                   Matrix D of state space model         

  dt                       REAL       0.1         Sample time                           s

  x_o\[n_states\]          REAL                   Initial conditions for output array   
  ---------------------------------------------------------------------------------------------

### 4.86.6 Variables

  ------------------------------------------------------------------------------
  NAME             TYPE        INITIAL   DESCRIPTION                     UNITS
  ---------------- ----------- --------- ------------------------------- -------
  sample           BOOLEAN     FALSE                                     

  x\[n_states\]    REAL                  States                          

  xn\[n_states\]   REAL                  New states                      
  ------------------------------------------------------------------------------

### 4.86.7 Guidelines

The dimension of outlet can be different to the dimension of the inlet. The matrix have the following dimensions:

- A must be an n_states by n_states matrix, where n_states is the number of states.

- B must be a n_states by n_in matrix, where n_in is the number of inputs

- C must be a n_out by n_states matrix, where n_out is the number of outputs

- D must be a n_out by n_in matrix

The initial conditions of state variables are defined by means of the vector x_o.

### 4.86.8 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

When the sample time instant takes place the output signal is calculated as follows:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image226.png){width="4.276841644794401in" height="0.7633213035870516in"}

The states variables are computed by:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image227.png){width="3.5052373140857394in" height="0.6914730971128609in"}

where:

$x_{t}$ = the new value of the state variables for the current sample time

$x_{t} - \delta t$ = the value of the state variables in the previous sample time

## 4.87 dTransferFunction

### 4.87.1 Description

This component is inherited from component dSISO. It represents a discrete transfer function described by the following equation:

$$y(z) = \frac{\left( p\lbrack 1\rbrack \cdot z^{n\_ num} + p\lbrack 2\rbrack \cdot z^{n\_ num - 1} + \ldots + p\lbrack n + 1\rbrack \right)}{\left( q\lbrack 1\rbrack \cdot z^{n\_ den} + q\lbrack 2\rbrack \cdot z^{n\_ den - 1} + \ldots + q\lbrack n + 1\rbrack \right)} \cdot u(z)$$

where n_num and n_den are the degree of the numerator and denominator polynomials respectively.

### 4.87.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image228.png){width="0.8472659667541558in" height="0.48613626421697287in"}

### 4.87.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_den          CONST INTEGER   1         Order of denominator polinomial

  n_num          CONST INTEGER   0         Order of numerator polinomial
  --------------------------------------------------------------------------

### 4.87.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.87.5 Data

  ------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME                 TYPE              DEFAULT         DESCRIPTION                                                                                   UNITS
  -------------------- ----------------- --------------- --------------------------------------------------------------------------------------------- -------
  dt                   REAL              0.1             Sample time                                                                                   s

  option               ENUM InitOption   InitialStates   Initialization of discrete component: states or output                                        

  pdata\[n_num + 1\]   REAL                              Coefficients of numerator polinomial in descending power of z: p\[1\]\*z\^n+\...+p\[n+1\]     

  qdata\[n_den + 1\]   REAL                              Coefficients of denominator polinomial in descending power of z: q\[1\]\*z\^n+\...+q\[n+1\]   

  x_o\[n_den\]         REAL                              Initial conditions of the states                                                              

  y_o                  REAL              0               Initial condition for the output                                                              
  ------------------------------------------------------------------------------------------------------------------------------------------------------------

### 4.87.6 Closed Parameters

  -------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- --------------------------------------
  n              CONST INTEGER   1         Dimension of input and ouput signals

  -------------------------------------------------------------------------------

### 4.87.7 Variables

  ------------------------------------------------------------------------------
  NAME             TYPE        INITIAL   DESCRIPTION                     UNITS
  ---------------- ----------- --------- ------------------------------- -------
  j                INTEGER                                               

  sample           BOOLEAN     FALSE                                     

  x\[n_den + 1\]   REAL                  Values of states                
  ------------------------------------------------------------------------------

### 4.87.8 Guidelines

The number of coeffcients of the data vectors pdata and qdata are (n_num+1) and (n_den+1) respectively. The order of the denominator must be greater than or equal to the order of the numerator.

This component represents the method typically used by control engineers representing systems as polynomials in z or s.

### 4.87.9 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

When the sample time instant takes place the output signal is calculated as follows:

The state variable x\[1\] is calculated before the output signal by:

$$x\lbrack 1\rbrack = \frac{s_{in}.signal\lbrack i\rbrack - \ \sum_{j = 2}^{n\_ den + 1}{x\lbrack j\rbrack \cdot qdata\lbrack j\rbrack}}{qdata\lbrack 1\rbrack}$$

$$s\_ out.signal\lbrack 1\rbrack = \sum_{j = 1}^{n\_ num + 1}{x\left\lbrack n_{den} + 2 - j \right\rbrack \cdot p\lbrack n\_ num + 2 - j\rbrack}$$

And the remainder of states variables are calculated as:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image229.png){width="2.7542246281714786in" height="0.44441819772528435in"}

## 4.88 dZeroPole

### 4.88.1 Description

This component is inherited from component dSISO. It implements a discrete system with the specified zeros, poles and gain in terms of the delay operator z as the following equation shows:

$$y(z) = K \cdot \frac{\left( z - zeros(1) \right) \cdot \left( z - zeros(2) \right) \cdot \ldots(z - zeros(n))}{\left( z - poles(1) \right) \cdot \left( z - poles(2) \right) \cdot \ldots(z - poles(n))} \cdot u(z)$$

where zeros represents the zeros vector, poles represents the poles vector and K represents the gain.

### 4.88.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image230.png){width="1.1458923884514436in" height="0.48613626421697287in"}

### 4.88.3 Parameters

  --------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- ---------------------------------
  n_poles        CONST INTEGER   1         Number of poles

  n_zeros        CONST INTEGER   1         Number of zeros
  --------------------------------------------------------------------------

### 4.88.4 Ports

  ---------------------------------------------------------------------------------
  NAME        TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ----------- --------------- ------------ ----------- ----------------------------
  s_in        analog_signal   (n = n)      IN          Inlet signal

  s_out       analog_signal   (n = n)      OUT         Outlet signal
  ---------------------------------------------------------------------------------

### 4.88.5 Data

  -------------------------------------------------------------------------------------------------------------------------------------------
  NAME                 TYPE              DEFAULT         DESCRIPTION                                              UNITS
  -------------------- ----------------- --------------- -------------------------------------------------------- ---------------------------
  K                    REAL              1               Gain array                                               

  dt                   REAL              0.1             Sample time                                              s

  option               ENUM InitOption   InitialStates   Initialization of discrete component: states or output   

  poles\[n_poles,2\]   REAL                              Values of the poles                                      real part, imaginary part

  x_o\[n_poles\]       REAL                              Initial conditions of the states                         

  y_o                  REAL              0               Initial condition for the output                         

  zeros\[n_zeros,2\]   REAL                              Values of the zeros                                      real part, imaginary part
  -------------------------------------------------------------------------------------------------------------------------------------------

### 4.88.6 Closed Parameters

  -------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION
  -------------- --------------- --------- --------------------------------------
  n              CONST INTEGER   1         Dimension of input and ouput signals

  -------------------------------------------------------------------------------

### 4.88.7 Variables

  ------------------------------------------------------------------------------------------------------------------
  NAME               TYPE        INITIAL   DESCRIPTION                                                       UNITS
  ------------------ ----------- --------- ----------------------------------------------------------------- -------
  j                  INTEGER                                                                                 

  p\[n_zeros + 1\]   REAL                  Coefficients of numerator polinomial in increasing power of z     

  q\[n_poles + 1\]   REAL                  Coefficients of denominator polinomial in increasing power of z   

  sample             BOOLEAN     FALSE                                                                       

  x\[n_poles + 1\]   REAL                  Values of the states                                              
  ------------------------------------------------------------------------------------------------------------------

### 4.88.8 Guidelines

The numerator cannot be of highter order than denominator.

### 4.88.9 Formulation

To sample at time 0 the following WHEN block is used:

WHEN(TIME == 0) THEN

sample = TRUE AFTER 0.

END WHEN

The following WHEN block is used to compute when the the sample time instant takes place.

WHEN (sample == TRUE) THEN

sample = FALSE AFTER 0.

sample = TRUE AFTER dt

END WHEN

The user can select the way to initialize the component with the data option, either initializing the output signal (InitialOutput option) or initializing the states variables (InitialStates option).

When the sample time instant takes place the output signal is calculated as follows:

The state variable x\[1\] is calculated before the output signal by:

$$x\lbrack 1\rbrack = \frac{s\_ in.signal\lbrack i\rbrack - \ \sum_{j = 2}^{n\_ poles + 1}{x\lbrack j\rbrack \cdot q\lbrack n\_ poles + 2 - j\rbrack}}{q\lbrack n\_ poles + 1\rbrack}$$

$$s\_ out.signal\lbrack i\rbrack\  = K \cdot \left( \sum_{j = 1}^{n\_ zeros + 1}{x\lbrack n\_ poles + 2 - j\rbrack \cdot p\lbrack j\rbrack} \right)$$

And the remainder of states variables are calculated as:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image231.png){width="3.151988188976378in" height="0.5302963692038495in"}

# 5 Building a Model

This chapter describes how to build a simple model using the CONTROL library, and how to simulate it. The basic methodology to create and simulate this simple model is the same as that for more complex models.

## 5.1 Guidelines for Building a Model

Here are some hints and guidelines to help you to build your models:

- Generally when building a control model, work first on paper and then build it using a schematic.

- Only ports of the same type can be connected, i.e. it is not allowed to connect an analog_signal port to a bool_signal port.

- The dimension of the array of signals that are transferred through the port must be defined in each component. Two ports interconnected must have the same dimension. If you connect two ports with different dimension and try to generate a partition (the mathematical model of the system) a partition error will displayed in the output message window:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image232.png){width="6.490277777777778in" height="1.6979166666666667in"}

- Multiple connections to signal input ports are forbidden. However, it is possible to make multiple connection from an outlet signal port, i.e it is possible to broadcast an outlet signal.

- Most of the data associated to a component are arrays. You can assign values to these data using the attribute editor of the component. Because these data are arrays, the assignation must be an array of values separated by commas and between bracket (or the same value for all the array), for example:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image233.png){width="4.590513998250219in" height="1.0069958442694664in"}

- It is advisable not to leave inlet ports unconnected because the models are easier to read and understand. If you leave one inlet port unconnected you will have to assign values to the array of signals of that port in the BOUNDARY block of the experiment.

## 5.2 Description of the example

The model described in this chapter integrates a cosine wave and limits excursion of the integrated signal. When completed, the model schematics should look similar to this:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image234.png){width="2.8959820647419074in" height="0.5347495625546806in"}

The data of the model are the following:

- The amplitude of the cosine wave: 1

- The period of the cosine wave: 2 \* 3.1416

- The initial value of the integrator output: 0

- The upper limit of the saturation block: 0.8

- The lower limit of the saturation block: -0.8

## 5.3 Build the Model

This section describes how to build a simple model using the CONTROL library. After you create the model, you can simulate it as described in the following section \"Simulating the Model\".

To create the model you must follow this steps:

- First create a new schematic using the botton ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image235.png){width="0.16263998250218722in" height="0.17305336832895887in"} or the File \> New \> Schematics. Save it in the CONTROL_EXAMPLES library with the name \"myFirstModel\". The active Workspace must have the PORTS_LIB, MATH, CONTROL_EXAMPLES and the CONTROL libraries loaded.

- To create the simple model in this chapter, you need the following three components:

  - AnalogSource from CONTROL library

  - Integrator from CONTROL library

  - Saturator from CONTROL library

- Select the different component one by one in the icon explorer and drag them to the schematic window

- Arrange the components in the schematic like in the figure above:

  - Use the Rotate buttons if necessary.

  - To change the size of a component, select the component, right button, select "component shape option" and change the size by dragging the symbol's corners.

  - To change the position of the component's name, press the SHIFT key at the same time as you move the mouse pointer over the labels, and drag it.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image236.png){width="3.0626574803149604in" height="0.6111428258967629in"}

- Draw connectors between the components like in the figure above.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image237.png){width="3.027933070866142in" height="0.6805905511811023in"}

- Select the connection button on the right-hand toolbar ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image238.png){width="0.16893372703412074in" height="0.15856080489938756in"}, or press the SHIFT key at the same time as you move the mouse pointer over a port

- Left-click on the port to be connected

- Click the various points of the schematic drawing where the connector is required to run (if any)

- Left-click the target port, which must be of the same type as the origin port

- A tooltip will appear whenever the mouse runs over a port, displaying the information of that port.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image239.png){width="3.3960083114610673in" height="1.666751968503937in"}

- Now you must customize the component data and names according to the model overview.

  - To change data of a component double-click on the corresponding symbol to open the Attributes Editor.

  - For the AnalogSource component, you must specify that the wave form is a **Source_sine** and in order to generate a cosine signal the phase data must be change to 3.1416/2. For the rest of the data, the amplitude is equal to 1 and the period is equal to 2\*3.1416. The name of the component will be set to \"CosWave\". The Attributes Editor of this component looks like this:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image240.png){width="6.495833333333334in" height="3.1805555555555554in"}

- Finally, generate the model using the button ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image241.png){width="0.14907042869641296in" height="0.13860017497812774in"}. The following window will be display. Click OK and you will have finalised the construction of your model and you can simulate it as described in the following section, "Simulating the Model":

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image242.png){width="3.2848906386701664in" height="1.465353237095363in"}

## 5.4 Simulate the Model

Now the model is ready for the simulation. Go to the Simulation View.

- Select \"myFirstModel.default\" (if the name of the partition you have created is "default") from the CONTROL_EXAMPLES library, right-click the option \"New experiment\" and type in a name.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image243.png){width="3.2153904199475067in" height="2.385965660542432in"}

- A default experiment text should appear in the editing window. Keep the TSTOP to 15 seconds and change CINT (Communications Interval) to 0.05 seconds in order to better represent the sinusoidal signals as indicated here below:

/\*\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--

LIBRARY: CONTROL_EXAMPLES

COMPONENT: myFirstModel

PARTITION: default

EXPERIMENT: exp1

TEMPLATE: TRANSIENT

CREATION DATE: 20/04/2022

\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\*/

EXPERIMENT exp1 ON myFirstModel.default

DECLS

OBJECTS

INIT

\-- initial values for state variables

BOUNDS

BODY

\-- REPORT_TABLE(\"results.rpt\", \"\*\") \-- create an automatic report of variables

DEBUG_LEVEL= 1 \-- valid range is \[0,4\]

IMETHOD= CVODE_BDF \-- integration method

\-- set tolerances for transient (REL_ERROR & ABS_ERROR) and steady (TOLERANCE) solvers

REL_ERROR = 1e-06

ABS_ERROR = 1e-06

TOLERANCE = 1e-06

INIT_INTEG_STEP = -1 \-- initial integration step size (-1 uses default)

MAX_INTEG_STEP = -1 \-- maximum integration step size (-1 uses default)

NSTEPS = 1 \-- Only for explicit solvers use CINT/NSTEPS as integration step size

REPORT_MODE = IS_EVENT \-- Report results at every CINT and event detection.

\-- simulate a transient in range\[TIME,TSTOP\] reporting at every CINT

TIME = 0

TSTOP = 15

CINT = 0.1

INTEG()

END EXPERIMENT

- Double dash (\--) means a comment.

- "REPORT_TABLE\" is a function that creates a file called \"results.rpt\" which consists of a report of all the variables of the model (it is commented, so to create the file uncomment)

<!-- -->

- Save the experiment. The experiment name will appear in the Workspace area

- Now you are going to simulate the experiment using the Monitor. Right button over the experiment name in the Workspace area, and select "Simulate in Monitor". Clicking ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image244.png){width="0.158416447944007in" height="0.16925306211723534in"} button will produce same action

- The Experiments monitor comes up. Add one plot for the output signal of the three components that are part of the system, for the analog source called CosWave the name of the variable would be CosWave.s_out.signal\[1\].

  - To add a plot click on \"Tab_1" and then click "New Plot" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image245.png){width="0.25277777777777777in" height="0.22777777777777777in"}. A window will appear with the "drawable / plotable" variables of the experiment.

  - Apply a filter to help you selecting variables. Tick the boxes alongside selected variables:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image246.png){width="4.2135717410323705in" height="3.259955161854768in"}

- Just as you may wish to plot the evolution of a variable compared with another, you may also wish to track the numerical values of the variables. The main task of the Watch is to display the variable values of the experiment, enabling them to be modified wherever possible.

  - The first step is to add variables by doing right click in the Watch Area and selecting the option "Edit Watch".

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image247.png){width="2.9376509186351707in" height="2.493183508311461in"}

- A menu very similar to that of the plots will appear, enabling the user to add or delete variables.

<!-- -->

- Select "Play" from the Toolbar We can see in the plot window how the variables change and in the right-hand how the numeric values of the selected variables change.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image248.png){width="6.495833333333334in" height="3.332638888888889in"}

- The user can notice how the results displayed in the plot are correct. The output signal of the CosWave component is a normalized cosine wave. And the output signal of the Integration1 is a sine wave that is the integral of a normalized cosine wave:

$$\int_{}^{}{\cos(x) = sin(x)}$$

- Finally the output signal of the Saturation1 component is a sine wave limited by an upper (0.8) and lower limit (-0.8) that have been specified in this component.

# 6 Application examples

## 6.1 Example_Controllers

### 6.1.1 Description

Controllers are one of the most used components. Most libraries use control ports in order to be compatible with either this one or the AnalogSource. The controller will always try to match the variable input to the set point input.

In this case study, the three different controllers that are analysed are the following:

- Proportional Controller (P Controller)

- Proportional Integral Controller (PI Controller)

- Proportional Integral Derivative Controller (PID Controller)

### 6.1.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.TF_2ndOrder (Plant, Plant_1, Plant_2):

  -------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -------------------
  frec\[n\]         2                 Hz                Angular frecuency

  damp\[n\]         0.25              \-                Damping

  gain\[n\]         0.25              \-                Gain
  -------------------------------------------------------------------------

- CONTROL.AnalogSource (Set_point):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  source            Source_Step                         Waveform

  Tstart            5                 s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (Signal):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Pulse                        Waveform

  Amp               2                 \-                Signal amplitude or height

  Tstart            8                 s                 Starting time of signal generation

  Period            1000              s                 Period of sine, pulse, sawtooth, or square source

  pulseWidth        1                 s                 Pulse width of pulse wave
  ---------------------------------------------------------------------------------------------------------

- CONTROL.Cntrl_P (P_Cntrl):

  -------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -------------------------------------
  k\[n\]            10                \-                Proportional gain of the controller

  u_min\[n\]        -100              \-                Low limit of output

  u_max\[n\]        100               \-                High limit of output
  -------------------------------------------------------------------------------------------

- CONTROL.Cntrl_PI (PI_Cntrl):

  -------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -------------------------------------
  k\[n\]            10                \-                Proportional gain of the controller

  u_min\[n\]        -100              \-                Low limit of output

  u_max\[n\]        100               \-                High limit of output

  Ti\[n\]           10                s                 Integrator time or reset time
  -------------------------------------------------------------------------------------------

- CONTROL.Cntrl_PID (PID_Cntrl):

  -------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -------------------------------------
  k\[n\]            10                \-                Proportional gain of the controller

  u_min\[n\]        -100              \-                Low limit of output

  u_max\[n\]        100               \-                High limit of output

  Ti\[n\]           10                s                 Integrator time or reset time

  Td\[n\]           1                 s                 Rate or derivative time
  -------------------------------------------------------------------------------------------

### 6.1.3 Schematics

![control_ex1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image249.png){width="6.489583333333333in" height="4.541666666666667in"}

### 6.1.4 Results

The following experiment analyses the differences between the various controllers. The P Controller is the least accurate, the PID being the most precise. The PI stands somewhere between the two. In this case, the PID reaches the set point the slowest. However, it must be taken into account that the parameters have not been finely tuned, and, therefore, are not optimal.

![Controllers_sol_basic](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image250.png){width="6.489583333333333in" height="2.78125in"}

This case study analyses the influence of the proportional gain over the output signal. As the plot below shows, the bigger this parameter is, the faster it reaches the set point. However, it also affects oscillations. The signal with a greater proportional gain oscillates much more than the other ones.

![Controllers_sol_k_Var](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image251.png){width="6.489583333333333in" height="2.78125in"}

The following experiment studies how different values of derivative time affect the signal. As this parameter grows in value, the time to reach the set point decreases.

![Controllers_sol_Td_Var](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image252.png){width="6.489583333333333in" height="2.78125in"}

The following experiment analyses the effect of multiple integrating times over the output signal. As the value of this parameter decreases, the oscillations increase. However, in the case of the PID controller, the result is more precise.

![Controllers_sol_Ti_Var](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image253.png){width="6.489583333333333in" height="2.7708333333333335in"}

## 6.2 Example_LogicGates

### 6.2.1 Description

Logic gates are the simplest Boolean operations. The output will always be \"True\" or \"False\", or in numeric terms a \"1\" or a \"0\". In this case, the subjects of study will be:

- AND: The equivalent of a multiplication. The output will only be \"True\" when both inputs are.

- OR: The equivalent of a sum. The output will only be \"True\" when one of the inputs or both are.

- XOR: The output will only be \"True\" when just one of the inputs is.

- NOT: This operation just changes the input from \"True\" to \"False\" and viceversa.

### 6.2.2 Components

- CONTROL.SourcebPulse (SourcebPulse_2):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  Period            5                 s                 Period of pulse

  pulseWidth        2.5               s                 Pulse width

  Tstart            2.5               s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

### 6.2.3 Schematics

![control_ex2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image254.png){width="6.489583333333333in" height="4.541666666666667in"}

### 6.2.4 Results

The following experiment analyses what the output of each gate will be when subjecting them to two square Boolean signals with different periods.

![logic_gates](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image255.png){width="6.479166666666667in" height="2.7708333333333335in"}

## 6.3 Example_Conditionals

### 6.3.1 Description

Conditionals compare two analog values and return a Boolean output. This is useful when setting up controls for variables. In this case, the subjects of study will be the following:

- Greater: Returns \"True\" when one of the inputs is greater than the other one.

- Greater or equal: Returns \"True\" when one of the inputs is greater or equal to the other one.

- Equal: Returns \"True\" only when both inputs are equal.

- Less or equal: Returns \"True\" when one of the inputs is less or equal to the other one.

- Greater: Returns \"True\" when one of the inputs is less than the other one.

### 6.3.2 Components

- CONTROL.AnalogSource (Signal_1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  source            Source_Sine                         Waveform

  -----------------------------------------------------------------------

- CONTROL.AnalogSource (Signal_2):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  source            Source_Sine                         Waveform

  Tstart            2                 s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

### 6.3.3 Schematics

![control_ex3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image256.png){width="6.489583333333333in" height="4.541666666666667in"}

### 6.3.4 Results

In the following experiment, the inputs will be two wave signals with an equal amplitude, but with an offset of two seconds. The plot shows the different outputs returned by the conditionals.

![conditionals](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image257.png){width="6.489583333333333in" height="2.7708333333333335in"}

## 6.4 Example_Counters

### 6.4.1 Description

Counters generate a signal, which increases or decreases in value at certain times, by a gain set by the user. There are three distinct types:

- Counter up: Increases in value every few seconds, set by the clock component. When it reaches the desired value, it generates a \"True\" output. In this case, this will reset the count.

- Counter down: Decreases in value every few seconds, set by the clock component. When it reaches the desired value, it generates a \"True\" output. In this case, this will reset the count.

- Counter up and down: At first, it increases in value every few seconds, set by the clock component. When it reaches the desired value, it generates a \"True\" output, after which it will start counting down. This behaviour will repeat itself periodically.

### 6.4.2 Components

- CONTROL.AnalogSource (PV_Up):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  Amp               5                 \-                Signal amplitude or height

  ----------------------------------------------------------------------------------

- CONTROL.SourcebPulse (OnOff_signal):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  Tstart            0                 s                 Starting time of signal generation

  ------------------------------------------------------------------------------------------

- CONTROL.Delay (Delay:

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  tdelay\[n\]       5                 s                 Delay time

  -----------------------------------------------------------------------

### 6.4.3 Schematics

![control_ex4](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image258.png){width="6.489583333333333in" height="4.541666666666667in"}

### 6.4.4 Results

The following plots show the aforementioned behaviour. When the count reaches the value 4 it will either reset the count or reverse its behaviour.

![counter_up](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image259.png){width="6.489583333333333in" height="2.78125in"}

![counter_down](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image260.png){width="6.489583333333333in" height="2.7708333333333335in"}

![counter_up_down](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image261.png){width="6.489583333333333in" height="2.78125in"}

## 6.5 Multiplexers

### 6.5.1 Description

A multiplexer is a device used for signal selection. From a multitude of inputs, this component can create a vector containing all possible options. The subjects in this case study are the following:

- 8 Input multiplexer: With a limited amount of inputs, this component is the easier of the two to use. The 8 Input multiplexer accepts up to eight signals, with the possibility of receiving less.

- General multiplexer: The advantage held by this component over the other multiplexer is the infinite amount of possibilities it offers. The amount of incoming signals is a modifiable construction parameter.  

### 6.5.2 Components

- CONTROL.AnalogSource:

  ------------------------------------------------------------------------------------------
  Name             Variable       Value          Units          Description
  ---------------- -------------- -------------- -------------- ----------------------------
  Signal_1         Amp            4              \-             Signal amplitude or height

  Signal_1_1       Amp            5              \-             Signal amplitude or height

  Signal_1_2       Amp            6              \-             Signal amplitude or height

  Signal_1_3       Amp            7              \-             Signal amplitude or height

  Signal_1_4       Amp            8              \-             Signal amplitude or height

  Signal_1_5       Amp            9              \-             Signal amplitude or height

  Signal_1_6       Amp            10             \-             Signal amplitude or height

  Signal_1_7       Amp            11             \-             Signal amplitude or height

  AnalogSource_1   Amp            1              \-             Signal amplitude or height

  AnalogSource_2   Amp            2              \-             Signal amplitude or height

  AnalogSource_3   Amp            3              \-             Signal amplitude or height

  AnalogSource_4   Amp            4              \-             Signal amplitude or height

  AnalogSource_5   Amp            5              \-             Signal amplitude or height
  ------------------------------------------------------------------------------------------

### 6.5.3 Schematics

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image262.png){width="6.495833333333334in" height="4.538888888888889in"}

The following code is necessary to change between the positions in the output vector. A counter variable increases in value every five seconds of simulation, picking the value with the same index. Given that both vectors have finite dimensions, the counters should reset when reaching the limit. Once selected, the amplitude is passed onto the output signal.

\-- EL code of the schematic.

\-- The COMPONENT definition lines are blocked for edition.

\-- You can edit the parameters clicking over them.

COMPONENT Multiplexers (\...)

DECLS

REAL Period UNITS \"s\"

REAL Period_2 UNITS \"s\"

INTEGER i = 1

INTEGER j = 1

INTEGER start_time = 0

DISCRETE

WHEN TIME \> start_time THEN

Period = Mux8_1.s_out.signal\[i\]

Period_2 = Mux.s_out.signal\[j\]

i = i + 1

j = j + 1

start_time = start_time + 5

END WHEN

WHEN i \> 8 THEN

i = 1

END WHEN

WHEN j \> 5 THEN

j = 1

END WHEN

CONTINUOUS

Output_signal.Period = Period

Output_signal_2.Period = Period_2

END COMPONENT

### 6.5.4 Results

The following plot shows the counter variable through time. As described in the last section, they will increase in value every five seconds, resetting after they reach their limit.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image263.png){width="6.495833333333334in" height="2.5569444444444445in"}

The output vector contains the various constants, which will be passed onto the output signal in the form of period values. As seen in the following figure, the period in the output signal matches the one stored in the array. The one characteristic which differentiates the two multiplexers is the ability of the user to predict the placement of the input in the array. Whereas the 8-input displays graphically in the schematics the order in which they will be placed, the general one does not. However, placement is easily defined through the use of code.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image264.png){width="6.495833333333334in" height="2.5569444444444445in"}

The following plots show the resulting signal. As predicted, the period changes every five seconds, repeating the value after the counter reaches the limit of the vector. The transitions between intervals are not smooth, but the value is correct.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image265.png){width="3.1496062992125986in" height="1.2397747156605425in"}![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image266.png){width="3.1496062992125986in" height="1.2397747156605425in"}

## 6.6 Example_Timers

### 6.6.1 Description

The function of timers is turning off or on signals based on time. The subjects of study in this case will be the following:

- TOFF: When the timer detects a signal, it will wait a time set by the user to turn it off. Otherwise, it will maintain the signal on.

- TON: When it detects a signal, it will wait a time set by the user to turn it on. If the signal turns off, so will the one generated by the timer.

- TP: It will turn a signal on at the same time as the input one. However, it will wait the time set by the user and then turn it off, regardless of whether the input is still on or not. It will also keep the signal on if it is turned of in the input.

### 6.6.2 Components

- CONTROL.SourcebPulse (SourcebPulse_1):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  Period            7                 s                 Period of pulse

  pulseWidth        3                 s                 Pulse width

  Tstart            1                 s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

### 6.6.3 Schematics

![control_ex6](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image267.png){width="6.489583333333333in" height="4.541666666666667in"}

### 6.6.4 Results

The following plot shows how each timer works when receiving a signal with a certain period.

![Timers](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image268.png){width="6.479166666666667in" height="2.7708333333333335in"}

## 6.7 Example_Switches

### 6.7.1 Description

Switches allow the user between various signals using a Boolean signal. When the Boolean input is \"True\" the output will choose one signal, and when the input is \"False\", it will be another. The inputs may be analog or Boolean.

### 6.7.2 Components

- CONTROL.SourcebPulse (SourcebPulse_1):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  Period            4                 s                 Period of pulse

  pulseWidth        2                 s                 Pulse width

  Tstart            1                 s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

- CONTROL.SourceExp (SourceExp):

  --------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------
  riseTime          5                 s                 Rise Time

  riseTimeConst     5                 s                 Rise time constant

  fallTimeConst     5                 s                 Fall time constant
  --------------------------------------------------------------------------

- CONTROL.SourcebStep (SourcebStep_1):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  Tstart            1                 s                 Starting time of signal generation

  ------------------------------------------------------------------------------------------

- CONTROL.SourcebSampleTrigger (SourcebSampleTrigger_1):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  Period            1                 s                 Period of sample

  ------------------------------------------------------------------------

### 6.7.3 Schematics

![control_ex7](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image269.png){width="6.489583333333333in" height="4.541666666666667in"}

### 6.7.4 Results

The following experiment studies the change between two signals. To accomplish this, the switch is activated by a Boolean pulse signal. The first plot shows the resulting signal from switching between an exponential function and a sine wave of variable period.

![Analog_switch](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image270.png){width="6.489583333333333in" height="2.78125in"}

The second plot shows the resulting signal from switching between two different Boolean signals.

![Digital_switch](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image271.png){width="6.489583333333333in" height="2.78125in"}

## 6.8 LinearSystem

### 6.8.1 Description

The example models a linear system where the output of the plant block undergoes a series of operations and transformations before being introduced again as an input of the plant. The unconnected side of the comparator sill be modelled as a square wave.

### 6.8.2 Components

- CONTROL.TransferFunction (process_plant):

  -----------------------------------------------------------------------------------------------
  Variable          Value              Units             Description
  ----------------- ------------------ ----------------- ----------------------------------------
  n_den             3                  \-                Order of the denominator polynomial

  p                 1                  \-                Coefficients of numerator polynomial

  q                 \[1,3.2,3.56,0\]   \-                Coefficients of denominator polynomial
  -----------------------------------------------------------------------------------------------

- CONTROL.Gain (amplifier):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  k\[n\]            1438              \-                Gain

  -----------------------------------------------------------------------

- CONTROL.TransferFunction (compensator):

  ----------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------------------
  N_num             2                 \-                Order of the numerator polynomial

  n_den             2                 \-                Order of the denominator polynomial

  p                 \[1,2,1\]         \-                Coefficients of numerator polynomial

  q                 \[1,28, 160\]     \-                Coefficients of denominator polynomial
  ----------------------------------------------------------------------------------------------

### 6.8.3 Schematics

![Captura](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image272.png){width="5.989583333333333in" height="4.145833333333333in"}

### 6.8.4 Results

One partition is selected for this model, including the signal at the three unconnected ends of the comparator and summers as boundaries of the problem. No algebraic variables are required. One experiment will be created next, where the summers\' signal are set to 0 and the one of the comparator is modelled as a square wave of period 5s. The equations are integrated for 20 seconds. The results are shown below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image273.png){width="5.78130905511811in" height="3.1162456255468065in"}

The system tries to adapt the signal in order to adapt to the comparator input. However, the output has some error when doing this resulting in some overshoot, delay and steady state error.

## 6.9 Random_generation

### 6.9.1 Description

This example shows the different ways of creating random numbers making use of the Control Library RandomSource component. This example will be fully developed in EL programming language, meaning no schematic will be created. Six different distributions will be tested and studied in the experiment of the model.

### 6.9.2 Model Script

As commented, the model is developed fully in EL programming language. The creation of the topology of the mode is shown in the picture below.

TOPOLOGY

RandomSource(random = Uniform, iseed = 1500) Unif(a =0,b = 1)

RandomSource(random = Gaussian, iseed = 1500) Gauss(mu = 0,sigma = 1)

RandomSource(random = Exponential, iseed = 1500) Expon(lambda = 1)

RandomSource(random = Poisson, iseed = 1500) Pois(xm = 1)

RandomSource(random = Gamma, iseed = 1500) Gamm(order = 3)

RandomSource(random = Binomial, iseed = 1500) Binom(n = 10, p = 0.5)

The six different sources are introduced along their relevant parameters. The six different distributions are Uniform, Gaussian, Exponential, Poisson, Gamma and Binomial. For simplicity when later analysing the results, each of the distributions signals are stored into new variables in the continuous block of the script.

CONTINUOUS

x = Unif.s_out.signal\[1\]

y = Gauss.s_out.signal\[1\]

z = Pois.s_out.signal\[1\]

u = Expon.s_out.signal\[1\]

v = Gamm.s_out.signal\[1\]

w = Binom.s_out.signal\[1\]

### 6.9.3 Results

The partition created can be default since no boundaries are needed. The experiment for this case will be transient and integrated for 50 seconds, with an integration step of 0.1 seconds. This means the monitor will show a random value each 0.1 seconds for a total of 500 data values. The results for the different distributions are shown below.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image274.png){width="6.495833333333334in" height="5.059722222222222in"}

Different distributions provide different results. In the case of a practical application, the user must select the one which adapts better to the random behaviour of the real problem considered,

# 7 Appendix A: Theory of PID Controllers

## 7.1 Introduction

Linear PID controllers have two main advantages which make them the most commonly used: their robustness and the intuitive relationships between their parameters and the system response.

The basic algorithm of the PID controllers are the following:

$$u(t) = K_{p}\left( e(t) + \frac{1}{T_{1}}\int_{}^{}{e(t)dt + T_{D}\frac{de(t)}{dt}} \right) = P + I + D$$

where:

$u(t)$ = the control signal or the manipulated variable

$e(t)$ = the error signal ($r(t) - \ y(t))$

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image275.png){width="5.049495844269466in" height="1.2637237532808399in"}

Basic Diagram of a Feedback Control System

**Definitions:**

- Proportional Action (P) is the action produced by a proportional control signal on the deviation of the output signal with regard to the set-point

- Integral action (I) is the action produced by an integral control signal on the time that the output is different from the set-point

- Derivative action (D) is the action produced by a proportional control signal on the speed at which the output signal varies with respect to the set-point

- Gains: proportional (kp); integral (ki = kp / Ti) and derivative (kd = kp Td) are the proportionality constants of the different controller actions

- Proportional range (BP=100/KP) is the change expressed as a % that the process output (measured variable) has to undergo for the output of the proportional block to exceed its minimum value (0%) or its maximum value (100%)

- Integral Time Constant (TI) is the time that must elapse for the integral action to match (to equal or to repeat) the proportional action

- Reset frequency (1/TI) is the number of times that the integral action matches the proportional action in one minute

- Derivative Time Constant (TD) is the time that must elapse for the derivative action to match the proportional action

When the proportional gain is very large, or when the proportional range is very small or when the integral time constant is very small, the controller can become unstable.

Derivative action is not recommendable when a lot of noise is present, as it is amplified.

## 7.2 Types of PID Structures

In industrial controllers it is common to find different versions of the PID control algorithm. Any such algorithm can be considered to belong to one of the three groups of PID controllers shown in previous section (non-interactive, interactive or parallel).

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image276.png){width="5.0974846894138235in" height="2.3265080927384076in"}

$$u(s) = K_{p}\left( 1 + \frac{1}{T_{I}s} + T_{D}s \right) \cdot E(s)$$

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image277.png){width="4.239856736657917in" height="1.6991196412948382in"}

$$u(s) = K_{p}\left( 1 + \frac{1}{T_{I}s} \right)(1 + T_{D}s) \cdot E(s)$$

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image278.png){width="3.7154691601049867in" height="2.3195636482939634in"}

$$u(s) = \left( K_{p} + \frac{1}{T_{I}s} + T_{D}s \right) \cdot E(s)$$

## 7.3 Filter in the Derivative Action

To limit the output of high frequencies (ie noise), the derivative action filter α is used so that the new filtered derivative action becomes:

$$\frac{u_{d}(s)}{E(s)} = \frac{K_{p}T_{D}s}{\alpha T_{D}s + 1}$$

which limits the output of high frequencies to $\frac{K_{p}}{\alpha}$

For an interactive PID, the resulting transfer function is:

$$u(s) = K_{p}\left( 1 + \frac{1}{T_{I}s} \right)\left( 1 + \frac{T_{D}s}{{1 + \alpha T}_{D}s} \right)E(s)$$

## 7.4 Control Structures with Derivative Filter

The PID control system allows great flexibility, not only in the control algorithm but also in the handling of the reference signal. Some manufacturers include this last characteristic in their industrial controllers, which allows a choice between different control structures or between different equations.

Next figure shows the three possible control structures, where the derivative action incorporates the derivative filter. In the PID structure, the three control actions (proportional, integral and derivative) act on the error signal. In the PI-D structure, derivative action only acts on the process output; in this way, overly high control signals with respect to the PID structure are avoided when the set-point changes. In the I-PD structure, brusque changes in the control signal due to proportional action are avoided, as only the integral part acts on the error signal.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image279.png){width="3.979371172353456in" height="1.944543963254593in"}

$$u(t) = K_{p}\left( e(t) + \frac{1}{T_{I}}\int_{}^{}{e(t)dt - T_{D}\frac{dy(t)}{dt}} \right)$$

PID Structure

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image280.png){width="4.243273184601925in" height="2.007047244094488in"}

$$u(t) = K_{p}\left( e(t) + \frac{1}{T_{i}}\int_{}^{}{e(t)dt - T_{D}\frac{dy(t)}{dt}} \right)$$

PI-D Structure

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image281.png){width="4.062708880139983in" height="2.243170384951881in"}

$$u(t) = K_{p}\left( - y(t) + \frac{1}{T_{i}}\int_{}^{}{e(t)dt - T_{D}\frac{dy(t)}{dt}} \right)$$

I-PD Structure

There is a general equation which includes the PI-D and I-PD structures for the case of non-interactive control. This equation is:

$$u(t) = K_{p}\left( \beta \cdot t(t) - y(t) + \frac{1}{T_{i}}\int_{}^{}{e(t)dt - T_{D}\frac{dy(t)}{dt}} \right)$$

β is the filter for brusque changes in the set-point

If $\beta$ = 1 PI-D Controller

If $\beta$ = 0 I-PD Controller

The adoption of the PI-D type controller has the following effects on the PID:

Longer increase time

Greater elongation

Lengthening of transient

Reduction of the initial value of the control signal

Minimum improvement in evolution

The adoption of the I-PD type controller has the following effects on the PID:

Longer increase time

Less elongation

Same settling time

Apt for systems that are subject to large changes in set-point

## 7.5 The Windup Problem

Most current controllers incorporate strategies which desaturate the integral part (anti-reset windup). Basically there are three ways of avoiding or reducing saturation as much as possible:

- Conditional integration methods

- Integral followup method

- Input limitation methods

- Integral Followup Method

This method is the most efficient and the only one which we will analyse here. It is based on feeding back to the controller the difference between the control signal which it generates, and the saturated control signal received by the actuator; in this way the difference between both signals is used by the controller to bring the control signal to the same value as the saturated signal. The method is so efficient because it allows a great reduction in the saturation time of the integral part, but it needs to know the physical limits of the actuator at all times, either by direct measurement or by incorporating a model of the actuator within the actual controller; said model may be a simple limiter.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image282.png){width="4.5464676290463695in" height="2.9622561242344707in"}

## 7.6 Description of the Cntrl_pid Component

The CONTROL library includes the Cntrl_pi and Cntrl_pid components to represent PI and PID controllers respectively. In the case of the Cntrl_PID controller there is a non-interactive PID control structure with derivative filter factor α to avoid noise amplification at low frequencies during derivative action, a weight factor β to avoid the effects of brusque changes of the set-point, and a feedback loop to avoid the effects of saturation on the integral part, whose error signal is applied to the output of the integral action or of the global action depending on whether the behaviour at the end position is end_I or PI respectively and in accordance with the following diagram:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\CONTROL\source_files\CONTROL_Library_Reference_Manual_media/media/image283.png){width="6.104480533683289in" height="3.1251607611548557in"}
