---
input_mode: dir
title: docs \> MECHANICAL \> source_files \> MECHANICAL_Library_Reference_Manual
---

# 1 Overview of the library

## 1.1 Description

MECHANICAL is a library for the simulation of 1-dimensional mechanical systems. Most of the typical MECHANICAL units are included as components that can be used to build graphically complex systems:

- Translational components for systems with linear displacements driven by forces with frictional losses

- Rotational components for systems with angular displacements driven by momentum with frictional losses

- Kinetic converters (levers, gears, ideal gear rotational to translational): They transform an angular movement into other angular movement at different velocity or into a translational movement.

The most important elements can be grouped in the following groups:

- Masses and inertia (Sliding mass, End stop mass, Inertia and End stop Inertia): These elements implement the second Newton law.

- Force and torque generators (Coulomb friction, dampers and springs): They calculate force or torque from the position or the velocity in their ports.

- Actuators (force, position, torque, acceleration and angle generators): They provide force, torque, acceleration, position and angle depending on an external input signal (user defined law).

- Sensors (acceleration, velocity, position, angle, force and torque measurement): These components generate output CONTROL signals with the acceleration, velocity, position and force signals.

- Special rotational elements (levers, pistons, clutch, brake and efficiency).

A detailed examination of the formulation reveals that components in the MECHANICAL library calculate the forces, torques and positions in different ways: Indeed, mass or inertia components calculate explicitly (second order derivatives) the position at their ports; other components such springs and dumpers include linear or non-linear algebraic equations. Finally, some components include events in the calculation of the forces / displacement (Coulomb friction, Stops ...).

In this way, final models result in a complex system of differential-algebraic equations of index 3 (constraint equations have to be differentiated) with discrete events to be captured. It is a work of software to order all the equations and to be able to symbolically differentiate equations, no matter the way the user includes the different components in a particular mechanical system.

Typical mechanical devices that could be frequently used in other more complex models can be built topologically from the basic components, and then considered as new components thanks to the object-oriented programming properties, i.e. Encapsulation, Inheritance and Aggregation.

## 1.2 Change log

+---------+--------------------------------------------------------------------------+
| Version | New Features                                                             |
+---------+--------------------------------------------------------------------------+
| 3.2.0   | - New component R_ClutchBasic has been added.                            |
+---------+--------------------------------------------------------------------------+
| 3.2.1   | - Reference Manual has been updated.                                     |
+---------+--------------------------------------------------------------------------+
| 3.2.2   | - New component R_AbsoluteSensorPower has been included.                 |
+---------+--------------------------------------------------------------------------+
| 3.2.4   | - Error in the units of the viscous friction coefficient has been fixed. |
+---------+--------------------------------------------------------------------------+

## 1.3 Ports

### 1.3.1 analog_signal

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

### 1.3.2 mech_trans

**Description**

This port type represents 1D translational flange

**Parameters**

  --------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION                     UNITS
  -------------- --------------- --------- ------------------------------- -------
  n              CONST INTEGER   1         Dimension of the signal array   \-

  --------------------------------------------------------------------------------

**Variables**

  -----------------------------------------------------------------------
  Name                    Description             Units
  ----------------------- ----------------------- -----------------------
  T                       Torque                  N\*m

  S                       Absolute position       m
  -----------------------------------------------------------------------

### 1.3.3 mech_rot

**Description**

This port type represents 1D rotational flange

**Parameters**

  --------------------------------------------------------------------------------
  NAME           TYPE            DEFAULT   DESCRIPTION                     UNITS
  -------------- --------------- --------- ------------------------------- -------
  n              CONST INTEGER   1         Dimension of the signal array   \-

  --------------------------------------------------------------------------------

**Variables**

  -----------------------------------------------------------------------
  Name                    Description             Units
  ----------------------- ----------------------- -----------------------
  F                       Force                   N

  n                       Angular velocity        rpm

  omega                   Angular velocity        rad/s
  -----------------------------------------------------------------------

## 1.4 Component Types

The components available in this library are depicted in the table below.

+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SYMBOL                                                                                                                                                                                                         | COMPONENTS                                                                                                                                                   | DESCRIPTION                                                                                                                                                                                                                                                                   |
+================================================================================================================================================================================================================+==============================================================================================================================================================+===============================================================================================================================================================================================================================================================================+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image3.png){width="0.6528116797900263in" height="0.47919181977252845in"}  | [Lever2](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#Lever2#Lever2)                                                                   | Lever Model (two points)                                                                                                                                                                                                                                                      |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image4.png){width="0.6458661417322835in" height="0.47224628171478567in"}  | [Lever3](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#Lever3#Lever3)                                                                   | Lever Model (three points)                                                                                                                                                                                                                                                    |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image5.png){width="0.47919181977252845in" height="0.49308070866141734in"} | R_AbsoluteSensor                                                                                                                                             | These components represent different type of sensors (rotational acceleration, angle, power, torque and angular velocity respectively).                                                                                                                                       |
|                                                                                                                                                                                                                |                                                                                                                                                              |                                                                                                                                                                                                                                                                               |
|                                                                                                                                                                                                                | Acceleration                                                                                                                                                 | The output value is transmitted to a CONTROL signal, so a control block can be modelled                                                                                                                                                                                       |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image6.png){width="0.47919181977252845in" height="0.49308070866141734in"} | [R_AbsoluteSensorAngle](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_AbsoluteSensorAngle#R_AbsoluteSensorAngle)                      |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image7.png){width="0.5649945319335083in" height="0.4547156605424322in"}   | [R_AbsoluteSensorPower](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_AbsoluteSensorTorque#R_AbsoluteSensorTorque)                    |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image8.png){width="0.5903083989501312in" height="0.49308070866141734in"}  | [R_AbsoluteSensorTorque](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_AbsoluteSensorTorque#R_AbsoluteSensorTorque)                   |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image9.png){width="0.47919181977252845in" height="0.49308070866141734in"} | [R_AbsoluteSensorVelocity](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_AbsoluteSensorVelocity#R_AbsoluteSensorVelocity)             |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image10.png){width="0.5903083989501312in" height="0.47224628171478567in"} | [R_ActuatorAcceleration](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_ActuatorAcceleration#R_ActuatorAcceleration)                   | These components represent different type of actuators (rotational acceleration, torque and angular velocity respectively)                                                                                                                                                    |
|                                                                                                                                                                                                                |                                                                                                                                                              |                                                                                                                                                                                                                                                                               |
|                                                                                                                                                                                                                |                                                                                                                                                              | They force a mechanical magnitude in one port, which is determined by an input signal.                                                                                                                                                                                        |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image11.png){width="0.5903083989501312in" height="0.47224628171478567in"} | [R_ActuatorTorque](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_ActuatorTorque#R_ActuatorTorque)                                     |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image12.png){width="0.5903083989501312in" height="0.47224628171478567in"} | [R_ActuatorVelocity](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_ActuatorVelocity#R_ActuatorVelocity)                               |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image13.png){width="0.5903083989501312in" height="0.3194608486439195in"}  | [R_BearingFriction](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_BearingFriction#R_BearingFriction)                                  | This component represents a bearing. It includes Coulomb friction in bearings, i.e., a frictional torque acting between a flange and the housing                                                                                                                              |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image14.png){width="0.5903083989501312in" height="0.5625284339457568in"}  | [R_Brake](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Brake#R_Brake)                                                                | This component models a brake, where a controlled normal force presses the flange to the housing in order to increase friction.                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image15.png){width="0.5903083989501312in" height="0.6180872703412074in"}  | [R_Clutch](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Clutch#R_Clutch)                                                             | This component represents a clutch It can be engaged and disengaged. Coulomb friction is present between the two flanges which are pressed together via a normal force.                                                                                                       |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image16.png){width="0.5903083989501312in" height="0.6180872703412074in"}  | [R_Clutch](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Clutch#R_Clutch)Basic                                                        |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image17.png){width="0.5903083989501312in" height="0.34029527559055117in"} | [R_Damper](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Damper#R_Damper)                                                             | This component represents an ideal rotational damper.                                                                                                                                                                                                                         |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image18.png){width="0.5903083989501312in" height="0.34029527559055117in"} | [R_Efficiency](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Efficiency#R_Efficiency)                                                 | This component represents the effect of mechanical losses in terms of efficiency.                                                                                                                                                                                             |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image19.png){width="0.7014249781277341in" height="0.6597561242344707in"}  | [R_ElastoBacklash](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_ElastoBacklash#R_ElastoBacklash)                                     | It represents a backlash element connected in series to a helicoidal spring and damper element which are connected in parallel.                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image20.png){width="0.451411854768154in" height="0.3194608486439195in"}   | [R_FixedTorque](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_FixedTorque#R_FixedTorque)                                              | These components represents constant boundary conditions in torque and in angular velocity respectively                                                                                                                                                                       |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image21.png){width="0.451411854768154in" height="0.3125164041994751in"}   | [R_FixedVelocity](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_FixedVelocity#R_FixedVelocity)                                        |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image22.png){width="0.5903083989501312in" height="0.4375229658792651in"}  | [R_Gear](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Gear#R_Gear)                                                                   | This component includes the following components: an ideal Gear, a BearingFriction, a rotational Efficiency and a ElastoBacklash. The inertia of the gear wheels should be taken into account by connecting components of type R_Inertia to the inlet and/or the outlet ports |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image23.png){width="0.5903083989501312in" height="0.513915135608049in"}   | [R_GearFriction](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_GearFriction#R_GearFriction)                                           | It models the gear ratio and the losses of a standard gear box in a reliable way including the stuck phases that may occur at zero speed                                                                                                                                      |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image24.png){width="0.5903083989501312in" height="0.513915135608049in"}   | [R_GearIdeal](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_GearIdeal#R_GearIdeal)                                                    | [This component represents a frictionless gearbox that transforms a rotational movement](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_GearIdeal#R_GearIdeal)                                                                                          |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image25.png){width="0.5903083989501312in" height="0.3194608486439195in"}  | [R_GearIdealR2T](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_GearIdealR2T#R_GearIdealR2T)                                           | This component represents a frictionless gearbox that transforms a rotational movement into a linear movement                                                                                                                                                                 |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image26.png){width="0.5903083989501312in" height="0.3194608486439195in"}  | [R_Inertia](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Inertia#R_Inertia)                                                          | This component calculates the movement (second derivative of the angular position) of a rotating mass with inertia                                                                                                                                                            |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image27.png){width="0.5903083989501312in" height="0.6319772528433946in"}  | [R_Piston](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Piston#R_Piston)                                                             | Dynamic model of an angular Piston submitted to the forces of pressure, spring, friction \...                                                                                                                                                                                 |
|                                                                                                                                                                                                                |                                                                                                                                                              |                                                                                                                                                                                                                                                                               |
|                                                                                                                                                                                                                |                                                                                                                                                              | Discrete events are foreseen to stop the piston when the stops are reached                                                                                                                                                                                                    |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image28.png){width="0.6041972878390202in" height="0.49308070866141734in"} | [R_RelativeSensorAcceleration](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_RelativeSensorAcceleration#R_RelativeSensorAcceleration) | These components represent different type of relative sensors (relative acceleration, relative angle and relative angular velocity respectively).                                                                                                                             |
|                                                                                                                                                                                                                |                                                                                                                                                              |                                                                                                                                                                                                                                                                               |
|                                                                                                                                                                                                                |                                                                                                                                                              | The output value is transmitted to a CONTROL signal, so a control block can be modelled                                                                                                                                                                                       |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image29.png){width="0.6041972878390202in" height="0.49308070866141734in"} | [R_RelativeSensorAngle](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_RelativeSensorAngle#R_RelativeSensorAngle)                      |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image30.png){width="0.6041972878390202in" height="0.49308070866141734in"} | [R_RelativeSensorSpeed](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_RelativeSensorSpeed#R_RelativeSensorSpeed)                      |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image31.png){width="0.5903083989501312in" height="0.3194608486439195in"}  | [R_Spring](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Spring#R_Spring)                                                             | This component represents an ideal rotational spring                                                                                                                                                                                                                          |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image32.png){width="0.5903083989501312in" height="0.3194608486439195in"}  | [R_SpringBacklash](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_SpringBacklash#R_SpringBacklash)                                     | This component represents a spring with a dead zone where the spring does not act.                                                                                                                                                                                            |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image33.png){width="0.7014249781277341in" height="0.6597561242344707in"}  | [R_SpringDamper](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_SpringDamper#R_SpringDamper)                                           | This component represents a spring and a damper element connected in parallel                                                                                                                                                                                                 |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image34.png){width="0.5903083989501312in" height="0.3194608486439195in"}  | [R_Stop](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#R_Stop#R_Stop)                                                                   | Rotating mass with inertia and stops                                                                                                                                                                                                                                          |
|                                                                                                                                                                                                                |                                                                                                                                                              |                                                                                                                                                                                                                                                                               |
|                                                                                                                                                                                                                |                                                                                                                                                              | Discrete events are foreseen to stop the mass when the stops are reached                                                                                                                                                                                                      |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image35.png){width="0.451411854768154in" height="0.5625284339457568in"}   | [T_AbsoluteSensorAcceleration](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_AbsoluteSensorAcceleration#T_AbsoluteSensorAcceleration) | These components represent different type of translational sensors (acceleration, force, position and velocity respectively).                                                                                                                                                 |
|                                                                                                                                                                                                                |                                                                                                                                                              |                                                                                                                                                                                                                                                                               |
|                                                                                                                                                                                                                |                                                                                                                                                              | The output value is transmitted to a CONTROL signal, so a control block can be modelled                                                                                                                                                                                       |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image36.png){width="0.5903083989501312in" height="0.5625284339457568in"}  | [T_AbsoluteSensorForce](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_AbsoluteSensorForce#T_AbsoluteSensorForce)                      |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image37.png){width="0.451411854768154in" height="0.5625284339457568in"}   | [T_AbsoluteSensorPosition](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_AbsoluteSensorPosition#T_AbsoluteSensorPosition)             |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                                                                                                                               |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image38.png){width="0.451411854768154in" height="0.5625284339457568in"}   | [T_AbsoluteSensorVelocity](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_AbsoluteSensorVelocity#T_AbsoluteSensorVelocity)             |                                                                                                                                                                                                                                                                               |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SYMBOL                                                                                                                                                                                                         | COMPONENTS                                                                                                                                 | DESCRIPTION                                                                                                                                                        |
+================================================================================================================================================================================================================+============================================================================================================================================+====================================================================================================================================================================+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image39.png){width="0.5903083989501312in" height="0.4236329833770779in"}  | [T_ActuatorAcceleration](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_ActuatorAcceleration#T_ActuatorAcceleration) | These components represent different type of translational actuators (acceleration, force and position respectively)                                               |
|                                                                                                                                                                                                                |                                                                                                                                            |                                                                                                                                                                    |
|                                                                                                                                                                                                                |                                                                                                                                            | They force a mechanical magnitude in one port, which is determined by an input signal.                                                                             |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                    |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image40.png){width="0.5903083989501312in" height="0.4236329833770779in"}  | [T_ActuatorForce](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_ActuatorForce#T_ActuatorForce)                      |                                                                                                                                                                    |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                    |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image41.png){width="0.5903083989501312in" height="0.4236329833770779in"}  | [T_ActuatorPosition](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_ActuatorPosition#T_ActuatorPosition)             |                                                                                                                                                                    |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image42.png){width="0.5903083989501312in" height="0.34029527559055117in"} | [T_Damper](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_Damper#T_Damper)                                           | This component represents an ideal damper                                                                                                                          |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image43.png){width="0.4027985564304462in" height="0.36807414698162727in"} | [T_EWall](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_EWall#T_EWall)                                              | Wall with viscous coefficient .This element simulates a solid wall that allows shocks and bounces with it by means of calculating the reaction force of the ground |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image44.png){width="0.7014249781277341in" height="0.5347495625546806in"}  | [T_ElastoGap](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_ElastoGap#T_ElastoGap)                                  | Ideal spring damper combination with gap. This component represents a translational spring damper combination with gap                                             |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image45.png){width="0.451411854768154in" height="0.3125164041994751in"}   | [T_FixedAcceleration](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_FixedAcceleration#T_FixedAcceleration)          | These components represents constant boundary conditions in translational acceleration, force and position respectively                                            |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                    |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image46.png){width="0.451411854768154in" height="0.3125164041994751in"}   | [T_FixedForce](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_FixedForce#T_FixedForce)                               |                                                                                                                                                                    |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+                                                                                                                                                                    |
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image47.png){width="0.451411854768154in" height="0.3125164041994751in"}   | [T_FixedPosition](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_FixedPosition#T_FixedPosition)                      |                                                                                                                                                                    |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image48.png){width="0.5903083989501312in" height="0.6597561242344707in"}  | [T_Piston](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_Piston#T_Piston)                                           | Dynamic model of a Piston submitted to the forces of pressure, spring, friction \...                                                                               |
|                                                                                                                                                                                                                |                                                                                                                                            |                                                                                                                                                                    |
|                                                                                                                                                                                                                |                                                                                                                                            | Discrete events are foreseen to stop the piston when the stops are reached                                                                                         |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image49.png){width="0.5903083989501312in" height="0.15278543307086614in"} | [T_Rod](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_Rod#T_Rod)                                                    | This component represents a rod without inertia and two rigidly connected flanges                                                                                  |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image50.png){width="0.5903083989501312in" height="0.3125164041994751in"}  | [T_SlidingMass](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_SlidingMass#T_SlidingMass)                            | This component calculates the movement (second derivative of the position) of a sliding mass in longitudinal movement                                              |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image51.png){width="0.5903083989501312in" height="0.2083442694663167in"}  | [T_Spring](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_Spring#T_Spring)                                           | This component represents an ideal spring                                                                                                                          |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image52.png){width="0.7014249781277341in" height="0.21528871391076115in"} | [T_SpringBacklash](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_SpringBacklash#T_SpringBacklash)                   | This component represents a spring with a dead zone where the spring does not act                                                                                  |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image53.png){width="0.7014249781277341in" height="0.5208595800524934in"}  | [T_SpringDamper](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_SpringDamper#T_SpringDamper)                         | Ideal linear damper and spring in parallel. This component represents a spring and a damper element connected in parallel                                          |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image54.png){width="0.5903083989501312in" height="0.35418525809273843in"} | [T_Stop](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_Stop#T_Stop)                                                 | This component represents a sliding mass with hard stop and Stribeck friction.                                                                                     |
|                                                                                                                                                                                                                |                                                                                                                                            |                                                                                                                                                                    |
|                                                                                                                                                                                                                |                                                                                                                                            | Discrete events are foreseen to stop the mass when the stops are reached                                                                                           |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image55.png){width="0.4027985564304462in" height="0.35418525809273843in"} | [T_Wall](file:///E:\EcosimPro_4.4\USER_LIBS\MECHANICAL\docs\MECHANICAL.html#T_Wall#T_Wall)                                                 | Wall with restitution coefficient. This component simulates a solid wall that allows shocks and bounces with it by means of a restitution coefficient.             |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Other components that a user may possibly require can be easily built by means of inheritance and aggregation of present components. In this respect, the \"[R_Gear](file:///E:\EcosimPro_4.4\USER_LIBS\ELECTRICAL\docs\ELECTRICAL.html#Line_LRCG#Line_LRCG)\" component is an example of a topological model behaving as a new component where several more simple units have been aggregated:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image56.png){width="6.5in" height="1.1041666666666667in"}

For a detailed description of the formulation and input data, please refer to the "htm" file present in the DOC directory of the Library

## 1.5 Sign convention

The direction of the arrows of the ports corresponds to the positive direction of the forces and displacements. The sign convention for translational or rotational ports is:

- Displacements are positive if they go from an IN port (marked with an inlet arrow, see figure below) to an OUT port (marked with an outlet arrow).

- Forces (or torques) are positive, either at inlet or outlet ports, if they will favor a positive movement of the mass.

In other words, If the force (torque) and the velocity in an inlet port are both positive, there is a power input in the component. Similarly, if the force (torque) and the velocity in an outlet port are both positive, there is a power output in the component

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image57.png){width="1.8125929571303587in" height="0.798652668416448in"} ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image58.png){width="1.5903597987751532in" height="0.840320428696413in"}

There is no restriction in the way the ports of a component are connected: Positive with negative, two positive ports together or two negative ports.

# 2 Abstract Components of MECHANICAL library

## 2.1 Component R_AbsFriction

### 2.1.1 Description

Abstract component of rotational coulomb friction components. This component is used as a base component of Coulomb friction elements. It calculates the configuration mode of the Coulomb friction elements: Free, Forward, Backward or Stuck by means of the variable "imode".

The meaning of the values of the "imode" variable is shown in the following table:

 

  --------------------------------------------------
  Mode      Meaning
  --------- ----------------------------------------
  -2        The element rotates backward

  -1        The element starts to rotate backward

  0         The element is stuck

  1         The element starts to rotate forward

  2         The element rotates forward

  3         The element is not active, it is free.
  --------------------------------------------------

### 2.1.2 Variables

  --------------------------------------------------------------------------------------------------------------------------
  NAME        TYPE      DEFAULT   RANGE   DESCRIPTION                                                             UNITS
  ----------- --------- --------- ------- ----------------------------------------------------------------------- ----------
  a_relfric   REAL                        Relative angular acceleration between frictional surfaces               rad/s\^2

  free        BOOLEAN   FALSE             TRUE, if frictional element is not active                               \-

  imode       INTEGER   -2                Operation mod                                                           \-

  sa          REAL                        Path parameter of friction characteristic                               \-

  tau         REAL                        Friction torque: positive, if directed in opposite direction of w_rel   N·m

  tau0        REAL                        Friction torque for w=0 and forward sliding                             N·m

  tau0_max    REAL                        Maximum friction torque for w=0 and locked                              N·m

  w_relfric   REAL                        Relative angular velocity between frictional surface                    
  --------------------------------------------------------------------------------------------------------------------------

### 2.1.3 Formulation

The component calls the function fun_R_AbsFriction to calculate the configuration mode of the Coulomb friction elements.

fun_R_AbsFriction(imode, a_relfric, sa, tau0) = 0

## 2.2 Component R_AbsoluteSensor

Inherited from CONTROL.Asensor

### 2.2.1 Description

Abstract class for definition of generic rotational absolute sensors. This abstract component is the base for rotational kinetic sensors (acceleration, velocity and angle sensors). In this type of components, the measure of the magnitude is carried out in one single port. This is why these components are called \"Absolute\".

This component has one mechanical rotational port and one signal port.

### 2.2.2 Parameters

  --------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION
  ------- --------- --------- ----------------------
  n_out   INTEGER   1         Dimension of outputs

  --------------------------------------------------

### 2.2.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                     PARAMETERS      DIRECTION   DESCRIPTION
  ------- -------------------------------------------------------------------------------------------------------- --------------- ----------- ----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                             IN          Rotational mechanical inlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)   (n = n_out)     OUT         Outlet signal
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.2.4 Data

  ---------------------------------------------------------------------------
  NAME            TYPE    DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------- --------- ------- ------------------------- -------
  bias\[n_out\]   REAL    0                 Bias                      \-

  Gain\[n_out\]   REAL    1                 Gain                      \-
  ---------------------------------------------------------------------------

### 2.2.5 Variables

  --------------------------------------------------------------------------
  NAME           TYPE    INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ------- --------- ------- ------------------------- -------
  var\[n_out\]   REAL                      Measured variable         \-

  --------------------------------------------------------------------------

## 2.3 Component R_Actuator

### 2.3.1 Description

Abstract class for definition of generic rotational actuators. This abstract component is the base for rotational actuators that transform input signal into mechanical magnitudes such as velocity or momentum.

This component has one mechanical rotational port and one signal port.

### 2.3.2 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                     PARAMETERS   DIRECTION   DESCRIPTION
  ------- -------------------------------------------------------------------------------------------------------- ------------ ----------- ------------------------------------
  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT         Outlet rotational mechanical port 

  s_in    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)                IN          Input signal port 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 2.4 Component R_Compliant

Inherited from R_Two_Flanges.

### 2.4.1 Description

Abstract class for definition of a compliant connection of two rotational ports. This abstract component is the base for components where the relative angular velocity between its two ports may change. The momentum in the ports are identical. It is used by components like sliding springs and dampers. 

### 2.4.2  Ports

  ----------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- -------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN          Left / driven mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT         Right / driven mech_rot
  ----------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.4.3 Data

  --------------------------------------------------------------------------------------
  NAME        TYPE    DEFAULT   RANGE   DESCRIPTION                              UNITS
  ----------- ------- --------- ------- ---------------------------------------- -------
  phi_rel_i   REAL    0                 Initial angular distance between ports   rad

  --------------------------------------------------------------------------------------

### 2.4.4 Variables

  ----------------------------------------------------------------------------
  NAME      TYPE    DEFAULT   RANGE   DESCRIPTION                      UNITS
  --------- ------- --------- ------- -------------------------------- -------
  T         REAL                      Rotational transmited torque     N·m

  phi_rel   REAL                      Angular distance between ports   rad
  ----------------------------------------------------------------------------

### 2.4.5 Formulation

The mathematical model associated to this component is given as follows:

- Relative angle:             phi_rel = m_out.phi -- m_in.phi

- Torque in inlet port:      m_in.tau = tau

- Torque in outlet port:    m_out.tau = tau

The outlet torque is equal to the inlet torque.

## 2.5 Component R_RelativeSensor

Inherited from CONTROL.Asensor

### 2.5.1 Description

Abstract class for definition of generic rotational relative sensors. This abstract component is the base for rotational sensors that generate its signal by comparing the values of a given magnitude in two ports. This is why these components are called \"Relative\". The sensors created from this abstract component must be placed in series.

This component has two mechanical rotational ports and one signal port.

### 2.5.2 Parameters

  --------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION
  ------- --------- --------- ----------------------
  n_out   INTEGER   1         Dimension of outputs

  --------------------------------------------------

### 2.5.3 Ports

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                     PARAMETERS      DIRECTION   DESCRIPTION
  ------- -------------------------------------------------------------------------------------------------------- --------------- ----------- -----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                             IN          Rotational mechanical inlet port

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                             OUT         Rotational mechanical outlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)   (n = n_out)     OUT         Outlet signal
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.5.4 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 2.5.5 Variables

  --------------------------------------------------------------------------
  NAME           TYPE    INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ------- --------- ------- ------------------------- -------
  var\[n_out\]   REAL                      Measured variable         \-

  --------------------------------------------------------------------------

## 2.6 Component R_Rigid

Inherited from R_Two_Flanges

### 2.6.1 Description

This abstract component is the base for rotational components where a constant angular velocity w is considered. This angular velocity is supplied to the ports. On the other hand, the momentum in the ports can be different. It is used by components like inertia.

### 2.6.2 Ports

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- -----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN          Rotational mechanical inlet port

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT         Rotational mechanical outlet port
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.6.3 Variables

  --------------------------------------------------------------------
  NAME   TYPE    INITIAL   RANGE   DESCRIPTION                 UNITS
  ------ ------- --------- ------- --------------------------- -------
  w      REAL                      Absolute angular velocity   rad/s

  --------------------------------------------------------------------

### 2.6.4 Formulation

The mathematical model associated to this component is shown below:

 

- Angular velocity at inlet port:    m_in.omega = w

- Angular velocity at outlet port: m_out.omega = w

 

The two mechanical connections (flanges) have the same angular speed.

## 2.7 Component R_Two_Flanges

### 2.7.1 Description

Abstract class for definition of components with two rotational ports. This abstract component is the base for two ports rotational components: It provides two mechanical rotational ports without any internal calculation.

### 2.7.2 Ports

  -----------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN          Left / driven mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT         Right / driven mech_rott
  -----------------------------------------------------------------------------------------------------------------------------------------------------------

## 2.8 Component T_AbsoluteSensor

Inherited from CONTROL.Asensor

### 2.8.1 Description

Abstract class for definition of generic translational absolute sensors. This abstract component is the base for translational kinetic sensors (acceleration, velocity and position sensors). In this type of components, the measure of the magnitude is carried out in one single port. This is why these components are called \"Absolute\". This component has one mechanical translational port and one signal port.

### 2.8.2 Parameters

  --------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION
  ------- --------- --------- ----------------------
  n_out   INTEGER   1         Dimension of outputs

  --------------------------------------------------

### 2.8.3 Ports

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                     PARAMETERS      DIRECTION   DESCRIPTION
  ------- -------------------------------------------------------------------------------------------------------- --------------- ----------- -----------------------
  m_in    [PORTS_LIB.mech\_](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)trans                          IN          Mechanical left port 

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)   (n = n_out)     OUT         Outlet signal
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.8.4 Data

  ---------------------------------------------------------------------------
  NAME            TYPE    DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------- --------- ------- ------------------------- -------
  bias\[n_out\]   REAL    0                 Bias                      \-

  gain\[n_out\]   REAL    1                 Gain                      \-
  ---------------------------------------------------------------------------

### 2.8.5 Variables

  --------------------------------------------------------------------------
  NAME           TYPE    INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ------- --------- ------- ------------------------- -------
  var\[n_out\]   REAL                      Measured variable         \-

  --------------------------------------------------------------------------

## 2.9 Component T_Actuator

### 2.9.1 Description

Abstract class for definition of generic translational actuators. This abstract component is the base for translational actuators that transform input signal into mechanical magnitudes such as position or force. This component has one mechanical translational port and one signal port.

### 2.9.2 Ports

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                     PARAMETERS   DIRECTION   DESCRIPTION
  ------- -------------------------------------------------------------------------------------------------------- ------------ ----------- --------------------------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        OUT         Output translational mechanical port

  s_in    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)                IN          Input signal port
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 2.10 Component T_Compliant

Inherited from T_Two_Flanges.

### 2.10.1 Description

Abstract class for definition of a compliant connection of two translational ports. This abstract component is the base for translational components where the relative position between its two ports may change. The force in the ports are identical but opposite. It is used by components like springs and dampers.

### 2.10.2  Ports

  --------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                              PARAMETERS   DIRECTION   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------- ------------ ----------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN          Left / driven mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT         Right / driven mech_trans
  --------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.10.3 Variables

  --------------------------------------------------------------------------
  NAME    TYPE    DEFAULT   RANGE   DESCRIPTION                      UNITS
  ------- ------- --------- ------- -------------------------------- -------
  F       REAL                      Translational transmited force   N

  s_rel   REAL                      Distance between ports           rad
  --------------------------------------------------------------------------

### 2.10.4 Formulation

The mathematical formulation associated to this component are the following:

- Relative displacement: s_rel = m_out.s - m_in.s

- Force at inlet port:        m_in.F = -F

- Force at outlet port:     m_out.F = F

## 2.11 Component T_RelativeSensor

Inherited from CONTROL.Asensor

### 2.11.1 Description

Abstract class for definition of generic translational relative sensors. This abstract component is the base for translational sensors that generate its signal by comparing the values of a given magnitude in two ports. This is why these components are called \"Relative\". The sensors created from this abstract component must be placed in series. This component has two mechanical translational ports and one signal port.

### 2.11.2 Parameters

  --------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION
  ------- --------- --------- ----------------------
  n_out   INTEGER   1         Dimension of outputs

  --------------------------------------------------

### 2.11.3 Ports

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                     PARAMETERS      DIRECTION   DESCRIPTION
  ------- -------------------------------------------------------------------------------------------------------- --------------- ----------- -----------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                           IN          Mechanical left port

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                           OUT         Mechanical right port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)   (n = n_out)     OUT         Outlet signal
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.11.4 Data

  ------------------------------------------------------------------
  NAME   TYPE    DEFAULT   RANGE   DESCRIPTION               UNITS
  ------ ------- --------- ------- ------------------------- -------
  bias   REAL    0                 Bias                      \-

  gain   REAL    1                 Gain                      \-
  ------------------------------------------------------------------

### 2.11.5 Variables

  --------------------------------------------------------------------------
  NAME           TYPE    INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ------- --------- ------- ------------------------- -------
  var\[n_out\]   REAL                      Measured variable         \-

  --------------------------------------------------------------------------

- 

## 2.12 Component T_Rigid

Inherited from T_Two_Flanges

### 2.12.1 Description

Abstract class for definition of a rigid connection of two translational ports. This abstract component is the base for translational components where a constant position s is considered. This position is supplied to the ports. On the other hand, the force in the ports can be different. It is used by components like masses.

### 2.12.2 Ports

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                              PARAMETERS   DIRECTION   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------- ------------ ----------- -----------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN          Left / driving mech_trans 

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT         Right / driving mech_trans 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.12.3 Variables

  -------------------------------------------------------------------------
  NAME   TYPE    INITIAL   RANGE   DESCRIPTION                      UNITS
  ------ ------- --------- ------- -------------------------------- -------
  s      REAL                      Absolute position of component   m

  -------------------------------------------------------------------------

### 2.12.4 Formulation

The mathematical formulation associated to this component is the following:

- Position at inlet port:                m_in.s = s

- Position at outlet port:              m_out.s = s

## 2.13 Component T_Two_Flanges

### 2.13.1 Description

Abstract class for definition of components with two translational ports. This abstract component is the base for two ports translational components: It provides two mechanical translational ports without any internal calculation.

### 2.13.2 Ports

  --------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                              PARAMETERS   DIRECTION   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------- ------------ ----------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN          Left / driven mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT         Right / driven mech_trans
  --------------------------------------------------------------------------------------------------------------------------------------------------------------

# 3 Component Types of MECHANICAL library

## 3.1 Component Lever2

### 3.1.1 Description

Lever with two points

### 3.1.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image59.png){width="1.0520833333333333in" height="1.0104166666666667in"}

### 3.1.3 Ports

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                               PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  --------- -------------------------------------------------------------------------------------------------- ------------ ----------- ------------- -------------
  fulcrum   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                    IN                        

  load1     [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                IN                        

  load2     [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                IN                        
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.1.4 Data

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                               DEFAULT   RANGE   DESCRIPTION                             UNITS
  --------- ---------------------------------------------------------------------------------- --------- ------- --------------------------------------- ---------
  I         REAL                                                                               1                 Inertia of the lever                    kg·m\^2

  L1        REAL                                                                               1                 Distance from load input 1 to fulcrum   m

  L2        [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   0.5               Distance from load input 2 to fulcrum   m 

  phi0      [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   0                 Initial angular position (rad)          rad

  phi_max   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   0.5               Lever upper limit angular position      rad

  phi_min   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   -0.5              Lever lower limit angular position      rad
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.1.5 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                               DEFAULT   RANGE   DESCRIPTION                                UNITS
  --------- ---------------------------------------------------------------------------------- --------- ------- ------------------------------------------ -------
  initial   BOOLEAN                                                                            TRUE                                                         

  phi       REAL                                                                                                 Lever angle                                rad

  s1        [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Displacement of load 1 application point   m  

  s2        [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Displacement of load 2 application point   m
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.1.6 Formulation

This component named is a topologic component. It does not have specific formulation, it consists of the following components:

- R_GearIdealR2T

- R_GearIdealR2T

- R_Stop

## 3.2 Component Lever3

### 3.2.1 Description

Lever with three points

### 3.2.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image60.png){width="1.0520833333333333in" height="1.0in"}

### 3.2.3 Ports

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                               PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  --------- -------------------------------------------------------------------------------------------------- ------------ ----------- ------------- -------------
  fulcrum   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                    IN                        

  load1     [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                IN                        

  load2     [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                IN                        

  load3     [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                IN                        
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.2.4 Data

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                               DEFAULT   RANGE   DESCRIPTION                             UNITS
  --------- ---------------------------------------------------------------------------------- --------- ------- --------------------------------------- ---------
  I         REAL                                                                               1                 Inertia of the lever                    kg·m\^2

  L1        REAL                                                                               1                 Distance from load input 1 to fulcrum   m

  L2        [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   0.5               Distance from load input 2 to fulcrum   m  

  L3        [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   0.5               Distance from load input 3 to fulcrum   m

  phi0      [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   0                 Initial angular position (rad)          rad

  phi_max   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   0.5               Lever upper limit angular position      rad

  phi_min   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   -0.5              Lever lower limit angular position      rad
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.2.5 Variables

  --------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME   TYPE                                                                               DEFAULT   RANGE   DESCRIPTION                                UNITS
  ------ ---------------------------------------------------------------------------------- --------- ------- ------------------------------------------ -------
  phi    REAL                                                                                                 Lever angle                                rad

  s1     [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Displacement of load 1 application point   m  

  s2     [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Displacement of load 2 application point   m

  s3     REAL                                                                                                 Displacement of load 2 application point   m
  --------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.2.6 Formulation

This component named is a topologic component. It does not have specific formulation, it consists of the following components:

- R_GearIdealR2T

- R_GearIdealR2T

- R_GearIdealR2T

- R_Stop

## 3.3 Component R_AbsoluteSensorAcceleration

Inherited from R_AbsoluteSensor.

### 3.3.1 Description

Absolute angular acceleration sensor

### 3.3.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image61.png){width="2.1458333333333335in" height="1.03125in"}

### 3.3.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.3.4 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- ----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN                        Rotational mechanical inlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.3.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias (-)                  \-

  gain\[n_out\]   REAL   1                 Gain (-)                  \-
  --------------------------------------------------------------------------

### 3.3.6 Variables

  --------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               DEFAULT   RANGE   DESCRIPTION                     UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------------- ----------
  ac             REAL                                                                                                 Absolute angular acceleration   rad/s\^2

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable               \-
  --------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.3.7 Formulation

The equations associated to this component are shown below:

 

- Angular acceleration:    ac = m_in.omega'

- Torque:                        m_in.T = 0.

- Output signal:               var\[1\] = ac

## 3.4 Component R_AbsoluteSensorAngle

Inherited from R_AbsoluteSensor.

### 3.4.1 Description

AbsoluteSensorAngle simulates an angle sensor. The measure of the position takes place in one single port. This component has one mechanical input port and one signal output port.

### 3.4.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image62.png){width="1.7395833333333333in" height="1.03125in"}

### 3.4.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.4.4 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- ----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN                        Rotational mechanical inlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.4.5 Data

  ---------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION                UNITS
  --------------- ------ --------- ------- -------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                       \-

  gain\[n_out\]   REAL   1                 Gain                       \-

  phi0            REAL   0                 Initial angular position   rad
  ---------------------------------------------------------------------------

### 3.4.6 Variables

  -------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               DEFAULT   RANGE   DESCRIPTION                 UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- --------------------------- -------
  phi            REAL                                                                                                 Absolute angular position   rad

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable           \-
  -------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.4.7 Formulation

The equations associated to this component are shown below:

 

- Angle:              phi\' = m_in.omega

- Torque:            m_in.T = 0

- Output signal:   var =phi

## 3.5 Component R_AbsoluteSensorPower

Inherited from R_RelativeSensor.

### 3.5.1 Description

AbsoluteSensorPower simulates a power sensor. The measure of the power takes place in two ports. This component has two mechanical ports and one signal port. Additionally, it must be placed in series in the branch where the power has to be measured.

### 3.5.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image63.png){width="1.5712489063867017in" height="0.8973162729658792in"}

### 3.5.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.5.4 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN                        Rotational mechanical inlet port

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT                       Rotational mechanical outlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.5.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.5.6 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               DEFAULT   RANGE   DESCRIPTION               UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------- -------
  P              REAL                                                                                                 Measured power            W

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable         \-
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.5.7 Formulation

The equations associated to this component are shown below:

 

- Ports torque:       m_out.T = m_in.T

- Ports angular velocity:  m_out.omega = m_in.omega

- Power: P = m_in.T\*m_in.omega

- Output signal:              var\[1\] = P

## 3.6 Component R_AbsoluteSensorTorque

Inherited from R_RelativeSensor.

### 3.6.1 Description

This component simulates a torque sensor. The measure of the torque takes place in two ports. This component has two mechanical ports and one signal port. Additionally, it must be placed in series in the branch where the torque has to be measured.

### 3.6.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image64.png){width="1.7916666666666667in" height="1.03125in"}

### 3.6.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.6.4 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN                        Rotational mechanical inlet port

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT                       Rotational mechanical outlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.6.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.6.6 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               DEFAULT   RANGE   DESCRIPTION               UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------- -------
  T              REAL                                                                                                 Measured torque           N·m

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable         \-
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.6.7 Formulation

The equations associated to this component are shown below:

 

- Torque at inlet port:      m_in.T = T

- Torque at outlet port:   m_out.T = T

- Ports angular velocity:  m_out.omega = m_in.omega

- Output signal:               var\[1\] = T

## 3.7 Component R_AbsoluteSensorVelocity

Inherited from R_AbsoluteSensor.

### 3.7.1 Description

AbsoluteSensorVelocity simulates an angular velocity sensor. The measure of the velocity takes place in one single port. This component has one mechanical input port and one signal output port.

### 3.7.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image65.png){width="1.8645833333333333in" height="1.03125in"}

### 3.7.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.7.4 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- ----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN                        Rotational mechanical inlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.7.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.7.6 Variables

  -------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               DEFAULT   RANGE   DESCRIPTION                 UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- --------------------------- -------
  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable           \-

  w              REAL                                                                                                 Absolute angular velocity   rad/s
  -------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.7.7 Formulation

The equations associated to this component are shown below:

 

- Angular velocity:          w = m_in.omega

- Torque:                        m_in.T = 0

- Output signal:               var\[1\] = w

## 3.8 Component R_ActuatorAcceleration

Inherited from R_Actuator.

### 3.8.1 Description

ActuatorAcceleration forces a mechanical angular acceleration in one port, which is determined by an input signal. This component has one mechanical port and one signal port.

### 3.8.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image66.png){width="1.6979166666666667in" height="1.0in"}

### 3.8.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------------------
  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT                       Rotational mechanical outlet port

  s_in    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     IN                        Input signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.8.4 Data

  -------------------------------------------------------------------
  NAME    TYPE   DEFAULT   RANGE   DESCRIPTION                UNITS
  ------- ------ --------- ------- -------------------------- -------
  wi      REAL   0                 Initial angular velocity   rad/s

  -------------------------------------------------------------------

### 3.8.5 Formulation

The mathematical equations governing this component are given as follows:

 

- Input signal:                             a = input.signal

- Angular velocity:                      a = m_out.omega'

## 3.9 Component R_ActuatorTorque

Inherited from R_Actuator.

### 3.9.1 Description

T_ActuatorTorque generates a mechanical torque from an input signal. This component has one mechanical port and one signal port.

### 3.9.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image67.png){width="1.3333333333333333in" height="1.0in"}

### 3.9.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------------------
  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT                       Rotational mechanical outlet port

  s_in    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     IN                        Input signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.9.4 Formulation

The mathematical equation governing this component is given as follows:

 

- Port torque:      m_out.T = s_in.signal\[1\]

## 3.10 Component R_ActuatorVelocity

Inherited from R_Actuator.

### 3.10.1 Description

R_ActuatorVelocity forces a mechanical angular velocity in one port, which is determined by an input signal. This component has one mechanical port and one signal port.

### 3.10.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image68.png){width="1.4270833333333333in" height="1.0in"}

### 3.10.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------------------
  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT                       Rotational mechanical outlet port

  s_in    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     IN                        Input signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.10.4 Formulation

The mathematical equation governing this component is given as follows:

 

- Angular velocity:          m_out.omega = s_in.signal\[1\]

## 3.11 Component R_BearingFriction

Inherited from R_Rigid and R_AbsFriction.

### 3.11.1 Description

This component represents a bearing that is a mechanical component used to reduce friction in a machine. It describes Coulomb friction in bearings, i.e., a frictional torque acting between a flange and the housing.

### 3.11.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image69.png){width="1.3333333333333333in" height="0.7708333333333334in"}

### 3.11.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driving mech_rot
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.11.4 Data

  ------------------------------------------------------------------------------------------------------------
  NAME      TYPE       DEFAULT   RANGE   DESCRIPTION                                                   UNITS
  --------- ---------- --------- ------- ------------------------------------------------------------- -------
  peak      REAL       1                 Auxiliary variable to calculate the maximum friction torque   \-

  tau_pos   TABLE_1D                     Positive sliding friction characteristic for positive speed   \-
  ------------------------------------------------------------------------------------------------------------

### 3.11.5 Variables

  --------------------------------------------------------------------------------------------------------------------------
  NAME        TYPE      DEFAULT   RANGE   DESCRIPTION                                                             UNITS
  ----------- --------- --------- ------- ----------------------------------------------------------------------- ----------
  a           REAL                        Absolute angular acceleration                                           rad/s\^2

  a_relfric   REAL                        Relative angular acceleration between frictional surfaces               rad/s\^2

  free        BOOLEAN   FALSE             TRUE, if frictional element is not active                               \-

  imode       INTEGER   -2                Operation mod                                                           \-

  sa          REAL                        Path parameter of friction characteristic                               \-

  tau         REAL                        Friction torque: positive, if directed in opposite direction of w_rel   N·m

  tau0        REAL                        Friction torque for w=0 and forward sliding                             N·m

  tau0_max    REAL                        Maximum friction torque for w=0 and locked                              N·m

  w           REAL                        Absolute angular velocity                                               rad/s

  w_relfric   REAL                        Relative angular velocity between frictional surface                    
  --------------------------------------------------------------------------------------------------------------------------

### 3.11.6 Formulation

The mathematical model associated to this component is shown below:

- Angular velocity at inlet port:    m_in.omega = w

- Angular velocity at outlet port: m_out.omega = w

The two mechanical connections (flanges) have the same angular speed.

The positive sliding friction torque \"tau\" has to be defined by table \"tau_pos\" as function of the absolute angular velocity \"w\". This torque is calculated interpolating linearly in the table with the value of the angular velocity. It is assumed that the negative sliding friction force has the same characteristic with negative values. Friction is modelled in the following way:

 

When the absolute angular velocity \"w\" is not zero, the friction torque is a function of w and of a constant normal force. This dependency is defined via table tau_pos and can be determined by measurements, e.g. by driving the gear with constant velocity and measuring the needed motor torque (friction torque).

 

tau = ZONE(imode == 0)

                  sa

      ZONE(imode == 2 OR imode == 1)

                  linearInterp1D(tau_pos, w)

      ZONE(imode == -2 OR imode == -1)

                  -linearInterp1D(tau_pos, -w)

      OTHERS

                  0.0

 

When the absolute angular velocity becomes zero, the elements connected by the friction element become stuck, i.e., the absolute angle remains constant. In this phase the friction torque is calculated from a torque balance due to the requirement, that the absolute acceleration shall be zero. The elements begin to slide when the friction torque exceeds a threshold value, called the maximum static friction torque "tau0_max", computed via:

 

tau0_max = peak \* tau0

 

where tau0 is the sliding friction torque when the angular velocity is zero.

This procedure is implemented by state events and leads to continuous/discrete systems.

## 3.12 Component R_Brake

Inherited from R_Rigid and R_AbsFriction.

### 3.12.1 Description

This component models a brake, that is., a component where a frictional torque is acting between the housing and a flange and a controlled normal force presses the flange to the housing in order to increase friction.

### 3.12.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image70.png){width="0.9583333333333334in" height="1.125in"}

### 3.12.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                     PARAMETERS   DIRECTION   DESCRIPTION
  --------- -------------------------------------------------------------------------------------------------------- ------------ ----------- ----------------------------------------------------------------------------
  inPort    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)   (n = 1)      IN          Normalized force signal (= normal_force/fn_max; clutch is engaged if \> 0)

  m_in      [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN          Left / driving mech_rot

  m_out     [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT         Right / driving mech_rot
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.12.4 Data

  --------------------------------------------------------------------------------------------------------------
  NAME      TYPE       DEFAULT   RANGE   DESCRIPTION                                                     UNITS
  --------- ---------- --------- ------- --------------------------------------------------------------- -------
  cgeo      REAL       1                 Geometry constant containing friction distribution assumption   

  fn_max    REAL       20                Maximum normal force                                            N

  mue_pos   TABLE_1D                     \[w,mue\] positive sliding friction coefficient: w_rel\>=0      

  peak      REAL       1.1               Maximum value of mue for w_rel=0                                \-

  w_i       REAL       1                 Initial relative angular velocity                               rad/s
  --------------------------------------------------------------------------------------------------------------

### 3.12.5 Variables

  --------------------------------------------------------------------------------------------------------------------------
  NAME        TYPE      DEFAULT   RANGE   DESCRIPTION                                                             UNITS
  ----------- --------- --------- ------- ----------------------------------------------------------------------- ----------
  a           REAL                        Absolute angular acceleration                                           rad/s\^2

  a_relfric   REAL                        Relative angular acceleration between frictional surfaces               rad/s\^2

  fn          REAL                        Normal force                                                            N

  free        BOOLEAN   FALSE             TRUE, if frictional element is not active                               \-

  imode       INTEGER   -2                Operation mod                                                           \-

  mue0        REAL                        Friction coefficient for w=0 and forward sliding                        \-

  sa          REAL                        Path parameter of friction characteristic                               \-

  tau         REAL                        Friction torque: positive, if directed in opposite direction of w_rel   N·m

  tau0        REAL                        Friction torque for w=0 and forward sliding                             N·m

  tau0_max    REAL                        Maximum friction torque for w=0 and locked                              N·m

  w           REAL                        Absolute angular velocity                                               rad/s

  w_relfric   REAL                        Relative angular velocity between frictional surface                    
  --------------------------------------------------------------------------------------------------------------------------

### 3.12.6 Formulation

The mathematical model associated to this component is shown below:

- Angular velocity at inlet port:    m_in.omega = w

- Angular velocity at outlet port: m_out.omega = w

 

The two mechanical connections (flanges) have the same angular speed.

The normal force "fn" has to be provided as input signal "InPort.signal\[1\]" in a normalized form: 

fn = fn_max\* InPort.signal\[1\]

where "fn_max" has to be provided as input data. Friction in the brake is modelled in the following way:

When the absolute angular velocity \"w\" is not zero, the friction torque "tau" is a function of the velocity dependent friction coefficient given by the table "mue_pos" , of the normal force \"fn\", and of a geometry constant \"cgeo\" which takes into account the geometry of the device and the assumptions on the friction distributions:

tau = cgeo\*fn\*linearInterp1D(mue_pos, w)

 

The value of the friction coefficient is computed by interpolating linearly in the table "mue_pos" with the value of the angular velocity:

mue = linearInterp1D(mue_pos, w)

Typical values of coefficients of friction:

- dry operation   :  mue = 0.2 .. 0.4

- operating in oil:   mue = 0.05 .. 0.1

When plates are pressed together, where ri is the inner radius, ro is the outer radius and N is the number of friction interfaces, the geometry constant is calculated in the following way under the assumption of a uniform rate of wear at the interfaces:

cgeo = N\*(r0 + ri)/2

When the absolute angular velocity becomes zero, the elements connected by the friction element become stuck, i.e., the absolute angle remains constant. In this phase the friction torque is calculated from a torque balance due to the requirement, that the absolute acceleration shall be zero. The elements begin to slide when the friction torque "tau" exceeds a threshold value "tau0_max", called the maximum static friction torque, computed via:

tau0_max = peak \* cgeo \* fn \* linearInterp1D(mue_pos, 0.0)  

This procedure is implemented by state events and leads to continuous/discrete systems of equations.

## 3.13 Component R_Clutch

Inherited from R_AbsFriction and R_Compliant.

### 3.13.1 Description

This component rerpresents a clutch that is a mechanism for transmitting rotation, which can be engaged and disengaged. It is a component with mechanical ports (flanges) where friction is present between the two flanges and these flanges are pressed together via a normal force. The normal force "fn" has to be provided as input signal "inPort.signal\[1\]" in a normalized form:

 

fn = fn_max\* inPort.signal\[1\]

 

where fn_max has to be provided as input data.

### 3.13.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image71.png){width="0.9583333333333334in" height="1.21875in"}

### 3.13.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                     PARAMETERS   DIRECTION   DESCRIPTION
  --------- -------------------------------------------------------------------------------------------------------- ------------ ----------- ----------------------------------------------------------------------------
  inPort    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)   (n = 1)      IN          Normalized force signal (= normal_force/fn_max; clutch is engaged if \> 0)

  m_in      [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN          Left / driving mech_rot

  m_out     [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT         Right / driving mech_rot
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.13.4 Data

  ----------------------------------------------------------------------------------------------------------------
  NAME        TYPE       DEFAULT   RANGE   DESCRIPTION                                                     UNITS
  ----------- ---------- --------- ------- --------------------------------------------------------------- -------
  cgeo        REAL       1                 Geometry constant containing friction distribution assumption   

  fn_max      REAL       20                Maximum normal force                                            N

  mue_pos     TABLE_1D                     \[w,mue\] positive sliding friction coefficient: w_rel\>=0      

  peak        REAL       1.1               Maximum value of mue for w_rel=0                                \-

  phi_rel_i   REAL       0                 Initial angular distance between ports                          rad

  w_rel_i     REAL       1                 Initial relative angular velocity                               rad/s
  ----------------------------------------------------------------------------------------------------------------

### 3.13.5 Variables

  --------------------------------------------------------------------------------------------------------------------------
  NAME        TYPE      DEFAULT   RANGE   DESCRIPTION                                                             UNITS
  ----------- --------- --------- ------- ----------------------------------------------------------------------- ----------
  T           REAL                        Rotational transmited torque                                            N·m

  a_rel       REAL                        Relative angular acceleration                                           rad/s\^2

  a_relfric   REAL                        Relative angular acceleration between frictional surfaces               rad/s\^2

  fn          REAL                        Normal force                                                            N

  free        BOOLEAN   FALSE             TRUE, if frictional element is not active                               \-

  imode       INTEGER   -2                Operation mod                                                           \-

  mue0        REAL                        Friction coefficient for w=0 and forward sliding                        \-

  phi_rel     REAL                        Angular distance between port                                           rad

  sa          REAL                        Path parameter of friction characteristic                               \-

  tau         REAL                        Friction torque: positive, if directed in opposite direction of w_rel   N·m

  tau0        REAL                        Friction torque for w=0 and forward sliding                             N·m

  tau0_max    REAL                        Maximum friction torque for w=0 and locked                              N·m

  w_rel       REAL                        Relative angular velocity                                               rad/s

  w_relfric   REAL                        Relative angular velocity between frictional surface                    
  --------------------------------------------------------------------------------------------------------------------------

### 3.13.6 Formulation

The mathematical model associated to this component is given as follows:

 

- Relative angle:              phi_rel = m_out.phi -- m_in.phi

- Torque in inlet port:      m_in.tau = tau

- Torque in outlet port:    m_out.tau = tau

 

The outlet torque is equal to the inlet torque.

The friction in the clutch is modelled in the following way:

 

When the relative angular velocity "w_rel" is not zero, the friction torque "tau" is a function of the velocity dependent friction coefficient given by the table "mue_pos" , of the normal force \"fn\", and of a geometry constant \"cgeo\" which takes into account the geometry of the device and the assumptions on the friction distributions:

 

tau = cgeo \* linearInterp1D(mue_pos, w_rel) \* fn

 

The value of the friction coefficient "mue" is computed by interpolating linearly in the table "mue_pos" with the value of the relative angular velocity:

 

mue = linearInterp1D(mue_pos, w_rel)

 

Typical values of coefficients of friction:

 

- dry operation   :  mue = 0.2 .. 0.4

- operating in oil:   mue = 0.05 .. 0.1

 

When plates are pressed together, where ri is the inner radius, ro is the outer radius and N is the number of friction interfaces, the geometry constant is calculated in the following way under the assumption of a uniform rate of wear at the interfaces:

 

cgeo = N\*(r0 + ri)/2

 

When the relative angular velocity becomes zero, the elements connected by the friction element become stuck, i.e., the relative angle remains constant. In this phase the friction torque is calculated from a torque balance due to the requirement, that the relative acceleration shall be zero. The elements begin to slide when the friction torque exceeds a threshold value "tau0_max", called the maximum static friction torque, computed via:

 

tau0_max = peak \* cgeo \* fn \* linearInterp1D(mue_pos, 0.0)  

 

This procedure is implemented by state events and leads to continuous/discrete systems of equations.

## 3.14 Component R_Damper

Inherited from R_Compliant.

### 3.14.1 Description

This component represents an ideal rotational damper. A damper is a general term for a mechanical device that damps vibrations or oscillations.

### 3.14.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image72.png){width="0.9583333333333334in" height="0.8020833333333334in"}

### 3.14.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driving mech_rot
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.14.4 Data

  --------------------------------------------------------------------------------------------
  NAME        TYPE    DEFAULT   RANGE   DESCRIPTION                              UNITS
  ----------- ------- --------- ------- ---------------------------------------- -------------
  d           REAL    0                 Damping constant                         N\*m\*s/rad

  phi_rel_i   REAL    0                 Initial angular distance between ports   rad
  --------------------------------------------------------------------------------------------

### 3.14.5 Variables

  ------------------------------------------------------------------------------------
  NAME      TYPE    DEFAULT   RANGE   DESCRIPTION                              UNITS
  --------- ------- --------- ------- ---------------------------------------- -------
  T         REAL                      Rotational transmited torque             N·m

  phi_rel   REAL                      Angular distance between port            rad

  w_rel     REAL                      Relative angular velocity between port   rad/s
  ------------------------------------------------------------------------------------

### 3.14.6 Formulation

The mathematical model associated to this component is given as follows:

 

- Relative angle:              phi_rel = m_out.phi -- m_in.phi

- Torque in inlet port:      m_in.tau = tau

- Torque in outlet port:    m_out.tau = tau

 

The outlet torque is equal to the inlet torque.

This component calculates a torque T depending on the relative velocity of its ports "w_rel":

T = - d \* w_rel

Where "d" is the damping constant and "w_rel" is the relative velocity of the ports.

## 3.15 Component R_Efficiency

Inherited from R_Rigid.

### 3.15.1 Description

This component represents the effect of mechanical losses in terms of efficiency.

### 3.15.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image73.png){width="1.0208333333333333in" height="0.8020833333333334in"}

### 3.15.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driving mech_rot
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.15.4 Data

  -------------------------------------------------------------------
  NAME    TYPE    DEFAULT   RANGE   DESCRIPTION               UNITS
  ------- ------- --------- ------- ------------------------- -------
  eta     REAL    0                 Efficiency: \[0,1\]       \-

  -------------------------------------------------------------------

### 3.15.5 Variables

  --------------------------------------------------------------------
  NAME   TYPE    DEFAULT   RANGE   DESCRIPTION                 UNITS
  ------ ------- --------- ------- --------------------------- -------
  P_a    REAL                      Power                       W

  w      REAL                      Absolute angular velocity   rad/s
  --------------------------------------------------------------------

### 3.15.6 Formulation

The mathematical model associated to this component is shown below:

- Angular velocity at inlet port:    m_in.omega = w

- Angular velocity at outlet port: m_out.omega = w

The two mechanical connections (flanges) have the same angular speed.

The angular velocity in both ports is the same. If Pin and Pout are the input and output power respectively, the efficiency (h) is defined as:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image74.png){width="0.6979166666666666in" height="0.6145833333333334in"}

It is supposed that Pin ≥ Pout. Since both ports have the same angular velocity, the efficiency can be expressed in terms of torque:

 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image75.png){width="2.6354166666666665in" height="0.7708333333333334in"}

 

Tin and Tout can be defined by any of the two ports. The port that produces positive work is considered "in".

## 3.16 Component R_ElastoBacklash

Inherited from R_Compliant.

### 3.16.1 Description

This component represents a backlash element connected in series to a spring and damper element which are connected in parallel

### 3.16.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image76.png){width="1.3854166666666667in" height="1.28125in"}

### 3.16.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driving mech_rot
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.16.4 Data

  ----------------------------------------------------------------------------------------------------------
  NAME        TYPE    DEFAULT   RANGE   DESCRIPTION                                             UNITS
  ----------- ------- --------- ------- ------------------------------------------------------- ------------
  c           REAL    0                 Spring constant                                         N·m/rad 

  d           REAL    0                 Damping constant                                        N·m\*s/rad

  ddz         REAL    0                 Direct dead zone                                        rad

  idz         REAL    0                 Inverse dead zone                                       rad

  phi_rel0    REAL    0                 Angular distance between ports for unstretched spring   rad

  phi_rel_i   REAL    0                 Initial angular distance between ports                  rad
  ----------------------------------------------------------------------------------------------------------

### 3.16.5 Variables

  -------------------------------------------------------------------------------------
  NAME      TYPE    DEFAULT   RANGE   DESCRIPTION                               UNITS
  --------- ------- --------- ------- ----------------------------------------- -------
  T         REAL                      Rotational transmited torque              N·m

  phi_rel   REAL                      Angular distance between ports            rad

  w_rel     REAL                      Relative angular velocity between ports   rad/s
  -------------------------------------------------------------------------------------

### 3.16.6 Formulation

The mathematical model associated to this component is given as follows:

- Relative angle:              phi_rel = m_out.phi -- m_in.phi

- Torque in inlet port:      m_in.tau = tau

- Torque in outlet port:    m_out.tau = tau

 

The outlet torque is equal to the inlet torque.

To define the dead zone, the user must enter a "direct dead zone" (ddz) and an "inverse dead zone" (idz) angles as component data.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image77.png){width="1.9791666666666667in" height="1.5416666666666667in"}

When the relative rotation angle "phi_rel" is out of the dead zone, this component calculates a torque T as follows:

 

T = - c \* (phi_rel - phi_rel0 - ddz) - d \* w_rel           for phi_rel \>= ddz

T = - c \* (phi_rel - phi_rel0 + idz) - d \* w_rel           for phi_rel \<= idz

 

Where c is the spring constant, phi_rel0 is the relative position when the spring is unloaded and d is the damping constant.

When the relative rotation angle "phi_rel" is within the dead zone, the torque is zero.

## 3.17 Component R_FixedTorque

### 3.17.1 Description

This component generates a constant torque output. In other words, this component represents a boundary condition in torque.

### 3.17.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image78.png){width="1.1666666666666667in" height="0.7708333333333334in"}

### 3.17.3 Ports

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- ------------------------
  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Rotational outlet port

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.17.4 Data

  -------------------------------------------------------------------
  NAME    TYPE    DEFAULT   RANGE   DESCRIPTION               UNITS
  ------- ------- --------- ------- ------------------------- -------
  T0      REAL    0                 Fixed torque value        N·m

  -------------------------------------------------------------------

### 3.17.5 Formulation

The value of the torque at the outlet port is fixed by the value of the input data called T0: 

m_out.T = T0

## 3.18 Component R_FixedVelocity

### 3.18.1 Description

This component generates a constant angular velocity in the port. In other words, this component represents a boundary condition in angular velocity.

### 3.18.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image79.png){width="1.25in" height="0.7708333333333334in"}

### 3.18.3 Ports

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- ------------------------
  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Rotational outlet port

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.18.4 Data

  --------------------------------------------------------------------
  NAME    TYPE    DEFAULT   RANGE   DESCRIPTION               UNITS
  ------- ------- --------- ------- ------------------------- --------
  w0      REAL    0                 Fixed angular velocity    rad/s 

  --------------------------------------------------------------------

### 3.18.5 Formulation

The value of the velocity at the outlet port is fixed by the value of the input data called w0:

 

m_out.omega = w0

## 3.19 Component R_Gear

Inherited from R_Two_Flanges.

### 3.19.1 Description

This component models the essential effects of a gearbox, in particular gear efficiency due to friction between the teeth, bearing friction, gear elasticity and damping, backlash. The inertia of the gear wheels is not modeled. Inertia can be taken into account by connecting components of type R_Inertia to the inlet and/or the outlet ports.

### 3.19.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image80.png){width="0.9583333333333334in" height="0.9479166666666666in"}

### 3.19.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driving mech_rot
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.19.4 Data

  ------------------------------------------------------------------------------------------------
  NAME           TYPE    DEFAULT   RANGE   DESCRIPTION                                 UNITS
  -------------- ------- --------- ------- ------------------------------------------- -----------
  b              REAL    0                 Total backlash                              rad

  c              REAL    0                 Gear elasticity                             N·m/rad 

  d              REAL    0                 Gear damping                                N·m·s/rad

  eta            REAL    1                 Gear efficiency                             \-

  friction_pos   REAL                      Positive sliding friction characteristic    

  peak           REAL    1                 Maximum friction torque at zero velocity    \-

  ratio          REAL    1                 Transmision ratio                           \-
  ------------------------------------------------------------------------------------------------

### 3.19.5 Formulation

This is a topological component and the following figure shows how the gear sub-system has been built:

 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image81.png){width="6.489583333333333in" height="1.25in"}

## 3.20 Component R_GearFriction

Inherited from R_Two_Flanges.

### 3.20.1 Description

This component represents a gear box that is a toothed wheel designed to transmit torque to another gear or toothed component. 

It models the gear ratio and the losses of a standard gear box in a reliable way including the stuck phases that may occur at zero speed.

### 3.20.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image82.png){width="1.1770833333333333in" height="1.0625in"}

### 3.20.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driving mech_rot
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.20.4 Data

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME          TYPE       DEFAULT   RANGE   DESCRIPTION                                                                                                      UNITS
  ------------- ---------- --------- ------- ---------------------------------------------------------------------------------------------------------------- -------
  ideal         BOOLEAN    FALSE             TRUE, if losses are neglected                                                                                    

  tab_eta_mf1   TABLE_1D                     Data of the mess efficiency in case of input shaft driving as a function of angular velocity                     

  tab_eta_mf2   TABLE_1D                     Data of the mess efficiency in case of output shaft driving as a function of angular velocity                    

  tab_tau_bf1   TABLE_1D                     Data of the absolute bearing friction torque in case of input shaft driving as a function of angular velocity    \-

  tab_tau_bf2   TABLE_1D                     Data of the bsolute bearing friction torque in case of output shaft driving as a function of angular velocity    

  trans_ratio   REAL       2                 Transmission ratio                                                                                               \-
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.20.5 Variables

  ------------------------------------------------------------------------------------------------------------------------------------------------
  NAME                   TYPE         INITIAL      RANGE   DESCRIPTION                                                                 UNITS
  ---------------------- ------------ ------------ ------- --------------------------------------------------------------------------- -----------
  T                      REAL                              Torque                                                                      N·m

  Tloss                  REAL                              Torque loss due to friction in the gear teeth and in the bearings           N·m

  Tloss_max              REAL                              Torque loss for positive speed                                              N·m

  Tloss_min              REAL                              Torque loss for negative speed                                              N·m

  a                      REAL                              Angular acceleration                                                        rad/s\^2 

  eta_mf1                REAL                              Mesh efficiency in case of input shaft driving                              \-

  eta_mf2                REAL                              Mesh efficiency in case of output shaft drivin                              \-

  imode                  INTEGER                           Operation mode                                                              

  lossTable_ideal\[4\]   CONST REAL   { 1,1,0,0}           Array for mesh efficiencies and bearing friction if losses are neglected    

  q1                     REAL                              First quadrant                                                              N·m

  q2                     REAL                              Second quadrant                                                             N·m

  q3                     REAL                              Third quadrant                                                              N·m

  q4                     REAL                              Fourth quadrant                                                             N·m

  sa                     REAL                              Path parameter for acceleration and torque loss                             

  tau_bf1                REAL                              Absolute bearing friction torque in case of input shaft driving             N·m

  tau_bf2                REAL                              Absolute bearing friction torque in case of output shaft driving            N·m

  w                      REAL                              Angular velocity of inlet port                                              rad/s 
  ------------------------------------------------------------------------------------------------------------------------------------------------

### 3.20.6 Formulation

The gear boxes that can be handeled are fixed in the ground, have one input and one output shaft, and are essentially described by the equations:

m_in.omega = trans_ratio \* m_out.omega

m_out.T = trans_ratio \* (eta_mf \* m_in.T -- tau_bf) = 0

 

where:

           trans_ratio = the constant gear ratio

            eta_mf = the mesh efficiency due to the friction between the teeth of the gear wheels

            tau_bf = the bearing friction torque

 

The loss terms "eta_mf" and "tau_bf" are functions of the absolute value of the input shaft speed "w" and of the energy flow direction. They are defined by the following input tables that have the following meaning:

 

- tab_eta_mf1 = Data of the mess efficiency in case of input shaft driving "eta_mf1" as a function of angular velocity

- tab_eta_mf2 = Data of the mess efficiency in case of output shaft driving "eta_mf2"as a function of angular velocity

- tab_tau_bf1 = Data of the absolute bearing friction torque in case of input shaft driving "\|tau_bf1\|" as a function of angular velocity

- tab_tau_bf2 =  Data of the bsolute bearing friction torque in case of output shaft driving "\|tau_bf2\|" as a function of angular velocity

 

With these variables, the mesh efficiency "eta_mf" and the bearing friction "tau_bf" are formally defined as:

 

IF (T \* w \> 0 OR (T == 0 AND w \> 0))

                        eta_mf = eta_mf1

                        tau_bf = tau_bf1

            ELSEIF (T \* w \< 0 OR (T == 0 AND w \< 0))

                        eta_mf = 1/eta_mf2

                        tau_bf = tau_bf2

            ELSE

                        eta_mf and tau_bf are calculated such that a = 0. The gear is stuck.

           

where:

            a = angular acceleration

            T = torque at inlet port

            w = angular velocity

 

The losses are modeled taking into account that at null speed the movement may be locked due to the friction in the gear teeth and/or in the bearings.

## 3.21 Component R_GearIdeal

Inherited from R_Two_Flanges.

### 3.21.1 Description

This component represents a frictionless gearbox that transforms a rotational movement.

### 3.21.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image83.png){width="1.0104166666666667in" height="1.0625in"}

### 3.21.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driving mech_rot
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.21.4 Data

  ----------------------------------------------------------------------
  NAME     TYPE      DEFAULT   RANGE   DESCRIPTION               UNITS
  -------- --------- --------- ------- ------------------------- -------
  ratio    REAL      1                 Transmission ratio        \-

  ----------------------------------------------------------------------

### 3.21.5 Formulation

This component represents a frictionless gearbox that transforms a rotational movement at angular velocity "m_out.omega" into another at angular velocity "m_in.omega" as follows:

 

      m_in.omega = ratio \* m_out.omega

 

where ratio is the transmission ratio.

The torque is calculated accordingly as:

 

ratio \* m_in.T = m_out.T

## 3.22 Component R_GearIdealR2T

### 3.22.1 Description

This component represents a frictionless gearbox that transforms a rotational movement into a linear movement.

### 3.22.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image84.png){width="1.25in" height="0.7708333333333334in"}

### 3.22.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  --------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ----------------------------
  R_m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                  IN                        Inlet rotational port 

  T_m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Outlet translational port 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.22.4 Data

  ----------------------------------------------------------------------
  NAME     TYPE      DEFAULT   RANGE   DESCRIPTION               UNITS
  -------- --------- --------- ------- ------------------------- -------
  ratio    REAL      1                 Transmission ratio        rad/m

  ----------------------------------------------------------------------

### 3.22.5 Formulation

The angular velocity and the displacement are linked by means of the equation:

T_m_out.s\' = R_m_in.omega / ratio

where ratio is the transmission ratio (in rad/m).

The relation between torque and force is given by:

T_m_out.F = ratio \* R_m_in.T

## 3.23 Component R_Inertia

Inherited from R_Rigid.

### 3.23.1 Description

This component represents a rotating mass with inertia.

### 3.23.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image85.png){width="0.9583333333333334in" height="0.7708333333333334in"}

### 3.23.3 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot 

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driven mech_rot 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.23.4 Data

  --------------------------------------------------------------------------
  NAME     TYPE      DEFAULT   RANGE   DESCRIPTION                 UNITS
  -------- --------- --------- ------- --------------------------- ---------
  I        REAL      1                 Moment of inertia of body   kg·m\^2

  w0       REAL      0                 Initial angular velocity    rad/s 
  --------------------------------------------------------------------------

### 3.23.5 Variables

  ----------------------------------------------------------------------------------
  NAME         TYPE    INITIAL   RANGE   DESCRIPTION                     UNITS
  ------------ ------- --------- ------- ------------------------------- -----------
  a            REAL                      Absolute angular acceleration   rad/s\^2 

  w            REAL                      Absolute angular velocity       rad/s 
  ----------------------------------------------------------------------------------

### 3.23.6 Formulation

The mathematical model associated to this component is shown below:

 

- Angular velocity at inlet port:    m_in.omega = w

- Angular velocity at outlet port: m_out.omega = w

 

The two mechanical connections (flanges) have the same angular speed.

This component calculates the angular acceleration (a) and angular velocity (w) of a rotating body (inertia I) depending on the momentum in the ports as follows:

 

      w' = a

      I \* a = m_in.T - m_out.T

## 3.24 Component R_Piston

Inherited from T_Rigid.

### 3.24.1 Description

Dynamic model of an angular Piston submitted to the forces of pressure, spring, friction\...

### 3.24.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image86.png){width="0.9583333333333334in" height="1.2395833333333333in"}

### 3.24.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                     PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  --------- -------------------------------------------------------------------------------------------------------- ------------ ----------- ------------- --------------------------------
  m_in      [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        IN                        Left / driving mech_trans

  m_out     [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        OUT                       Right / driven mech_trans

  s_Mext    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)                IN                        Piston external torque signal 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.24.4 Data

  ----------------------------------------------------------------------------------
  NAME         TYPE    DEFAULT   RANGE   DESCRIPTION                       UNITS
  ------------ ------- --------- ------- --------------------------------- ---------
  Ip           REAL    0.01              Movil parts inertia               kg·m\^2

  K_spr        REAL    1000              Spring constan                    N·m/rad

  Mpl          REAL    10                Piston preload at themin          N·m 

  R            REAL    0.1               Effective radiu                   m

  cv           REAL    20                Viscous friction coeffien         N/m·s

  fc1          REAL    0                 Direct coulomb friction torque    N

  fc2          REAL    0                 Inverse coulomb friction torque   N

  theini       REAL    0                 Piston initial position           rad

  themax       REAL    1                 Piston position upper limit       rad

  themin       REAL    0                 Piston position lower limit       rad
  ----------------------------------------------------------------------------------

### 3.24.5 Variables

  -----------------------------------------------------------------------------
  NAME     TYPE      INITIAL   RANGE   DESCRIPTION                      UNITS
  -------- --------- --------- ------- -------------------------------- -------
  M        REAL                        Net M on piston                  N·m

  s        REAL                        Absolute position of component   m

  the      REAL                        Angular piston position          rad

  the0     REAL                        Angular piston precharge         rad
  -----------------------------------------------------------------------------

### 3.24.6 Formulation

The mathematical formulation associated to this component is the following:

- Position at inlet port:                m_in.s = s

- Position at outlet port:              m_out.s = s

## 3.25 Component R_RelativeSensorAcceleration

Inherited from R_RelativeSensor.

### 3.25.1 Description

This component represents a relative acceleration sensor. It measures the relative angular acceleration a_rel between the two ports in an ideal way.

### 3.25.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image87.png){width="2.0729166666666665in" height="1.03125in"}

### 3.25.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.25.4 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN                        Rotational mechanical inlet port

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT                       Rotational mechanical outlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.25.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.25.6 Variables

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               INITIAL   RANGE   DESCRIPTION                     UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------------- -----------
  a_rel          REAL                                                                                                 Relative angular acceleration   rad/s\^2 

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable               \-

  w_rel          REAL                                                                                                 Relative speed acceleration     rad/s
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.25.7 Formulation

The equations associated to this component are shown below:

 

- Relative velocity:                      w_rel = m_out.omega -- m_in.omega

- Relative acceleration:               a_rel = w_rel'

- Torque at the inlet port:            m_in.T = 0

- Torque at the outlet port:          m_out.T = 0

- Output signal:                          var = a_rel

## 3.26 Component R_RelativeSensorAngle

Inherited from R_RelativeSensor.

### 3.26.1 Description

This component represents a relative angle sensor. It measures the relative angle phi_rel between the two ports in an ideal way.

### 3.26.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image88.png){width="1.6770833333333333in" height="1.03125in"}

### 3.26.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.26.4 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN                        Rotational mechanical inlet port

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT                       Rotational mechanical outlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.26.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-

  phi_rel_0       REAL   0                 Initial relative angle    rad
  --------------------------------------------------------------------------

### 3.26.6 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------- -------
  phi_rel        REAL                                                                                                 Relative angle            rad

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable         \-
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.26.7 Formulation

The equations associated to this component are shown below:

 

- Relative angle:                          phi_rel' = m_out.omega -- m_in.omega

- Torque at the inlet port:            m_in.T = 0

- Torque at the outlet port:          m_out.T = 0

- Output signal:                          var =phi_rel

- 

## 3.27 Component R_RelativeSensorSpeed

Inherited from R_RelativeSensor.

### 3.27.1 Description

This component represents a relative velocity sensor. It measures the relative angular velocity w_rel between the two ports in an ideal way.

### 3.27.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image89.png){width="1.71875in" height="1.03125in"}

### 3.27.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.27.4 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          IN                        Rotational mechanical inlet port

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                          OUT                       Rotational mechanical outlet port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.27.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.27.6 Variables

  ------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------- --------
  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable         \-

  w_rel          REAL                                                                                                 Relative angular speed    rad/s 
  ------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.27.7 Formulation

The equations associated to this component are shown below:

 

- Torque at the inlet port:            m_in.T = 0

- Torque at the outlet port:          m_out.T = 0

- Relative velocity:                      w_rel = m_out.omega -- m_in.omega

- Output signal:                          var =w_rel

- 

- 

## 3.28 Component R_Spring

Inherited from R_Compliant.

### 3.28.1 Description

This component represents an ideal rotational spring.

### 3.28.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image90.png){width="0.9583333333333334in" height="0.7708333333333334in"}

### 3.28.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- -------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driven mech_rot
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.28.4 Data

  ------------------------------------------------------------------------------------------------------
  NAME        TYPE   DEFAULT   RANGE   DESCRIPTION                                             UNITS
  ----------- ------ --------- ------- ------------------------------------------------------- ---------
  c           REAL   0                 Spring constant                                         N·m/rad

  phi_rel0    REAL   0                 Angular distance between ports for unstretched spring   rad

  phi_rel_i   REAL   0                 Initial angular distance between ports                  rad
  ------------------------------------------------------------------------------------------------------

### 3.28.5 Variables

  ------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                               INITIAL   RANGE   DESCRIPTION                     UNITS
  --------- ---------------------------------------------------------------------------------- --------- ------- ------------------------------- -------
  T         [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Rotational transmited torque    N·m

  phi_rel   REAL                                                                                                 Angular distance between port   rad 
  ------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.28.6 Formulation

The mathematical model associated to this component is given as follows: 

- Relative angle:              phi_rel = m_out.phi -- m_in.phi

- Torque in inlet port:      m_in.tau = tau

- Torque in outlet port:    m_out.tau = tau

 

The outlet torque is equal to the inlet torque.

This component calculates a torque T depending on the relative position of its ports phi_rel:

T = - c \* (phi_rel - phi_rel0)

Where c is the spring constant and phi_rel0 is the relative position when the spring is unloaded.

## 3.29 Component R_SpringBacklash

Inherited from R_Compliant.

### 3.29.1 Description

Helicoidal spring with backlash. This component represents a spring with a dead zone where the spring does not act.

### 3.29.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image91.png){width="1.3854166666666667in" height="0.7708333333333334in"}

### 3.29.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- -------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driven mech_rot
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.29.4 Data

  ------------------------------------------------------------------------------------------------------
  NAME        TYPE   DEFAULT   RANGE   DESCRIPTION                                             UNITS
  ----------- ------ --------- ------- ------------------------------------------------------- ---------
  c           REAL   0                 Spring constant                                         N·m/rad

  ddz         REAL   0                 Direct dead zone                                        rad

  idz         REAL   0                 Inverse dead zone                                       rad

  phi_rel0    REAL   0                 Angular distance between ports for unstretched spring   rad

  phi_rel_i   REAL   0                 Initial angular distance between ports                  rad
  ------------------------------------------------------------------------------------------------------

### 3.29.5 Variables

  ------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                               INITIAL   RANGE   DESCRIPTION                     UNITS
  --------- ---------------------------------------------------------------------------------- --------- ------- ------------------------------- -------
  T         [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Rotational transmited torque    N·m

  phi_rel   REAL                                                                                                 Angular distance between port   rad 
  ------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.29.6 Formulation

The mathematical model associated to this component is given as follows:

- Relative angle:              phi_rel = m_out.phi -- m_in.phi

- Torque in inlet port:      m_in.tau = tau

- Torque in outlet port:    m_out.tau = tau

 

The outlet torque is equal to the inlet torque.

To define the dead zone, the user must enter a "direct dead zone" (ddz) and an "inverse dead zone" (idz) angles as component data.

 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image92.png){width="2.0729166666666665in" height="1.6145833333333333in"}

 

When the relative rotation angle "phi_rel" is out of the dead zone, this component calculates a torque T as follows:

- T = - c \* (phi_rel - phi_rel0 - ddz)           for phi_rel \>= ddz

- T = - c \* (phi_rel - phi_rel0 + idz)           for phi_rel \<= idz

 

Where c is the spring constant and phi_rel0 is the relative position when the spring is unloaded.

## 3.30 Component R_SpringDamper

Inherited from R_Compliant.

### 3.30.1 Description

This component represents a spring and a damper element connected in parallel.

### 3.30.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image93.png){width="1.28125in" height="1.28125in"}

### 3.30.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- -------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driven mech_rot
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.30.4 Data

  --------------------------------------------------------------------------------------------------------
  NAME        TYPE   DEFAULT   RANGE   DESCRIPTION                                             UNITS
  ----------- ------ --------- ------- ------------------------------------------------------- -----------
  c           REAL   0                 Spring constant                                         N·m/rad

  d           REAL   0                 Damping constant                                        N·m·s/rad

  phi_rel0    REAL   0                 Angular distance between ports for unstretched spring   rad

  phi_rel_i   REAL   0                 Initial angular distance between ports                  rad
  --------------------------------------------------------------------------------------------------------

### 3.30.5 Variables

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                               INITIAL   RANGE   DESCRIPTION                               UNITS
  --------- ---------------------------------------------------------------------------------- --------- ------- ----------------------------------------- -------
  T         [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Rotational transmited torque              N·m

  phi_rel   REAL                                                                                                 Angular distance between port             rad 

  w_rel     REAL                                                                                                 Relative angular velocity between ports   rad/s
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.30.6 Formulation

The mathematical model associated to this component is given as follows:

 

- Relative angle:              phi_rel = m_out.phi -- m_in.phi

- Torque in inlet port:      m_in.tau = tau

- Torque in outlet port:    m_out.tau = tau

 

The outlet torque is equal to the inlet torque.

This component calculates the torque T as follows:

T = - c \* (phi_rel - phi_rel0 ) - d \* w_rel

Where c is the spring constant, phi_rel0 is the relative position when the spring is unloaded, d is the damping constant and w_rel is the relative angular velocity between the two ports.

## 3.31  Component R_Stop

Inherited from R_Rigid.

### 3.31.1 Description

Rotating mass with inertia and stops

### 3.31.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image94.png){width="0.9583333333333334in" height="0.7708333333333334in"}

### 3.31.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                            PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------- ------------ ----------- ------------- -------------------------
  m_in    [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 IN                        Left / driving mech_rot

  m_out   [PORTS_LIB.mech_rot](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                 OUT                       Right / driven mech_rot
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.31.4 Data

  ------------------------------------------------------------------------------
  NAME      TYPE      DEFAULT   RANGE   DESCRIPTION                    UNITS
  --------- --------- --------- ------- ------------------------------ ---------
  I         REAL      1                 Moment of inertia of body      kg·m\^2

  phi0      REAL      0                 Initial angular position       rad

  phi_max   REAL      0.5               Upper limit angular position   rad

  phi_min   REAL      -0.5              Lower limit angular position   rad

  w0        REAL      0                 Initial angular velocity       rad/s 
  ------------------------------------------------------------------------------

### 3.31.5 Variables

  ----------------------------------------------------------------------------------
  NAME         TYPE    INITIAL   RANGE   DESCRIPTION                     UNITS
  ------------ ------- --------- ------- ------------------------------- -----------
  M            REAL                      Net Moment on leve              N·m

  a            REAL                      Absolute angular acceleration   rad/s\^2 

  phi          REAL                      Absolute angular position       rad

  w            REAL                      Absolute angular velocity       rad/s 
  ----------------------------------------------------------------------------------

### 3.31.6 Formulation

The mathematical model associated to this component is shown below:

- Angular velocity at inlet port:    m_in.omega = w

- Angular velocity at outlet port: m_out.omega = w

The two mechanical connections (flanges) have the same angular speed.

## 3.32 Component T_AbsoluteSensorAcceleration

Inherited from T_AbsoluteSensor.

### 3.32.1 Description

This component simulates an acceleration sensor. The measure of the acceleration takes place in one single port. This component has one mechanical input port and one signal output port.

### 3.32.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image95.png){width="2.125in" height="1.125in"}

### 3.32.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.32.4 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- ----------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        IN                        Mechanical left port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.32.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.32.6 Variables

  -------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------- ---------
  a              REAL                                                                                                 Absolute acceleration     m/s\^2 

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable         \-
  -------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.32.7 Formulation

The mathematical formulation associated to this component is the following:

 

- Acceleration:    a = m_in.s''

- Force:              m_in.F = 0

- Output signal:   var\[1\] =a

## 3.33 Component T_AbsoluteSensorForce

Inherited from T_AbsoluteSensor.

### 3.33.1 Description

This component simulates a force sensor. The measure of the force takes place in two ports. This component has two mechanical ports and one signal port. Additionally, it must be placed in series in the branch where the force has to be measured.

### 3.33.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image96.png){width="1.71875in" height="1.125in"}

### 3.33.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.33.4 Ports

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- -----------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        IN                        Mechanical left port

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        OUT                       Mechanical right port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.33.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.33.6 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------- -------
  F              REAL                                                                                                 Measured force            N

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable         \-
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.33.7 Formulation

The mathematical formulation associated to this component is the following:

 

- Position:                                  m_out.s = m_in.s

- Force at the inlet port:              m_in.F = F

- Force at the outlet port:            m_out.F = F

- Output signal:                           var\[1\] = F

## 3.34 Component T_AbsoluteSensorPosition

Inherited from T_AbsoluteSensor.

### 3.34.1 Description

AbsoluteSensorPosition simulates a position sensor. The measure of the position takes place in one single port. This component has one mechanical input port and one signal output port.

### 3.34.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image97.png){width="1.875in" height="1.125in"}

### 3.34.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.34.4 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- ----------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        IN                        Mechanical left port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.34.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.34.6 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------- -------
  s              REAL                                                                                                 Absolute position         m

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable         \-
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.34.7 Formulation

The mathematical formulation associated to this component is the following:

 

- Position:           s = m_in.s

- Force:              m_in.F = 0

- Output signal:   var\[1\] = s

## 3.35 Component T_AbsoluteSensorVelocity

Inherited from T_AbsoluteSensor.

### 3.35.1 Description

AbsoluteSensorVelocity simulates a velocity sensor. The measure of the velocity takes place in one single port. This component has one mechanical input port and one signal output port..

### 3.35.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image98.png){width="1.8541666666666667in" height="1.125in"}

### 3.35.3 Construction Parameters

  ----------------------------------------------------------
  NAME    TYPE      DEFAULT   DESCRIPTION            UNITS
  ------- --------- --------- ---------------------- -------
  n_out   INTEGER   1         Dimension of outputs   \-

  ----------------------------------------------------------

### 3.35.4 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- ----------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        IN                        Mechanical left port

  s_out   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     OUT                       Outlet signal () 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.35.5 Data

  --------------------------------------------------------------------------
  NAME            TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  --------------- ------ --------- ------- ------------------------- -------
  bias\[n_out\]   REAL   0                 Bias                      \-

  gain\[n_out\]   REAL   1                 Gain                      \-
  --------------------------------------------------------------------------

### 3.35.6 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME           TYPE                                                                               INITIAL   RANGE   DESCRIPTION               UNITS
  -------------- ---------------------------------------------------------------------------------- --------- ------- ------------------------- -------
  v              REAL                                                                                                 Absolute velocity         m/s

  var\[n_out\]   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Measured variable         \-
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.35.7 Formulation

The mathematical formulation associated to this component is the following:

- Velocity:          v = m_in.s'

- Force:              m_in.F = 0

- Output signal:   var\[1\] = v

## 3.36 Component T_ActuatorAcceleration

Inherited from T_Actuator.

### 3.36.1 Description

This component forces a movement in a port from an input acceleration signal. This component has one mechanical port and one signal port.

### 3.36.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image99.png){width="1.6770833333333333in" height="0.9270833333333334in"}

### 3.36.3 Ports

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- --------------------------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        OUT                       Output translational mechanical port

  s_in    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     IN                        Input signal port () 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.36.4 Data

  ------------------------------------------------------------------
  NAME    TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  ------- ------ --------- ------- ------------------------- -------
  s_0     REAL   0                 Start position            m

  v_0     REAL   0                 Start velocity            m/s
  ------------------------------------------------------------------

### 3.36.5 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------
  NAME   TYPE                                                                               INITIAL   RANGE   DESCRIPTION               UNITS
  ------ ---------------------------------------------------------------------------------- --------- ------- ------------------------- ---------
  a      REAL                                                                                                 Absolute acceleration     m/s\^2 

  s      [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Absolute position         m

  v      REAL                                                                                                 Absolute speed            m/s
  -----------------------------------------------------------------------------------------------------------------------------------------------

### 3.36.6 Formulation

The mathematical model associated to this component is given as follows:

- Velocity:          v\' = a

- Acceleration:    a = s_in.signal\[1\]

- Position:           s\'\' = a

- Port position:    m_out.s = s

## 3.37 Component T_ActuatorForce

Inherited from T_Actuator.

### 3.37.1 Description

This component generates a mechanical force from an input signal. This component has one mechanical port and one signal port.

### 3.37.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image100.png){width="1.2708333333333333in" height="0.9270833333333334in"}

### 3.37.3 Ports

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- --------------------------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        OUT                       Output translational mechanical port

  s_in    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     IN                        Input signal port () 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.37.4 Formulation

The mathematical model associated to this component is given as follows:

- Outlet force:     m_out.F = s_in.signal\[1\]

## 3.38 Component T_ActuatorPosition

Inherited from T_Actuator.

### 3.38.1 Description

ActuatorPosition forces a mechanical position in one port which is determined by an input signal. This component has one mechanical port and one signal port.

### 3.38.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image101.png){width="1.4166666666666667in" height="0.9270833333333334in"}

### 3.38.3 Ports

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                  PARAMETERS      DIRECTION   CARDINALITY   DESCRIPTION
  ------- ----------------------------------------------------------------------------------------------------- --------------- ----------- ------------- --------------------------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        OUT                       Output translational mechanical port

  s_in    [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)   (n = n_out)     IN                        Input signal port () 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.38.4 Formulation

The mathematical model associated to this component is given as follows:

- Position:           m_out.s = s_in.signal\[1\]

## 3.39 Component T_Damper

Inherited from T_Compliant.

### 3.39.1 Description

This component represents an ideal damper.

### 3.39.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image102.png){width="0.9583333333333334in" height="0.8020833333333334in"}

### 3.39.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                IN                        Left / driving mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.39.4 Data

  -------------------------------------------------------------------
  NAME    TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  ------- ------ --------- ------- ------------------------- --------
  d       REAL   0                 Damping constant          N·s/m 

  -------------------------------------------------------------------

### 3.39.5 Variables

  ------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                               INITIAL   RANGE   DESCRIPTION                       UNITS
  ------- ---------------------------------------------------------------------------------- --------- ------- --------------------------------- -------
  F       REAL                                                                                                 Translational transmited force    N

  s_rel   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Distance between ports            m

  v_rel   REAL                                                                               0                 Relative velocity between ports   m/s
  ------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.39.6 Formulation

The mathematical formulation associated to this component are the following:

- Relative displacement: s_rel = m_out.s - m_in.s

- Force at inlet port:        m_in.F = -F

- Force at outlet port:     m_out.F = F

- 

This component calculates a force depending on the relative velocity of its ports:

F = - d \* v_rel 

Where d is the damping constant and v_rel is the relative velocity of the ports, calculated as the derivate of the relative displacement.

v_rel = s_rel\'

## 3.40 Component T_EWall

### 3.40.1 Description

This element simulates a solid wall that allows shocks and bounces with it by means of calculating the reaction force of the ground.

### 3.40.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image103.png){width="0.78125in" height="0.84375in"}

### 3.40.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.40.4 Data

  ---------------------------------------------------------------------------------
  NAME    TYPE      DEFAULT   RANGE   DESCRIPTION                          UNITS
  ------- --------- --------- ------- ------------------------------------ --------
  C       REAL      1                 Viscous coefficient                  N·s/m 

  E       REAL      1.e308            Elastic coefficient                  N/m

  wp      REAL      0                 Wall position                        m

  ws      INTEGER   -1                Wall solid side: -1=Left & 1=RighT   
  ---------------------------------------------------------------------------------

### 3.40.5 Formulation

This element simulates a solid wall that allows shocks and bounces with it calculating a reaction force N. This reaction force consists of two terms: one is conservative (elastic) and the other is disipative (friction):

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image104.png){width="1.5729166666666667in" height="0.78125in"}

 

Where s and v are respectively the position and the velocity of the hitting mass, wp is the wall position, E is the elastic coefficient of the wall and c is a dissipative coefficient.

 The reaction force is calculated when the moving mass crosses the wall position to the wall solid side. When the position of the moving mass is in the wall-free area, N is set to 0. The status of the moving body is determined in the DISCRETE block. 

The integer flag ws defines the solid side of the wall (in other words, where the mass movement is not possible). When ws = 0, the solid side is for s ≤ wp (movement forbidden in the left side). The movement is forbidden in the right side of wp when ws =1.

## 3.41 Component T_ElastoGap

Inherited from T_Compliant.

### 3.41.1 Description

This component represents a translational spring damper combination with gap.

### 3.41.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image105.png){width="1.125in" height="1.09375in"}

### 3.41.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                IN                        Left / driving mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.41.4 Data

  ---------------------------------------------------------------------------------------
  NAME     TYPE   DEFAULT   RANGE   DESCRIPTION                                  UNITS
  -------- ------ --------- ------- -------------------------------------------- --------
  d        REAL   0                 Damping constant                             N·s/m 

  k        REAL   0                 Spring constant                              N·m

  s_rel0   REAL   0                 Distance between ports for unloaded spring   m
  ---------------------------------------------------------------------------------------

### 3.41.5 Variables

  --------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                               INITIAL   RANGE   DESCRIPTION                       UNITS
  --------- ---------------------------------------------------------------------------------- --------- ------- --------------------------------- -------
  F         REAL                                                                                                 Translational transmited force    N

  contact   BOOLEAN                                                                                                                                

  s_rel     [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Distance between ports            m

  v_rel     REAL                                                                               0                 Relative velocity between ports   m/s
  --------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.41.6 Formulation

The mathematical formulation associated to this component are the following:

- Relative displacement: s_rel = m_out.s - m_in.s

- Force at inlet port:        m_in.F = -F

- Force at outlet port:     m_out.F = F

- 

This component calculates a force depending on the relative velocity and the relative position of its ports:

F = -k \* (s_rel - s_rel0) - d \* v_rel        if s_rel \< s_rel0

F = 0.0                                      if s_rel \> s_rel0 

where k is the spring constant, s_rel0 is the distance between ports for unloaded spring, d is the damping constant and v_rel is the relative velocity of the ports, calculated as the derivative of the relative displacement:

v_rel = s_rel\'

## 3.42 Component T_FixedAcceleration

### 3.42.1 Description

This component generates a constant acceleration output. In other words, this component represents a boundary condition in acceleration, such as gravity.

### 3.42.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image106.png){width="1.5104166666666667in" height="0.7708333333333334in"}

### 3.42.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.42.4 Data

  ---------------------------------------------------------------------
  NAME    TYPE   DEFAULT   RANGE   DESCRIPTION                UNITS
  ------- ------ --------- ------- -------------------------- ---------
  a0      REAL   0                 Fixed acceleration value   m/s\^2 

  ---------------------------------------------------------------------

### 3.42.5 Variables

  ---------------------------------------------------------------------------------------------------------------------------------------------
  NAME   TYPE                                                                               INITIAL   RANGE   DESCRIPTION               UNITS
  ------ ---------------------------------------------------------------------------------- --------- ------- ------------------------- -------
  s      [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Absolute position         m

  ---------------------------------------------------------------------------------------------------------------------------------------------

### 3.42.6 Formulation

The value of the acceleration at the outlet port is fixed by the value of the input data called a0:

      s\'\'= a0

      m_out.s = s

## 3.43 Component T_FixedForce

### 3.43.1 Description

This component generates a constant force output. In other words, this component represents a boundary condition in force.

### 3.43.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image107.png){width="1.09375in" height="0.7708333333333334in"}

### 3.43.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.43.4 Data

  ------------------------------------------------------------------
  NAME    TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  ------- ------ --------- ------- ------------------------- -------
  F0      REAL   0                 Fixed force value         N

  ------------------------------------------------------------------

### 3.43.5 Formulation

The value of the force at the outlet port is fixed by the value of the input data called F0: 

m_out.F = F0

## 3.44 Component T_FixedPosition

### 3.44.1 Description

This component generates a constant position output. In other words, this component represent a boundary condition in position, such as a ground fixation.

### 3.44.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image108.png){width="1.2395833333333333in" height="0.7708333333333334in"}

### 3.44.3 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.44.4 Data

  ------------------------------------------------------------------
  NAME    TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  ------- ------ --------- ------- ------------------------- -------
  s0      REAL   0                 Fixed offset position     m

  ------------------------------------------------------------------

### 3.44.5 Formulation

The value of the position at the outlet port is fixed by the value of the input data called s0:

            m_out.s = s0

## 3.45 Component T_Piston

Inherited from T_Rigid.

### 3.45.1 Description

Dynamic model of a Piston submitted to the forces of pressure, spring, friction \...

### 3.45.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image109.png){width="0.9583333333333334in" height="1.28125in"}

### 3.45.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME     TYPE                                                                                                     PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  -------- -------------------------------------------------------------------------------------------------------- ------------ ----------- ------------- ------------------------------
  m_in     [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        IN                        Left / driving mech_trans

  m_out    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                        OUT                       Right / driven mech_trans

  S_Fext   [PORTS_LIB.analog_signal](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.analog_signal.html)                IN                        Piston external force signal
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.45.4 Data

  ----------------------------------------------------------------------
  NAME    TYPE   DEFAULT   RANGE   DESCRIPTION                   UNITS
  ------- ------ --------- ------- ----------------------------- -------
  Fpl     REAL   100               Piston preload at xmin        N

  K_spr   REAL   100000            Spring constant               N·m

  Mp      REAL   1                 Piston mass                   kg

  cv      REAL   20                Viscous friction coeffient    N/m·s

  fc1     REAL   1                 Direct coulomb friction       N

  fc2     REAL   1                 Inverse coulomb friction      N

  xini    REAL   0                 Piston initial position       m

  xmax    REAL   0.05              Piston position upper limit   m

  xmin    REAL   0                 Piston position lower limit   m
  ----------------------------------------------------------------------

### 3.45.5 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME   TYPE                                                                               INITIAL   RANGE   DESCRIPTION                       UNITS
  ------ ---------------------------------------------------------------------------------- --------- ------- --------------------------------- -------
  F      REAL                                                                                                 Translational transmited force    N

  s      [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Absolute position of component    m

  x      REAL                                                                                                 Relative velocity between ports   m

  x0     REAL                                                                                                 Piston precharge                  m
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.45.6 Formulation

The mathematical formulation associated to this component is the following:

- Position at inlet port:                m_in.s = s

- Position at outlet port:              m_out.s = s

## 3.46 Component T_Rod

Inherited from T_Rigid.

### 3.46.1 Description

This component represents a rod without inertia and two rigidly connected flanges.

### 3.46.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image110.png){width="0.9583333333333334in" height="0.5208333333333334in"}

### 3.46.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                IN                        Left / driving mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.46.4 Variables

  ----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME   TYPE                                                                               INITIAL   RANGE   DESCRIPTION                      UNITS
  ------ ---------------------------------------------------------------------------------- --------- ------- -------------------------------- -------
  s      [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Absolute position of component   m

  ----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.46.5 Formulation

The mathematical formulation associated to this component is the following:

- Position at inlet port:                m_in.s = s

- Position at outlet port:              m_out.s = s

- 

The force balance applied to this component is shown next:

0 = m_in.F + m_out.F

## 3.47 Component T_SlidingMass

Inherited from T_Rigid.

### 3.47.1 Description

This component represents a sliding mass in longitudinal movement.

### 3.47.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image111.png){width="1.15625in" height="0.7708333333333334in"}

### 3.47.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                IN                        Left / driving mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.47.4 Data

  ------------------------------------------------------------------
  NAME    TYPE   DEFAULT   RANGE   DESCRIPTION               UNITS
  ------- ------ --------- ------- ------------------------- -------
  M       REAL   1                 Mass of body              kg

  s0      REAL   0                 Initial body position     m

  v0      REAL   0                 Initial body velocity     m/s
  ------------------------------------------------------------------

### 3.47.5 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME   TYPE                                                                               INITIAL   RANGE   DESCRIPTION                      UNITS
  ------ ---------------------------------------------------------------------------------- --------- ------- -------------------------------- --------
  a      REAL                                                                                                 Absolute acceleration            m/s\^2

  s      [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Absolute position of component   m

  v      REAL                                                                                                 Absolute velocity                m/s
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.47.6 Formulation

The mathematical formulation associated to this component is the following:

- Position at inlet port:                m_in.s = s

- Position at outlet port:              m_out.s = s

- 

This component calculates the acceleration (a), velocity (v) and position (s) of a mass m depending on the forces in the ports as follows:

 

- Position:           s\' = v

- Velocity:           v\' = a

- Acceleration:    m \* a = m_in.F + m_out.F

## 3.48 Component T_Spring 

Inherited from T_Compliant.

### 3.48.1 Description

This component represents an ideal spring..

### 3.48.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image112.png){width="0.9583333333333334in" height="0.6145833333333334in"}

### 3.48.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                IN                        Left / driving mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.48.4 Data

  --------------------------------------------------------------------------------------
  NAME     TYPE   DEFAULT   RANGE   DESCRIPTION                                  UNITS
  -------- ------ --------- ------- -------------------------------------------- -------
  k        REAL   0                 Spring constant                              N/m

  s_rel0   REAL   0                 Distance between ports for unloaded spring   m
  --------------------------------------------------------------------------------------

### 3.48.5 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                               INITIAL   RANGE   DESCRIPTION                      UNITS
  ------- ---------------------------------------------------------------------------------- --------- ------- -------------------------------- -------
  F       REAL                                                                                                 Translational transmited force   N

  s_rel   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Distance between ports           m
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.48.6 Formulation

The mathematical formulation associated to this component are the following:

 

- Relative displacement: s_rel = m_out.s - m_in.s

- Force at inlet port:       m_in.F = -F

- Force at outlet port:     m_out.F = F

This component calculates a force depending on the relative position of its ports s_rel:

F = - k \* (s_rel - s_rel0)

Where k is the spring constant and s_rel0 is the relative position when the spring is unloaded

## 3.49 Component T_SpringBacklash

Inherited from T_Compliant.

### 3.49.1 Description

This component represents a spring with a dead zone where the spring does not act.

### 3.49.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image113.png){width="1.3645833333333333in" height="0.6145833333333334in"}

### 3.49.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                IN                        Left / driving mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.49.4 Data

  --------------------------------------------------------------------------------------
  NAME     TYPE   DEFAULT   RANGE   DESCRIPTION                                  UNITS
  -------- ------ --------- ------- -------------------------------------------- -------
  ddz      REAL   0                 Direct dead zone                             m

  idz      REAL   0                 Inverse dead zone                            m

  k        REAL                     Spring constant                              N/m 

  s_rel0   REAL   0                 Distance between ports for unloaded spring   m
  --------------------------------------------------------------------------------------

### 3.49.5 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                               INITIAL   RANGE   DESCRIPTION                      UNITS
  ------- ---------------------------------------------------------------------------------- --------- ------- -------------------------------- -------
  F       REAL                                                                                                 Translational transmited force   N

  s_rel   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Distance between ports           m
  -----------------------------------------------------------------------------------------------------------------------------------------------------

### 3.49.6 Formulation

The mathematical formulation associated to this component are the following:

- Relative displacement: s_rel = m_out.s - m_in.s

- Force at inlet port:        m_in.F = -F

- Force at outlet port:     m_out.F = F

- 

To define the dead zone of the spring, the user must enter a "direct dead zone" (ddz) and an "inverse dead zone" (idz) position as component data.

 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image114.png){width="2.9375in" height="1.1770833333333333in"}

 

When the position s is out of the dead zone, this component calculates a force depending on the relative position of its ports s_rel:

 

F = k \* (s_rel - s_rel0 - ddz)                      for s_rel \>= ddz

F = k \* (s_rel - s_rel0 - idz)                      for s_rel \<= idz

 

Where k is the spring constant and s_rel0 is the relative position when the spring is unloaded.

When the position s is within the dead zone, the force is zero.

## 3.50 Component T_SpringDamper

Inherited from T_Compliant.

### 3.50.1 Description

This component represents a spring and a damper element connected in parallel.

### 3.50.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image115.png){width="1.2708333333333333in" height="1.0833333333333333in"}

### 3.50.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                IN                        Left / driving mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.50.4 Data

  ---------------------------------------------------------------------------------------
  NAME     TYPE   DEFAULT   RANGE   DESCRIPTION                                  UNITS
  -------- ------ --------- ------- -------------------------------------------- --------
  d        REAL   0                 Damping constant                             N·s/m 

  k        REAL   0                 Spring constant                              N/m 

  s_rel0   REAL   0                 Distance between ports for unloaded spring   m
  ---------------------------------------------------------------------------------------

### 3.50.5 Variables

  ------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                               INITIAL   RANGE   DESCRIPTION                       UNITS
  ------- ---------------------------------------------------------------------------------- --------- ------- --------------------------------- -------
  F       REAL                                                                                                 Translational transmited force    N

  s_rel   [REAL](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_trans.html)                     Distance between ports            m

  v_rel   REAL                                                                                                 Relative velocity between ports   m/s
  ------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.50.6 Formulation

The mathematical formulation associated to this component are the following: 

- Relative displacement: s_rel = m_out.s - m_in.s

- Force at inlet port:        m_in.F = -F

- Force at outlet port:     m_out.F = F

This component calculates the force F as follows:

F =  - k \* (s_rel - s_rel0) - d \* v_rel 

Where k is the spring constant, s_rel0 is the distance between ports for unloaded spring, d is the damping constant and v_rel is the relative velocity between the two ports.

## 3.51 Component T_Stop

Inherited from T_Rigid.

### 3.51.1 Description

This component represents a sliding mass with hard stop and Stribeck friction.

### 3.51.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image116.png){width="0.9583333333333334in" height="0.8229166666666666in"}

### 3.51.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_in    [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                IN                        Left / driving mech_trans

  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.51.4 Data

  ----------------------------------------------------------------------------------------
  NAME         TYPE      DEFAULT   RANGE   DESCRIPTION                        UNITS
  ------------ --------- --------- ------- ---------------------------------- ------------
  F_Coulomb    REAL      5                 Constant friction: Coulomb force   N

  F_Stribeck   REAL      10                Stribeck effect                    N

  F_prop       REAL      1                 Velocity dependent friction        N/\[m/s\]

  fexp         REAL      2                 Exponential decay                  1/\[m/s\] 

  m            REAL      1                 Mass                               kg

  smax         REAL      25                Right stop for sliding mass        m

  smin         REAL      -25               Left stop for sliding mass         m

  sini         REAL      0                 Initial position                   m
  ----------------------------------------------------------------------------------------

### 3.51.5 Variables

  ----------------------------------------------------------------------------------------
  NAME          TYPE          INITIAL   RANGE   DESCRIPTION                      UNITS
  ------------- ------------- --------- ------- -------------------------------- ---------
  a             REAL                            Acceleration                     m/s\^2 

  f             REAL                            External forces                  N

  fr            REAL                            Friction force                   N

  s             REAL                            Absolute position of component   m

  v             REAL                            Velocity                         m/s 

  var_initial   BOOLEAN       TRUE              Initial state                    
  ----------------------------------------------------------------------------------------

### 3.51.6 Formulation

The mathematical formulation associated to this component is the following:

 

- Position at inlet port:                m_in.s = s

- Position at outlet port:              m_out.s = s

- 

This element describes the Stribeck friction characteristics of a sliding mass, i. e. the frictional force acting between the sliding mass and the support. Included is a hard stop for the position.

The surface is fixed and there is friction between sliding mass and surface. The frictional force fr is given for positive velocity v by:

fr = F_prop\*v + sign(v)\*F_Stribeck\*exp(-fexp\*abs(v)) - rev_fri(v,F_Coulomb,F_Coulomb)

There are hard stops at smax and smin, i. e. if  m_in.s \>= smin and m_out.s \<= xmax the sliding mass can move freely.

When the absolute velocity becomes zero, the sliding mass becomes stuck, i.e., the absolute position remains constant. In this phase the friction force is calculated from a force balance due to the requirement that the absolute acceleration shall be zero. The elements begin to slide when the friction force exceeds a threshold value.

This requires the states position and velocity. If these states are eliminated during the index reduction the model will not work. To avoid this any inertias should be connected via springs to the T_Stop component, other sliding masses, dampers or hydraulic chambers must be avoided.

## 3.52 Component T_Wall

### 3.52.1 Description

This component simulates a solid wall that allows shocks and bounces with it by means of a restitution coefficient.

### 3.52.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image117.png){width="0.6875in" height="0.8229166666666666in"}

### 3.52.3 Ports

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                             PARAMETERS   DIRECTION   CARDINALITY   DESCRIPTION
  ------- ------------------------------------------------------------------------------------------------ ------------ ----------- ------------- ---------------------------
  m_out   [PORTS_LIB.mech_trans](C://EcosimPro_4.8.0_2/USER_LIBS/PORTS_LIB/docs/PORTS_LIB.mech_rot.html)                OUT                       Right / driven mech_trans

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.52.4 Data

  ---------------------------------------------------------------------------------------------------
  NAME   TYPE        DEFAULT   RANGE   DESCRIPTION                                            UNITS
  ------ ----------- --------- ------- ------------------------------------------------------ -------
  cl     REAL        1                 Restitution coefficient: 0=inelastic \<-\> 1=elastic   \-

  wp     REAL        0                 Wall position                                          m

  ws     INTEGER     -1                Wall solid side: -1=Left & 1=Right                     \-
  ---------------------------------------------------------------------------------------------------

### 3.52.5 Variables

  --------------------------------------------------------------------------------
  NAME         TYPE          INITIAL   RANGE   DESCRIPTION               UNITS
  ------------ ------------- --------- ------- ------------------------- ---------
  a            REAL                            Absolute acceleration     m/s\^2 

  s            REAL                            Absolute position         m

  v            REAL                            Absolute velocity         m/s 
  --------------------------------------------------------------------------------

### 3.52.6 Formulation

This element simulates a solid wall that allows shocks and bounces with it by means of a restitution coefficient (cl). When a mass with a velocity v hits the wall (that is, its position is equal to the wall position, wp), its velocity is set to -- cl·v while keeping the same position. This calculation is performed in the DISCRETE block.

The integer flag ws defines the solid side of the wall (in other words, where the mass movement is not possible). When ws = 0, the solid side is for s ≤ wp (movement forbidden in the left side). The movement is forbidden in the right side of wp when ws =1.

# 4 Application examples

## 4.1 Examples

### 4.1.1 Example_CoupledClutches

#### 4.1.1.1 Description

A series of clutches are activated one after another, adding inertia to the system. The first clutch is controlled by a sine wave. This means that when this signal goes over a certain value or below it, the mode changes. The other two are controlled by constant signals.

#### 4.1.1.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (sineSignal):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               10                \-                Signal amplitude or height

  Period            0.2               s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (signal_clutch1):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Phase             1.57              rad               Phase of sine source

  Period            5                 s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (signal_clutch2):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  source            Source_Step                         Waveform

  Tstart            0.4               s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (signal_clutch3):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  source            Source_Step                         Waveform

  Tstart            0.9               s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (torqueZero):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  Amp               0                 \-                Signal amplitude or height

  ----------------------------------------------------------------------------------

#### 4.1.1.3 Schematics

![Example_CoupledClutches](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image118.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.1.4 Results

The following plot illustrates how after engaging each of the clutches the velocity in the system decreases until it reaches an equilibrium. As more inertia is added to the system, the shaft rotates at a lower speed. The rotating masses have an initial moment of acceleration, until they reach the speed of the system. This point is where the two faces of the clutch stop having relative motion between them and the whole shaft rotates at the same pace.

![exp](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image119.png){width="6.479166666666667in" height="2.40625in"}

### 4.1.2 Example_DriveTrain

#### 4.1.2.1 Description

A drivetrain is a mechanism used to transfer the motion between engine and wheels. The former will be represented by a sine wave, whereas the latter will be an Inertia. Between these two components there will be a clutch, a damper-spring combination and a brake.

The sine wave which defines the engine will only be active when the startSignal is on.

#### 4.1.2.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (sineSignal):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               200               \-                Signal amplitude or height

  Period            PI / 50           s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (startSignal):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  Amp               -1                \-                Signal amplitude or height

  Tstart            startTime         s                 Starting time of signal generation

  Offset            1                 \-                Offset of output signal
  ------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (brakeSignal):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  source            Source_Step                         Waveform

  Tstart            startTime         s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (torqueZero):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  Amp               0                 \-                Signal amplitude or height

  ----------------------------------------------------------------------------------

- MECHANICAL.R_Inertia (inertia3):

  --------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------
  w0                100               rad/s             Initial angular velocity

  --------------------------------------------------------------------------------

- MECHANICAL.R_Inertia (inertia2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 0.05              kg·m\^2           Moment of inertia of body

  w0                90                rad/s             Initial angular velocity
  ---------------------------------------------------------------------------------

- MECHANICAL.R_Inertia (inertia3):

  --------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------
  w0                90                rad/s             Initial angular velocity

  --------------------------------------------------------------------------------

- MECHANICAL.R_Clutch (clutch):

  -----------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------------------------
  peak              1                                   Maximum value of mue for w_rel=0

  fn_max            N                 N                 Maximum normal force

  w_rel_i           rad/s             rad/s             Initial relative angular velocity
  -----------------------------------------------------------------------------------------

- MECHANICAL.R_Brake (brake):

  -----------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------------------------
  peak              1                                   Maximum value of mue for w_rel=0

  fn_max            1600              N                 Maximum normal force

  w_i               90                rad/s             Initial relative angular velocity
  -----------------------------------------------------------------------------------------

- MECHANICAL.R_SpringDamper (spring):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  d                 1                 N·m·s/rad         Damping constant

  c                 160               N·m/rad           Spring constant
  ------------------------------------------------------------------------

#### 4.1.2.3 Schematics

![Example_DriveTrain](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image120.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.2.4 Results

As the clutch connects the engine to the wheel, it starts to move. However, as soon as the brake is activated, the velocity starts decreasing. Both inertia1 and inertia2 drop at the same rate, this cannot be said for inertia3. The reason behind this phenomenon is that the clutch has been deactivated and there is no longer torque coming from the engine.

![exp_4](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image121.png){width="6.489583333333333in" height="3.0625in"}

### 4.1.3 Example_GearFriction1

#### 4.1.3.1 Description

Friction between the gears can result in a loss of speed, torque or both of them. This can cause the different parts of the shaft to be asynchronous. Starting movement on the axis may also prove to be difficult due to the reasons cited.

#### 4.1.3.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (driveSignal):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               10                \-                Signal amplitude or height

  Period            1                 s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (load):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  source            Source_Ramp                         Waveform

  Amp               5                 \-                Signal amplitude or height

  Offset            -10               \-                Offset of output signal

  rampDuration      2                 s                 Duration of the ramp
  ----------------------------------------------------------------------------------

- MECHANICAL.R_Inertia (inertia2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 1.5               kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

#### 4.1.3.3 Schematics

![Example_GearFriction1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image122.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.3.4 Results

The plot shows how the mechanism struggles to get the motion started, as it has to overcome the static resistance force. As it can be observed, equilibrium is not reached.

![exp_3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image123.png){width="6.489583333333333in" height="3.125in"}

### 4.1.4 Example_GearFriction2

#### 4.1.4.1 Description

The same case as before. However, in this one, both bearing and gears will have friction. This results in a

#### 4.1.4.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (driveSignal):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               10                \-                Signal amplitude or height

  Period            1                 s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (load):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  source            Source_Ramp                         Waveform

  Amp               5                 \-                Signal amplitude or height

  Offset            -10               \-                Offset of output signal

  rampDuration      2                 s                 Duration of the ramp
  ----------------------------------------------------------------------------------

- MECHANICAL.R_BearingFriction (bearingFriction):

  ------------------------------------------------------------------------------------------------------------------------
  Variable          Value                  Units             Description
  ----------------- ---------------------- ----------------- -------------------------------------------------------------
  tau_pos           { { 0,1} ,{ 0.5,1} }                     Positive sliding friction characteristic for positive speed

  ------------------------------------------------------------------------------------------------------------------------

#### 4.1.4.3 Schematics

![Example_GearFriction2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image124.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.4.4 Results

The result is the same as before. However, the decrease in speed is not as big as in the case before.

![exp_5](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image125.png){width="6.489583333333333in" height="2.2291666666666665in"}

### 4.1.5 Example_Spring

#### 4.1.5.1 Description

In the following case study, two masses connected by a spring with no forces acting on them. However, one of the masses will be located out of the resting position of the spring. This will cause the whole system to oscillate. These oscillations will be infinite, as there is no damping in the mechanism.

#### 4.1.5.2 Components

#### 4.1.5.3 Schematics

![Example_Spring](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image126.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.5.4 Results

As mentioned before, the system never reaches equilibrium. The position of the two masses will change according to a sine wave of the same amplitude and period, but different sign.

![exp_6](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image127.png){width="6.489583333333333in" height="2.3333333333333335in"}

### 4.1.6 Example_T_Stop

#### 4.1.6.1 Description

A *T_Stop* is a component with position and friction restraints. It will only be able to move between certain points.

#### 4.1.6.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (SignalPosition):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  Amp               -1.75             \-                Signal amplitude or height

  ----------------------------------------------------------------------------------

- CONTROL.AnalogSource (ForceNull):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  Amp               0                 \-                Signal amplitude or height

  ----------------------------------------------------------------------------------

- MECHANICAL.T_Spring (spring):

  --------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------------------------
  k                 500               N/m               Spring constant

  s_rel0            1                 m                 Distance between ports for unloaded spring
  --------------------------------------------------------------------------------------------------

- MECHANICAL.T_Stop (T_Stop):

  ----------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------------
  smax              0.9               m                 Right stop for sliding mass

  smin              -0.9              m                 Left stop for sliding mass

  F_Coulomb         3                 N                 Constant friction: Coulomb force

  F_Stribeck        5                 N                 Stribeck effect
  ----------------------------------------------------------------------------------------

#### 4.1.6.3 Schematics

![Example_T_Stop](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image128.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.6.4 Results

As the plots show, the mass only advances up to a certain point. At that point, the system saturates.

![exp_7](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image129.png){width="6.489583333333333in" height="2.8541666666666665in"}

## 4.2 Rotational exercises

### 4.2.1 Example_GearChange

#### 4.2.1.1 Description

One of the most basic elements in the library is the gear. This component will allow for torque and speed manipulation. In order to learn how it works, the case study will make use of it. Two inertias will be connected by a cog with a known ratio. The torque will be provided by the actuator component, which will be fed random values following a normal distribution with a known average and deviation. The two cases to be studied are the behaviour of the system when the gear is changed, and when the inertia of the bodies varies.

![Mec_ex1_diagram](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image130.png){width="6.489583333333333in" height="2.0520833333333335in"}

#### 4.2.1.2 Components

In order to replicate this, the components, which are changed, are the following:

- MECHANICAL.R_Inertia (R_Inertia_2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 3                 kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

#### 4.2.1.3 Schematics

![Mech_ex1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image131.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.1.4 Results

In the first experiment a \"FOR\" loop goes through all different values of gear ratio. As this parameter increases, so does the speed of the inertia. However, the torque decreases.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image132.png){width="6.495833333333334in" height="2.8020833333333335in"}

In the second experiment, the same thing is done with the inertia values. As the inertia increases, the acceleration of the rotating bodies decreases.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image133.png){width="6.495833333333334in" height="2.7881944444444446in"}

### 4.2.2 Mech_ex2

#### 4.2.2.1 Example_FixedVelocity

The following case study examines the behaviour of the system when introduced to a new component, fixed velocity. This element restrains the initial angular speed of an element with inertia to one defined by the user. In the experiment, the fixed velocity is changed to various values in order to see how it affects the mechanism. The results are shown in the monitor.

![Untitled Diagram](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image134.png){width="6.489583333333333in" height="1.7916666666666667in"}

#### 4.2.2.2 Components

In order to replicate this, the components, which are changed, are the following:

- MECHANICAL.R_Inertia (R_Inertia_2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 3                 kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

#### 4.2.2.3 Schematics

![Mech_ex2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image135.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.2.4 Results

With each change of initial velocity, the signal starts at a different point. A \"FOR\" loop in the experiment allows the change between different values of fixed velocities.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image136.png){width="6.495833333333334in" height="2.765972222222222in"}

### 4.2.3 Example_Brake

#### 4.2.3.1 Description

An essential component is the brake. These elements are widely used in the industry and are indispensable for rotating mechanisms. By applying an external force, the device is able to reduce, or even stop, rotation on both its ends. The goal of the experiment was to see how much the force affects this, and how much of it is necessary to completely stop the system.

![Mech_ex3_brake(1)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image137.png){width="6.5in" height="1.6041666666666667in"}

#### 4.2.3.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (AnalogSource_1)

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  source            Source_Sine                         Waveform

  Amp               20                                  Signal amplitude or height
  ----------------------------------------------------------------------------------

- MECHANICAL.R_Inertia (R_Inertia_2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 3                 kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

- MECHANICAL.R_Brake (Brake):

  ----------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------
  fn_max            20                N                 Maximum normal force

  ----------------------------------------------------------------------------

#### 4.2.3.3 Schematics

![Mech_ex3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image138.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.3.4 Results

The greater the force, the faster the system decreases its speed.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image139.png){width="6.5in" height="3.5208333333333335in"}

### 4.2.4 Example_Clutch

#### 4.2.4.1 Description

Clutches are the mechanical equivalent to an electrical switch. By using friction, they connect two rotating shafts and make their relative angular speed null. This case study seeks to understand how the system behaves when activating such a device in two different manners. The first one is a simple instance of actuating the clutch and keeping it in the final position. The second one is replicating this phenomenon, but also letting it go repeatedly. The monitor shows how without any sort of friction, the inertias keep accumulating angular moment.

![Untitled Diagram](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image140.png){width="6.489583333333333in" height="1.75in"}

#### 4.2.4.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (AnalogSource_1): This component is used to generate a signal of a certain shape and parameters. The specifications used in this component are the following:

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  source            Source_Sine                         Waveform

  Amp               20                                  Signal amplitude or height

  Tstart            10                s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

- MECHANICAL.R_Inertia (R_Inertia_2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 3                 kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

#### 4.2.4.3 Schematics

![Mech_ex4](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image141.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.4.4 Results

As the plots in the monitor show, when the clutch is activated by an external force the rightmost inertia (R_Inertia_3) starts rotating. It will accelerate until it reaches the same speed as R_Inertia_2.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image142.png){width="6.5in" height="3.5104166666666665in"}

The next case study explores the possibility of pressing the clutch together and letting it go numerous times. The inertia will accelerate only when the clutch is activated.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image143.png){width="6.5in" height="3.5208333333333335in"}

### 4.2.5 Example_PIControlledMechanicalSystem

#### 4.2.5.1 Description

Knowing the basic elements of the mechanical library, the next logical step is controlling them. This case study analyses how a PI controller should be configured in order to regulate the torque and achieve the desired speed values.

![Mech_ex5](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image144.png){width="6.489583333333333in" height="1.6875in"}

#### 4.2.5.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (AnalogSource_1):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  source            Source_Square                       Waveform

  Amp               50                                  Signal amplitude or height

  Offset            25                                  Offset of output signal
  ----------------------------------------------------------------------------------

- 

- 

- 

- 

- CONTROL.Cntrl_PI (PI_cntrl):

  -------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -------------------------------------
  k\[n\]            3                                   Proportional gain of the controller

  u_min\[n\]        150                                 Low limit of output

  u_max\[n\]        150                                 High limit of output

  Ti\[n\]           0.1               s                 Integrator time or reset time
  -------------------------------------------------------------------------------------------

- MECHANICAL.R_Inertia (R_Inertia_2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 3                 kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

#### 4.2.5.3 Schematics

![Mech_ex5](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image145.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.5.4 Results

In first place, the PI controller is designed with general parameters. This is done to evaluate what is the current state of the control system. The monitor below showcases the output after adjusting some of the values used in the PI controller.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image146.png){width="6.5in" height="3.5104166666666665in"}

The second case considers the influence of the proportional constant in the PI controller. Different values are used in order to determine the optimal value to use. As the monitor shows, this makes the signal achieve the desired value faster.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image147.png){width="6.5in" height="3.5208333333333335in"}

The third case studies the influence of the integrating time over the system. As the monitor shows, the smaller the integrating time is, the more the signal oscillates.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image148.png){width="6.5in" height="3.5208333333333335in"}

### 4.2.6 Example_PIControlledClutch

#### 4.2.6.1 Description

Knowing the basic elements of the mechanical library, the next logical step is controlling them. This case study analyses how a PI controller should be configured in order to regulate the torque with a clutch between the controller and the element to be controlled.

#### 4.2.6.2 Components

In order to replicate this, the components, which are changed, are the following:

- MECHANICAL.R_Inertia (R_Inertia_2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 3                 kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

- MECHANICAL.Clutch (Clutch):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 3                 kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

- CONTROL.AnalogSource (Torque_signal):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  source            Source_Square                       Waveform

  Amp               50                                  Signal amplitude or height

  Offset            25                                  Offset of output signal
  ----------------------------------------------------------------------------------

- CONTROL.AnalogSource (AnalogSource_2):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  source            Source_Step                         Waveform

  Amp               20                                  Signal amplitude or height

  Tstart            10                s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

- CONTROL.Cntrl_PI (PI_cntrl):

  -------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -------------------------------------
  k\[n\]            3                 \-                Proportional gain of the controller

  u_min\[n\]        -150              \-                Low limit of output

  u_max\[n\]        150               \-                High limit of output

  Ti\[n\]           0.05              s                 Integrator time or reset time
  -------------------------------------------------------------------------------------------

- 

#### 4.2.6.3 Schematics

![Mech_ex6](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image149.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.6.4 Results

As the controlled element reaches the set velocity, the system stabilizes. However, when the clutch is connected, the controller quickly overcompensates. From that point on, it will bring the element to the desired value of velocity, with just a slight variation.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image150.png){width="6.5in" height="3.5208333333333335in"}

### 4.2.7 Example_RotationalSpringAndDamper

#### 4.2.7.1 Description

The following is a comparison between the following rotational elements:

- Spring

- Damper

- Spring and Damper in parallel

#### 4.2.7.2 Components

In order to replicate this, the components, which are changed, are the following:

- MECHANICAL.R_Inertia (R_Inertia_2, R_Inertia_2, R_Inertia_2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  I                 3                 kg·m\^2           Moment of inertia of body

  ---------------------------------------------------------------------------------

- MECHANICAL.R_Damper (Damper):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  d                 0.02              N·m·s/rad         Damping constant

  ------------------------------------------------------------------------

- MECHANICAL.R_Spring (R_Spring_1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  c                 50                N·m/rad           Spring constant

  -----------------------------------------------------------------------

- MECHANICAL.R_SpringDamper (SpringDamper):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  d                 0.02              N·m·s/rad         Damping constant

  c                 50                N·m/rad           Spring constant
  ------------------------------------------------------------------------

#### 4.2.7.3 Schematics

![Mech_ex7](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image151.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.7.4 Results

The first experiment analyses how the system behaves with basic settings of damping and elastic constants. Both systems with springs behave very similarly. The torque oscillates with very little sign of damping. However, the system with a both elements shows how the torque is dampening itself. The system with just a damper just rises, with no oscillation.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image152.png){width="6.5in" height="3.5208333333333335in"}

The second experiment analyses the influence of the damping constant on the various systems. As expected, the one without a damper shows no change in behaviour. However, as the damping constant rises, the faster the torque signal is dampened in the case with both a spring and a damper.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image153.png){width="6.5in" height="3.5208333333333335in"}

The third experiment illustrates how the system is affected by a variation in the elastic constant. As this constant rises, so does the frequency with which the torque oscillates.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image154.png){width="6.5in" height="3.5208333333333335in"}

## 4.3 Translation exercises

### 4.3.1 Example_TranslationalSpringAndDamper

#### 4.3.1.1 Description

The following is a comparison between the following translational elements:

- Spring

- Damper

- Spring and Damper in parallel

#### 4.3.1.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (Force_val):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Pulse                        Waveform

  Amp               5                 \-                Signal amplitude or height

  Tstart            5                 s                 Starting time of signal generation

  Period            500               s                 Period of sine, pulse, sawtooth, or square source

  pulseWidth        0.1               s                 Pulse width of pulse wave
  ---------------------------------------------------------------------------------------------------------

- MECHANICAL.T_Damper (Damper):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  d                 0.1               N·s/m             Damping constant

  ------------------------------------------------------------------------

- MECHANICAL.T_Spring (Spring):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  k                 1                 N/m               Spring constant

  -----------------------------------------------------------------------

- MECHANICAL.T_SpringDamper (SpringDamper):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  d                 0.1               N·s/m             Damping constant

  k                 1                 N/m               Spring constant
  ------------------------------------------------------------------------

#### 4.3.1.3 Schematics

![Mech_ex8](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image155.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.3.1.4 Results

The goal of the first experiment is to illustrate the difference between the three systems. Without any damping, the elastic system oscillates endlessly. Likewise, a system with no elastic coefficient is unable to go back to its initial position. The spring and damper solution oscillates up to a certain point, reaching equilibrium in its initial stage after some time.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image156.png){width="6.5in" height="3.5208333333333335in"}

After analysing how the different systems behave, the second experiment focuses on showcasing the influence of the damping constant. As the constant rises, the final position of the element decreases, as it gets more difficult to overcome the resistance. In the spring and damper component the increase in damping constant affects in the speed the system reaches equilibrium.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image157.png){width="6.5in" height="3.5208333333333335in"}

When changing the restitution coefficient of the wall, no discernible changes can be appreciated.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image158.png){width="6.5in" height="3.5208333333333335in"}

The last experiment analyses the influence of the elastic constant. An increase in this coefficient means a decrease in the amplitude of the position signal. However, it also affects the frequency of the wave, which grows proportionally.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image159.png){width="6.5in" height="3.5208333333333335in"}

### 4.3.2 Example_2DegreeOfFreedomSystem

#### 4.3.2.1 Description

A system which requires 2 coordinate systems in order to properly define its position, is called a 2DOF system. In this case, 2 masses are joined to each other in order to replicate this. One of the masses will also be tied to a wall. The goal of this case study is to illustrate how different waves affect the mechanism.

#### 4.3.2.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (Force_val):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  source            Source_Constant                     Waveform

  Amp               20                \-                Signal amplitude or height
  ----------------------------------------------------------------------------------

- MECHANICAL.T_SpringDamper (SpringDamper):

  --------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------------------------
  d                 1                 N·s/m             Damping constant

  k                 1                 N/m               Spring constant

  s_rel0            1                 m                 Distance between ports for unloaded spring
  --------------------------------------------------------------------------------------------------

- MECHANICAL.T_SlidingMass (Mass_1):

  -----------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------------
  s0                1                 m                 Initial body position

  -----------------------------------------------------------------------------

- 

- MECHANICAL.T_SlidingMass (Mass_2):

  -----------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------------
  s0                2                 m                 Initial body position

  -----------------------------------------------------------------------------

- MECHANICAL.T_Spring (Spring):

  --------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------------------------
  k                 1                 N/m               Spring constant

  s_rel0            1                 m                 Distance between ports for unloaded spring
  --------------------------------------------------------------------------------------------------

#### 4.3.2.3 Schematics

![Mech_ex9](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image160.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.3.2.4 Results

In the different experiments, the force will have various shapes. In the plot below, it is a pulse. The picture shows the difference in position between the two masses.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image161.png){width="6.489583333333333in" height="2.8541666666666665in"}

### 4.3.3 Example_PIControlled2DOFSystem

#### 4.3.3.1 Description

Seeing how a 2DOF system behaves, the next step is controlling it. With a PID controller, the position of the masses can be set.

#### 4.3.3.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.Cntrl_PID (PID_Cntrl):

  -------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -------------------------------------
  k\[n\]            10                \-                Proportional gain of the controller

  u_max\[n\]        50                \-                High limit of output

  Ti\[n\]           0.1               s                 Integrator time or reset time

  Td\[n\]           1                 s                 Rate or derivative time
  -------------------------------------------------------------------------------------------

- MECHANICAL.T_SpringDamper (SpringDamper):

  --------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------------------------
  d                 1                 N·s/m             Damping constant

  k                 1                 N/m               Spring constant

  s_rel0            1                 m                 Distance between ports for unloaded spring
  --------------------------------------------------------------------------------------------------

- MECHANICAL.T_SlidingMass (Mass_1):

  -----------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------------
  s0                1                 m                 Initial body position

  -----------------------------------------------------------------------------

- 

- MECHANICAL.T_SlidingMass (Mass_2):

  -----------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------------
  s0                2                 m                 Initial body position

  -----------------------------------------------------------------------------

- MECHANICAL.T_Spring (Spring):

  --------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------------------------
  k                 1                 N/m               Spring constant

  s_rel0            1                 m                 Distance between ports for unloaded spring
  --------------------------------------------------------------------------------------------------

- MECHANICAL.T_Spring (Spring):

  --------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------------------------
  k                 1                 N/m               Spring constant

  s_rel0            1                 m                 Distance between ports for unloaded spring
  --------------------------------------------------------------------------------------------------

- 

#### 4.3.3.3 Schematics

![Mech_ex10](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image162.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.3.3.4 Results

The first experiment analyses how a PID controller reaches equilibrium in the mass position. As the plot shows, once one of the masses stabilizes, the other one follows shortly.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image163.png){width="6.5in" height="3.5208333333333335in"}

As the proportional constant increases, the signal peak decreases. It also reaches equilibrium faster.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image164.png){width="6.5in" height="3.5208333333333335in"}

As the integration time decreases, so does the signal peak.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image165.png){width="6.5in" height="3.5208333333333335in"}

As the differential time increases, so does the speed in which it stabilizes itself. However, from a certain point it stabilizes on the wrong value.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image166.png){width="6.5in" height="3.5208333333333335in"}

### 4.3.4 Example_Piston

#### 4.3.4.1 Description

The piston component is defined by two mechanical ports and an analogue one. The following case analyses how it works.

#### 4.3.4.2 Components

In order to replicate this, the components, which are changed, are the following:

- CONTROL.AnalogSource (Air_val):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  source            Source_SawTooth                     Waveform

  Amp               5000              \-                Signal amplitude or height
  ----------------------------------------------------------------------------------

- CONTROL.AnalogSource (F_ext):

  ----------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ----------------------------
  Amp               100               \-                Signal amplitude or height

  ----------------------------------------------------------------------------------

- MECHANICAL.R_GearIdealR2T (Rot_to_Trans):

  --------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------
  ratio             -5                rad/m             Transmission ratio

  --------------------------------------------------------------------------

- MECHANICAL.R_SpringDamper (SpringDamper):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  d                 0.4               N·m·s/rad         Damping constant

  c                 0.4               N·m/rad           Spring constant
  ------------------------------------------------------------------------

- MECHANICAL.R_Damper (Damper):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  d                 1                 N·m·s/rad         Damping constant

  ------------------------------------------------------------------------

#### 4.3.4.3 Schematics

![Mech_ex11](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image167.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.3.4.4 Results

The following experiment analyses the behaviour if the system. The linear speed of the rod is converted into rotational velocity. With the aid of dampers and springs, the motion is turned into a signal which resembles a sine.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image168.png){width="6.5in" height="3.5208333333333335in"}

The next experiment analyses the influence of changing the external force on the piston. As this force increases the amplitude of the rotational velocity decreases.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image169.png){width="6.5in" height="3.5208333333333335in"}

# 5 Building a Model

This library is designed for building MECHANICAL models by dragging and pasting components as if it was a real system.

Next sections describe how to build a simple model, and how to simulate it. The basic methodology to create and simulate this simple model is the same as that for more complex models.

## 5.1 Guidelines for Building a Model

Components can be connected together in every meaningful combination (e.g. direct connection of two springs or two inertias).

However, difficulties may occur, if the elements which can lock the relative motion between two flanges are connected rigidly together. Currently, this type of problem can occur with the Coulomb friction elements BearingFriction, Clutch, Brake, LossyGear when the elements become stuck:

Sensors components of position extract the information from only one port, i.e., the value corresponding to that port, whereas force and torque sensors must be inserted between the ports where the force is required to be measured.

## 5.2 Description of the example

The model described in this chapter represents Translational Stop example.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image170.png){width="6.489583333333333in" height="0.90625in"}

The system consists of an external force and spring acting on a mass whose displacements is limited between two stops. Left side of the spring is fixed.

## 5.3 Build the Model

To build the model users should follow the steps to create a schematic, as described below. The active Workspace must include the MATH, PORTS_LIB, MECHANICAL \_EXAMPLES and the CONTROL libraries loaded:

- Create a new schematic using the botton ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image171.png){width="0.16263998250218722in" height="0.17305336832895887in"} or the File \> New \> Schematics. Save it in the MECHANICAL \_EXAMPLES library and choose a name (for example, my_model).

- From the icon explorer tab of the MECHANICAL library, select one by one the different components showed in the figure above and drag them to the schematic window

- Arrange the components in the schematic like in the figure above:

  - Use the Rotate buttons if necessary.

  - To change the size of a component, select the component, right button, select "component shape option" and change the size by dragging the symbol's corners.

  - To change the position of the component's name, press the SHIFT key at the same time as you move the mouse pointer over the labels, and drag it.

- Draw connectors between the components like in the figure above. A tooltip will appear whenever the mouse runs over a port, displaying the information of that port:

  - Select the connection button on the right-hand toolbar ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image172.png){width="0.16893372703412074in" height="0.15856080489938756in"}, or press the SHIFT key at the same time as you move the mouse pointer over a port

  - Left-click on the port to be connected

  - Click the various points of the schematic drawing where the connector is required to run (if any)

  - Left-click the target port, which must be of the same type as the origin port

  - To connect different components with right angles, there are two options: 1) select right angle connections mode by pressing ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image173.png){width="0.1980194663167104in" height="0.1858606736657918in"} button and connect components as explained before. 2) Create a connection straight line between two components, press SHIFT and left click over the line. A point will be created to divide the line in two different segments. Drag the point to the desired place and use ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image174.png){width="0.18316819772528434in" height="0.1644225721784777in"} button to force right angles.

  - To delete extra points of a connector line, just press SHIFT over the point and click on the point to be deleted

- Set the data of the components. Now you must customize the component data according to the table below:

COMPONENT INSTANCES DATA:

  ---------------------------------------------------------------------------------------------------------------------
  DATUM                          VALUE        DESCRIPTION                                              UNITS  
  ------------------------------ ------------ -------------------------------------------------------- ----------------
  ForceNull.Amp                  0            Signal amplitude or height (-)                           \"-\" 

  ForceNull.Offset               0            Offset of output signal (-)                              \"-\" 

  ForceNull.Period               10           Period of sine, pulse, sawtooth, or square source (s)    \"s\" 

  ForceNull.Phase                0            Phase of sine source (rad)                               \"rad\" 

  ForceNull.Tstart               0            Starting time of signal generation (s)                   \"s\" 

  ForceNull.n_out                1            Dimension of outputs (-)                                 \"-\" 

  ForceNull.pulseWidth           0.001        Pulse width of pulse wave (s)                            \"s\" 

  ForceNull.rampDuration         10           Duration of the ramp (s)                                 \"s\" 

  ForceNull.source               Constant     Waveform                                                 \"\" 

  ForceNull.timeTable                         Table for table source (-)                               \"-\" 

  SignalPosition.Amp             -1.75        Signal amplitude or height (-)                           \"-\" 

  SignalPosition.Offset          0            Offset of output signal (-)                              \"-\" 

  SignalPosition.Period          10           Period of sine, pulse, sawtooth, or square source (s)    \"s\" 

  SignalPosition.Phase           0            Phase of sine source (rad)                               \"rad\" 

  SignalPosition.Tstart          0            Starting time of signal generation (s)                   \"s\" 

  SignalPosition.n_out           1            Dimension of outputs (-)                                 \"-\" 

  SignalPosition.pulseWidth      0.001        Pulse width of pulse wave (s)                            \"s\" 

  SignalPosition.rampDuration    10           Duration of the ramp (s)                                 \"s\" 

  SignalPosition.source          Constant     Waveform                                                 \"\" 

  SignalPosition.timeTable                    Table for table source (-)                               \"-\" 

  T_Stop.F_Coulomb               3            Constant friction: Coulomb force (N)                     \"N\" 

  T_Stop.F_Stribeck              5            Stribeck effect (N)                                      \"N\" 

  T_Stop.F_prop                  1            Velocity dependent friction (N/\[m/s\])                  \"N/\[m/s\]\" 

  T_Stop.fexp                    2            Exponential decay (1/\[m/s\])                            \"1/\[m/s\]\" 

  T_Stop.m                       1            Mass (kg)                                                \"kg\" 

  T_Stop.smax                    0.9          Right stop for sliding mass (m)                          \"m\" 

  T_Stop.smin                    -0.9         Left stop for sliding mass (m)                           \"m\" 

  spring.k                       500          Spring constant (N/m)                                    \"N/m\" 

  spring.s_rel0                  1            Distance between ports for unloaded spring (m)           \"m\" 
  ---------------------------------------------------------------------------------------------------------------------

- To change data of a component double-click on the corresponding symbol to open the Attributes Editor. For example, for the T_stop component, data values should be like this:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image175.png){width="5.833632983377078in" height="3.493234908136483in"}

- Finally, generate the model using the button ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image176.png){width="0.14907042869641296in" height="0.13860017497812774in"}. The following window will be display. Click OK and you will have finalised the construction of your model and you can simulate it as described in the following section, "Simulating the Model":

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image177.png){width="3.2501673228346455in" height="1.4584087926509186in"}

## 5.4 Simulate the Model

Now it is ready for the simulation. Go to the Simulation View.

- Select \"my_model.default\" (if the name of the partition you have created is "default") from the MECHANICAL_EXAMPLES library, right-click, select option \"New experiment\". The following window will be display. Type a name for the experiment:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image178.png){width="3.5084492563429572in" height="2.567658573928259in"}

- A default experiment text should appear in the editing window. Change the REPORT_MODE, TSTOP, CINT, IMETHOD (Communications Interval) and other values as indicated here below:

EXPERIMENT exp2 ON my_model.default

\...

REPORT_MODE = IS_STEP

\...

\-- simulate a transient in range\[TIME,TSTOP\] reporting at every CINT

TIME = 0

TSTOP = 0.1

CINT = 0.011

IMETHOD = DASSL_SPARSE

INTEG()

END EXPERIMENT

- Double dash (\--) means a comment.

- "IMETHOD = DASSL_SPARSE" means that the DASSL sparse integration method will be employed (See the User Manual.

- "REPORT_MODE = IS_STEP" means that an output (in the plots and in the reports) will be produced at each internal time step (given by the integration method), that is normally shorter than the communication interval CINT.

<!-- -->

- Save the experiment. The experiment name will appear in the Workspace area

- Now you're going to simulate the experiment using the Monitor. Right button over the experiment name in the Workspace area, and select "Simulate in Monitor". Clicking ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image179.png){width="0.21458333333333332in" height="0.21458333333333332in"} button will produce same action

- The Experiments monitor comes up. Add the necessary plots to visualize the results.

  - To add a plot click on \"Tab_1" and then click "New Plot" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image180.png){width="0.25277777777777777in" height="0.22777777777777777in"}. A window will appear with the "drawable / plotable" variables of the experiment.

  - Apply a filter to help you selecting variables. Tick the boxes alongside selected variables:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image181.png){width="6.496527777777778in" height="5.014583333333333in"}

- Just as the user may wish to plot the evolution of a variable compared with another, he may also wish to track the numerical values of the variables. The main task of the Watch is to display the variable values of the experiment, enabling them to be modified wherever possible.

  - The first step is to add variables by doing right click in the Watch Area and select the option "Edit Watch".

  - A menu very similar to that of the plots will appear, enabling the user to add or delete variables.

- To simulate the experiment click "Simulate" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image182.png){width="0.1736111111111111in" height="0.25277777777777777in"}. By clicking "New Integration" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image183.png){width="0.2625in" height="0.25763888888888886in"} on the toolbar, the simulation can be extended or started at new times.

Figure below shows some typical time histories of the main variables of the model:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\MECHANICAL\source_files\MECHANICAL_Library_Reference_Manual_media/media/image184.png){width="6.496527777777778in" height="4.307638888888889in"}

# 6 References

User Manual. EA International. 1992-2022
