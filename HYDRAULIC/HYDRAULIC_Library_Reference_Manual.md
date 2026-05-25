---
input_mode: dir
title: docs \> HYDRAULIC \> source_files \> HYDRAULIC_Library_Reference_Manual
---

# 1 Overview of the Library

## 1.1 Introduction

This document is the User Manual for the HYDRAULIC library. The HYDRAULIC library provides the custom items needed to represent simple hydraulic networks. It can be used as a stand-alone library or together with other libraries. This library allows to easily build models, dragging and dropping the symbols from the library palette and connecting them. The manual contains different chapters. Chapter \`\`[Building a Model](#building-a-model)\'\' contains a step-by-step description of the modelling and simulation process with the HYDRAULIC library. Chapter \`\`[Notes of the HYDRAULIC library](#notes-of-the-hydraulic-library)\'\' contains a set of tips to master the use of the library. Chapter \`\`[HYDRAULIC Library Items](#hydraulic-library-items)\'\' describes the ports of the library, the enumerative type data and fluids defined in the library and a brief description of the available components in the library. Chapter \`\`[HYDRAULIC Abstract Components](#hydraulic-abstract-components)\'\' provides reference information for all abstract components defined in the library. The abstract components describe a behaviour that alone does not represent any physical component and can only be used as a base component for other components. Chapter \`\`[HYDRAULIC Components](#hydraulic-components)\'\' provides reference information for all HYDRAULIC library components. Chapter \`\`[Application Examples](#application-examples)\'\' contains a detailed description of the examples present in the HYDRAULIC_EXAMPLES library.

## 1.2 Change log

+---------+---------------------------------------------------------------------------------------------------------------------------------------------+
| Version | New Features                                                                                                                                |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------+
| 3.1.3   | - The symbols and schematics appearance have been updated.                                                                                  |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------+
| 3.1.4   | - The libraries dependences and file categories have been added.                                                                            |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------+
| 3.1.5   | - Default widgets in symbols have been implemented for schematic simulation.                                                                |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------+
| 3.1.6   | - The following hydraulic machines components have been added: HydPump and HydTurbine.                                                      |
|         |                                                                                                                                             |
|         | - Boundary components Inlet and Outlet have been included.                                                                                  |
|         |                                                                                                                                             |
|         | - A heat exchanger component called HydHex has been added.                                                                                  |
|         |                                                                                                                                             |
|         | - The following components with a thermal interface have been included in the library: HydPipe_Th and HydTank_Th.                           |
|         |                                                                                                                                             |
|         | - The fluid definition in the models has been improved enabling the use of different liquids and more than one fluid in the same schematic. |
|         |                                                                                                                                             |
|         | - The symbols categories has been updated.                                                                                                  |
|         |                                                                                                                                             |
|         | - EL code files have been updated.                                                                                                          |
|         |                                                                                                                                             |
|         | - Hydraulic port has been moved to PORTS_LIB as hyd                                                                                         |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------+

## 1.3 Description

HYDRAULIC is a library for the transient and steady simulation of hydraulic circuits. Most of the typical hydraulic units are included as components ([^1]) that can be used to build graphically complex systems.

The following are the most important features of the library:

- The components are based on the mass, energy and momentum conservation equations ([^2]).

- Pressure drop is considered.

- Special components simulating a heat exchanger, a valve and hydraulic machines (pump, turbine) are included.

- This library can be connected to the CONTROL, the THERMAL and the MECHANICAL libraries.

- Generic sources (bound components) of mass flow, pressure and temperature are included.

- Sensor components measuring the mass flow, the pressure and the temperature in a branch (which allows coupling hydraulic circuits to control blocks) are also available.

- It\'s possible to choose between several working fluids.

- The fluid properties are limited to density and specific heat of the working fluid, which are considered constant along the simulation.

- The sign convention within a component is: mass flow (\`\`w\'\' variable) and energy flow (\`\`wh\'\' variable) are positive if they enter an IN hydraulic port or exit an OUT hydraulic port, and negative otherwise.

Application\'s job is to order all the equations involved, regardless of how the user includes the different components in a particular hydraulic network.

## 1.4 Sign convention

The sign convention mass flow and enthalpy flows (\`\`w\'\' and \`\`wh\'\' variables) is:

- POSITIVE if they enter through an IN port (normally named f_in) or exit through an OUT port (normally named f_out).

- NEGATIVE if they exit through an IN port (normally named f_in) or enter through an OUT port (normally named f_out).

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image3.png){width="2.6147747156605425in" height="1.6163812335958005in"}

\`\`Pump\'\' and \`\`Turbine\'\' are the only components in the library with a mechanical interface. Thus, by means of the \`\`mech_rot\'\' port, pumps will consume mechanical power while turbines will generate it. The sign convection for mechanical power is: positive for consumption (pump), negative for generation (turbine).

## 1.5 Connectivity rules

The definition of the \`\`Hydraulic\'\' port does not allow the connection of ports with the same effective mode. In other words, IN ports must be connected to OUT ports, and vice versa. Connecting two IN ports together will raise an error when compiling the schematic. The same will happen when trying to connect two OUT ports together.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image4.png){width="4.28736220472441in" height="3.5162543744531933in"}

# 2 Building a Model

Models of hydraulic networks are built by arrangement of components of libraries such as the HYDRAULIC, the CONTROL, the THERMAL or the MECHANICAL. The HYDRAULIC library is designed for building hydraulic models by dragging and dropping components as if it was a real circuit.

The following sections describe how to build a simple model, and how to simulate it. The basic methodology to create and simulate this simple model is the same as that for more complex models.

## 2.1 Description of the example

The model described in this chapter represents an emitter amplifier circuit:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image5.png){width="6.496527777777778in" height="1.4666666666666666in"}

The system consists of two hydraulic tanks connected by a pipe, with mass flow and temperature fixed and a working fluid.

## 2.2 Build the Model

To build a graphical model or *schematic*, users should follow the steps described below. The MATH, PORTS_LIB, THERMAL, HYDRAULIC, HYDRAULIC_EXAMPLES and CONTROL libraries must first be loaded into the active Workspace:

- Create a new schematic using the botton ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image6.png){width="0.16263998250218722in" height="0.17305336832895887in"} or the File \> New \> Schematic. Save it in the desired library (it must be unlocked) and choose a name (for example, hydro_circuit).

- From the icon explorer tab of the HYDRAULIC library, select one by one the different components shown in the figure above and drag them to the schematic window

- Arrange the components in the schematic like in the figure above:

  - Use the Rotate buttons if necessary

  - To change the size of a component, select the component, right button, select \`\`component shape option\'\' and change the size by dragging the symbol's corners

  - To change the position of the component's name, press the SHIFT key at the same time as you move the mouse pointer over the labels, and drag it

- Draw connectors between the components like in the figure above. A tooltip will appear whenever the mouse hovers over a port, displaying the information of that port:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image7.png){width="2.617788713910761in" height="1.8923261154855644in"}

- Select the connection button on the right-hand toolbar ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image8.png){width="0.16893372703412074in" height="0.15856080489938756in"}, or press the SHIFT key at the same time as you move the mouse pointer over a port

- Left-click on the port to be connected

- Click the various points of the schematic drawing where the connector is required to run (if any)

- Left-click the target port, which must be of the same type as the origin port

- To connect different components with right angles, there are two options:

- Select right angle connections mode by pressing the ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image9.png){width="0.1980194663167104in" height="0.1858606736657918in"} button and connect components as explained before.

- Create a straight line connection between two components, press SHIFT and left click over the line. A point will be created to divide the line into two different segments. Drag the point to the desired place and use the ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image10.png){width="0.18316819772528434in" height="0.1644225721784777in"} button to force right angles.

- To delete extra points of a connector line, just press SHIFT over the point and click on the point to be deleted

<!-- -->

- Set the data of the components. Now you must customize the component data according to the table below:

COMPONENT INSTANCES DATA:

  -------------------------------------------------------------------------------------------------------------------------
  DATUM                    VALUE    DESCRIPTION                                                                  UNITS  
  ------------------------ -------- ---------------------------------------------------------------------------- ----------
  Fluid.cp_user_defined    4186     User defined specific heat                                                   J/(kg·K)

  Fluid.fluid              Water    Working hydraulic fluid                                                      \-

  Fluid.rho_user_defined   1000     User defined density                                                         kg/m^3^

  Fluid.user_defined       FALSE    If TRUE, cp and rho are defined by the user                                  \-

  HydPipe.d                0.1      Diameter                                                                     m

  HydPipe.dp_lam           1000     Pressure drop for laminar flow                                               Pa

  HydPipe.f                0.02     Friction factor                                                              \-

  HydPipe.l                1        Lenght                                                                       m

  HydPipe.z_in             0        Geometric elevation of inlet                                                 m

  HydPipe.z_out            0        Geometric elevation of outlet                                                m

  HydTank1.A               1        Cross area of the tank                                                       m^2^

  HydTank1.Ho              3        Initial level                                                                m

  HydTank1.To              288      Initial fluid temperature                                                    degC

  HydTank1.p_atm           101325   Atmospheric pressure                                                         Pa

  HydTank1.z_in            0        Geometric elevation of inlet                                                 m

  HydTank1.z_out           0        Geometric elevation of outlet                                                m

  HydTank2.A               1        Cross area of the tank                                                       m^2^

  HydTank2.Ho              1        Initial level                                                                m

  HydTank2.To              288      Initial fluid temperature                                                    degC

  HydTank2.p_atm           101325   Atmospheric pressure                                                         Pa

  HydTank2.z_in            0        Geometric elevation of inlet                                                 m

  HydTank2.z_out           0        Geometric elevation of outlet                                                m

  Inlet.dyn                FALSE    If TRUE, mass flow follows 1st order transfer function using tau parameter   \-

  Inlet.tau                0.1      Characteristic time to setting up required mass flow                         s

  Outlet.dyn               FALSE    If TRUE, mass flow follows 1st order transfer function using tau parameter   \-

  Outlet.tau               0.1      Characteristic time to setting up required mass flow                         s
  -------------------------------------------------------------------------------------------------------------------------

- To change data of a component double-click on the corresponding symbol to open the Attributes Editor. For example, for the HydPipe component, the data values should look like this:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image11.png){width="5.438280839895013in" height="3.5082874015748033in"}

- Lastly, generate the model using the button ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image12.png){width="0.14907042869641296in" height="0.13860017497812774in"}. The following window will be displayed. Click OK and you will have finalized the construction of your model and you can simulate it as described in the following section, \`\`Simulating the Model\'\':

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image13.png){width="3.6936734470691164in" height="1.633082895888014in"}

## 2.3 Simulate the Model

The model is now ready for simulation. Go to the Simulation View.

- Select \`\`hydro_circuit.default\'\' (if the name of the partition you have created is \`\`default\'\') from the library, right-click, select option \`\`New experiment\'\'. The following window will be displayed. Type a name for the experiment:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image14.png){width="6.166972878390201in" height="4.07791447944007in"}

- A default experiment text should appear in the editing window. Change the REPORT_MODE, TSTOP, CINT (Communications Interval) and other values as indicated below:

EXPERIMENT exp1 ON hydro_circuit.default

DECLS

OBJECTS

INIT

BOUNDS

Inlet.s_temp.signal\[1\] = 288

Inlet.s_mflow.signal\[1\] = 0

Outlet.s_mflow.signal\[1\] = 0

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

REPORT_MODE = IS_STEP \-- Report results at every CINT and event detection.

\-- simulate a transient in range\[TIME,TSTOP\] reporting at every CINT

TIME = 0

TSTOP = 45

CINT = 1

INTEG()

END EXPERIMENT

- Double dash (\--) means a comment.

- \`\`IMETHOD = CVODE_BDF\'\' means that the CVODE sparse integration method will be employed (See the User Manual.

- \`\`REPORT_MODE = IS_STEP\'\' means that an output (in the plots and in the reports) will be produced at each internal time step (given by the integration method), that is normally shorter than the communication interval CINT.

<!-- -->

- Save the experiment. The experiment name will appear in the Workspace area

- Now you are ready to simulate the experiment using the Monitor. Right button over the experiment name in the Workspace area, and select \`\`Simulate in Monitor\'\'. Clicking the ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image15.png){width="0.21458333333333332in" height="0.21458333333333332in"} button will produce the same effect

- The Experiments monitor comes up. Add the necessary plots to view the results.

  - To add a plot click on \`\`Tab_1\'\' and then click \`\`New Plot\'\' ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image16.png){width="0.25277777777777777in" height="0.22777777777777777in"}. A window will appear with the \`\`drawable/ plotable\'\' variables of the experiment.

  - Apply a filter to help you to select variables. Tick the boxes alongside the selected variables:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image17.png){width="5.0136428258967625in" height="5.611206255468066in"}

- Just as users may wish to plot the evolution of a variable compared to another, they may also wish to track the numerical values of the variables. The main task of Watch is to display the variable values of the experiment, enabling them to be modified wherever possible.

  - The first step is to add variables by right clicking on the Watch Area and selecting the option \`\`Edit Watch\'\'

  - A menu very similar to that of the plots will appear, enabling users to add or delete variables

- To simulate the experiment click \`\`Simulate\'\' ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image18.png){width="0.1736111111111111in" height="0.25277777777777777in"}. By clicking \`\`New Integration\'\' ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image19.png){width="0.2625in" height="0.25763888888888886in"} on the toolbar, the simulation can be extended or started at new times

The figure below shows some typical time histories of the main variables of the model:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image20.png){width="6.496527777777778in" height="3.245833333333333in"}

# 3 Notes of the HYDRAULIC library

## 3.1 Tips and good practices

The mathematical partition is a very important entity within the EcosimPro environment. It encapsulates the organized set of equations required to execute effectively a simulation over a given model. During its generation, the mathematical partition may detect boundaries and algebraic loops:

- Boundaries are easy to handle (as they just require fixing a value), but sometimes they may cause unexpected results as can remain \`\`undetected\'\' with a wrong value.

- Algebraic loops impose a challenge in most of the cases. Thus, it is always recommended to avoid them, unless necessary.

Below are some general good practices to take into account when generating a model and running simulations:

- It is preferable to create \`\`Custom\'\' partitions rather than \`\`Default\'\' ones. While the output may be the same, the \`\`Custom\'\' partition allows to control the different steps of the partition generation process. This allows to see and check the boundary variables and tearing variables of algebraic loops.

- It is important to note that the BOUND block of experiments is not updated once created. If modifications are done on the schematic and the partition, new boundaries could appear on the partition, but not on the already created experiment code. Thus, it is always recommended to review the boundary variables on the \`\`Mathematical Model\'\' (right click on the partition -\> \`\`View Mathematical Model\'\') and add the missing ones to the experiments.

- To avoid some algebraic loops, do not connect together two or more components of the same type.

- If it is not possible to remove the algebraic loops, the selected tearing variables will appear on the \`\`INIT\'\' block of the experiment code. It is very important to give it a good default initial value. This will help EcosimPro on the iteration process to find the solution.

- With algebraic loops, the integration method may play an important role. It can be configured in the experiment code through the variable IMETHOD. If the model does not converge at some point, it is advisable to switch between IDAS and DASSL.

- Insert the \`\`Fluid\'\' component in the different loops to avoid a wrong definition of the density and specific heat of the fluid. Do not insert two fluid components in the same loop, as it will generate a partition error.

- Use boundary components to close the loops.

- Always check that the fluid properties (P,T,h) are within reasonable limits. Avoid working over saturation or below freezing point, as this library is only intended for incompressible fluids.

- Review data attributes of components. Default values, as initial conditions, could affect the simulation results and lead the simulation to undesired results.

## 3.2 User-Defined Fluids

User-defined properties can be set for the working fluid. As described in section §[6.1.](#fluid) , the BOOLEAN parameter \`\`user_defined\'\' can be changed to TRUE to enable the definition of density (rho) and specific heat (cp).

If the user desires to have several user-defined fluids and change between them easily, a suitable approach would be generating a new source file with the following information:

- Define a new ENUM item, with the name of the new fluids:

\-- User fluids

ENUM usr_def_fluid = \\

{

Mercury,

Ethanol,

Toluene,

Kerosene

}

- Define a new array with the density associated to each fluid:

\-- Specific heat vs user fluid

CONST REAL usr_rho_fluid\[usr_def_fluid\] = \\

{

13545,

789,

867,

750

}

- Define a new array with the specific heat associated to each fluid:

\-- Specific heat vs user fluid

CONST REAL usr_cp_fluid\[usr_def_Fluid\] = \\

{

139,

2570,

1710,

2450

}

- Call each array on the corresponding attribute of the \`\`Fluid\'\' component, selecting the desired user-defined fluid inside it:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image21.png){width="3.991346237970254in" height="2.4276607611548555in"}

## 3.3 Boundary components

Each time we model an open circuit, at least two fluid ports will remain open, which may correspond to inlets or outlets. This means that when generating the partition, the user will be required to choose variables as boundaries to close the mathematical model. In the experiment, the user will be able to assign expressions to these variables.

To allow these variables to be easily closed within the schematic itself, the HYDRAULIC library has two boundary components: an inlet and an outlet. These components can be connected to the unconnected Hydraulic ports and allow the use of the CONTROL library to define temperature, pressure and mass flow thanks to their analog ports. This way, the user can take advantage of the advance signal generation of the CONTROL library, being able to set different types of values (fixed, sinusoidal, interpolated, the result of certain operations, etc...).

Generally, it is recommended to create the hydraulic circuit, close the ends by means of \`\`Inlet\'\' and \`\`Outlet\'\' boundary components and initiate the \`\`Custom\'\' partition generation process:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image5.png){width="5.5362653105861765in" height="1.2498764216972877in"}

On the \`\`Boundary wizard\'\' page of the partition wizard, the suggested boundary port\'s signals will appear:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image22.png){width="6.242208005249344in" height="4.80875in"}

With those in mind, the user might go the schematic and close those ports by means of the CONTROL library components:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image23.png){width="5.669328521434821in" height="1.9356321084864392in"}

It is important to note that the variables that appear when generating a partition are only a suggestion to close the model. For example, let\'s take the case of the Example_HeatExchanger example (see §[7.5.](#heat-exchanger-system) ).

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image24.png){width="5.967183945756781in" height="2.1501859142607174in"}

When creating a customized partition, the initial suggestion is to set the flow rate and temperature at the inlets and the pressure at the outlets:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image25.png){width="4.659692694663167in" height="4.087340332458442in"}

If we had other data (for example, flow rate, pressure, and temperature at the inlets), we could open the *Categories* drop-down menu and select *Able to be selected*. From there, we can choose the necessary number of variables and check that they close the model by clicking *Check*.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image26.png){width="5.121211723534558in" height="4.426713692038495in"}

If the selection is valid but we want to close the variables in the schematic, we can click *Cancel* and assign values to them there.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image27.png){width="5.893324584426947in" height="2.2546456692913384in"}

Otherwise, we can click *Next* and close the variables in the experiment.

# 4 HYDRAULIC Library Items

## 4.1 Enumeration Data Types

### 4.1.1 Enumeration Type Fluid

Enumerative data type that defines the working fluid.

ENUM hyd_fluid = { Water,Water_Glycol_6040, Water_Glycol_5050, Water_Glycol_4060, Synthetic_Oil, Mineral_Oil}

## 4.2 Global Constants

The following constants are defined as global in the HYDRAULIC library:

- \`\`g\'\' = 9.806 m/s^2^. Gravity acceleration.

- \`\`rho_fluid\'\' and \`\`cp_fluid\'\', dependent on the \`\`hyd_fluid\'\' enumerative:

\-- Density vs fluid

CONST REAL rho_fluid\[hyd_fluid\] = \\

{

1000, \--Water

1080, \--Water_Glycol_6040

1100, \--Water_Glycol_5050

1120, \--Water_Glycol_4060

860, \--Synthetic_Oil

880 \--Mineral_Oil

}

\-- Specific heat vs fluid

CONST REAL cp_fluid\[hyd_fluid\] = \\

{

4186, \--Water

3500, \--Water_Glycol_6040

3300, \--Water_Glycol_5050

3000, \--Water_Glycol_4060

2000, \--Synthetic_Oil

1670 \--Mineral_Oil

}

## 4.3 Working Fluids

The current available working fluids (hyd_fluid) and their properties (rho_fluid and cp_fluid) are:

  -----------------------------------------------------------------------------
  Fluid name          Density - rho (kg/m^3^)   Specific heat - cp (J/(kg·K))
  ------------------- ------------------------- -------------------------------
  Water               1000                      4186

  Water_Glycol_6040   1080                      3500

  Water_Glycol_5050   1100                      3300

  Water_Glycol_4060   1120                      3000

  Synthetic_Oil       860                       2000

  Mineral_Oil         880                       1670
  -----------------------------------------------------------------------------

User-defined properties can be set for the working fluid. As described in section §[6.1.](#fluid) , the BOOLEAN parameter \`\`user_defined\'\' can be changed to TRUE to enable the definition of density (rho) and specific heat (cp).

## 4.4 Ports

The Hydraulic Library components make use of the following ports:

- hyd port type: port of the PORTS_LIB library. It provides information about the flow.

- analog_signal port type: standard port of the PORTS_LIB library. It allows sending analog signals.

- mech_rot port type: standard port of the PORTS_LIB library. It allows imposing rotational flange.

- thermal port type: standard port of the PORTS_LIB library. It allows sending a temperature and a heat flow.

The variables defined in each port are the following:

- hyd port

  -----------------------------------------------------------------------
  Name                    Description             Units
  ----------------------- ----------------------- -----------------------
  w                       Mass flow               kg/s

  p                       Pressure                Pa

  T                       Temperature             K

  h                       Enthalpy                J/kg

  wh                      Energy flow             W
  -----------------------------------------------------------------------

- analog_signal port

  -------------------------------------------------------------------------
  Name                    Description               Units
  ----------------------- ------------------------- -----------------------
  signal\[n\]             Array of analog signals   \-

  -------------------------------------------------------------------------

- mech_rot port

  ---------------------------------------------------------------------------
  Name                    Description                 Units
  ----------------------- --------------------------- -----------------------
  T                       Torque                      N·m

  Omega                   Absolute angular velocity   rad/s

  n                       Angular velocity            rpm
  ---------------------------------------------------------------------------

- thermal port

  ---------------------------------------------------------------------------
  Name                    Description                 Units
  ----------------------- --------------------------- -----------------------
  Tk\[n\]                 Kelvin Temperature Array    K

  Tc\[n\]                 Celsius Temperature Array   C

  Q\[n\]                  Heat Flow Array             W
  ---------------------------------------------------------------------------

## 4.5 Component Types

The components available in this library are depicted in the table below.

### 4.5.1 Abstract Components

  ------------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Name           Description
  ------------------------ -----------------------------------------------------------------------------------------------------------------------------------
  HydChannel               It serves as a parent for any component that has two fluid ports, one inlet and one outlet. The height of these ports can be set.

  HydFluidMeter            Component that serves as a parent for any sensor. It inherits from HydChannel and CONTROL.ASensor.

  HydMachine               This component serves as a parent for turbomachinery, such as pumps or turbines.
  ------------------------------------------------------------------------------------------------------------------------------------------------------------

### 4.5.2 Operative Components

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Symbol                                                                                                                                                                                                         Component Name                                                                                                                                                                                                                         Description
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image28.png){width="0.4409448818897638in" height="0.4094488188976378in"}    [Fluid](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#CCCS#CCCS)              Working fluid.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image29.png){width="0.45268372703412074in" height="0.663934820647419in"}    [HydFlowMeter](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#CCCS#CCCS)       Components to represent a flowmeter.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image30.png){width="0.5057392825896763in" height="0.6567060367454068in"}    HydPressureMeter                                                                                                                                                                                                                       Components to represent a pressure meter.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image31.png){width="0.4475262467191601in" height="0.5895975503062117in"}    HydTemperatureMeter                                                                                                                                                                                                                    Components to represent a temperature meter.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image32.png){width="0.9938604549431321in" height="0.5931528871391076in"}    [Inlet](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Conductor#Conductor)    Component to establish fluid conditions at an inlet port as a boundary.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image33.png){width="0.9247867454068242in" height="0.5529451006124234in"}    [Outlet](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Conductor#Conductor)   Component to establish fluid conditions at an outlet port as a boundary.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image34.png){width="1.1862773403324585in" height="0.22947725284339457in"}   [HydPipe](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Diode#Diode)          Component that represents a pipe.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image35.png){width="1.1456692913385826in" height="0.3425196850393701in"}    HydPipe_Th                                                                                                                                                                                                                             Component that represents a pipe with a thermal interface.
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Symbol                                                                                                                                                                                                        Component Name                                                                                                                                                                                                                     Description
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image36.png){width="0.6299212598425197in" height="0.5393700787401575in"}   [HydValve](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#EMF#EMF)         Component that represents a valve.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image37.png){width="0.8622047244094488in" height="0.6259842519685039in"}   HydTank                                                                                                                                                                                                                            Component that represents a tank.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image38.png){width="0.8622047244094488in" height="0.6732283464566929in"}   HydTank_Th                                                                                                                                                                                                                         Component that represents a tank with a thermal interface.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image39.png){width="0.7897801837270341in" height="0.5989381014873141in"}   [HydHex](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Gyrator#Gyrator)   Heat exchanger model based on the calculation of the thermal effectiveness.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image40.png){width="0.9272123797025372in" height="0.8021948818897637in"}   HydPump                                                                                                                                                                                                                            Component that represents a hydraulic pump.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image41.png){width="1.1043208661417323in" height="0.7501049868766404in"}   HydTurbine                                                                                                                                                                                                                         Component that represents a hydraulic turbine.
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Other components that a user may possibly require can be easily built by means of inheritance and aggregation of existing components.

For a detailed description of the formulation and the input data, please refer to the \`\`htm\'\' file present in the DOC directory of the Library.

# 5 HYDRAULIC Abstract Components

## 5.1 HydChannel

### 5.1.1 Description

This abstract component is used for deriving component with two hydraulic ports, an inlet and an outlet.

#### 5.1.1.1 Ports

  -----------------------------------------------------------------
  NAME          TYPE          DIRECTION     DESCRIPTION
  ------------- ------------- ------------- -----------------------
  hp_in         Hydraulic     IN            Inlet hydraulic port

  hp_out        Hydraulic     OUT           Outlet hydraulic port
  -----------------------------------------------------------------

#### 5.1.1.2 Data

  ----------------------------------------------------------------------------------
  NAME          TYPE          DEFAULT   DESCRIPTION                     UNITS
  ------------- ------------- --------- ------------------------------- ------------
  z_in          REAL          0         Geometric elevation of inlet    m

  z_out         REAL          0         Geometric elevation of outlet   m
  ----------------------------------------------------------------------------------

#### 5.1.1.3 Variables

  -----------------------------------------------------------
  NAME   TYPE   UNITS      DESCRIPTION
  ------ ------ ---------- ----------------------------------
  rho    REAL   Kg/m^3^    Density of hydraulic fluid

  cp     REAL   J/(kg·K)   Specific heat of hydraulic fluid
  -----------------------------------------------------------

### 5.1.2 Formulation

**Port variables**

Density and specific heat are conserved throughout the component and are equal to the component\'s intermediate variable.

$$\rho = \rho_{in} = \rho_{out}$$

$$cp = cp_{in} = cp_{out}$$

## 5.2 HydFluidMeter

### 5.2.1 Description

This component serves as the basis for components that behave as sensors of the hydraulic port variables. It inherits the behavior of HydChannel (§[5.1.](#hydchannel) ) and ASensor, belonging to the Control library.

### 5.2.2 Formulation

Apart from the behaviour inherited from ASensor, this component includes equations in the fluid port variables to enforce the conservation of mass flow, pressure and temperature.

$$w_{in} = w_{out}$$

$$p_{in} = p_{out}$$

$$T_{in} = T_{out}$$

## 5.3 HydMachine

### 5.3.1 Description

This abstract component represents a generic hydraulic rotating machine that exchanges energy with a fluid through a mechanical shaft. It includes the common behavior for both pumps and turbines, including flow calculation, power balances, temperature rise due to losses, and optional rotor dynamics.

It serves as parent of generic hydraulic machines such as pump or turbine and is inherited from HydChannel (§[5.1.](#hydchannel) ).

In addition to those described in HydChannel (§[5.1.](#hydchannel) ), it has the following ports, data and variables.

#### 5.3.1.1 Ports

  ------------------------------------------------------------------------------
  NAME   TYPE       DIRECTION   DESCRIPTION
  ------ ---------- ----------- ------------------------------------------------
  sh     mech_rot   IN          Rotational shaft (torque & speed input/output)

  ------------------------------------------------------------------------------

#### 5.3.1.2 Construction parameters

  ----------------------------------------------------------------------------------------------------
  NAME        TYPE      DEFAULT   UNITS   DESCRIPTION
  ----------- --------- --------- ------- ------------------------------------------------------------
  RotorFlag   BOOLEAN   FALSE     \-      Flag to take into account mechanical inertia of pump rotor

  ----------------------------------------------------------------------------------------------------

#### 5.3.1.3 Data

  -----------------------------------------------------------------------------------------------------
  NAME       TYPE   DEFAULT   UNITS     DESCRIPTION
  ---------- ------ --------- --------- ---------------------------------------------------------------
  eta_hyd    REAL   0.85      \-        Hydraulic efficiency (flow losses due to friction/turbulence)

  eta_mech   REAL   0.95      \-        Mechanical efficiency (mechanical friction losses)

  eta_vol    REAL   0.95      \-        Volumetric efficiency (internal leakage losses)

  I          REAL   0.1       kg·m^2^   Rotor moment of inertia

  V_disp     REAL   1.0e-4    m^3^      Volumetric displacement
  -----------------------------------------------------------------------------------------------------

Its input and output are assumed to be at the same height, so the data z_in and z_out from HydChannel (§[5.1.](#hydchannel) ) are closed and equal to 0.

#### 5.3.1.4 Variables

  -----------------------------------------------------------------------
  NAME       TYPE    UNITS    DESCRIPTION
  ---------- ------- -------- -------------------------------------------
  omega      REAL    rad/s    Shaft angular speed

  Q_i        REAL    m^3^/s   Ideal volumetric flow rate

  Q          REAL    m^3^/s   Actual volumetric flow rate

  w          REAL    kg/s     Mass flow rate

  dP         REAL    Pa       Pressure difference (hp_out.p - hp_in.p)

  P_i        REAL    W        Ideal hydraulic power

  P_mech     REAL    W        Mechanical power

  q_losses   REAL    W        Heat losses due to inefficiencies

  dT         REAL    K        Fluid temperature increase

  eta        REAL    \-       Total efficiency

  T          REAL    N·m      Torque ($\tau)$ transmitted through shaft
  -----------------------------------------------------------------------

### 5.3.2 Formulation

**Mass Conservation**

The mass conservation equation is expressed as follows:

$$w_{in} = w_{out} = w$$

**Volumetric Flow**

The ideal volumetric flow rate is derived from shaft speed:

$$Q_{i} = V_{disp} \cdot \frac{\omega}{2\pi}$$

Thus, it is considered that at no speed the flow cannot pass through the machine.

The actual flow accounts for volumetric efficiency:

$$Q = \eta_{vol} \cdot Q_{i}$$

The mass flow rate is then:

$$w = Q \cdot \rho$$

**Pressure and Power Relations**

The pressure difference between outlet and inlet is:

$$\Delta P = p_{out} - p_{in}$$

The ideal hydraulic power (from pressure and flow):

$$P_{i} = \Delta P \cdot \ Q_{i}\ $$

The total efficiency combines all losses:

$$\eta = \eta_{vol} \cdot \eta_{hyd} \cdot \eta_{mech}$$

**Thermal losses**

Thermal power losses (friction, turbulence) are ultimately transformed into heat and cause a temperature rise at the outlet. This is computed indirectly through:

$$\Delta T = \frac{q_{losses}}{cp \cdot w}$$

$$T_{out} = T_{in} + \Delta T$$

**Torque and shaft dynamics**

The torque exchanged with the shaft is computed from mechanical power and shaft speed:

$$\tau = \frac{P_{mech}}{\omega}$$

The sign and dynamics of torque depend on the specific subcomponent and whether the rotor inertia is considered.

# 6 HYDRAULIC Components

## 6.1 Fluid

### 6.1.1 Description

The working fluids available in the HYDRAULIC library are limited to incompressible liquids. Therefore, a reduced set of two properties is used: specific heat and density. These remain constant throughout the simulation, regardless of temperature and pressure.

The \`\`Fluid\'\' component is used to specify the working fluid in each loop of the model. If no \`\`Fluid\'\' component is inserted on the schematic, the partition will propose as boundaries the density and specific heat of the fluid, which must be set by the user.

Restrictions related to the temperature and pressure limits of the working fluid are not taken into account. The user must be aware of these circumstances to assess the validity of the results.

Several fluids can be used in the same schematic but in different loops or circuits. Otherwise, partition problems may arise, disabling the simulation of the model.

For more information about the working fluids, see §[3.2.](#user-defined-fluids) and §[4.3.](#working-fluids)

This component inherits from the HydChannel (§[5.1.](#hydchannel) ). Additionally, it has the following ports, data and variables.

#### 6.1.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image42.png){width="0.645923009623797in" height="0.5938331146106737in"}

#### 6.1.1.2 Construction parameters

  ---------------------------------------------------------------------------------------------------------------------------
  **NAME**       **TYPE**         **DEFAULT**   **DESCRIPTION**                                                   **UNITS**
  -------------- ---------------- ------------- ----------------------------------------------------------------- -----------
  user_defined   BOOLEAN          FALSE         Option to define the density and the specific heat of the fluid   \-

  fluid          ENUM hyd_fluid   Water         Working hydraulic fluid                                           \-
  ---------------------------------------------------------------------------------------------------------------------------

#### 6.1.1.3 Data

In addition to those of HydChannel (§[5.1.](#hydchannel) ), with the exception of z_in and z_out, which are closed and equal to zero, it contains the following data

  ------------------------------------------------------------------------------------------------
  **NAME**           **TYPE**   **DEFAULT**   **DESCRIPTION**                          **UNITS**
  ------------------ ---------- ------------- ---------------------------------------- -----------
  rho_user_defined   REAL       1000          User defined density                     Kg/m^3^

  cp_user_defined    REAL       4186          User defined specific heat               J/(Kg·K)
  ------------------------------------------------------------------------------------------------

### 6.1.2 Formulation

**Definition of the density and the specific heat of the fluid**

If the boolean variable user_defined is set to TRUE, then the density and the specific heat of the input port are calculated as follows:

$$\rho_{in} = rho\_ user\_ defined$$

$${cp}_{in} = cp\_ user\_ defined$$

If user_defined is FALSE, then they are calculated as:

$$\rho_{in} = rho\lbrack fluid\rbrack$$

$${cp}_{in} = cp\lbrack fluid\rbrack$$

These values are described in section §[4.3.](#working-fluids)

**Conservation of port variables**

This is expressed as follows:

$$w_{in} = w_{out}$$

$$p_{in} = p_{out}$$

$$T_{in} = T_{out}$$

## 6.2 HydFlowMeter

### 6.2.1 Description

This component provides a simplified representation for flowmeters. It is inherited from abstract component HydFluidMeter (§[5.2.](#hydfluidmeter) ), and is an interface between the hydraulic and control parts of a model.

#### 6.2.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image29.png){width="0.625087489063867in" height="0.9167946194225722in"}

### 6.2.2 Formulation

This component sets the value of the measured signal equal to the mass flow through the component:

$$var\lbrack 1\rbrack\  = \ w_{in}$$

## 6.3 HydHex

### 6.3.1 Description

This component provides a representation of heat exchangers. The main assumptions are:

- Heat transfer rate is calculated from effectiveness formulation.

- There are two control volumes, one on the hot side and the other on the cold side, where heat storage is taken into account, but mass storage is ignored.

- Momentum equations take into account pressure losses.

#### 6.3.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image43.png){width="1.4792563429571304in" height="1.076286089238845in"}

#### 6.3.1.2 Ports

  ---------------------------------------------------------------------------
  **NAME**      **TYPE**   **DIRECTION**   **DESCRIPTION**
  ------------- ---------- --------------- ----------------------------------
  hp_cold_in    fluid      IN              Cold side inlet

  hp_hot_in     fluid      IN              Hot side inlet

  hp_cold_out   fluid      OUT             Cold side outlet

  hp_hot_out    fluid      OUT             Hot side outlet
  ---------------------------------------------------------------------------

#### 6.3.1.3 Data

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  **NAME**       **TYPE**   **DEFAULT**   **DESCRIPTION**                                                                                                                         **UNITS**
  -------------- ---------- ------------- --------------------------------------------------------------------------------------------------------------------------------------- -----------
  const_eff      BOOLEAN    FALSE         Option to choose between a constant effectiveness and an interpolation of a 1D table with the effectiveness vs the hot and cold flows   \-

  cp_dry         REAL       460           Cp of dry material                                                                                                                      J/(kg·K)

  dp_lam_cold    REAL       1000          Pressure drop for laminar flow in cold side                                                                                             Pa

  dp_lam_hot     REAL       1000          Pressure drop for laminar flow in hot side                                                                                              Pa

  eff            REAL       0.9           Heat exchanger effectiveness. Will be taken as 1 if eff \> 1 and as 0 if eff \< 0.                                                      \-

  eff_vs_flows   TABLE_2D                 Table of heat exchanger effectiveness versus adimensional hot fluid flow and cold fluid flow                                            \-

  f_cold         REAL       0.02          Friction factor of the cold side                                                                                                        \-

  f_hot          REAL       0.02          Friction factor of the hot side                                                                                                         \-

  m_dry_cold     REAL       1.00E-02      Mass of material in cold side                                                                                                           kg

  m_dry_hot      REAL       1.00E-02      Mass of material in hot side                                                                                                            kg

  T_cold_out_i   REAL       293           Initial temperature at cold outlet                                                                                                      K

  T_hot_out_i    REAL       293           Initial temperature at hot outlet                                                                                                       K

  vol_cold       REAL       1.00E-03      Fluid volume of the cold side                                                                                                           m^3^

  vol_hot        REAL       1.00E-03      Fluid volume of the hot side                                                                                                            m^3^

  w_cold_ref     REAL       0.1           Reference mass flow for cold side dp data and efficiency                                                                                kg/s

  w_hot_ref      REAL       0.1           Reference mass flow for hot side dp and efficiency                                                                                      kg/s
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### 6.3.1.4 Variables

  --------------------------------------------------------------------------------------------
  **NAME**    **TYPE**   **INITIAL**    **DESCRIPTION**                            **UNITS**
  ----------- ---------- -------------- ------------------------------------------ -----------
  cp_cold     REAL                      Cp of cold side fluid                      J/(kg·K)

  cp_hot      REAL                      Cp of hot side fluid                       J/(kg·K)

  d_cold      REAL                      Diameter of the cold side                  m

  d_hot       REAL                      Diameter of the hot side                   m

  hex_eff     REAL                      Heat exchanger effectiveness               \-

  qex         REAL                      Total heat flow exchanged                  W

  qmax        REAL                      Maximum limit for the heat flow exchange   W

  rho_cold    REAL                      Density of cold side fluid                 kg/m^3^

  rho_hot     REAL                      Density of hot side fluid                  kg/m^3^

  T_cold      REAL       T_cold_out_i   Outlet temperature of the cold side        K

  T_cold_in   REAL                      Inlet temperature in the cold side         K

  T_hot       REAL       T_hot_out_i    Outlet temperature of the hot side         K

  T_hot_in    REAL                      Inlet temperature in the hot side          K

  w_cold      REAL                      Mass flow in the cold side                 kg/s

  w_hot       REAL                      Mass flow in the hot side                  kg/s
  --------------------------------------------------------------------------------------------

### 6.3.2 Formulation

This heat exchanger is a topological component, where the hot and cold volumes are represented with thermal pipes (HydPipe_Th, 4.5.).

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image44.png){width="4.281847112860892in" height="1.6877351268591425in"}

In addition to that of the pipelines, this component has the following formulation.

**Geometry**

The diameters of the pipes are calculated as:

$$d_{hot} = 2\sqrt{\frac{vol_{hot}}{l \cdot \pi}}$$

$$d_{cold} = 2\sqrt{\frac{vol_{cold}}{l \cdot \pi}}$$

**Heat Exchange Rate**

The heat exchange rate, q~ex~, is calculated from the effectiveness method:

$$q_{ex} = \varepsilon_{hex} \cdot q_{\max}$$

where

$\varepsilon_{hex}$ =the effectiveness of the heat exchanger

q~max~ =the maximum heat rate

The maximum heat rate is obtained assuming that cold fluid leaves the heat exchanger at hot inlet temperature, or hot fluid leaves the heat exchanger at cold inlet temperature. The minimum of these two heat rates is the maximum heat rate:

$$q_{\max} = cp \cdot \ min\left( |w_{hot}|,|w_{cold}| \right) \cdot \left( T_{hot,in} - T_{cold,in} \right)$$

If const_eff is FALSE, the effectiveness of the heat exchanger,$\ \varepsilon_{hex}$, is calculated from the interpolation of the table of heat exchanger effectiveness versus non-dimensional mass flows:

$$\varepsilon_{hex} = \ min\left( 1.,linearInterp2D\left( eff\_ vs\_ flows,\frac{\left| w_{hot} \right|}{w_{hot_{ref}}},\frac{\left| w_{cold} \right|}{w_{cold_{ref}}} \right)\  \right)\ $$

If const_eff is TRUE, then the effectiveness is equal to the input data eff:

$$\varepsilon_{hex} = \min\left( 1,\max(0,eff) \right)$$

**Energy Equations Applied to the Hot Side and to the Cold Side**

Through the thermal port on the hot side, the exchanged heat is lost, as well as the heat that goes to the material.

hot_pipe.tp_in.q\[1\] = - qex - T_hot\'\*cp_dry\*m_dry_hot

Analogously, through the thermal port on the cold side, the heat exchanged is gained, and the heat that goes to the material is lost.

cold_pipe.tp_in.q\[1\] = qex - T_cold\'\*cp_dry\*m_dry_cold

**Port variables**

$$T_{hot_{in}}\  = \ donor\_ cell(w_{hot},\ {T_{hot}}_{in},\ {T_{hot}}_{out})$$

$$T_{cold_{in}}\  = \ donor\_ cell(w_{cold},{T_{cold}}_{in},{T_{cold}}_{out})$$

$${T_{hot}}_{out}\  = T_{hot},\ \ {T_{cold}}_{out}\  = T_{cold}$$

$${w_{hot}}_{in}\  = w_{hot},\ \ {w_{cold}}_{in}\  = w_{cold}$$

$${{cp}_{hot}}_{in}\  = {cp}_{hot},\ \ {{cp}_{cold}}_{in}\  = {cp}_{cold}$$

$${\rho_{hot}}_{in}\  = \rho_{hot},\ \ {\rho_{cold}}_{in}\  = \rho_{cold}$$

## 6.4 HydPipe

### 6.4.1 Description

This component represents a pipe. Pressure loss is considered. It is inherited from HydChannel (§[5.1.](#hydchannel) ).

#### 6.4.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image45.png){width="2.0315332458442694in" height="0.41672462817147854in"}

#### 6.4.1.2 Data

  ---------------------------------------------------------------------------------------------
  **NAME**   **TYPE**   **DEFAULT**   **DESCRIPTION**                               **UNITS**
  ---------- ---------- ------------- --------------------------------------------- -----------
  d          REAL       0.1           Diameter of the pipe                          m

  dp_lam     REAL       1000          Pressure drop for laminar flow                Pa

  f          REAL       0.020         Friction factor                               \-

  l          REAL       1             Length of the pipe                            m
  ---------------------------------------------------------------------------------------------

#### 6.4.1.3 Variables

  -------------------------------------------------------------------------
  **NAME**   **TYPE**   **DESCRIPTION**                         **UNITS**
  ---------- ---------- --------------------------------------- -----------
  A          REAL       Area of the pipe                        m^2^

  w_lam      REAL       Mass flow corresponding to \`dp_lam\'   Kg/s
  -------------------------------------------------------------------------

### 6.4.2 Formulation

**Geometry**

The surface of the pipe is calculated as follows:

$$A = \pi \cdot \left( \frac{d}{2} \right)^{2}$$

**Conservation of Mass**

The continuity equations are written as:

$$w_{in} = w_{out}$$

**Momentum Balance**

The mass flow corresponding to dp_lam is calculated as:

$$w_{lam} = A \cdot \sqrt{\frac{2 \cdot d \cdot dp_{lam} \cdot \rho}{f \cdot l}}$$

This variable is used in the momentum equation:

$$P_{in}\text{ } - \text{   }P_{out}\text{ } + \rho \cdot g \cdot \left( z_{in} - z_{out} \right) = \frac{1}{2} \cdot f \cdot l \cdot \frac{fpow2(w_{in},\ w_{lam})}{d \cdot \rho \cdot A^{2}}$$

**Conservation of Energy**

The conservation of energy is expressed as:

$$T_{in} = T_{out}$$

## 6.5 HydPipe_Th

### 6.5.1 Description

This component represents a pipe with a thermal interface. It\'s inherited from the HydPipe component (§[6.4.](#hydpipe) ).

#### 6.5.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image46.png){width="1.8648436132983377in" height="0.4896511373578303in"}

#### 6.5.1.2 Ports

  -------------------------------------------------------------------------
  NAME          TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ------------- ------------- ------------ ----------- --------------------
  tp_in         thermal       n=1          IN          Thermal port

  -------------------------------------------------------------------------

#### 6.5.1.3 Data

  ---------------------------------------------------------------------------------------------
  **NAME**   **TYPE**   **DEFAULT**   **DESCRIPTION**                               **UNITS**
  ---------- ---------- ------------- --------------------------------------------- -----------
  To         REAL       293.15        Initial temperature                           K

  ---------------------------------------------------------------------------------------------

#### 6.5.1.4 Variables

  -----------------------------------------------------------------
  **NAME**   **TYPE**   **INITIAL**   **DESCRIPTION**   **UNITS**
  ---------- ---------- ------------- ----------------- -----------
  m          REAL                     Liquid mass       kg

  T          REAL       To            Temperature       K
  -----------------------------------------------------------------

### 6.5.2 Formulation

In addition to that of the HydPipe (§[6.4.](#hydpipe) ), this component has the following formulation.

**Liquid mass**

The liquid mass inside the pipe is calculated as follows:

$$m = \ \rho \cdot A \cdot l$$

**Conservation of energy**

In this component, the energy conservation equation of HydPipe (§[6.4.](#hydpipe) ) is replaced by the following:

$$T_{out} = T$$

This temperature is calculated according to the following balance:

$$m \cdot cp \cdot T' + \left( w_{in} - w_{out} \right) \cdot cp \cdot T = wh_{in} - wh_{out} + tp_{in}.q\ $$

that takes into account the heat flow entering through the thermal port.

**Port variables**

Finally, the temperature of the thermal port is calculated as:

$$tp_{in}.Tk\lbrack 1\rbrack = T$$

## 6.6 HydPressureMeter

### 6.6.1 Description

This component provides a simplified representation for pressure meters. It is inherited from abstract component HydFluidMeter (§[5.2.](#hydfluidmeter) ), and is an interface between the hydraulic and control parts of a model.

#### 6.6.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image30.png){width="0.6980139982502187in" height="0.9063768591426071in"}

### 6.6.2 Formulation

This component sets the value of the measured signal equal to the pressure of the component:

$$var\lbrack 1\rbrack\  = \ P_{in}$$

## 6.7 HydPump

### 6.7.1 Description

The HydPump component represents a hydraulic pump that converts mechanical shaft power into hydraulic energy by increasing the pressure of a moving fluid. It inherits the general flow and energy balance equations from the HydMachine component (§[5.3.](#hydmachine) ) and contains no additional data, variables or ports, but specifies how the mechanical power is consumed and how the shaft torque is determined based on direction of energy transfer.

#### 6.7.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image47.png){width="1.2189206036745406in" height="1.0522298775153105in"}

### 6.7.2 Formulation

Besides to that inherited from HydMachine (§[5.3.](#hydmachine) ), this component has the following behaviour.

**Mechanic power**

The mechanical power required by the pump is calculated by dividing the ideal hydraulic power ($P_{i}$) by the total efficiency ($\eta$):

$$P_{mech}\  = \frac{P_{i}}{\eta}$$

**Thermal losses**

Some of the mechanical energy is dissipated as heat due to internal inefficiencies. The thermal losses are calculated as:

$$q_{losses}\  = |P_{mech}| \cdot (1 - \eta)$$

This heat contributes to the temperature increase of the fluid.

**Rotor dynamics**

The component optionally includes rotational dynamics of the rotor using the RotorFlag parameter:

- If RotorFlag = TRUE, the shaft behaves like a rotating body with moment of inertia I, and Newton\'s second law is applied:

$$I \cdot \omega' = \tau_{in}\  - \tau$$

- If RotorFlag = FALSE, rotor inertia is ignored and torque is directly transferred:

$$\tau = \ \tau_{in}$$

## 6.8 HydTank

### 6.8.1 Description

This component represents a water tank. It is inherited from HydChannel (§[5.1.](#hydchannel) ). It has an analog output port that indicates the water level in the tank.

#### 6.8.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image48.png){width="1.6530107174103237in" height="1.1749354768153981in"}

#### 6.8.1.2 Data

  ---------------------------------------------------------------------------
  **NAME**   **TYPE**   **DEFAULT**   **DESCRIPTION**             **UNITS**
  ---------- ---------- ------------- --------------------------- -----------
  A          REAL       1             Cross area of the tank      m^2^

  Ho         REAL       10            Initial level               m

  To         REAL       293.15        Initial fluid temperature   K

  p_atm      REAL       101325        Atmospheric pressure        Pa
  ---------------------------------------------------------------------------

#### 6.8.1.3 Variables

  -----------------------------------------------------------------
  **NAME**   **TYPE**   **INITIAL**   **DESCRIPTION**   **UNITS**
  ---------- ---------- ------------- ----------------- -----------
  H          REAL       Ho            Level             m

  m          REAL                     Mass              Kg

  T          REAL       To            Temperature       K
  -----------------------------------------------------------------

### 6.8.2 Formulation

**Conservation of Mass**

The water level in the tank is calculated from a balance between incoming and outgoing mass flow.

$$\frac{dH\lbrack 1\rbrack}{dt} = \frac{w_{in} - w_{out}}{\rho \cdot A}$$

From the water level, the mass of liquid inside the tank is calculated.

$$m = H\lbrack 1\rbrack \cdot \rho \cdot A$$

The level of water is transferred to the output signal variable of the analog port.

$$s\_ level.signal\lbrack 1\rbrack = H\lbrack 1\rbrack$$

**Momentum Balance Equation**

The momentum balance equation is formulated as follows:

$$P_{in} = P_{0} + \rho \cdot g \cdot (H\lbrack 1\rbrack - z_{in})$$

$$P_{out} = P_{0} + \rho \cdot g \cdot (H\lbrack 1\rbrack - z_{out})$$

**Conservation of Energy**

The energy conservation equation is expressed as:

$$m \cdot cp \cdot \frac{dT}{dt} + \left( w_{in} - w_{out} \right) \cdot cp \cdot T = wh_{in} - wh_{out}$$

The value of the temperature variable is transferred to the temperature variable of the output port.

$$T_{out} = T$$

## 6.9 HydTank_Th

### 6.9.1  Description

This component represents a pipe with a thermal interface. It\'s inherited from the HydTank component (§[6.8.](#hydtank) ).

#### 6.9.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image49.png){width="1.9794433508311462in" height="1.6356452318460193in"}

#### 6.9.1.2 Ports

  -------------------------------------------------------------------------
  NAME          TYPE          PARAMETERS   DIRECTION   DESCRIPTION
  ------------- ------------- ------------ ----------- --------------------
  tp_in         thermal       n=1          IN          Thermal port

  -------------------------------------------------------------------------

### 6.9.2 Formulation

In addition to that of the HydTank (§[6.8.](#hydtank) ), this component has the following formulation.

**Conservation of energy**

In this component, the energy conservation equation of HydTank (§[6.8.](#hydtank) ) is replaced by the following:

$$m \cdot cp \cdot T' + \left( w_{in} - w_{out} \right) \cdot cp \cdot T = wh_{in} - wh_{out} + tp_{in}.q\ $$

that takes into account the heat flow entering through the thermal port.

**Port variables**

The temperature of the thermal port is calculated as:

$$tp_{in}.Tk\lbrack 1\rbrack = T$$

## 6.10 HydTemperatureMeter

### 6.10.1 Description

This component provides a simplified representation for temperature meters. It is inherited from abstract component HydFluidMeter (§[5.2.](#hydfluidmeter) ), and is an interface between the hydraulic and control parts of a model.

#### 6.10.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image31.png){width="0.6563418635170604in" height="0.8647036307961505in"}

### 6.10.2 Formulation

This component sets the value of the measured signal equal to the pressure of the component:

$$var\lbrack 1\rbrack\  = \ T_{in}$$

## 6.11 HydTurbine

### 6.11.1 Description

This component models a hydraulic turbine, which converts hydraulic energy from a fluid under pressure into mechanical rotational energy. It inherits the general fluid and energy handling behavior from the HydMachine component (§[5.3.](#hydmachine) ) and specifies the direction and calculation of power generation and torque applied to the shaft.

#### 6.11.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image50.png){width="1.4272823709536309in" height="0.9480489938757656in"}

### 6.11.2 Formulation

Besides to that inherited from HydMachine (§[5.3.](#hydmachine) ), this component has the following behaviour.

**Mechanic power**

The turbine generates mechanical power by extracting energy from a pressurized fluid. The mechanical power output is computed by multiplying the ideal hydraulic power ($P_{i}$) by the total efficiency ($\eta$):

$$P_{mech}\  = P_{i} \cdot \eta$$

**Thermal losses**

Some of the mechanical energy is dissipated as heat due to internal inefficiencies. The thermal losses are calculated as:

$$q_{losses}\  = |P_{mech}| \cdot \left( \frac{1}{\eta} - 1 \right)$$

These losses increase the outlet fluid temperature**.**

**Rotor dynamics**

The component optionally includes rotational dynamics of the rotor using the RotorFlag parameter:

- If RotorFlag = TRUE, the component models the rotor as a rigid body with moment of inertia I. The rotor dynamic equation follows Newton's law:

$$I \cdot \omega' = \tau - \tau_{in}$$

- If RotorFlag = FALSE, rotor inertia is ignored and torque is directly transferred:

$$\tau = \ \tau_{in}$$

## 6.12 HydValve

### 6.12.1 Description

This component represents a hydraulic valve. Its opening position is given by the signal from an analog port, called s_position. It\'s inherited from HydChannel (§[5.1.](#hydchannel) ).

#### 6.12.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image36.png){width="1.083484251968504in" height="0.9272123797025372in"}

#### 6.12.1.2 Ports

  ---------------------------------------------------------------------------------------------------------
  NAME          TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ------------- --------------- ------------ ----------- --------------------------------------------------
  s_position    analog_signal   n=1          IN          Output position signal. Must be between 0 and 1.

  ---------------------------------------------------------------------------------------------------------

#### 6.12.1.3 Data

  -----------------------------------------------------------------------------------
  **NAME**   **TYPE**   **DEFAULT**   **DESCRIPTION**                     **UNITS**
  ---------- ---------- ------------- ----------------------------------- -----------
  Avo        REAL       0.020         Valve area at fully open position   m^2^

  dp_lam     REAL       1000          Pressure drop for laminar flow      Pa
  -----------------------------------------------------------------------------------

#### 6.12.1.4 Variables

  ---------------------------------------------------
  **NAME**   **TYPE**   **DESCRIPTION**   **UNITS**
  ---------- ---------- ----------------- -----------
  Av         REAL       Valve area        m^2^

  ---------------------------------------------------

### 6.12.2 Formulation

**Geometry**

The valve area is calculated from total area and opening position.

$$Av = Avo \cdot s\_ position.signal\lbrack 1\rbrack$$

**Mass conservation equation**

$$w_{out} = w_{in}$$

**Conservation of momentum**

$$w_{in} = Av \cdot \sqrt{\rho \cdot \left( p_{in} - p_{out} - \rho \cdot g \cdot \left( z_{in} - z_{out} \right) \right)}$$

**Conservation of energy**

$$T_{out} = T_{in}$$

## 6.13 Inlet

### 6.13.1 Description

This component allows imposing temperature, pressure and mass flow as inlet boundaries, depending on the connected components and the schematic. These variables will be assigned to the corresponding analog signals of ports s_temp, s_press and s_mflow.

#### 6.13.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image32.png){width="1.5970439632545932in" height="0.9531419510061242in"}

#### 6.13.1.2 Ports

  ------------------------------------------------------------------------------
  NAME          TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ------------- --------------- ------------ ----------- -----------------------
  s_temp        analog_signal   n=1          IN          Temperature signal

  s_press       analog_signal   n=1          IN          Pressure signal

  s_mflow       analog_signal   n=1          IN          Mass flow signal

  f_out         Hydraulic                    OUT         Outlet hydraulic port
  ------------------------------------------------------------------------------

### 6.13.2 Formulation

In the continuous component block, the signals of the analog ports are transferred to the hydraulic port:

$$f\_ out.T = s\_ temp.signal\lbrack 1\rbrack$$

$$f\_ out.p = s\_ press.signal\lbrack 1\rbrack$$

$$f\_ out.w = s\_ mflow.signal\lbrack 1\rbrack$$

## 6.14 Outlet

### 6.14.1 Description

This component allows imposing temperature, pressure and mass flow as outlet boundaries, depending on the connected components and the schematic. These variables will be assigned to the corresponding analog signals of ports s_temp, s_press and s_mflow.

#### 6.14.1.1 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image33.png){width="1.603963254593176in" height="0.9590365266841645in"}

#### 6.14.1.2 Ports

  ------------------------------------------------------------------------------
  NAME          TYPE            PARAMETERS   DIRECTION   DESCRIPTION
  ------------- --------------- ------------ ----------- -----------------------
  s_temp        analog_signal   n=1          IN          Temperature signal

  s_press       analog_signal   n=1          IN          Pressure signal

  s_mflow       analog_signal   n=1          IN          Mass flow signal

  f_in          Hydraulic                    IN          Intlet hydraulic port
  ------------------------------------------------------------------------------

### 6.14.2 Formulation

In the continuous component block, the signals of the analog ports are transferred to the hydraulic port:

$$f\_ in.T = s\_ temp.signal\lbrack 1\rbrack$$

$$f\_ in.p = s\_ press.signal\lbrack 1\rbrack$$

$$f\_ in.w = s\_ mflow.signal\lbrack 1\rbrack$$

# 7 Application Examples

The following examples, available in the HYDRAULIC_EXAMPLES library, provide an overview of the various components available. Additionally, examining the schematics can help users better understand how to correctly generate models and gain key insights into component usage.

The graphical editing of all the schematics is blocked to avoid errors and keep concordance with the User Manual. However, the user might reuse them by clicking on the \`\`Save-as\'\' option on the file menu.

## 7.1 Two-Tank system

  --------------------- -----------------------------------
  Library:              HYDRAULIC_EXAMPLES

  Model Name:           Example_TwoTanks

  Partition Name:       default

  Experiment Name:      exp1, exp2
  --------------------- -----------------------------------

### 7.1.1 Model description

The schematic represents a closed system of two tanks connected through a pipe:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image51.png){width="6.495833333333334in" height="1.5354166666666667in"}

As the initial water level of each tank is different, the water will flow from one to another until reaching the equilibrium.

The aim of this case is to show the capability of the library to compute both direct and reverse flow based on pressure differences.

### 7.1.2 Results

The direct/reverse flow capability is shown by two different experiments. The only difference between them is that in \`\`exp1\'\', HydTank1 initial level is higher than that of HydTank2. In \`\`exp2\'\', the opposite happens.

- Exp1: HydTank1 Ho = 3m; HydTank2 Ho = 1m:

As expected, flow will go from Tank1, which has the highest level (and thus pressure), to Tank2, with a lower pressure.

The following chart shows the evolution of the mass flow through the pipe between tanks. As it is positive, it goes from Tank1 to Tank2.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image52.png){width="5.792168635170603in" height="1.4917957130358706in"}

The mass flow decreases at a constant speed until diminishing. This is because the levels and pressures of the tanks are being equalized.

Water flowing from Tank1 (and emptying it) will fill Tank2, until reaching a steady situation:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image53.png){width="5.792168635170603in" height="1.4917957130358706in"}

Because the tanks has the same dimensions, the levels will equalize just in the middle, at 2m height.

- Exp2: HydTank1 Ho = 1m; HydTank2 Ho = 3m:

This experiment aims to show reserve flow capabilities. Opposite to the previous case, water must flow from Tank2 to Tank1, due to the levels and pressure difference.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image54.png){width="5.925513998250219in" height="1.4917957130358706in"}

As can be seen, it follows the same behavior of the previous experiment, but in the opposite direction. That is why the sign of the mass flow is negative.

Similarly, the level of the tanks will equalize at 2m:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image55.png){width="5.925513998250219in" height="1.4917957130358706in"}

## 7.2 Three-Tank system

  --------------------- -----------------------------------
  Library:              HYDRAULIC_EXAMPLES

  Model Name:           Example_ThreeTanks

  Partition Name:       default

  Experiment Name:      exp1
  --------------------- -----------------------------------

### 7.2.1 Model description

The schematic represents a closed system of three tanks connected through a pipe network:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image56.png){width="6.495833333333334in" height="3.078472222222222in"}

As the initial water level of each tank is different, the water will flow from one to another until reaching the equilibrium. Additionally, the initial temperature is also different, so as the transient evolves, the temperatures will also change until pressure equilibrium is met.

Note that the pipe system creates an algebraic loop related to the mass flow, which is solved by the mathematical algorithms.

The aim of this case is to show the capability of the library to compute mass flow and enthalpy flow based on pressure difference.

### 7.2.2 Results

To achieve the required pressure difference that drives the mass flows and enthalpy flows, the temperatures and levels of the tanks must be different. Thus, the following lines have been inserted on the experiment code to initialized their values:

HydTank1.Ho = 4

HydTank2.Ho = 1

HydTank3.Ho = 1

HydTank1.To = 273.15+10

HydTank2.To = 273.15+25

HydTank3.To = 273.15+50

Related to mass flows, water is flowing from Tank1 to Tank2 and Tank3. This can be seen analysing pipes flows:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image57.png){width="5.551772747156606in" height="2.1918886701662292in"}

As water moves from Tank1, at 10 C, the temperature of Tank2 and Tank3 must decrease:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image58.png){width="5.515048118985127in" height="2.177389545056868in"}

## 7.3 Mass flow regulation system

  --------------------- -----------------------------------
  Library:              HYDRAULIC_EXAMPLES

  Model Name:           Example_ValveControl

  Partition Name:       default

  Experiment Name:      exp1
  --------------------- -----------------------------------

### 7.3.1 Model description

The schematic represents a closed system of two tanks connected through a pipe network with a valve.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image59.png){width="6.495833333333334in" height="1.2756944444444445in"}

The valve position is controlled with a PID controller to achieve the desired mass flow. As the initial water level of each tank is different, the water will flow from one to another until reaching the equilibrium. However, the valve will restrict the flow, slowing down the equilibrium process.

Note that the pipe and valve system creates an algebraic loop related to the mass flow, which is solved by the mathematical algorithms.

### 7.3.2 Results

As in previous examples, the level difference between tanks will create a pressure gradient that will drive water from Tank1 to Tank2:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image60.png){width="6.100528215223097in" height="2.516884295713036in"}

However, looking at the mass flow through the different items of the system, the mass flow is keep constant, at a set point of 0.75 kg/s, until the levels of the tanks are equalized:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image61.png){width="6.100528215223097in" height="2.516884295713036in"}

This happens because of the effect of the controlled valve, which position is commanded by the PID:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image62.png){width="6.100528215223097in" height="2.516884295713036in"}

As seen before, as the levels of the tanks start to equalize, the controller tries to open the valve as much as possible to keep the mass flow at the desired set point.

## 7.4 Refrigeration system

  --------------------- -----------------------------------
  Library:              HYDRAULIC_EXAMPLES

  Model Name:           Example_RefrigerationLine

  Partition Name:       default

  Experiment Name:      exp1
  --------------------- -----------------------------------

### 7.4.1 Model description

The schematic represents a line with a pipe and a tank filled with a 60-40 water-glycol mixture.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image63.png){width="6.495833333333334in" height="3.1194444444444445in"}

The pipe will receive some heat from the exterior, while the tank will have thermal losses/gains against the ambient temperature. After an initial transient where the pipe heats up, the refrigerant will flow from inlet to outlet at a temperature of -10C to counteract the effect of the heat loads.

The refrigerant presents an initial transient where the outlet does not retrieve as much fluid as the inlet provides, leading to an increase of the tank level.

### 7.4.2 Results

The evolution of the ambient temperature (K) and heat flux (W) to the pipe is the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image64.png){width="6.092194881889764in" height="2.516884295713036in"}

The pumping system is started at time 250s:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image65.png){width="6.100528215223097in" height="2.2418613298337706in"}

There is a small delay on the removal of refrigerant, which can be seen in the figure above. Thus, the tank will slightly increase its level until the flow is stabilized:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image66.png){width="6.100528215223097in" height="1.5584678477690288in"}

Meanwhile, the evolution of the temperature is shown on the chart below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image67.png){width="6.100528215223097in" height="2.516884295713036in"}

When there is no mass flow in the system (from TIME = 0s to TIME = 250s), the temperatures of the pipe and tank increase. The pipe temperature almost reaches the boiling temperature of the fluid. At time 250s, the pumping system starts, moving the refrigerant to the tank. That is the reason why at time 260s there is a small increase on the temperature of the tank. After that, the cold refrigerant fills both the pipe and the tank.

The final steady state shows how the cold refrigerant is slightly heated up by the heat flux over the pipe. That refrigerant flows later through the tank, which experience some additional heat gain due to convection with the ambient temperature.

## 7.5 Heat-Exchanger system

  --------------------- -----------------------------------
  Library:              HYDRAULIC_EXAMPLES

  Model Name:           Example_HeatExchanger

  Partition Name:       default

  Experiment Name:      exp1
  --------------------- -----------------------------------

### 7.5.1 Model description

The schematic represents a piping system with a heat exchanger working with water on the cold side and synthetic oil on the hot side.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image68.png){width="6.495833333333334in" height="2.1125in"}

The HydHex component allows calculating the temperature distribution before and after the exchanger and the overall exchange efficiency is calculated.

The model also shows the capability of the library to work with two different fluids in the same schematic (but different loops or lines)

### 7.5.2 Results

The temperature evolution of the water and synthetic oil before and after the heat exchanger is shown below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image69.png){width="6.100528215223097in" height="2.4085422134733157in"}

The efficiency of the exchange process is dynamically calculated based on the specified table on the heat exchanger and the hot and cold mass flows:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image70.png){width="6.100528215223097in" height="2.4085422134733157in"}

## 7.6 Hydraulic-Pump station

  --------------------- ---------------------------------------------------
  Library:              HYDRAULIC_EXAMPLES

  Model Name:           Example_HydroPump_speed, Example_HydroPump_torque

  Partition Name:       default

  Experiment Name:      exp1
  --------------------- ---------------------------------------------------

### 7.6.1 Model description

The schematic represents a piping system with upper and lower reservoirs. Water can flow against gravity thanks to the action of the pump. An engine working at the desired rpms moves the pump.

The simulation allows seeing how, depending on the speed, the water from lower reservoir goes to the upper reservoir, storing potential energy.

The pump can take into account the mechanical inertia of its rotor. In that case, the \`\`RotorFlag\'\' of the component must be activated. Then, the pump will work on \`\`torque mode\'\', calculating the rotation speed based on the torque input at the shaft:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image71.png){width="6.495833333333334in" height="2.984027777777778in"}

If the rotor inertia is not taken into account, the schematic can be simplified, not requiring a controller. In this case, the speed is set at the shaft and the torque is calculated:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image72.png){width="6.495833333333334in" height="2.9256944444444444in"}

### 7.6.2 Results

The results of both case are very similar, as the controller rpms are the same. However, small differences may appear during transients, as the \`\`torque mode\'\' will take into account the dynamics of the rotor inertia and the controller.

The experiment turns on the pump at TIME = 1000s, at 1500 rpms. Then, at TIME = 2000s, the pump is accelerated to 3000 rpms. After that, the pump is turn off at TIME = 3000s.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image73.png){width="4.349241032370954in" height="1.9544553805774278in"}

The movement of the pump will displace a certain volume of water per second, calculated as the volumetric flow:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image74.png){width="4.105798337707786in" height="1.9545188101487314in"}

As water flows, the level of upper reservoir increases, while that of the lower decreases:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image75.png){width="4.267099737532808in" height="1.9339599737532809in"}

This variation of heights will increase the pressure difference between reservoirs, progressively increasing the torque demand:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image76.png){width="4.099759405074366in" height="2.0628116797900264in"}

The image above presents some peaks due to the acceleration and deceleration of the pump at the different stages of the experiment. This only happens on the \`\`torque mode\'\' case, as the inertia and controller response are taken into account.

To move the water against gravity, the pump will consume some mechanical power (P_mech). Part of it will turn into hydraulic, volumetric and mechanical losses (q_losses) and only a part of it will actually impulse the fluid (P_i):

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image77.png){width="5.0754396325459314in" height="2.641895231846019in"}

## 7.7 Hydraulic-Turbine station

  --------------------- ---------------------------------------------------
  Library:              HYDRAULIC_EXAMPLES

  Model Name:           Example_HydroTurb_speed, Example_HydroTurb_torque

  Partition Name:       default

  Experiment Name:      exp1
  --------------------- ---------------------------------------------------

### 7.7.1 Model description

The schematic represents a piping system with upper and lower reservoirs. Water can flow, thanks to gravity, through a turbine. The turbine moves a generator working at the desired rpms.

The simulation allows seeing how, depending on the speed, the water from upper reservoir goes to the lower one, absorbing potential energy and delivering power to the generator.

As the pump, the turbine can take into account the mechanical inertia of its rotor. In that case, the \`\`RotorFlag\'\' of the component must be activated. Then, the turbine will work on \`\`torque mode\'\', calculating the rotation speed based on the torque input at the shaft:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image78.png){width="6.495833333333334in" height="2.9402777777777778in"}

If the rotor inertia is not taken into account, the schematic can be simplified, not requiring a controller. In this case, the speed is set at the shaft and the torque is calculated:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image79.png){width="6.495833333333334in" height="2.838888888888889in"}

### 7.7.2 Results

The results of both case are very similar, as the controller rpms are the same. However, small differences may appear during transients, as the \`\`torque mode\'\' will take into account the dynamics of the rotor inertia and the controller.

The experiment turns on the turbine at TIME = 1000s, at 1500 rpms. Then, at TIME = 2000s, the turbine is accelerated to 3000 rpms. After that, the turbine is turn off at TIME = 3000s.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image80.png){width="4.408715004374454in" height="2.0001727909011375in"}

The movement of the turbine will displace a certain volume of water per second, calculated as the volumetric flow:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image81.png){width="4.392047244094488in" height="2.050177165354331in"}

As water flows, the level of upper reservoir decreases, while that of the lower increases:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image82.png){width="4.33124343832021in" height="2.140536964129484in"}

This variation of heights will decrease the pressure difference between reservoirs, progressively increasing the torque demand:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image83.png){width="4.1503597987751535in" height="2.1085159667541555in"}

The image above presents some peaks due to the acceleration and deceleration of the pump at the different stages of the experiment. This only happens on the \`\`torque mode\'\' case, as the inertia and controller response are taken into account.

During this process, the turbine is absorbing power from the fluid (P_i). Part of it will turn into hydraulic, volumetric and mechanical losses (q_losses) and only a part of it will actually reach the generator (P_mech):

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\HYDRAULIC\source_files\HYDRAULIC_Library_Reference_Manual_media/media/image84.png){width="4.825417760279965in" height="2.083513779527559in"}

# 8 References

User Manual

Getting Started

[^1]: \(1\) A component is the basic simulation unit generated by EcosimPro Language (EL) representing some physical/logical behaviour. Components are used as symbols that can be dragged & pasted graphically to build more complex models.

[^2]: () For a detailed description of the formulation and input data, please refer to the on-line Reference Manual available over any of the components inserted in a model diagram (documentation button of the Attributes Editor).
