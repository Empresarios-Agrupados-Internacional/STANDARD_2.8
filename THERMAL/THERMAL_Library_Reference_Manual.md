---
input_mode: dir
title: docs \> THERMAL \> source_files \> THERMAL_Library_Reference_Manual
---

# 1 Overview of the Library

## 1.1 Introduction

This document is the reference manual for the THERMAL Library (version 3.5).

This Reference Manual will provide:

- List of the components of the library

- Global description of the units of the library

- Icons associated to every component

- Description of the data and variables associated to every component and function

- Limitations of every component and function

- Description of the physical-mathematical model associated to every component or function

The Thermal Library does not provide all of the components that a user may possibly require, but it presents a good starting point for easily building customised components using the components provided by means of inheritance.

The THERMAL library, supplied with the professional version of this software, contains components to predict temperature distributions and heat flows in systems and devices using the thermal network method.

The thermal network method is also known as the lumped parameter method or the resistance/capacity method. It is essentially a finite difference method and entails modelling a continuous medium as a discrete thermal network of nodes representing the capacitance of the system linked by conductors representing its conductance.

Lumped parameter models are easily built. A thermal system with complex geometries can be replaced by a series of heat capacities and conductors (one-dimensional heat transfer) if a very detailed temperature distribution within the system is not required.

Using drag & drop methodology, the user can quickly create a diagram of the thermal system to be analysed, the representation of which is very similar to the physical system. The capabilities of the library are vast, since customized components can be developed from the available components as a function of the modelling needs.

Thanks to the features of this tool, libraries can be built that are easy to configure and extend, adding any components and characteristics as needed. This can be done graphically through a simple, user friendly interface, or through its own object-orientated language which makes it possible to re-use existing codes.

One of the library's biggest advantages is the possibility of its use in the multidisciplinary facet of this tool. This means that we can jointly study, for example, hydraulic systems or energy generation processes, such as combined cycle plants, and the dynamic behaviour of heat transfer through different geometrics and materials. This way, an overall study of the system is obtained with minimal design time.

Either steady-state or transient analyses can be handled with this library. The heat transfer modes that can be considered in the thermal model are conduction, radiation and natural convection. Material properties such as specific heat or conductivity may also vary with temperature.

It is important to note that this library does not derive thermal network models from specific geometries: That task must be performed by the user. The role of the THERMAL library is to handle and solve the thermal network models that the user has devised to represent the actual system.

## 1.2 Change log

+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Version | New Features                                                                                                                                                     |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 4.0.1   | - New fluids and their property files have been added: Argon, para Hydrogen, Oxygen and Nitrogen.                                                                |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 4.0.4   | - The paths of the material and fluid property files have been corrected to avoid problems in Linux.                                                             |
|         |                                                                                                                                                                  |
|         | - Examples of user defined fluid property files have been added: UsrDef_gas?.txt and UsrDef_liq?.txt.                                                            |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 4.0.5   | - The symbols of DNodeMat, DNodeMat_Vec, GL_mat, VCHP and Wall have been updated.                                                                                |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 4.0.6   | - The new component GL_Vec has been included in the library                                                                                                      |
|         |                                                                                                                                                                  |
|         | - The component Radiator has been modified including mass calculation, possibility of having a number of identical radiators, and fixing the bug when n_fin = 2. |
|         |                                                                                                                                                                  |
|         | - New ENUM variable thermoProp has been implemented for properties cp, rho and K.                                                                                |
|         |                                                                                                                                                                  |
|         | - New property files of materials have been added (see TH_material_prop_ref.el file).                                                                            |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 4.0.7   | - New materials LiH and ZrCp have been added.                                                                                                                    |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 4.0.8   | - New component DNode_vec has been included.                                                                                                                     |
|         |                                                                                                                                                                  |
|         | - The symbols of components mux and demux have been updated.                                                                                                     |
|         |                                                                                                                                                                  |
|         | - New component DNodenTom has been included.                                                                                                                     |
|         |                                                                                                                                                                  |
|         | - New component Th_InvIndex has been included.                                                                                                                   |
|         |                                                                                                                                                                  |
|         | - The Wall component has been slightly modified: The variables k_var and k_eq are forced to explicit to prevent convergence problems.                            |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+

## 1.3 Components in the Thermal Library

### 1.3.1 List of Components

**Abstract Components**

  -----------------------------------------------------------------------
  Component Type Name    Items Represented
  ---------------------- ------------------------------------------------
  Node                   Thermal node

  Conductor              Thermal conductor

  ADNode                 Abstract diffusive thermal node

  AGL                    Abstract linear thermal conductor

  AGR                    Abstract radiative conductor
  -----------------------------------------------------------------------

**Operative Components**

  --------------------------------------------------------------------------------------------------------------------------------------------------------
  Component Type Name             Items Represented
  ------------------------------- ------------------------------------------------------------------------------------------------------------------------
  BNode                           Boundary thermal node

  Cylinder                        Cylinder divided into longitudinal and radial nodes

  Cylinder_AI                     Axially isolated cylinder divided into longitudinal and radial nodes

  DNode                           Diffusive thermal node with constant capacity

  DNodeMat                        Diffusive thermal node having a mass of a given material

  DNodeMat_vec                    Diffusive vectorized thermal node calculating n temperatures with no heat exchange between nodes

  DNodeRoom                       Diffusive thermal node that represents a volume filled with a fluid

  DNphases                        Diffusive thermal node taking into account phase changes

  FreeConvec_HorizontalCylinder   Coupling to calculate the natural convection from a surface of a horizontal cylinder to a fluid

  FreeConvec_Plate                Coupling to calculate the natural convection from a surface of a plate to a fluid

  FreeConvec_UserDefined          Coupling to calculate the natural convection specifying the heat transfer coefficient as a function of the temperature

  FreeConvec_Wire                 Coupling to calculate the natural convection from a surface of a wire to a fluid

  FreeConvec_simple               Coupling to calculate natural convection from a surface to a simplified fluid

  GL                              Linear conductor with constant conductance

  GL_mat                          Linear conductor of a given material

  GL_vec                          Linear conductor with variable conductance along the nodes

  GR                              Radiative conductor with constant REF (Radiative Exchange Factor)

  HeatFlowMultiplier              Device to multiply input heat flow by a specified gain

  Heater                          Heater

  Insulation                      Thermal insulator

  Peltier                         Peltier element

  Periodic_Stop_Control           Device to check if the dynamic response of node temperature is cyclic

  Plate                           Plate divided into a number of longitudinal and transversal nodes

  Q_sensor                        Heat flow sensor

  Radiator                        Radiative plate

  Saddle                          Element to fasten heat pipes and tubes to a surface

  TD_GL                           Linear conductor with temperature dependant conductance

  Th_Demux                        Thermal demultiplexer: splitting a thermal port in two thermal ports

  Th_Demux1                       Thermal demultiplexer: splitting a thermal port in N thermal ports

  Th_Mux                          Thermal multiplexer, bringing together two thermal ports into one port

  Th_Mux1                         Thermal multiplexer, bringing together N thermal ports into one port

  T_sensor                        Temperature sensor

  Tube                            Pipe section required for constructing heat pipe component

  VCHP                            Variable conductance heat pipe

  View_Factors                    Radiative exchange between thermal nodes, the radiative exchange is calculated from the view factors.

  Wall                            Thermal wall
  --------------------------------------------------------------------------------------------------------------------------------------------------------

### 1.3.2 Hierarchy of the Components

The following figures show the relationships between inherited components.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image9.png){width="6.496527777777778in" height="3.0520833333333335in"}

Hierarchy of nodes

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image10.png){width="6.496527777777778in" height="2.848611111111111in"}

Hierarchy of conductors

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image11.png){width="6.496527777777778in" height="3.370833333333333in"}

Hierarchy of sensors

### 1.3.3 Ports

This library uses the following types of elementary standard ports that are defined in the library PORTS_LIB:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Port Type       Description                                                                                                                                                                                                                                                                                                                                               Symbol
  --------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  thermal         1-dimension array of thermal exchanges between two components. Physically, it corresponds to a line of contact or a surface of contact where the variables only exchange in one direction. The number of points where thermal exchange takes place can be varied through the "n" parameter; thus this type of port is referred to as a vectorised port.   ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image12.png){width="0.125in" height="0.125in"}

  analog_signal   1-dimension array of analog signal                                                                                                                                                                                                                                                                                                                        ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image13.png){width="0.125in" height="0.125in"}

  elec            electrical pin                                                                                                                                                                                                                                                                                                                                            ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image14.png){width="0.125in" height="0.125in"}
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The variables defined in each port are the following:

- **thermal port**

  ----------------------------------------------------------------------------------
  Name                    Description                        Units
  ----------------------- ---------------------------------- -----------------------
  Tc\[n\]                 Array of temperatures in Celsius   ºC

  Tk\[n\]                 Array of temperatures in Kelvin    K

  q\[n\]                  Array of heat flows                W
  ----------------------------------------------------------------------------------

- **analog_signal port**

  -------------------------------------------------------------------------
  Name                    Description               Units
  ----------------------- ------------------------- -----------------------
  signal\[n\]             Array of analog signals   \-

  -------------------------------------------------------------------------

- **elec port**

  --------------------------------------------------------------------------------
  Name                    Description                      Units
  ----------------------- -------------------------------- -----------------------
  i                       Electrical Current               A

  v                       Voltage (electrical potential)   V
  --------------------------------------------------------------------------------

## 1.4 Materials

There are several components where the user can specify the material. In that case, the material thermal properties are dependant on the temperature.

The calculation of these thermal properties is based on the interpolation in external data contained in files (1D temperature tables). The use of external data files has important advantages:

- The properties can be easily changed or completed just modifying the external data file without need to modify the library.

- Coding of the component is far less dependent on the type of the material

The users may build their own properties files. They must be named as follows: MatUsr1.txt, MatUsr2.txt or MatUsr1.txt, and added to the THERMAL/TABLES library directory. It is enough to indicate the corresponding name for "mat" in the attributes editor of a thermal component using material properties.

The format of these properties files is as follows. For example, for the AL2219:

+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| Register no.             | Values         | Comments                                                                                                  |
+==========================+================+===========================================================================================================+
| 1                        | AL2219         | Material name. (Same name as the file name)                                                               |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| 2                        | 3 2 34         | Number of constant properties, number of variable properties and number of points for variable properties |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| 3                        | 2800           | Numerical value of the first constant property (density in this case)                                     |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| 4                        | 70.E9          | Numerical value of the second constant property (E modulus in this case)                                  |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| 5                        | 0.30           | Numerical value of the third constant property (Poisson Modulus in this case)                             |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| 6                        | 20 30          | Minimum allowed temperatures for variable properties (one column per variable)                            |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| 7                        | 600 600        | Maximum allowed temperatures for variable properties (one column per variable)                            |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| 8                        | 20 23.98 22    | T1 Var1(T1) Var2(T1). In this case:                                                                       |
|                          |                |                                                                                                           |
|                          |                | T1 Cp k                                                                                                   |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| ...                      | \...           | ...                                                                                                       |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+
| 8+number of temperatures | 600 1000.0 155 | Tn Var1(Tn) Var2(Tn).                                                                                     |
+--------------------------+----------------+-----------------------------------------------------------------------------------------------------------+

Current available materials are depicted in the following table:

+-------------------------------------------------------------------------------------------------------------------------+
| MATERIALS                                                                                                               |
+==================+==================+============================+========================+=============================+
| Aluminium        | AL2219           | Al5083                     | AL3003_F               | AL6061_T6                   |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| AL7020           | Carbon           | Carbon Steel               | Copper                 | GCF or Epoy fiberglass      |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| Cryosof          | H920A            | Dacron filled with helium, | VIP (Polystyrene foam) | Dacron filled with nitrogen |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| H920A            | SS_304           | SS_304L                    | SS_310                 | SS_316                      |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| SS_321           | Titanium         | SA_210_A1                  | SA_213_T22             | T409                        |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| SA_106_GrB       | SA_335_P22       | Inconel 718                | Epoxy CarbonFiber      | Silicon Carbide             |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| B2O3             | B4C              | Be                         | BeO                    | Graphite IG 110             |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| Mo               | Mo-Re            | Re                         | UC                     | UN                          |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| UO2              | W                | Zr1Nb                      | ZrH                    | \-                          |
+------------------+------------------+----------------------------+------------------------+-----------------------------+
| MatUsr1          | MatUsr2          | MatUsr3                    | \-                     | \-                          |
+------------------+------------------+----------------------------+------------------------+-----------------------------+

where SS refers to Stainless Steal, SA to Steel Alloy, AL to Aluminium alloys and MatUsrX refers to user customized material.

## 1.5 Capacitive and Resistive Components

A detailed examination of the formulation reveals that most of the components in the Thermal library can be categorised according to the way the temperature and heat flow are calculated at their ports.

Following this criterion, components can be classified as either having capacitive (C) or resistive (R) thermal ports. A thermal port is referred to as capacitive when the formulation of the component calculates the temperature at the port as a state variable, whereas a port is called resistive when the component formulation calculates the heat flow at the port.

Most components in the Thermal library comprise thermal ports of a single kind (either C or R), but there may be exceptions. The list below indicates whether a component contains only C thermal ports, R thermal ports, or both types:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Components              Symbol                                                                                                                                                                                                     C thermal port    R thermal port
  ----------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------- -----------------
  BNode                   ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image15.png){width="0.625in" height="0.5208333333333334in"}                 **X**             

  Cylinder                ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image16.png){width="0.625in" height="0.5208333333333334in"}                 **X**             

  Cylinder_AI             ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image17.png){width="0.625in" height="0.5208333333333334in"}                 **X**             

  DNode                   ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image18.png){width="0.625in" height="0.5208333333333334in"}                 **X**             

  DNodeMat                ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image19.png){width="0.3968996062992126in" height="0.3877405949256343in"}    **X**             

  DNodeMat_vec            ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image20.png){width="0.4966163604549431in" height="0.41623906386701665in"}   **X**             

  DNphases                ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image21.png){width="0.625in" height="0.5208333333333334in"}                 **X**             

  FreeConvec_simple       ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image22.png){width="0.625in" height="0.5208333333333334in"}                                   **X**

  GL                      ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image23.png){width="0.625in" height="0.5208333333333334in"}                                   **X**

  GL_mat                  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image24.png){width="0.9131846019247594in" height="0.31670056867891516in"}                     **X**

  GL_vec                  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image25.png){width="0.7527974628171479in" height="0.4099387576552931in"}                      **X**

  GR                      ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image26.png){width="0.625in" height="0.5208333333333334in"}                                   **X**

  HeatFlowMultiplier      ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image27.png){width="0.625in" height="0.5208333333333334in"}                 **X**             **X**

  Heater                  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image28.png){width="0.5833333333333334in" height="0.5729166666666666in"}                      **X**

  Insulation              ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image29.png){width="0.625in" height="0.5208333333333334in"}                                   **X**

  Peltier                 ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image30.png){width="0.625in" height="0.5208333333333334in"}                                   **X**

  Periodic_Stop_Control   ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image31.png){width="0.625in" height="0.5208333333333334in"}                 **-**             **-**
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Components          Symbol                                                                                                                                                                                                    C thermal port    R thermal port
  ------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------- -----------------
  Plate               ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image32.png){width="0.625in" height="0.5208333333333334in"}                                  **X**

  Q_sensor            ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image33.png){width="0.625in" height="0.5208333333333334in"}                **X**             **X**

  Radiator            ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image34.png){width="0.625in" height="0.5208333333333334in"}                                  **X**

  Saddle              ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image35.png){width="0.625in" height="0.5208333333333334in"}                                  **X**

  TD_GL               ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image36.png){width="0.625in" height="0.5208333333333334in"}                                  **X**

  T_sensor            ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image37.png){width="0.4479166666666667in" height="0.5416666666666666in"}   **-**             **-**

  Tube                \-                                                                                                                                                                                                                          **X**

  VCHP                ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image38.png){width="0.625in" height="0.5208333333333334in"}                                  **X**

  Wall                ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image39.png){width="0.625in" height="0.5208333333333334in"}                **X**             
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

There are a few components in which the type of their thermal ports depends upon components to which they are connected.

- HeatFlowMultiplier must be connected to one C port and one R port but any order is valid. That means that if its inlet thermal port is connected to a C port, its outlet thermal port must be connected to a R port, and viceversa.

- QSensor is the same case as HeatFlowMultiplier, i.e. it must be inserted in between C and R ports, in any order.

## 1.6 Sign convention

The direction of the arrows of the ports corresponds to the positive direction of the heat fluxes. The sign convention is: Heat flux is positive if it goes from an IN port (marked with an inlet arrow, see figure below) to an OUT port (marked with an outlet arrow).

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image40.png){width="2.8792443132108487in" height="1.088827646544182in"}

Normally, capacitive components have IN ports meaning that positive heat fluxes will increase the temperature in the component. Resistive components have IN OUT ports.

# 2 

# 3 Global Items

## 3.1 Global Constants

  --------------------------------------------------------------------------------------------------------
  Name             Type                    Value     Description                               Units
  ---------------- ----------------------- --------- ----------------------------------------- -----------
  SOLAR_CONSTANT   CONST REAL              1410      Solar power received at Earth orbit       *W/m2*

  STEFAN           CONST REAL              5.67E-8   Stefan Boltzmann Constant                 *W/m2 K4*

  TMAX             CONST REAL              100000    Maximum temperature to report a warning   *K*

  TZERO            CONST REAL              273.15    Zero Temperature Shift                    *K*
  --------------------------------------------------------------------------------------------------------

## 3.2 Enumeration Data Types

### 3.2.1 Enumeration Type GasFlProps

Enumerative data type that defines fluid properties in gas state.

ENUM GasFlProps = {GAS_cp, GAS_viscosity, GAS_thermal_conductivity}

### 3.2.2 Enumeration Type LiqFlProps

Enumerative data type for fluid properties in liquid state.

ENUM LiqFlProps = {LIQ_density, LIQ_cp, LIQ_vsound, LIQ_beta, LIQ_viscosity, LIQ_thermal_conductivity, LIQ_surface_tension}

### 3.2.3 Enumeration Type Material

Enumerative data type that defines the list of available materials in the library.

ENUM Material = { None,

Aluminum,

AL2219,

AL3003_F,

AL5083_O,

AL6061_T6,

AL7020,

Carbon,

Carbon_Steel,

Copper,

Cryosof,

Dacron_filled_with_helium,

Dacron_filled_with_nitrogen,

Epoxy_fiberglass,

H920A,

SS_304,

SS_304L,

SS_310,

SS_316,

SS_321,

Titanium,

Vacuum_Insulated_Panel,

\-- New material names

SA_210_A1,

SA_213_T22,

T409,

SA_106_GrB,

SA_335_P22,

Inco718,

Epoxy_carbonfiber,

Silicon_carbide,

\--Nuclear Materials

B2O3,

B4C,

Be,

BeO,

Graphite_IG110,

Mo,

Mo_Re,

Re,

UC,

UN,

UO2,

W,

Zr1Nb,

ZrC,

ZrH,

\--Old Material Names to be eliminated in future versions

Al5083,

GCF,

Steel321,

VIP,

MatUsr1,

MatUsr2,

MatUsr3}

### 3.2.4 Enumeration Type PropSolid

Enumerative data type that describes properties of material.

ENUM PropSolid = {Density, ElasticityModulus, PoissonCoeff, SpecificHeat, Conductivity}

### 3.2.5 Enumeration Type ThFluids

Enumerative data type that describes the list of working fluids in the library.

ENUM ThFluids = {Air, Nitrogen, Oxygen, Water_ReheatedVap, UsrDef_gas1, UsrDef_gas2, UsrDef_gas3, Water_liq, UsrDef_liq1, UsrDef_liq2, UsrDef_liq3}

### 3.2.6 Enumeration Type ThermProp

Enumerative data type that describes the list of properties relevant for thermal calculation:

SET_OF (PropSolid) ThermProp = {Density, SpecificHeat, Conductivity}

### 3.2.7 Enumeration Type WALL_INIT_MODE

Enumerative data type that defines the available types of initialization.

ENUM WALL_INIT_MODE = {Constant_Temp, Linear_Temp, Table_Temp}

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  option                 Description
  ---------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Constant_Temp          Nodes are initialized at a constant user-defined temperature

  Linear_Temp            Nodes on both sides are initialized at the user-defined temperature. Temperatures of intermediate nodes are a linear interpolation between the values of both sides.

  Table_Temp             Nodes are initialized by means of interpolation in a user-defined table
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3.2.8 Enumeration Type WIRE_POSITION

Enumeration data type that defines the position of the component wire.

ENUM WIRE_POSITION = {Horizontal, Vertical}

### 3.2.9 Enumeration Type WallType

Enumerative data type that defines the type of wall.

ENUM WallType = {wall, floor, ceil}

## 3.3 SET_OF Data Types

### 3.3.1 SET_OF Type ConstProp

SET_OF type that defines the group of elements belonging to the enumerative data type PropSolid which are constant.

SET_OF (PropSolid) ConstProp ={Density, ElasticityModulus, PoissonCoeff}

### 3.3.2 SET_OF Type PipeMat

SET_OF type that sorts the elements of the enumerative type Material that are available for the component Pipe.

SET_OF (Material) PipeMat = { None, Aluminum, AL2219, AL3003_F, AL5083_O,

AL6061_T6, AL7020, Carbon_Steel, Copper, Epoxy_fiberglass, SS_304 , SS_304L, 10, SS_316,SS_321, Titanium, Inco718, Epoxy_carbonfiber, Silicon_carbide, Al5083, Steel321, MatUsr1, MatUsr2, MatUsr3}

### 3.3.3 SET_OF Type VarProp

SET_OF type that defines the group of elements belonging to the enumerative data type PropSolid which are time-dependent.

SET_OF (PropSolid) VarProp = {SpecificHeat, Conductivity}

## 3.4 Current Available Materials

Current available materials are:

  ---------------------------------------------------------------
  Material name                 File Name
  ----------------------------- ---------------------------------
  Aluminium                     Aluminium.txt

  AL2219                        AL2219.txt

  Al5083_O or Al5083            Al5083_O.txt

  AL3003_F                      AL3003_F.txt

  AL6061_T6                     AL6061_T6.txt

  AL7020                        AL7020.txt

  Carbon                        Carbon.txt

  Carbon_Steel                  Carbon_Steel.txt

  Copper                        Copper.txt

  Cryosof                       Cryosof.txt

  Dacron_filled_with_helium     Dacron_filled_with_helium.txt

  Dacron_filled_with_nitrogen   Dacron_filled_with_nitrogen.txt

  Epoxy_carbonfiber             Epoxy_carbonfiber.txt

  GCF or Epoy fiberglass        Epoxy_fiberglass.txt

  H920A                         H920A.txt

  Inco718                       Inco718.txt

  SA_106_GrB                    SA_106_GrB.txt

  SA_210_A1                     SA_210_A1.txt

  SA_213_T22                    SA_213_T22.txt

  SA_335_P22                    SA_335_P22.txt

  Silicon_carbide               Silicon_carbide.txt

  SS_304                        SS_304.txt

  SS_304L                       SS_304L.txt

  SS_310                        SS_310.txt

  SS_316                        SS_316.txt

  SS_321                        SS_321.txt

  T409                          T409.txt

  Titanium                      Titanium.txt

  B2O3                          B2O3.txt

  B4C                           B4C.txt

  Be                            BE.txt

  BeO                           BeO.txt

  Graphite IG 110               GraphiteIG110.txt

  Mo                            Mo.txt

  Mo-Re                         MoRe.txt

  Re                            Re.txt

  UC                            UC.txt

  UN                            UN.txt

  UO2                           UO2.txt

  W                             W.txt

  Zr1Nb                         Zr1Nb.txt

  ZrH                           ZrH.txt

  .                             .

  MatUsr1.txt tp MatUsr3        MatUsr1.txt tp MatUsr3-txt
  ---------------------------------------------------------------

## 3.5 Global Variables

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------
  Name                 Type         Default    Description                                                                                                 Units
  -------------------- ------------ ---------- ----------------------------------------------------------------------------------------------------------- -------
  Orbit_Period         BOUND REAL   7200       Orbit Period                                                                                                *s*

  PRINT_TEMP           BOOLEAN      FALSE      Print label to display the name and temperature of the nodes                                                *-*

  setRaleighWarnings   INTEGER      1          Test validity ranges in natural convection correlations (0 warnings are not shown ; 1 warnings are shown)   
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

## 3.6 Current Available Fluids

The following table depicts the available 1-phase pure fluids in the library for free-convection calculations:

  ---------------------------------------------------------------------------
  Fluid name          File Name               Description
  ------------------- ----------------------- -------------------------------
  Air                 Air.txt                 Air in gas phase

  Nitrogen            Nitrogen.txt            Nitrogen in gas phase

  Oxygen              Oxygen.txt              Oxygen in gas phase

  Water_ReheatedVap   Water_ReheatedVap.txt   Reheated water vapour

  UsrDef_gas1         UsrDef_gas1.txt         Gas defined by the user

  UsrDef_gas2         UsrDef_gas2.txt         Gas defined by the user

  UsrDef_gas3         UsrDef_gas3.txt         Gas defined by the user

  Water_liq           Water_liq.txt           Liquid water

  UsrDef_liq1         UsrDef_liq1.txt         Liquid defined by the user

  UsrDef_liq2         UsrDef_liq2.txt         Liquid defined by the user

  UsrDef_liq3         UsrDef_liq3.txt         Liquid defined by the user
  ---------------------------------------------------------------------------

The file of every fluid saves the physical-thermodynamic properties of the fluid needed for free-convection calculation like specific heat, conductivity, etc.

The list of available fluid is defined in the global enumerative variable called ThFluids.

# 4 Abstract Components

## 4.1 Abstract Component Node

### 4.1.1 Description

An abstract class for the definition of thermal nodes, with the ability to label nodes and calculate the minimum and the maximum temperatures reached.

### 4.1.2 Construction Parameters

  ------------------------------------------------------------------------------
  Name     Type            Default   Description                     Units
  -------- --------------- --------- ------------------------------- -----------
  n        CONST INTEGER   1         Dimension of thermal port       *-*

  ------------------------------------------------------------------------------

### 4.1.3 Ports

  ---------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality    Description
  ------- ---------- ------------ ----------- -------------- ----------------------
  tp_in   thermal    (n = n)      IN          \[1, 10000\]   Thermal inlet port

  ---------------------------------------------------------------------------------

### 4.1.4 Data

  ----------------------------------------------------------------------------
  Name    Type      Default        Description                     Units
  ------- --------- -------------- ------------------------------- -----------
  Label   STRING    "Node Label"   Node label identifier           *-*

  qi      REAL      0              Impressed heat                  *W*
  ----------------------------------------------------------------------------

### 4.1.5 Variables

  --------------------------------------------------------------------------
  Name      Type       Initial   Description                      Units
  --------- ---------- --------- -------------------------------- ----------
  q         REAL                 Total heat into node             *W*

  Tmin      REAL                 Minimum temperature reached      *K*

  Tmax      REAL                 Maximum temperature reached      *K*
  --------------------------------------------------------------------------

### 4.1.6 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language (EL language).

PATH tp_in TO tp_in

### 4.1.7 Formulation

**Print the Node Label and its Temperature**

It is possible to print on the screen the label and the temperature of the nodes at a specific point in time when one switches the global variable PRINT_TEMP to TRUE.

**Calculation of the Maximum and the Minimum Temperatures**

After each integration interval the maximum and minimum temperatures in the node are calculated by the thermal functions Bmax(xmax, x) and Bmin(xmin, x). In this case:

$$\begin{matrix}
Bmax(Tmax,\ T) \\
Bmin(Tmin,\ T)
\end{matrix}$$

These functions Bmax(xmax, x) and Bmin(xmin, x) calculate the maximum and the minimum values between the two function arguments and are stored in the variables xmax and xmin respectively.

**Calculation of the Total Heat into the Node**

The total heat into the node is equal to the sum of the impressed heat plus the overall heat flow coming through the inlet thermal port:

$$q_{tot} = q_{impress} + q_{in}$$

where:

$q_{impress}$: Impressed heat

$q_{in}$: Total heat flow coming into the node through the vectorised thermal inlet port, therefore qin is the sum of all "n" contributions

$$q_{in} = \sum_{i \in 1,n}^{}q_{in,i}$$

$q_{tot}$: Total heat flow into the node

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image41.png){width="1.7391994750656168in" height="0.9944892825896763in"}

## 4.2 Abstract Component Conductor

### 4.2.1 Description

An abstract class to derive the different types of thermal conductors by inheritance.

### 4.2.2 Construction Parameters

  -----------------------------------------------------------------------------------
  Name           Type            Default   Description                 Units
  -------------- --------------- --------- --------------------------- --------------
  n              CONST INTEGER   1         Dimension of thermal port   *-*

  -----------------------------------------------------------------------------------

### 4.2.3 Ports

  ---------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  ---------------------------------------------------------------------------------

### 4.2.4 Variables

  ------------------------------------------------------------------------
  Name      Type         Description                             Units
  --------- ------------ --------------------------------------- ---------
  q\[n\]    REAL         Heat flow                               *W*

  ------------------------------------------------------------------------

### 4.2.5 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 4.2.6 Formulation

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image42.png){width="2.3750360892388453in" height="0.6982699037620298in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 4.3 Abstract Component ADnode

Inherited from component Node.

### 4.3.1 Description

This component type, named ADNode, represents a thermal diffusive node with no equation to calculate the thermal capacity. Its purpose is to enable the user to derive different types of diffusive thermal nodes by inheritance. The thermal capacitance can be provided as a datum or it can be calculated from an equation.

This component has the option of being used as a boundary node that is at constant temperature.

### 4.3.2 Construction Parameters

  ------------------------------------------------------------------------------
  Name     Type            Default   Description                     Units
  -------- --------------- --------- ------------------------------- -----------
  n        CONST INTEGER   1         Dimension of thermal port       *-*

  ------------------------------------------------------------------------------

### 4.3.3 Ports

  ---------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality    Description
  ------- ---------- ------------ ----------- -------------- ----------------------
  tp_in   thermal    (n = n)      IN          \[1, 10000\]   Thermal inlet port

  ---------------------------------------------------------------------------------

### 4.3.4 Data

  -------------------------------------------------------------------------------
  Name       Type      Default        Description                        Units
  ---------- --------- -------------- ---------------------------------- --------
  Label      STRING    "Node Label"   Node label identifier              *-*

  qi         REAL      0              Heater power                       *W*

  To         REAL      290            Initial temperature                *K*

  Boundary   BOOLEAN   FALSE          Flag used to set boundary mode     *-*
  -------------------------------------------------------------------------------

### 4.3.5 Variables

  -------------------------------------------------------------------------
  Name       Type       Initial    Description                     Units
  ---------- ---------- ---------- ------------------------------- --------
  q          REAL                  Total Heat into node            *W*

  Tmin       REAL                  Minimum temperature reached     *K*

  Tmax       REAL                  Maximum temperature reached     *K*

  T          REAL                  Temperature                     *K*

  VC         REAL                  Variable Heat Capacity          *J/K*
  -------------------------------------------------------------------------

### 4.3.6 Formulation

The following mathematical expressions apply to this component type:

**Initialisation of the Temperature:**

$$T = T_{0}$$

The rate of change of the node temperature is calculated depending on the value of the Boolean variable named Boundary. If this variable is false then the rate of change of the node temperature is calculated from:

$$\frac{\partial T}{\partial t} = \frac{q}{VC}$$

where:

$q$: Total heat flow into the node

$VC$: Thermal capacitance of the node

But if this variable is true then the rate of change of the node temperature is considered equal to zero.

The temperature of the thermal inlet port is equal to the diffusive node temperature:

$$T_{in} = T$$

**Inherited from Abstract Component Node**

It is possible to print on the screen the label and the temperature of the nodes at a specific point in time when one switches the global variable PRINT_TEMP to TRUE.

After each integration interval the maximum and minimum temperatures in the node are calculated by the thermal functions Bmax(xmax, x) and Bmin(xmin, x). In this case:

$$\begin{matrix}
Bmax(Tmax,\ T) \\
Bmin(Tmin,\ T)
\end{matrix}$$

These functions Bmax(xmax, x) and Bmin(xmin, x) calculate the maximum and the minimum values between the two function arguments and are stored in the variables xmax and xmin respectively.

The total heat into the node is equal to the sum of the impressed heat plus the overall heat flow coming through the inlet thermal port:

$$q_{tot} = q_{impress} + q_{in}$$

where:

$q_{impress}$: Impressed heat

$q_{in}$: Total heat flow coming into the node through the vectorised thermal inlet port, therefore $q_{in}$ is the sum of all "n" contributions

$$q_{in} = \sum_{i \in 1,n}^{}q_{in,i}$$

$q_{tot}$: Total heat flow into the node

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image43.png){width="1.7630971128608923in" height="1.0676531058617673in"}

## 4.4 Abstract Component AGL

Inherited from component Conductor.

### 4.4.1 Description

This component type, named AGL, represents a thermal linear conductor where the heat flow is the temperature difference times a thermal conductance. This component does not provide any equation to calculate the thermal conductance, so its purpose is to enable the library developer to derive different types of linear conductors.

### 4.4.2 Construction Parameters

  -----------------------------------------------------------------------------
  Name     Type            Default   Description                     Units
  -------- --------------- --------- ------------------------------- ----------
  n        CONST INTEGER   1         Dimension of thermal port       *-*

  -----------------------------------------------------------------------------

### 4.4.3 Ports

  ---------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  ---------------------------------------------------------------------------------

### 4.4.4 Variables

  ------------------------------------------------------------------------------------
  Name         Type         Description                                   Units
  ------------ ------------ --------------------------------------------- ------------
  q\[n\]       REAL         Heat flow                                     *W*

  Vcond\[n\]   REAL         Variable thermal conductance per array item   *W/K*
  ------------------------------------------------------------------------------------

### 4.4.5 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 4.4.6 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

Heat Transport by Conduction

$$q_{i} = {Vcond}_{i}\left( T_{in,i} - T_{out,i} \right)$$

where $Vcond_{i}\$is the thermal conductance at each array item.

**Inherited from Abstract Component Conductor**

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image42.png){width="2.3750360892388453in" height="0.6982699037620298in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 4.5 Abstract Component AGR

Inherited from component Conductor.

### 4.5.1 Description

This component type, named AGR, represents a thermal radiative connection. This component does not provide the value of the Radiative Exchange Factor, and its purpose is to enable the user to derive different types of radiative conductors.

### 4.5.2 Construction Parameters

  ------------------------------------------------------------------------------
  Name     Type            Default   Description                     Units
  -------- --------------- --------- ------------------------------- -----------
  n        CONST INTEGER   1         Dimension of thermal port       \-

  ------------------------------------------------------------------------------

### 4.5.3 Ports

  ---------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  ---------------------------------------------------------------------------------

### 4.5.4 Variables

  --------------------------------------------------------------------------------------
  Name        Type         Description                                         Units
  ----------- ------------ --------------------------------------------------- ---------
  Q\[n\]      REAL         Heat flow                                           *W*

  VREF\[n\]   REAL         Variable Radiative Exchange Factor per array item   *m2*
  --------------------------------------------------------------------------------------

### 4.5.5 Topology

PATH tp_in TO tp_out

### 4.5.6 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

**Heat Conduction by Radiation**

$$q_{i} = {\sigma \cdot VREF}_{i} \cdot \left( T_{in,i}^{4} - T_{out,i}^{4} \right)$$

where:

$\sigma$ : Stefan Boltzmann constant, i.e. 5.67.10-8 W/(m^2^ K^4^)

${VREF}_{i}$: Radiation Exchange Factor per array item, in m^2^

$T_{in}^{}$: Inlet absolute temperature in K

$T_{out}^{}$: Outlet absolute temperature in K

**Inherited from Abstract Component Conductor**

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image42.png){width="2.3750360892388453in" height="0.6982699037620298in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 4.6 Component Tube

### 4.6.1 Description

Strictly speaking this component is not an Abstract Component, but it is presented in this section because it is a building block for the definition of the VCHP (variable conductance heat pipe) component. Hence it is not expected that it will be used on its own.

This component represents a section of a VCHP, i.e. a thin-walled tube containing a certain amount of condensable fluid as well as a quantity of non-condensing gas for control purposes.

The component calculates the different heat flows taking place in and out of the tube and through the fluid. The purpose of the control gas is to vary the length of active pipe determining the total inner contact surface of pipe with fluid and heat transfer characteristics of tube.

This component makes use of the Lvap function to calculate the active length of the pipe under given operational conditions and, additionally, the amount of non-condensing gas moles contained in tube.

### 4.6.2 Symbol

No symbol is needed for this component because it is only the basis of VCHP component.

### 4.6.3 Construction Parameters

  -------------------------------------------------------------------------
  Name      Type                   Default   Description
  --------- ---------------------- --------- ------------------------------
  n         CONST INTEGER          5         Number of nodes in tube

  -------------------------------------------------------------------------

### 4.6.4 Ports

  ------------------------------------------------------------------------------------------------------------------------------------------------
  Name         Type            Parameters   Direction   Description
  ------------ --------------- ------------ ----------- ------------------------------------------------------------------------------------------
  tp_1         thermal         (n = 1)      IN          Tube axial thermal inlet port

  tp_N         thermal         (n = 1)      OUT         Tube axial thermal outlet port

  tp_vapour    thermal         (n = n)      IN          Thermal inlet port for the radial connection of the inner side of the tube to the vapour

  tp_wall      thermal_n       (n = n)      OUT         Thermal outlet port for radial connecting of the outer side of the tube

  s_p          analog_signal   \-           IN          Input signal port for the total pressure

  s_ngas_in    analog_signal   \-           IN          Input port for the number of moles of gas

  s_ngas_out   analog_signal   \-           OUT         Output port for the number of moles of gas

  s_lvap       analog_signal   \-           OUT         Vapour length measured from start of tube
  ------------------------------------------------------------------------------------------------------------------------------------------------

### 4.6.5 Data

  -------------------------------------------------------------------------------------
  Name    Type            Default   Description                              Units
  ------- --------------- --------- ---------------------------------------- ----------
  l       REAL            1         Length of tube                           *m*

  D_o     REAL            0.02      Outer diameter of tube                   *m*

  D_i     REAL            0.018     Inner diameter of tube                   *m*

  A_vap   REAL            0.0001    Fluid cross section area in tube         *m2*

  mat     ENUM Material   None      Material used for tube                   *-*

  rho     REAL            1000      Wall density if material is None         *Kg/m3*

  cp      REAL            500       Wall specific heat if material is None   *J/kg K*

  k       REAL            0.1       Wall conductivity if material is None    *W/m K*

  h       REAL            1000      Vapour-tube heat transfer coefficient    *W/m2 K*
  -------------------------------------------------------------------------------------

### 4.6.6 Variables

  --------------------------------------------------------------------------------------
  Name            Type            Description                                 Units
  --------------- --------------- ------------------------------------------- ----------
  dx              REAL            Node length                                 *m*

  P_outer         REAL            Perimeter of outer section                  *m*

  P_inner         REAL            Perimeter of inner section                  *m*

  A               REAL            Cross sectional area of tube wall           *m2*

  A_i             REAL            Cross sectional inner area of tube          *m2*

  rho_var         REAL            Density of wall material                    *kg/m3*

  cp_var          REAL            Specific heat wall material                 *J/kg K*

  k               REAL            Thermal conductivity of wall material       *W/m K*

  C               REAL            Thermal capacitance of nodes                *J/K*

  q\[n+1\]        REAL            Axial heat flow through nodes               *W*

  q_vapour\[n\]   REAL            Heat flow from vapour to each node          *W*

  T\[n\]          REAL            Temperature of nodes                        *K*

  chi\[n\]        REAL            Vapour-gas moles ratio at each section      *-*

  l_vap           REAL            Vapour length measured from start of tube   *m*
  --------------------------------------------------------------------------------------

### 4.6.7 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_1 TO tp_N

### 4.6.8 Formulation

**Nodalisation**

The tube is divided into a number *n* of sections.

Array of variables *T\[n\]* contains the temperatures of the wall at each section, array of variables *q\[n+1\]* contains the heat flows across the wall sections plus the heat flows at the ends of the tube, and array of variables *q_vapour\[n\]* contains the heat flows coming from the fluid. On the other hand, the vectorised port *tp_wall* contains the temperatures of the wall (*T\[i\]*) and outgoing heat flows through the wall at each section. Additionally, the vectorised port *tp_vapour* contains the temperature of the vapour and the total heat flow coming from the fluid.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image44.png){width="3.1075634295713037in" height="1.8662871828521435in"}

Each section is modelled as a thermal node as shown below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image45.png){width="4.127527340332459in" height="1.3465758967629047in"}

It is known that at the ends of the tube:

$q_{1} = tp\_ 1.q$

$q_{n + 1} = tp\_ N.q$

We can divide the heat flows into their axial (through nodes) and radial components:

The axial internal heat flows are given by:

$q_{i} = K \cdot A \cdot \frac{T_{i - 1} - T_{i}}{\partial x}$

and at the ends of the tube:

$q_{1} = K \cdot A \cdot \frac{tp\_ 1.T - T_{1}}{\partial x/2}$

$q_{n + 1} = K \cdot A \cdot \frac{T_{n} - tp\_ N.T}{\partial x/2\ }$

The radial heat fluxes are given by:

${q\_ vapour}_{i} = h \cdot \left( \varepsilon_{i} \cdot P_{inner} \cdot \partial x \right) \cdot \left( tp\_ vapour.T - T_{i} \right)$

where $\varepsilon_{i}\$depends on the gas front position, it is equal to 1 when the node is filled with vapour, it is equal to zero when the node it is filled with gas, and its value is linearly interpolated between 0 and 1 when the front is within node i.

The corresponding energy equation for any section is:

${cp}_{i} \cdot \rho_{i} \cdot A \cdot \partial x \cdot \frac{\partial T_{i}}{\partial x} = \left( q_{i} - q_{i + 1} \right) + \left( q\_ vapour_{i} - tp\_ wall.q_{i} \right)$

Where:

$cp$: Specific heat of each node in the tube

$\rho$: Density of each node in the tube

$A$: Cross sectional are of tube wall

# 5 Components

## 5.1 Component BNode

Inherited from component Node.

### 5.1.1 Description

This component type, named BNode, represents a thermal boundary node at which the temperature is a time-dependent boundary condition.

### 5.1.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image46.png){width="0.6666666666666666in" height="0.8854166666666666in"}

### 5.1.3 Construction parameters

  --------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- ------------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  --------------------------------------------------------------------------

### 5.1.4 Ports

  ------------------------------------------------------------------------------------------------------------------
  Name            Type            Parameters   Direction   Cardinality    Description
  --------------- --------------- ------------ ----------- -------------- ------------------------------------------
  s_temperature   analog signal   (n = n)      IN                         Input signal port for temperature values

  tp_in           thermal         (n = n)      IN          \[1, 10000\]   Thermal inlet port
  ------------------------------------------------------------------------------------------------------------------

### 5.1.5 Data

  -------------------------------------------------------------------------------
  Name    Type       Default        Description                           Units
  ------- ---------- -------------- ------------------------------------- -------
  Label   STRING     "Node Label"   Node label                            *-*

  qi      REAL       0              Impressed heat                        *W*
  -------------------------------------------------------------------------------

### 5.1.6 Variables

  --------------------------------------------------------------------------
  Name    Type         Initial   Description                       Units
  ------- ------------ --------- --------------------------------- ---------
  q       REAL                   Total heat into node              *W*

  Tmin    REAL                   Minimum temperature reached       *K*

  Tmax    REAL                   Maximum temperature reached       *K*
  --------------------------------------------------------------------------

### 5.1.7 Formulation

The vectorised thermal port temperature is equal to the time-varying temperature signal:

tp_in\[j\] = s_temperature.signal\[j\]

**Inherited from Abstract Component Node**

It is possible to print on the screen the label and the temperature of the nodes at a specific point in time when one switches the global variable PRINT_TEMP to TRUE.

After each integration interval the maximum and minimum temperatures in the node are calculated by the thermal functions Bmax(xmax, x) and Bmin(xmin, x). In this case:

$$\begin{matrix}
Bmax(Tmax,\ T) \\
Bmin(Tmin,\ T)
\end{matrix}$$

These functions Bmax(xmax, x) and Bmin(xmin, x) calculate the maximum and the minimum values between the two function arguments and are stored in the variables xmax and xmin respectively.

The total heat into the node is equal to the sum of the impressed heat plus the overall heat flow coming through the inlet thermal port:

$$q_{tot} = q_{impress} + q_{in}$$

where:

$q_{impress}$: Impressed heat

$q_{in}$: Total heat flow coming into the node through the vectorised thermal inlet port, therefore qin is the sum of all "n" contributions

$$
{q_{in} = \sum_{i \in 1,n}^{}q_{in,i}}$$

$q_{tot}$: Total heat flow into the node

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image43.png){width="1.7630971128608923in" height="1.0676531058617673in"}

## 5.2 Component Cylinder

### 5.2.1 Description

This component type, named Cylinder, represents a pipe that is divided into a number of longitudinal and radial shapes (nodes). Heat flows are considered positive in the direction of increasing node index. For axial nodes this is from left to right, and for radial nodes this is from the centre of the cross-section to the outside.

### 5.2.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image47.png){width="1.1666666666666667in" height="1.125in"}

### 5.2.3 Construction parameters

  ------------------------------------------------------------------------------
  Name              Type              Default           Description
  ----------------- ----------------- ----------------- ------------------------
  nr                CONST INTEGER     3                 Number of radial nodes

  nz                CONST INTEGER     5                 Number of axial nodes
  ------------------------------------------------------------------------------

### 5.2.4 Ports

  ----------------------------------------------------------------------------------------------
  Name          Type          Parameters   Direction   Description
  ------------- ------------- ------------ ----------- -----------------------------------------
  tpr_in        thermal       (n = nz)     IN          Thermal inlet port -- radial direction

  tpr_out       thermal       (n = nz)     OUT         Thermal outlet port -- radial direction

  tpz_in        thermal       (n = nr)     IN          Thermal inlet port -- axially

  tpz_out       thermal       (n=nr)       OUT         Thermal outlet port - axially
  ----------------------------------------------------------------------------------------------

### 5.2.5 Data

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Name                    Type                  Default      Description                                                                                     Units
  ----------------------- --------------------- ------------ ----------------------------------------------------------------------------------------------- ----------
  Do                      REAL                  0.12         Outer diameter                                                                                  *m*

  Di                      REAL                  0.1          Inner diameter                                                                                  *m*

  L                       REAL                  1            Length                                                                                          *m*

  mat                     ENUM Material         None         Material                                                                                        *-*

  cp                      REAL                  500          Wall specific heat if material is None                                                          *J/kg K*

  k                       REAL                  0.1          Wall conductivity if material is None                                                           *W/m K*

  rho                     REAL                  1000         Wall density if material is None                                                                *Kg/m3*

  TemperatureDependance   BOOLEAN               TRUE         Option to consider or not the temperature dependence on the material properties                 

  init_mode               ENUM WALL_INIT_MODE   Const_Temp   Option for the initialisation of the nodal temperatures                                         *-*

  To                      REAL                  293          Initial temperature                                                                             *K*

  To_linear               REAL \[2\]            {290, 290}   Initial temperatures at both sides if init_mode = Linear_Temp                                   *K*

  To_table                TABLE_1D                           Table with initial wall temperature versus non-dimensional position if init_mode = Table_Temp   *K*
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Input data cp, k and rho will be used only if "mat" = None. If not, the properties will be interpolated using the corresponding data file.

### 5.2.6 Variables

  -------------------------------------------------------------------------------------------------------------------------
  Name                Type         Initial   Description                                                        Units
  ------------------- ------------ --------- ------------------------------------------------------------------ -----------
  F                   CONST REAL   0.0001    Thermal capacity ratio assigned to the surface                     *-*

  T\[nr,nz\]          REAL                   Nodal temperature                                                  *K*

  V\[nr\]             REAL                   Nodal volume                                                       *m*^3^

  cp_var\[nr, nz\]    REAL                   Nodal specific heat of wall material                               *J/kg K*

  cp_tpr\[2, nz\]     REAL                   Nodal specific heat of outer-inner skin                            *J/kg K*

  cp_tpz\[nr,2\]      REAL                   Nodal specific heat of first-last section skin                     *J/kg K*

  dr                  REAL                   Nodal distance in r                                                *m*

  dz                  REAL                   Nodal distance in z                                                *m*

  k_var\[nr, nz\]     REAL                   Nodal thermal conductivities                                       *W/m K*

  C_rad\[nr+1,nz\]    REAL                   Radial equivalent conductance between the thermal nodes            *W/K*

  C_axi\[nr, nz+1\]   REAL                   Axial equivalent conductance between the thermal nodes             *W/K*

  qr\[nr +1, nz\]     REAL                   Heat flows between nodes in radial direction                       *W*

  qz\[nr, nz+1\]      REAL                   Heat flows between nodes in axial direction                        *W*

  rho_var             REAL                   Density of wall material                                           *Kg/m*^3^

  ito                 INTEGER                Pointer to time interval for To in property tables                 *-*

  icpk\[nr,nz\]       INTEGER                Pointer to last interpolation interval for each node               *-*

  icpk_tpr\[2, nz\]   INTEGER                Pointer to last interpolation interval for each radial port node   *-*

  icpk_tpz\[nr, 2\]   INTEGER                Pointer to last interpolation interval for each axial port node    *-*
  -------------------------------------------------------------------------------------------------------------------------

### 5.2.7 Formulation

**Nodalisation**

The dimensions of the inlet and outlet vectorised thermal ports are defined by the values of *nz* (number of nodes in the axial direction into which the pipe is divided) and nr (number of nodes in the radial direction). The temperature at each node is stored in an array called *T\[nr, nz\]*.

Array *qr\[nr + 1, nz\]* contains the heat flows across nodes in the radial direction, whereas array *qz\[nr, nz + 1\]* contains the heat flows across nodes in the axial direction.

The nodal distance along the axis of the cylinder is then:

$$\partial z = \frac{L}{nz}$$

And the nodal distance in the radial direction of the cylinder is:

$$\partial r = \frac{\left( D_{out} - D_{in} \right)}{2 \cdot nr}$$

where:

$D_{out}$: Outer diameter

$D_{in}$: Inner diameter

The volume of each node is given by:

$$V_{i,j} = \frac{1}{4}\pi\left\{ \left( D_{in} + 2 \cdot i \cdot \partial r \right)^{2} - \left( D_{in} + 2 \cdot (i - 1) \cdot \partial r \right)^{2} \right\} \cdot \partial z$$

The volume assigned to the ports is a percentage of the thermal capacity assigned to the closest node specified by the constant variable F.

**Initialisation**

The data named init_mode allows the user to specify the initial temperature distribution in the nodes. There are three options::

- Uniform initial temperature for all the nodes (init_mode = Constant_Temp)

- Linear initial temperature distribution in the radial direction and uniform initial temperature in the axial direction (init_mode = Linear_Temp)

- Initial temperature distribution given by a data table of the initial temperature as a function of the non-dimensional position in the radial direction (init_mode = Table_Temp). For the axial direction, the temperature distribution is considered uniform.

**Heat balance**

The following heat balance equation is applied on each node in the radial and axial directions

$$\rho_{var} \cdot cp_{var\ i,j} \cdot V_{i,j} \cdot \ \frac{\partial T_{i,j}}{\partial t} = qr_{i,j} - qr_{i + 1,j} + qz_{i,j} - qz_{i,j + 1}$$

**Heat flows**

The axial heat flows are given by

$$qz_{i,j} = \ \frac{k_{var\ i,j - 1} \cdot k_{var\ i,j}\ }{\frac{k_{var\ i,j}}{2}\partial z + \frac{k_{var\ i,j - 1}}{2}\partial z}\left( \frac{V_{i,j}}{\partial z} \right)\left( \frac{T_{i,j - 1} - T_{i,j}}{\partial z} \right)$$

And the radial heat flows are given by

$$qr_{i,j} = \ 2 \cdot \pi \cdot \partial z \cdot \frac{1\ }{\frac{\log\left( \frac{D_{in} + (2 \cdot i - 2)\partial r}{D_{in} + (2 \cdot i - 3)\partial r} \right)}{k_{var\ i - 1,j}} + \frac{\log\left( \frac{D_{in} + (2 \cdot i - 1)\partial r}{D_{in} + (2 \cdot i - 2)\partial r} \right)}{k_{var\ i,j}}}\left( T_{i - 1,j} - T_{i,j} \right)$$

where:

$i$: Index for the radial discretization

$j$: Index for the axial discretization

$T_{i,j}$: Temperature in the node \[i,j\]

$k_{var\ i,j}\ :$ Conductivity of the node \[i,j\]

$qr_{i,j}$: Radial heat flow between the nodes \[i-1,j\] y \[i,j\]

$qz_{i,j}$: Axial heat flow between the nodes \[i, j-1\] y \[i,j\]

**Axial boundary conditions**

In the radial direction, a certain thermal inertia of the closest node (given by F) is assigned to the thermal inlet and outlet ports. This is done to prevent the appearance of algebraic loops when calculating the heat flows at the ports.

$$c{p\_ tpz}_{i,1} \cdot F \cdot V_{i,1} \cdot \rho_{var} \cdot \ \frac{\partial{tpz\_ in.Tk}_{i}}{\partial t} = tpz\_ in.q_{i} - qz_{i,1}$$

$$c{p\_ tpz}_{i,2} \cdot F \cdot V_{i,nz} \cdot \rho_{var} \cdot \ \frac{\partial{tpz\_ in.Tk}_{i}}{\partial t} = {qz}_{i,nz + 1} - tpz\_ out.q_{i}$$

where:

$F$: Thermal capacity ratio assigned to the ports

$tpz\_ in.q$: Heat flow at the axial inlet thermal port

$tpz\_ out.q$: Heat flow at the axial outlet thermal port

$tpz\_ in.Tk$: Temperature at the axial inlet thermal port

$tpz\_ out.Tk$: Temperature at the axial outlet thermal port

$qz_{i,1}$: Heat flow between the thermal port and the node \[i,1\]

${qz}_{i,nz + 1}$: Heat flow between the thermal port and the node \[i,nz\]

These last heat flows are computed as follows:

$$qz_{i,j} = \ 2 \cdot k_{var\ i,j} \cdot \frac{V_{i,1}}{\partial z} \cdot \frac{\left( tpz\_ in.Tk_{i} - T_{i,1}\  \right)\ }{\partial z}$$

$$qz_{i,nz + 1} = \ 2 \cdot k_{var\ i,nz} \cdot \frac{V_{i,nz}}{\partial z} \cdot \frac{\left( T_{i,nz} - tpz\_ out.Tk_{i}\  \right)\ }{\partial z}$$

**Radial boundary conditions**

In the radial direction, a certain thermal inertia (given by F) is assigned to the thermal inlet and outlet ports. This is done to prevent the appearance of algebraic loops when calculating the heat flows at the ports.

$$c{p\_ tpr}_{1,j} \cdot F \cdot V_{1,j} \cdot \rho_{var}\frac{\partial tpr\_ in.Tk_{j}\ }{\partial t} = \ tpr\_ in.q_{i} - qr_{1,j}$$

$$c{p\_ tpr}_{2,j} \cdot F \cdot V_{nr,j} \cdot \rho_{var}\frac{\partial tpr\_ out.Tk_{j}\ }{\partial t} = \ qr_{nr + 1,j} - tpr\_ out.q_{j}$$

where:

$F$: Thermal capacity ratio assigned to the ports

$tpr\_ in.q$: Heat flow at the radial inlet thermal port

$tpr\_ out.q$: Heat flow at the radial outlet thermal port

$tpr\_ in.Tk$: Temperature at the radial inlet thermal port

$tpr\_ out.Tk$: Temperature at the radial outlet thermal port

$qr_{1,j}$: Heat flow between the thermal port and the node \[1,j\]

$qr_{nr + 1,j}$: Heat flow between the thermal port and the node \[nr+1,j\]

These last heat flows are computed as follows:

$$qr_{1,j} = \frac{2 \cdot \pi \cdot \partial z \cdot k_{var\ 1,j}}{\log\left( 1 + \frac{\partial r}{D_{in}} \right)} \cdot \left( tpr\_ in.Tk_{j} - T_{1,j} \right)$$

$$qr_{nr + 1,j} = \frac{2 \cdot \pi \cdot \partial z \cdot k_{var\ nr,j}}{\log\left( \frac{D_{out}}{D_{out} - \partial r} \right)} \cdot \left( T_{nr,j} - tpr\_ out.Tk_{j} \right)$$

## 5.3 Component Cylinder_AI

Inherited from component Cylinder.

### 5.3.1 Description

This component, named Cylinder_AI, is similar to component Cylinder but its axial ends are isolated, which means that the axial ports tpz_in and tpz_out are closed.

### 5.3.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image48.png){width="0.9583333333333334in" height="1.125in"}

### 5.3.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- -----------------------------
  nr         CONST INTEGER          3         Number of radial nodes

  nz         CONST INTEGER          5         Number of axial nodes
  -------------------------------------------------------------------------

### 5.3.4 Ports

  ----------------------------------------------------------------------------------------------
  Name             Type      Parameters   Direction    Description
  ---------------- --------- ------------ ------------ -----------------------------------------
  tpr_in           thermal   (n = nz)     IN           Thermal inlet port -- radial direction

  tpr_out          thermal   (n = nz)     OUT          Thermal outlet port -- radial direction
  ----------------------------------------------------------------------------------------------

### 5.3.5 Data

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Name                    Type                  Default      Description                                                                                     Units
  ----------------------- --------------------- ------------ ----------------------------------------------------------------------------------------------- -----------
  Do                      REAL                  0.12         Outer diameter                                                                                  *m*

  Di                      REAL                  0.1          Inner diameter                                                                                  *m*

  L                       REAL                  1            Length                                                                                          *m*

  mat                     ENUM Material         None         Material                                                                                        *-*

  cp                      REAL                  500          Wall specific heat if material is None                                                          *J/kg K*

  k                       REAL                  0.1          Wall conductivity if material is None                                                           *W/m K*

  rho                     REAL                  1000         Wall density if material is None                                                                *Kg/m*^3^

  TemperatureDependance   BOOLEAN               TRUE         Option to consider or not the temperature dependence on the material properties                 

  init_mode               ENUM WALL_INIT_MODE   Const_Temp   Option for the initialisation of the nodal temperatures                                         *-*

  To                      REAL                  293          Initial temperature                                                                             *K*

  To_linear               REAL \[2\]            {290, 290}   Initial temperatures at both sides if init_mode = Linear_Temp                                   *K*

  To_table                TABLE_1D                           Table with initial wall temperature versus non-dimensional position if init_mode = Table_Temp   *K*
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Input data cp, k and rho will be used only if "mat" = None. If not, the properties will be interpolated using the corresponding data file.

### 5.3.6 Variables

  -------------------------------------------------------------------------------------------------------------------------
  Name                Type         Initial   Description                                                        Units
  ------------------- ------------ --------- ------------------------------------------------------------------ -----------
  F                   CONST REAL   0.0001    Thermal capacity ratio assigned to the surface                     *-*

  T\[nr,nz\]          REAL                   Nodal temperature                                                  *K*

  V\[nr\]             REAL                   Nodal volume                                                       *m3*

  cp_var\[nr, nz\]    REAL                   Nodal specific heat of wall material                               *J/kg K*

  cp_tpr\[2, nz\]     REAL                   Nodal specific heat of outer-inner skin                            *J/kg K*

  cp_tpz\[nr,2\]      REAL                   Nodal specific heat of first-last section skin                     *J/kg K*

  dr                  REAL                   Nodal distance in r                                                *m*

  dz                  REAL                   Nodal distance in z                                                *m*

  k_var\[nr, nz\]     REAL                   Nodal thermal conductivities                                       *W/m K*

  C_rad\[nr+1,nz\]    REAL                   Radial equivalent conductance between the thermal nodes            *W/K*

  C_axi\[nr, nz+1\]   REAL                   Axial equivalent conductance between the thermal nodes             *W/K*

  qr\[nr +1, nz\]     REAL                   Heat flows between nodes in radial direction                       *W*

  qz\[nr, nz+1\]      REAL                   Heat flows between nodes in axial direction                        *W*

  rho_var             REAL                   Density of wall material                                           *Kg/m*^3^

  ito                 INTEGER                Pointer to time interval for To in property tables                 

  icpk\[nr,nz\]       INTEGER                Pointer to last interpolation interval for each node               

  icpk_tpr\[2, nz\]   INTEGER                Pointer to last interpolation interval for each radial port node   

  icpk_tpz\[nr, 2\]   INTEGER                Pointer to last interpolation interval for each axial port node    
  -------------------------------------------------------------------------------------------------------------------------

### 5.3.7 Formulation

The cylinder is isolated at its ends by removing the axial ports as shown below:

DECLS

CLOSE tpz_in

CLOSE tpz_out

**Inherited from component Cylinder**

**Nodalisation**

The dimensions of the inlet and outlet vectorised thermal ports are defined by the values of *nz* (number of nodes in the axial direction into which the pipe is divided) and nr (number of nodes in the radial direction). The temperature at each node is stored in an array called *T\[nr, nz\]*.

Array *qr\[nr + 1, nz\]* contains the heat flows across nodes in the radial direction, whereas array *qz\[nr, nz + 1\]* contains the heat flows across nodes in the axial direction.

The nodal distance along the axis of the cylinder is then:

$$\partial z = \frac{L}{nz}$$

And the nodal distance in the radial direction of the cylinder is:

$$\partial r = \frac{\left( D_{out} - D_{in} \right)}{2 \cdot nz}$$

where:

$D_{out}$: Outer diameter

$D_{in}$: Inner diameter

The volume of each radial node is given by:

$$V_{i,j} = \frac{1}{4}\pi\left\{ \left( D_{in} + 2 \cdot i \cdot \partial r \right)^{2} - \left( D_{in} + 2 \cdot (i - 1) \cdot \partial r \right)^{2} \right\} \cdot \partial z$$

The volume assigned to the ports is a percentage of the thermal capacity assigned to the closest node specified by the constant F.

**Initialisation**

The data named init_mode allows the user to specify the initial temperature distribution in the nodes. There are three options:

- Uniform initial temperature for all the nodes (init_mode = Constant_Temp)

- Linear initial temperature distribution in the radial direction and uniform initial temperature in the axial direction (init_mode = Linear_Temp)

- Initial temperature distribution given by a data table of the initial temperature as a function of the non-dimensional position in the radial direction (init_mode = Table_Temp). For the axial direction, the temperature distribution is considered uniform.

**Heat balance**

The following heat balance equation is applied on each node in the radial and axial directions

$$\rho_{var} \cdot \ {cp}_{var\ i,j} \cdot V_{i,j} \cdot \frac{\partial T_{i,j}}{\partial t} = qr_{i,j} - qr_{i + 1,j} + qz_{i,j} - qz_{i,j + 1}$$

**Heat flows**

The axial heat flows are given by

$$qz_{i,j} = \ \frac{k_{var\ i,j - 1} \cdot k_{var\ i,j}\ }{\frac{k_{var\ i,j}}{2}\partial z + \frac{k_{var\ i,j - 1}}{2}\partial z}\left( \frac{V_{i,j}}{\partial z} \right)\left( \frac{T_{i,j - 1} - T_{i,j}}{\partial z} \right)$$

And the radial heat flows are given by

$$qr_{i,j} = \ 2 \cdot \pi \cdot \partial z \cdot \frac{1\ }{\frac{\log\left( \frac{D_{in} + (2 \cdot i - 2)\partial r}{D_{in} + (2 \cdot i - 3)\partial r} \right)}{k_{var\ i - 1,j}} + \frac{\log\left( \frac{D_{in} + (2 \cdot i - 1)\partial r}{D_{in} + (2 \cdot i - 2)\partial r} \right)}{k_{var\ i,j}}}\left( T_{i - 1,j} - T_{i,j} \right)$$

where:

$i$: Index for the radial discretization

$j$: Index for the axial discretization

$T_{i,j}$: Temperature in the node \[i,j\]

$k_{var\ i,j}$: Conductivity of the node \[i,j\]

$qr_{i,j}$: Radial heat flow between the nodes \[i-1,j\] y \[i,j\]

$qz_{i,j}$: Axial heat flow between the nodes \[i, j-1\] y \[i,j\]

**Axial boundary conditions**

In the radial direction, a certain thermal inertia of the closest node (given by F) is assigned to the thermal inlet and outlet ports. This is done to prevent the appearance of algebraic loops when calculating the heat flows at the ports.

$${cp\_ tpz}_{i,1} \cdot F \cdot V_{i,1} \cdot \rho_{var}\frac{\partial tpz\_ in.Tk_{i}}{\partial t} = tpz\_ in.q_{i} - {qz}_{i,1}$$

$${cp\_ tpz}_{i,2} \cdot F \cdot V_{i,nz} \cdot \rho_{var}\frac{\partial tpz\_ out.Tk_{i}}{\partial t} = qz_{i,nz + 1} - tpz\_ out.q_{i}\ $$

where:

$F$: Thermal capacity ratio assigned to the ports

$tpz\_ in.q_{i}$: Heat flow at the axial inlet thermal port

$tpz\_ out.q_{i}$: Heat flow at the axial outlet thermal port

$tpz\_ in.Tk_{i}$: Temperature at the axial inlet thermal port

$tpz\_ out.Tk_{i}$: Temperature at the axial outlet thermal port

${qz}_{i,1}$: Heat flow between the thermal port and the node \[i,1\]

$qz_{i,nz + 1}$: Heat flow between the thermal port and the node \[i,nz\]

These last heat flows are computed as follows:

$${qz}_{i,1} = 2 \cdot k_{var\ i,j} \cdot \frac{V_{i,1}}{dz} \cdot \frac{\left( tpz\_ in.Tk_{i} - T_{i,1} \right)}{dz}$$

$${qz}_{i,nz + 1} = 2 \cdot k_{var\ i,nz} \cdot \frac{V_{i,nz}}{dz} \cdot \frac{\left( T_{i,nz} - tpz\_ out.Tk_{i} \right)}{dz}$$

**Radial boundary conditions**

In the radial direction, a certain thermal inertia (given by F) is assigned to the thermal inlet and outlet ports. This is done to prevent the appearance of algebraic loops when calculating the heat flows at the ports.

$${cp\_ tpr}_{1,j} \cdot F \cdot V_{1,j} \cdot \rho_{var}\frac{\partial tpr\_ in.Tk_{j}}{\partial t} = tpr\_ in.q_{j} - {qr}_{1,j}$$

$${cp\_ tpr}_{2,j} \cdot F \cdot V_{nr,j} \cdot \rho_{var}\frac{\partial tpr\_ out.Tk_{j}}{\partial t} = qr_{nr + 1,j} - tpr\_ out.q_{j}\ $$

where:

$F$ : Thermal capacity ratio assigned to the ports

$tpr\_ in.q_{j}$: Heat flow at the radial inlet thermal port

$tpr\_ out.q_{j}$: Heat flow at the radial outlet thermal port

$tpr\_ in.Tk_{j}$: Temperature at the radial inlet thermal port

$tpr\_ out.Tk_{j}$: Temperature at the radial outlet thermal port

${qr}_{1,j}$: Heat flow between the thermal port and the node \[1,j\]

$qr_{nr + 1,j}$: Heat flow between the thermal port and the node \[nr+1,j\]

These last heat flows are computed as follows:

$$qr_{1,j} = \frac{2 \cdot \pi \cdot dz \cdot k_{var\ 1,j}}{\log\left( 1 + \frac{dr}{D_{in}} \right)} \cdot \left( tpr\_ in.Tk_{j} - T_{1,j} \right)$$

$$qr_{nr + 1,j} = \frac{2 \cdot \pi \cdot dz \cdot k_{var\ nr,j}}{\log\left( \frac{D_{out}}{D_{out} - dr} \right)} \cdot \left( T_{nr,j} - tpr\_ out.Tk_{j} \right)$$

## 5.4 Component DNode

Inherited from component ADNode.

### 5.4.1 Description

This component type, named DNode, represents a thermal diffusive node with constant thermal capacity; i.e. the thermal capacity is given as a value.

### 5.4.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image49.png){width="0.6666666666666666in" height="0.6041666666666666in"}

### 5.4.3 Construction Parameters

  --------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- ------------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  --------------------------------------------------------------------------

### 5.4.4 Ports

  ---------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality    Description
  ------- ---------- ------------ ----------- -------------- ----------------------
  tp_in   thermal    (n = n)      IN          \[1, 10000\]   Thermal inlet port

  ---------------------------------------------------------------------------------

### 5.4.5 Data

  -------------------------------------------------------------------------------
  Name       Type      Default        Description                       Units
  ---------- --------- -------------- --------------------------------- ---------
  Label      STRING    "Node Label"   Node label                        *-*

  qi         REAL      0              Impressed heat                    *W*

  C          REAL      1.e-3          Heat capacity                     *J/K*

  To         REAL      290            Initial temperature               *K*

  Boundary   BOOLEAN   FALSE          Flag used to set boundary mode    *-*
  -------------------------------------------------------------------------------

### 5.4.6 Variables

  ------------------------------------------------------------------------
  Name            Type       Description                       Units
  --------------- ---------- --------------------------------- -----------
  q               REAL       Total heat into node              *W*

  Tmin            REAL       Minimum temperature reached       *K*

  Tmax            REAL       Maximum temperature reached       *K*

  T               REAL       Temperature                       *K*

  VC              REAL       Variable heat capacity            *J/K*
  ------------------------------------------------------------------------

### 5.4.7 Formulation

The following mathematical expressions apply to this component type:

**Initialisation of the Temperature:**

$$T = T_{0}$$

If the node is considered as a boundary node with constant temperature (Boundary is TRUE) then the rate of change of the node temperature is zero. If the node is considered as a diffusive node the rate of change of the node temperature is calculated from:

$$\frac{\partial T}{\partial t} = \frac{q}{VC}$$

where:

$q$: Total heat flow into the node

$VC$: Thermal capacitance of the node; i.e. it is a datum:

$$VC = C$$

The temperature of the thermal inlet port is equal to the diffusive node temperature:

$$T_{in} = T$$

**Inherited from Abstract Component Node**

It is possible to print on the screen the label and the temperature of the nodes at a specific point in time when one switches the global variable PRINT_TEMP to TRUE.

After each integration interval the maximum and minimum temperatures in the node are calculated by the thermal functions Bmax(xmax, x) and Bmin(xmin, x). In this case:

$$\begin{matrix}
Bmax(Tmax,\ T) \\
Bmin(Tmin,\ T)
\end{matrix}$$

These functions Bmax(xmax, x) and Bmin(xmin, x) calculate the maximum and the minimum values between the two function arguments and are stored in the variables xmax and xmin respectively.

The total heat into the node is equal to the sum of the impressed heat plus the overall heat flow coming through the inlet thermal port:

$$q_{tot} = q_{impress} + q_{in}$$

where:

$q_{impress}$: Impressed heat

$q_{in}$: Total heat flow coming into the node through the vectorised thermal inlet port, therefore qin is the sum of all "n" contributions

$$q_{in} = \sum_{i \in 1,n}^{}q_{in,i}$$

$q_{tot}$: Total heat flow into the node

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image50.png){width="2.309945319335083in" height="1.2707830271216098in"}

## 5.5 Component DNodeMat

Inherited from Component ADNode.

### 5.5.1 Description

This component type, named DNodeMat, represents a thermal diffusive node containing a mass of a specified material.

### 5.5.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image51.png){width="1.364346019247594in" height="0.9484339457567804in"}

### 5.5.3 Construction Parameters

  --------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- ------------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  --------------------------------------------------------------------------

### 5.5.4 Ports

  ---------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality    Description
  ------- ---------- ------------ ----------- -------------- ----------------------
  tp_in   thermal    (n = n)      IN          \[1, 10000\]   Thermal inlet port

  ---------------------------------------------------------------------------------

### 5.5.5 Data

  ----------------------------------------------------------------------------------------
  Name       Type            Default        Description                         Units
  ---------- --------------- -------------- ----------------------------------- ----------
  Label      STRING          "Node Label"   Node label                          *-*

  cp         REAL            500            Specific heat if material is None   *J/kg K*

  mass       REAL            1              Mass of the thermal node            *kg*

  mat        ENUM Material   None           Material                            *-*

  qi         REAL            0              Impressed heat                      *W*

  To         REAL            290            Initial temperature                 *K*

  Boundary   BOOLEAN         FALSE          Flat used to set boundary node      *-*
  ----------------------------------------------------------------------------------------

Input data cp will be used only if "mat" = None. If not, the properties will be interpolated using the corresponding data file.

### 5.5.6 Variables

  ---------------------------------------------------------------------------
  Name     Type        Initial   Description                       Units
  -------- ----------- --------- --------------------------------- ----------
  q        REAL                  Total heat into node              *W*

  Tmin     REAL                  Minimum temperature reached       *K*

  Tmax     REAL                  Maximum temperature reached       *K*

  T        REAL                  Temperature                       *K*

  VC       REAL                  Variable heat capacity            *J/K*

  cp_var   REAL                  Specific heat of wall material    *J/kg K*

  ipt      REAL                  Pointer to last table position    *-*
  ---------------------------------------------------------------------------

### 5.5.7 Formulation

The following mathematical expressions apply to this component type:

**Initialisation of the Temperature:**

$$T = T_{0}$$

If the node is considered as a boundary node with constant temperature (Boundary is TRUE) then the rate of change of the node temperature is zero. If the node is considered as a diffusive node the rate of change of the node temperature is calculated from:

$$\frac{\partial T}{\partial t} = \frac{q}{VC}$$

where:

q: Total heat flow into the node

VC: Thermal capacitance of the node, and its value is given by:

$$VC = cp\_ var\  \cdot mass$$

$cp\_ var$: Specific heat that is calculated interpolating in a data file if a material is specified in the thermal node (mat ≠ None)

The temperature of the thermal inlet port is equal to the diffusive node temperature:

$$T_{in} = T$$

**Inherited from Abstract Component Node**

It is possible to print on the screen the label and the temperature of the nodes at a specific point in time when one switches the global variable PRINT_TEMP to TRUE.

After each integration interval the maximum and minimum temperatures in the node are calculated by the thermal functions Bmax(xmax, x) and Bmin(xmin, x). In this case:

$$\begin{matrix}
Bmax(Tmax,\ T) \\
Bmin(Tmin,\ T)
\end{matrix}$$

These functions Bmax(xmax, x) and Bmin(xmin, x) calculate the maximum and the minimum values between the two function arguments and are stored in the variables xmax and xmin respectively.

The total heat into the node is equal to the sum of the impressed heat plus the overall heat flow coming through the inlet thermal port:

$$q_{tot} = q_{impress} + q_{in}$$

where:

$q_{impress}$: Impressed heat

$q_{in}$: Total heat flow coming into the node through the vectorised thermal inlet port, therefore qin is the sum of all "n" contributions

$$q_{in} = \sum_{i \in 1,n}^{}q_{in,i}$$

$q_{tot}$: Total heat flow into the node

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image52.png){width="1.9956069553805775in" height="1.1735531496062992in"}

## 5.6 Component DNodeMat_vec

### 5.6.1 Description

This component type, named DNodeMat_vec, represents a vectorized thermal diffusive node calculating n temperatures without considering heat exchange between the nodes.

### 5.6.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image53.png){width="1.7207753718285215in" height="0.9372419072615923in"}

### 5.6.3 Construction Parameters

  --------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- ------------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  --------------------------------------------------------------------------

### 5.6.4 Ports

  ---------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality    Description
  ------- ---------- ------------ ----------- -------------- ----------------------
  tp_in   thermal    (n = n)      IN          \[1, 10000\]   Thermal inlet port

  ---------------------------------------------------------------------------------

### 5.6.5 Data

  -------------------------------------------------------------------------------------
  Name       Type            Default     Description                         Units
  ---------- --------------- ----------- ----------------------------------- ----------
  cp         REAL            500         Specific heat if material is None   *J/kg K*

  mass       REAL            1           Mass of the thermal node            *kg*

  mat        ENUM Material   None        Material                            *-*

  To         REAL            290         Initial temperature                 *K*

  Boundary   BOOLEAN         FALSE       Flat used to set boundary node      *-*
  -------------------------------------------------------------------------------------

Input data cp will be used only if "mat" = None. If not, the properties will be interpolated using the corresponding data file.

### 5.6.6 Variables

  --------------------------------------------------------------------------------
  Name          Type        Initial   Description                       Units
  ------------- ----------- --------- --------------------------------- ----------
  q\[n\]        REAL                  Heat into node                    *W*

  T\[n\]        REAL                  Node temperature                  *K*

  VC\[n\]       REAL                  Variable heat capacity            *J/K*

  cp_var\[n\]   REAL                  Specific heat of wall material    *J/kg K*

  ipt           REAL                  Pointer to last table position    *-*
  --------------------------------------------------------------------------------

### 5.6.7 Formulation

The following mathematical expressions apply to this component type:

**Initialisation of the Temperature:**

$$T\lbrack i\rbrack = T_{0}$$

If the nodes are considered as boundary nodes with constant temperature (Boundary is TRUE) then the rate of change of the node temperature is zero. If the nodes are considered as a diffusive node the rate of change of the node temperature is calculated from:

$$\frac{\partial T_{in}}{\partial t} = \frac{q_{i}}{VC_{i}}$$

where:

$q_{i}$: Heat flow into the node

$VC_{i}$: Thermal capacitance of the node, and its value is given by:

$$VC_{i} = cp\_ var_{i}\  \cdot mass$$

$cp\_ var_{i}$: Specific heat that is calculated interpolating in a data file if a material is specified in the thermal node (mat ≠ None)

The temperature of the thermal inlet port is equal to the diffusive node temperature.

The heat into the node is equal to the heat flow coming through the inlet thermal port. The component does not take into account conduction between the nodes.

## 5.7 Component DNodeRoom

Inherited from component ADNode.

### 5.7.1 Description

This component type, named DNodeRoom, is a thermal diffusive node which represents a room filled with a fluid.

### 5.7.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image54.png){width="1.03125in" height="0.59375in"}

### 5.7.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- -----------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  -------------------------------------------------------------------------

### 5.7.4 Ports

  ------------------------------------------------------------------------------------
  Name        Type        Parameters   Direction   Cardinality    Description
  ----------- ----------- ------------ ----------- -------------- --------------------
  tp_in       Thermal     (n = n)      IN          \[1, 10000\]   Thermal inlet port

  ------------------------------------------------------------------------------------

### 5.7.5 Data

  ----------------------------------------------------------------------------------------
  Name            Type            Default        Description                      Units
  --------------- --------------- -------------- -------------------------------- --------
  Label           STRING          "Node Label"   Node label                       *-*

  qi              REAL            0              Impressed heat                   *W*

  To              REAL            290            Initial temperature              *K*

  Boundary        BOOLEAN         FALSE          Flag used to set boundary mode   *-*

  V               REAL            100            Volume of the room node          *m3*

  P               REAL            101325         Fluid pressure in the room       *Pa*

  thermal_fluid   ENUM ThFluids   Air            Fluid in the room                *-*
  ----------------------------------------------------------------------------------------

### 5.7.6 Variables

  -------------------------------------------------------------------------------
  Name            Type       Description                              Units
  --------------- ---------- ---------------------------------------- -----------
  q               REAL       Total heat into node                     *W*

  Tmin            REAL       Minimum temperature reached              *K*

  Tmax            REAL       Maximum temperature reached              *K*

  T               REAL       Temperature                              *K*

  VC              REAL       Variable heat capacity                   *J/K*

  cp              REAL       Specific heat of the fluid in the room   *J/kg K*

  rho             REAL       Density of the fluid in the room         *kg/m3*

  ier             INTEGER    Function error identifier                *-*
  -------------------------------------------------------------------------------

### 5.7.7 Formulation

The following mathematical expressions apply to this component type:

**Initialisation of the Temperature:**

$$T = T_{0}$$

If the node is considered as a boundary node with constant temperature (Boundary is TRUE) then the rate of change of the node temperature is zero. If the node is considered as a diffusive node the rate of change of the node temperature is calculated from:

$$\frac{\partial T}{\partial t} = \frac{q}{VC}$$

where:

$q$: Total heat flow into the node

$VC$: Thermal capacitance of the node is calculated from the fluid properties and the volume of the node (V):

$$VC = V \cdot \rho \cdot cp$$

$\rho$: Density of the fluid calculated from the thermodynamic-physical property functions defined in the THERMAL library

$cp$: Specific heat of the fluid calculated from the thermodynamic-physical property functions defined in the THERMAL library

The temperature of the thermal inlet port is equal to the diffusive node temperature:

$$T_{in} = T$$

**Inherited from Abstract Component Node**

It is possible to print on the screen the label and the temperature of the nodes at a specific point in time when one switches the global variable PRINT_TEMP to TRUE.

After each integration interval the maximum and minimum temperatures in the node are calculated by the thermal functions Bmax(xmax, x) and Bmin(xmin, x). In this case:

$$\begin{matrix}
Bmax(Tmax,\ T) \\
Bmin(Tmin,\ T)
\end{matrix}$$

These functions Bmax(xmax, x) and Bmin(xmin, x) calculate the maximum and the minimum values between the two function arguments and are stored in the variables xmax and xmin respectively.

The total heat into the node is equal to the sum of the impressed heat plus the overall heat flow coming through the inlet thermal port:

$$q_{tot} = q_{impress} + q_{in}$$

where:

$q_{impress}$: Impressed heat

$q_{in}$: Total heat flow coming into the node through the vectorised thermal inlet port, therefore qin is the sum of all "n" contributions

$$q_{in} = \sum_{i \in 1,n}^{}q_{in,i}$$

$q_{tot}$: Total heat flow into the node

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image52.png){width="1.9956069553805775in" height="1.1735531496062992in"}

## 5.8 Component DNode_vec

### 5.8.1 Description

This component type, named DNode_vec, represents a vectorized thermal diffusive node with constant thermal capacity calculating n temperatures without considering heat exchange between the nodes

### 5.8.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image55.png){width="1.2827744969378827in" height="0.8404385389326334in"}

### 5.8.3 Construction Parameters

  --------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- ------------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  --------------------------------------------------------------------------

### 5.8.4 Ports

  ---------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality    Description
  ------- ---------- ------------ ----------- -------------- ----------------------
  tp_in   thermal    (n = n)      IN          \[1, 10000\]   Thermal inlet port

  ---------------------------------------------------------------------------------

### 5.8.5 Data

  -----------------------------------------------------------------------------
  Name     Type      Default        Description                       Units
  -------- --------- -------------- --------------------------------- ---------
  Label    STRING    "Node Label"   Node label                        *-*

  qi       REAL      0              Impressed heat                    *W*

  C        REAL      1.e-3          Heat capacity                     *J/K*

  To       REAL      290            Initial temperature               *K*
  -----------------------------------------------------------------------------

### 5.8.6 Variables

  --------------------------------------------------------------------------
  Name     Type        Initial   Description                       Units
  -------- ----------- --------- --------------------------------- ---------
  Tmin     REAL                  Minimum temperature reached       K

  Tmax     REAL                  Maximum temperature reached       K

  q        REAL                  Heat into node                    *W*

  T\[n\]   REAL                  Node temperature                  *K*
  --------------------------------------------------------------------------

### 5.8.7 Formulation

The following mathematical expressions apply to this component type:

**Initialisation of the Temperature:**

$$T\lbrack i\rbrack = T_{0}$$

The rate of change of the node temperature is calculated from:

$$\frac{\partial T_{i}}{\partial t} = \frac{q_{i}}{(C/n)}$$

where:

$q_{i}$: Heat flow into the node

$C/n$: Thermal capacitance of the node

The temperature of the thermal inlet port is equal to the diffusive node temperature.

The heat into the node is equal to the heat flow coming through the inlet thermal port. The component does not take into account conduction between the nodes.

## 5.9 Component DNodenTom

### 5.9.1 Description

This component type, named DNodenTom, is used to convert a connection with size n to size m assuming same temperature and sum of heat fluxes.

### 5.9.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image56.png){width="1.2389490376202974in" height="0.8789523184601925in"}

### 5.9.3 Construction Parameters

  --------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- ------------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  m          CONST INTEGER          1         Outlet port dimension
  --------------------------------------------------------------------------

### 5.9.4 Ports

  ----------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality    Description
  -------- ---------- ------------ ----------- -------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[1, 10000\]   Thermal inlet port

  tp_out   thermal    (n = m)      OUT         \[1, 10000\]   Thermal outlet port
  ----------------------------------------------------------------------------------

### 5.9.5 Data

  -------------------------------------------------------------------------------
  Name       Type      Default        Description                       Units
  ---------- --------- -------------- --------------------------------- ---------
  Label      STRING    "Node Label"   Node label                        *-*

  qi         REAL      0              Impressed heat                    *W*

  C          REAL      1.e-3          Heat capacity                     *J/K*

  Boundary   BOOLEAN   FALSE          Flag used to set boundary mode    *-*

  To         REAL      290            Initial temperature               *K*
  -------------------------------------------------------------------------------

### 5.9.6 Variables

  -------------------------------------------------------------------------
  Name    Type        Initial   Description                       Units
  ------- ----------- --------- --------------------------------- ---------
  Tmin    REAL                  Minimum temperature reached       K

  Tmax    REAL                  Maximum temperature reached       K

  q       REAL                  Heat into node                    *W*

  T       REAL                  Temperature                       *K*

  VC      REAL                  Variable heat capacity            *J/K*
  -------------------------------------------------------------------------

### 5.9.7 Formulation

The following mathematical expressions apply to this component type:

**Initialisation of the Temperature:**

$$T = T_{0}$$

If the node is considered as a boundary node with constant temperature (Boundary is TRUE) then the rate of change of the node temperature is zero. If the node is considered as a diffusive node the rate of change of the node temperature is calculated from:

$$\frac{\partial T}{\partial t} = \frac{q}{VC}$$

where:

$q$: Total heat flow into the node

$VC$: Thermal capacitance of the node; i.e. it is a datum:

$$VC = C$$

The temperature of the thermal inlet port is equal to the diffusive node temperature:

$$T_{in} = T$$

The total heat into the node is equal to the sum of the impressed heat plus the overall heat flow coming through the inlet thermal port:

$$q_{tot} = q_{impress} + q_{in}$$

where:

$q_{impress}$: Impressed heat

$q_{in}$: Total heat flow coming into the node through the vectorised thermal inlet and outlet ports, therefore qin is the sum of all "n" and \"m\" contributions

$$q_{in} = \sum_{i \in 1,n}^{}{q_{in,i} + \sum_{j \in 1,n}^{}q_{in,j}}$$

$q_{tot}$: Total heat flow into the node

**Inherited from Abstract Component Node**

It is possible to print on the screen the label and the temperature of the nodes at a specific point in time when one switches the global variable PRINT_TEMP to TRUE.

After each integration interval the maximum and minimum temperatures in the node are calculated by the thermal functions Bmax(xmax, x) and Bmin(xmin, x). In this case:

$$\begin{matrix}
Bmax(Tmax,\ T) \\
Bmin(Tmin,\ T)
\end{matrix}$$

These functions Bmax(xmax, x) and Bmin(xmin, x) calculate the maximum and the minimum values between the two function arguments and are stored in the variables xmax and xmin respectively.

## 5.10 DNphases

Inherited from component Node.

### 5.10.1 Description

This component type, named DNphases, represents a diffusive thermal node that takes into account possible phase changes of the material.

### 5.10.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image57.png){width="0.8958333333333334in" height="0.6041666666666666in"}

### 5.10.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- -----------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  -------------------------------------------------------------------------

### 5.10.4 Ports

  ---------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality    Description
  ------- ---------- ------------ ----------- -------------- ----------------------
  tp_in   Thermal    (n = n)      IN          \[1, 10000\]   Thermal inlet port

  ---------------------------------------------------------------------------------

### 5.10.5 Data

  ----------------------------------------------------------------------------------
  Name        Type        Default        Description                      Units
  ----------- ----------- -------------- -------------------------------- ----------
  Label       STRING      "Node Label"   Node label                       *-*

  qi          REAL        0              Impressed heat                   *W*

  Mass        REAL        1              Mass of water                    *Kg*

  To          REAL        290            Initial temperature of water     *K*

  CP_l        REAL        4186           Specific heat of liquid          *J/kg K*

  CP_s        REAL        2039           Specific heat of solid           *J/kg K*

  CP_v        REAL        1805           Specific heat of vapour          *J/kg K*

  Hfus        REAL        334000         Enthalpy of fusion               *J/kg*

  Hvap        REAL        2501000        Enthalpy of vaporisation         *J/kg*

  T_fusion    REAL        273.15         Fusion or melting temperature    *K*

  T_boiling   REAL        373.15         Boiling temperature              *K*
  ----------------------------------------------------------------------------------

### 5.10.6 Variables

  ---------------------------------------------------------------------------------------------
  Name      Type       Description                                                    Units
  --------- ---------- -------------------------------------------------------------- ---------
  q         REAL       Total heat into node                                           *W*

  Tmin      REAL       Minimum temperature reached                                    *K*

  Tmax      REAL       Maximum temperature reached                                    *K*

  u         REAL       Internal Energy                                                *J/kg*

  Uv        REAL       Internal energy corresponding to saturated vapour              *J/kg*

  Ul        REAL       Internal energy corresponding to saturated liquid              *J/kg*

  Us        REAL       Internal energy corresponding to solid at fusion temperature   *J/kg*

  T         REAL       Temperature                                                    *K*
  ---------------------------------------------------------------------------------------------

### 5.10.7 Formulation

It is assumed that the node material has two phase changes: solid-liquid and liquid-vapour, and that the reference state for zero internal energy is the saturated liquid (see next figure).

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image58.png){width="4.137389545056868in" height="2.4411996937882763in"}

The derivative of the specific internal energy (u) is equal to the total heat (q) divided by the mass (M):

$$\frac{\partial u}{\partial t} = \frac{q}{M}$$

From the specific internal energy, the temperature can be calculated using the relationship expressed by the above figure:

$$T = f(u)$$

**Inherited from Abstract Component Node**

It is possible to print on the screen the label and the temperature of the nodes at a specific point in time when one switches the global variable PRINT_TEMP to TRUE.

After each integration interval the maximum and minimum temperatures in the node are calculated by the thermal functions Bmax(xmax, x) and Bmin(xmin, x). In this case:

$$\begin{matrix}
Bmax(Tmax,\ T) \\
Bmin(Tmin,\ T)
\end{matrix}$$

These functions Bmax(xmax, x) and Bmin(xmin, x) calculate the maximum and the minimum values between the two function arguments and are stored in the variables xmax and xmin respectively.

The total heat into the node is equal to the sum of the impressed heat plus the overall heat flow coming through the inlet thermal port:

$$q_{tot} = q_{impress} + q_{in}$$

where:

$q_{impress}$: Impressed heat

$q_{in}$: Total heat flow coming into the node through the vectorised thermal inlet port, therefore qin is the sum of all "n" contributions

$$q_{in} = \sum_{i \in 1,n}^{}q_{in,i}$$

$q_{tot}$: Total heat flow into the node

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image59.png){width="2.0612642169728783in" height="1.184633639545057in"}

## 5.11 Component FreeConvec_Horizontal_Cylinder

### 5.11.1 Description

This component, named FreeConvec_Horizontal_Cylinder, represents a coupling to calculate natural convection from a surface of a horizontal cylinder to an undisturbed fluid.

### 5.11.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image60.png){width="2.21875in" height="0.9895833333333334in"}

### 5.11.3 Construction Parameters

  ------------------------------------------------------------------------------
  Name            Type                   Default   Description
  --------------- ---------------------- --------- -----------------------------
  n               CONST INTEGER          1         Dimension of thermal port

  thermal_fluid   ENUM ThFluids          Air       Interface fluid
  ------------------------------------------------------------------------------

### 5.11.4 Ports

  --------------------------------------------------------------------------------
  Name         Type       Parameters   Direction   Description
  ------------ ---------- ------------ ----------- -------------------------------
  tp_surface   thermal    (n = n)      IN          Surface port

  tp_fluid     thermal    (n = n)      OUT         Fluid port
  --------------------------------------------------------------------------------

### 5.11.5 Data

  -------------------------------------------------------------------------
  Name    Type       Default   Description                       Units
  ------- ---------- --------- --------------------------------- ----------
  d       REAL       1         Diameter of the cylinder          *m*

  L       REAL       0.1       Length of the cylinder            *m*

  P       REAL       101325    Ambient pressure                  *Pa*

  Grav    REAL       9.80665   Gravity                           *m/s2*
  -------------------------------------------------------------------------

### 5.11.6 Variables

  -----------------------------------------------------------------------------------
  Name       Type       Default   Description                              Units
  ---------- ---------- --------- ---------------------------------------- ----------
  q\[n\]     REAL                 Heat flow                                *W*

  DT\[n\]    REAL       \-        Temperature difference                   *K*

  Cp\[n\]    REAL                 Specific heat                            *J/kg K*

  vis\[n\]   REAL                 Viscosity                                *Pa s*

  rho\[n\]   REAL                 Density                                  *kg/m3*

  Tm\[n\]    REAL                 Average temperature                      *K*

  B\[n\]     REAL                 Beta factor                              *1/K*

  Gr\[n\]    REAL                 Grashof number                           *-*

  Pr\[n\]    REAL                 Prandtl number                           *-*

  Ra\[n\]    REAL                 Rayleigh number                          *-*

  K\[n\]     REAL                 Thermal conductivity                     *W/m K*

  h\[n\]     REAL                 Convective heat transfer coefficient     *W/m2 K*

  Nu\[n\]    REAL                 Nusselt number                           *-*

  A          REAL                 Surface                                  *m2*

  ier        INTEGER    0         Error code from fluid data calculation   *-*
  -----------------------------------------------------------------------------------

### 5.11.7 Formulation

The heat flow exchanged between the cylinder surface and the fluid is calculated as follows:

$$q_{i} = \left( \frac{A}{n} \right) \cdot h_{i} \cdot \left( T_{i,surface} - T_{i,fluid} \right)$$

where:

$h_{i}$: Heat transfer coefficient

$T_{i,surface}$: Temperature of the cylinder surface

$T_{i,fluid}$: Temperature of the fluid

$T_{i,fluid}$: Heat transfer surface:

$$A = \pi \cdot d \cdot L$$

$d$: Diameter of the cylinder

$L$: Length of the cylinder

The heat transfer coefficient is computed from the Nusselt number calculated from the THERMAL library function called NusseltCylinder.

Nu\[i\] = NusseltCylinder(Pr\[i\],Ra\[i\])

where:

Nu: Nusselt number

Pr: Prandtl number

Ra: Rayleigh number

For a description of this function, see reference [5.5.](#function-nusseltcylinder)

## 5.12 Component FreeConvec_Plate

### 5.12.1 Description

This component, named FreeConvec_Plate, represents a coupling to calculate natural convection from a surface of a plate to an undisturbed fluid.

### 5.12.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image61.png){width="1.3645833333333333in" height="0.84375in"}

### 5.12.3 Construction Parameters

  -------------------------------------------------------------------------------------------------
  Name            Type                   Default   Description
  --------------- ---------------------- --------- ------------------------------------------------
  n               CONST INTEGER          1         Dimension of thermal port

  position        ENUM WallType          wall      Position of the plate with regard to the fluid

  thermal_fluid   ENUM ThFluids          Air       Interface fluid
  -------------------------------------------------------------------------------------------------

### 5.12.4 Ports

  --------------------------------------------------------------------------------
  Name         Type       Parameters   Direction   Description
  ------------ ---------- ------------ ----------- -------------------------------
  tp_surface   thermal    (n = n)      IN          Surface port

  tp_fluid     thermal    (n = n)      OUT         Fluid port
  --------------------------------------------------------------------------------

### 5.12.5 Data

  -------------------------------------------------------------------------------------------------------------
  Name    Type       Default   Description                                                           Units
  ------- ---------- --------- --------------------------------------------------------------------- ----------
  A       REAL       1         Convective heat exchange are                                          *m2*

  Lc      REAL       0.1       Height for vertical plate OR perimeter for floor and ceiling option   *m*

  P       REAL       101325    Ambient pressure                                                      *Pa*

  Grav    REAL       9.80665   Gravity                                                               *m/s2*
  -------------------------------------------------------------------------------------------------------------

### 5.12.6 Variables

  -----------------------------------------------------------------------------------
  Name       Type       Default   Description                              Units
  ---------- ---------- --------- ---------------------------------------- ----------
  q\[n\]     REAL                 Heat flow                                *W*

  DT\[n\]    REAL       \-        Temperature difference                   *K*

  Cp\[n\]    REAL                 Specific heat                            *J/kg K*

  vis\[n\]   REAL                 Viscosity                                *Pa s*

  rho\[n\]   REAL                 Density                                  *kg/m3*

  Tm\[n\]    REAL                 Average temperature                      *K*

  B\[n\]     REAL                 Beta factor                              *1/K*

  Gr\[n\]    REAL                 Grashof number                           *-*

  Pr\[n\]    REAL                 Prandtl number                           *-*

  Ra\[n\]    REAL                 Rayleigh number                          *-*

  K\[n\]     REAL                 Thermal conductivity                     *W/m K*

  h\[n\]     REAL                 Convective heat transfer coefficient     *W/m2 K*

  Nu\[n\]    REAL                 Nusselt number                           *-*

  L\[n\]     REAL                 Characteristic length                    *m*

  A          REAL                 Surface                                  *m2*

  ier        INTEGER    0         Error code from fluid data calculation   *-*
  -----------------------------------------------------------------------------------

### 5.12.7 Formulation

The heat flow exchanged between the plate surface and the fluid is calculated as follows:

$$q_{i} = \left( \frac{A}{n} \right) \cdot h_{i} \cdot \left( T_{i,surface} - T_{i,fluid} \right)$$

where:

$h_{i}$: Heat transfer coefficient

$T_{i,surface}$: Temperature of the cylinder surface

$T_{i,fluid}$: Temperature of the fluid

$A$: Convective heat exchange area

The heat transfer coefficient is computed from the Nusselt number calculated from the THERMAL library functions depending on the position of the plate with regard to the fluid:

EXPAND(position==wall) Nu\[i\]=NusseltWall(Pr\[i\],Ra\[i\])

EXPAND(position==floor) Nu\[i\] = NusseltFloor(Ra\[i\],tp_surface.Tk\[i\],tp_fluid.Tk\[i\])

EXPAND(position==ceil) Nu\[i\] = NusseltCeiling(Ra\[i\],tp_surface.Tk\[i\],tp_fluid.Tk\[i\])

where:

Nu: Nusselt number

NusseltWall: Function to calculate the natural convection correlation for a vertical plate

NusseltFloor: Function to calculate the natural convection correlation for a upward facing plate

NusseltCeiling: Function to calculate the natural convection correlation for a downward facing plate

Pr: Prandtl number

Ra: Rayleigh number

tp_surface.Tk: Temperature of the plate surface

tp_fluid.Tk: Temperature of the undisturbed fluid

For a description of the aforementioned functions, see references [5.4.](#function-nusseltceiling) , [5.6.](#function-nusseltfloor) and [5.7.](#function-nusseltwall)

## 5.13 Component FreeConvec_UserDefined

### 5.13.1 Description

This component, named FreeConvec_UserDefined, represents a coupling to calculate natural convection between two surfaces with a fluid between them. The user specifies the free convection heat transfer coefficient as a function of the temperature difference between the two surfaces.

### 5.13.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image62.png){width="1.78125in" height="1.0104166666666667in"}

### 5.13.3 Construction Parameters

  ------------------------------------------------------------------------------
  Name     Type            Default   Description                    Units
  -------- --------------- --------- ------------------------------ ------------
  n        CONST INTEGER   1         Dimension of thermal port      *-*

  ------------------------------------------------------------------------------

### 5.13.4 Ports

  ---------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  ---------------------------------------------------------------------------------

### 5.13.5 Data

  -----------------------------------------------------------------------------------------------------
  Name      Type       Default   Description                                           Units
  --------- ---------- --------- ----------------------------------------------------- ----------------
  A         REAL       1         Area to thermal path ratio                            *m2*

  h_table   TABLE_1D             Heat transfer coefficient vs Temperature difference   *W/m2 K vs. K*
  -----------------------------------------------------------------------------------------------------

### 5.13.6 Variables

  ------------------------------------------------------------------------------------
  Name         Type         Description                                   Units
  ------------ ------------ --------------------------------------------- ------------
  q\[n\]       REAL         Heat flow                                     *W*

  Vcond\[n\]   REAL         Variable thermal conductance per array item   *W/K*
  ------------------------------------------------------------------------------------

### 5.13.7 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 5.13.8 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

The heat flow by free convection is calculated as follows:

$$q_{i} = Vcond_{i}\left( T_{in,i} - T_{out,i} \right)$$

where:

$Vcond_{i}$: Thermal conductance at each array item that is calculated interpolating in the data table given by the user:

$$Vcond_{i} = \left( \frac{A}{n} \right) \cdot linearInterp1D(h\_ table,\ abs(tp\_ in.Tk\lbrack i\rbrack - tp\_ out.Tk\lbrack i\rbrack))$$

$A$: Area to thermal path ratio

$tp\_ in.Tk$: Temperature of the hot surface

$tp\_ out.Tk$: Temperature of the cold surface

**Inherited from Abstract Component Conductor**

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image63.png){width="2.931096894138233in" height="0.8439730971128608in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 5.14 Component FreeConvec_Wire

### 5.14.1 Description

This component, named FreeConvec_Wire, represents a coupling to calculate natural convection from a surface of a wire to an undisturbed fluid.

### 5.14.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image64.png){width="1.3333333333333333in" height="0.84375in"}

### 5.14.3 Construction Parameters

  ---------------------------------------------------------------------------------
  Name            Type                   Default      Description
  --------------- ---------------------- ------------ -----------------------------
  n               CONST INTEGER          1            Dimension of thermal port

  position        ENUM WIRE_POSITION     Horizontal   Wire Position

  thermal_fluid   ENUM ThFluids          Air          Interface fluid
  ---------------------------------------------------------------------------------

### 5.14.4 Ports

  --------------------------------------------------------------------------------
  Name         Type       Parameters   Direction   Description
  ------------ ---------- ------------ ----------- -------------------------------
  tp_surface   thermal    (n = n)      IN          Surface port

  tp_fluid     thermal    (n = n)      OUT         Fluid port
  --------------------------------------------------------------------------------

### 5.14.5 Data

  -------------------------------------------------------------------------
  Name    Type       Default   Description                       Units
  ------- ---------- --------- --------------------------------- ----------
  d       REAL       0.1       Diameter of the wire              *m*

  L       REAL       1         Length of the wire                *m*

  P       REAL       101325    Ambient pressure                  *Pa*

  Grav    REAL       9.80665   Gravity                           *m/s*^2^
  -------------------------------------------------------------------------

### 5.14.6 Variables

  ---------------------------------------------------------------------------------------
  Name       Type       Default   Description                              Units
  ---------- ---------- --------- ---------------------------------------- --------------
  q\[n\]     REAL                 Heat flow                                *W*

  DT\[n\]    REAL       \-        Temperature difference                   *K*

  Cp\[n\]    REAL                 Specific heat                            *J/kg K*

  vis\[n\]   REAL                 Viscosity                                *Pa s*

  rho\[n\]   REAL                 Density                                  *kg/m*^3^

  Tm\[n\]    REAL                 Average temperature                      *K*

  B\[n\]     REAL                 Beta factor                              *1/K*

  Gr\[n\]    REAL                 Grashof number                           *-*

  Pr\[n\]    REAL                 Prandtl number                           *-*

  Ra\[n\]    REAL                 Rayleigh number                          *-*

  K\[n\]     REAL                 Thermal conductivity                     *W/m K*

  h\[n\]     REAL                 Convective heat transfer coefficient     *W/m*^2^ *K*

  Nu\[n\]    REAL                 Nusselt number                           *-*

  A          REAL                 Surface                                  *m*~2~

  ier        INTEGER    0         Error code from fluid data calculation   *-*
  ---------------------------------------------------------------------------------------

### 5.14.7 Formulation

The heat flow exchanged between the plate surface and the fluid is calculated as follows:

$$q_{i} = \left( \frac{A}{n} \right) \cdot h_{i} \cdot \left( T_{i,surface} - T_{i,fluid} \right)$$

where:

$h_{i}$: Heat transfer coefficient

$T_{i,surface}$: Temperature of the cylinder surface

$T_{i,fluid}$: Temperature of the fluid

$A$: Heat transfer surface of the wire calculated as follows:

$$A = \pi \cdot d \cdot L$$

$d$: Wire diameter

$L$: Wire length

The heat transfer coefficient is computed from the Nusselt number calculated from the THERMAL library functions depending on the position of the wire:

EXPAND (position == Horizontal) Nu\[i\] = NusseltWireHorizontal(Pr\[i\],Ra\[i\],d)

EXPAND (position == Vertical) Nu\[i\] = NusseltWireVertical(Pr\[i\],Ra\[i\],d,L)

where:

Nu: Nusselt number

NusseltWireHorizontal: Function to calculate the natural convection correlation for a vertical wire

NusseltWireVertical: Function to calculate the natural convection correlation for a horizontal wire

Pr: Prandtl number

Ra: Rayleigh number

For a description of these functions, see reference [5.8.](#function-nusseltwirehorizontal) , [5.9.](#function-nusseltwirevertical)

## 5.15 Component FreeConvec_simple

### 5.15.1 Description

This component, named FreeConvec_simple, represents a coupling to calculate natural convection from a surface to a simplified fluid. The temperature of the fluid is given as an input control signal s_fluid_tem.

### 5.15.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image65.png){width="1.4583333333333333in" height="1.0104166666666667in"}

### 5.15.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- -----------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  -------------------------------------------------------------------------

### 5.15.4 Ports

  --------------------------------------------------------------------------------------------------
  Name          Type                Parameters   Direction   Description
  ------------- ------------------- ------------ ----------- ---------------------------------------
  s_fluid_tem   analog_signal       (n = 1)      IN          Signal port for the fluid temperature

  tp_in         thermal             (n = n)      IN          Thermal outlet port
  --------------------------------------------------------------------------------------------------

### 5.15.5 Data

  ----------------------------------------------------------------------------------------------------------------
  Name    Type       Default   Description                                                 Units
  ------- ---------- --------- ----------------------------------------------------------- -----------------------
  A       REAL       1         Convective heat exchange area                               *m2*

  Lc      REAL       0.1       Characteristic length                                       *m*

  b_l     REAL       1.32      Coefficient b in hc = b\*(DT/Lc)\^0.25 for laminar regime   *W/m*^1.75^ *K*^1.25^

  b_t     REAL       1.24      Coefficient b in hc = b\*DT\^0.3333 for turbulent regime    *W/m*^2^ *K*^1.333^
  ----------------------------------------------------------------------------------------------------------------

### 5.15.6 Variables

  -------------------------------------------------------------------------------------------------
  Name        Type         Default       Description                                 Units
  ----------- ------------ ------------- ------------------------------------------- --------------
  DT\[n\]     REAL         \-            Temperature difference                      *K*

  T_fluid     REAL         293.15        Fluid temperature                           *K*

  hc\[n\]     REAL         \-            Heat transfer coefficient                   *W/m*^2^*/K*

  hc_l\[n\]   REAL         \-            Laminar heat transfer coefficient           *W/m*^2^*/K*

  hc_t\[n\]   REAL         \-            Turbulent heat transfer coefficient         *W/m*^2^*/K*

  n_exp       CONST REAL   20            Exponent for laminar turbulent transition   *-*
  -------------------------------------------------------------------------------------------------

### 5.15.7 Formulation

The temperature difference DT is considered as the absolute value of the difference between the input port temperature and the fluid temperature,

$$DT_{i} = abs(tp\_ in.Tk_{i} - T_{fluid})$$

Then the heat transfer coefficient for laminar flow is given by:

$$hc\_ l_{i} = b\_ l \cdot \left( \frac{DT_{i}}{L_{c}} \right)^{\frac{1}{4}}$$

And the heat transfer coefficient for turbulent flow is given by:

$$hc\_ t_{i} = b\_ t \cdot \left( DT_{i} \right)^{\frac{1}{3}}$$

So the overall heat transfer coefficient is:

$$hc_{i} = \left\{ {hc\_ l}_{i}^{n\ exp} + {hc\_ t}_{i}^{n\ exp} \right\}^{\frac{1}{n\ exp}}$$

The heat flow is then calculated as:

$$tp\_ in.q_{i} = hc_{i} \cdot \frac{A}{n} \cdot \left( tp\_ in.Tk_{i}\  - T_{fluid} \right)$$

## 5.16 Component GL

Inherited from component AGL.

### 5.16.1 Description

This component type, named GL, represents a linear thermal conductor with constant thermal conductance.

### 5.16.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image66.png){width="1.125in" height="0.6041666666666666in"}

### 5.16.3 Construction Parameters

  ------------------------------------------------------------------------
  Name    Type            Default        Description
  ------- --------------- -------------- ---------------------------------
  n       CONST INTEGER   1              Dimension of thermal port

  ------------------------------------------------------------------------

### 5.16.4 Ports

  ---------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  ---------------------------------------------------------------------------------

### 5.16.5 Data

  ---------------------------------------------------------------------------
  Name    Type           Default   Description                       Units
  ------- -------------- --------- --------------------------------- --------
  cond    REAL           0         Total thermal conductance         *W/K*

  ---------------------------------------------------------------------------

### 5.16.6 Variables

  ---------------------------------------------------------------------------
  Name         Type         Description                              Units
  ------------ ------------ ---------------------------------------- --------
  q\[n\]       REAL         Total heat                               *W*

  Vcond\[n\]   REAL         Variable thermal conductance             *W/K*
  ---------------------------------------------------------------------------

### 5.16.7 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 5.16.8 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

The total thermal conductance is distributed among the port connections

Since the thermal port is in vectorised form, connecting a GL component (with total thermal conductance cond) is equivalent to connecting n GL components in parallel, each having thermal conductance:

$$Vcond_{i} = \frac{cond}{n}$$

Heat Transport by Conduction for each node is calculated as follows:

$$q_{i} = \ Vcond_{i}\left( T_{in,i} - T_{out,i} \right)$$

where:

$Vcond_{i}$: Thermal conductance at each array element.

$T_{in,i}$: Temperature of the element i of the inlet thermal port

$T_{out,i}$: Temperature of the element i of the outlet thermal port

**Inherited from Abstract Component Conductor**

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image67.png){width="2.6507206911636048in" height="0.7972867454068241in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 5.17 Component GL_mat

Inherited from component AGL.

### 5.17.1 Description

This component type, named GL_mat, represents a linear thermal conductor of a given material.

### 5.17.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image68.png){width="1.7212139107611548in" height="0.8624037620297463in"}

### 5.17.3 Construction Parameters

  ------------------------------------------------------------------------
  Name    Type            Default        Description
  ------- --------------- -------------- ---------------------------------
  n       CONST INTEGER   1              Dimension of thermal port

  ------------------------------------------------------------------------

### 5.17.4 Ports

  ---------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  ---------------------------------------------------------------------------------

### 5.17.5 Data

  --------------------------------------------------------------------------------------
  Name    Type            Default   Description                                Units
  ------- --------------- --------- ------------------------------------------ ---------
  mat     ENUM Material   None      Material                                   *W/K*

  F       REAL            0.1       Area to thermal path ratio                 *m*

  k       REAL            0.1       Thermal conductivity if material is None   *W/m K*
  --------------------------------------------------------------------------------------

### 5.17.6 Variables

  ---------------------------------------------------------------------------
  Name         Type         Description                             Units
  ------------ ------------ --------------------------------------- ---------
  q\[n\]       REAL         Total heat                              *W*

  Vcond\[n\]   REAL         Variable thermal conductance            *W/K*

  k_var\[n\]   REAL         Thermal conductivity                    *W/m K*

  ipt\[n\]     REAL         Pointer to last table position          *-*
  ---------------------------------------------------------------------------

### 5.17.7 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 5.17.8 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

Thermal Conductance is distributed among the port connections

Since the thermal port is in vectorised form, the thermal conductance of each element is computed as follows:

$$Vcond_{i} = \frac{F}{n} \cdot k\_ var_{i}$$

where:

$F$: Area to thermal path ratio

$k\_ var_{i}$: Variable thermal conductivity at mean conductor temperature calculated interpolating in the data files

Heat Transport by Conduction for each node is calculated as follows:

$$q_{i} = Vcond_{i}\left( T_{in,i} - T_{out,i} \right)$$

where:

$Vcond_{i}$: Thermal conductance at each array item.

$T_{in,i}$: Temperature of the element i of the inlet thermal port

$T_{out,i}$: Temperature of the element i of the outlet thermal port

**Inherited from Abstract Component Conductor**

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image67.png){width="2.6507206911636048in" height="0.7972867454068241in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 5.18 Component GL_vec

Inherited from component AGL.

### 5.18.1 Description

This component type, named GL_vec, represents a linear thermal conductor of a given with variable conductance along the nodes.

### 5.18.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image25.png){width="1.051952099737533in" height="0.5728455818022747in"}

### 5.18.3 Construction Parameters

  ------------------------------------------------------------------------
  Name    Type            Default        Description
  ------- --------------- -------------- ---------------------------------
  n       CONST INTEGER   1              Dimension of thermal port

  ------------------------------------------------------------------------

### 5.18.4 Ports

  ---------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  ---------------------------------------------------------------------------------

### 5.18.5 Data

  -------------------------------------------------------------------------------------
  Name        Type           Default   Description                             Units
  ----------- -------------- --------- --------------------------------------- --------
  cond\[n\]   REAL\[n\]      0         Variable thermal conductance per node   *W/K*

  -------------------------------------------------------------------------------------

### 5.18.6 Variables

  ---------------------------------------------------------------------------
  Name         Type         Description                             Units
  ------------ ------------ --------------------------------------- ---------
  q\[n\]       REAL         Total heat                              *W*

  Vcond\[n\]   REAL         Variable thermal conductance            *W/K*
  ---------------------------------------------------------------------------

### 5.18.7 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 5.18.8 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

Thermal Conductance is distributed among the port connections

Since the thermal port is in vectorised form, the thermal conductance of each element is directly an input of the model

Heat Transport by Conduction for each node is calculated as follows:

$$q_{i} = cond_{i}\left( T_{in,i} - T_{out,i} \right)$$

where:

$cond_{i}$: Thermal conductance at each array item.

$T_{in,i}$: Temperature of the element i of the inlet thermal port

$T_{out,i}$: Temperature of the element i of the outlet thermal port

**Inherited from Abstract Component Conductor**

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image67.png){width="2.6507206911636048in" height="0.7972867454068241in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 5.19 Component GR

Inherited from component AGR.

### 5.19.1 Description

This component type, named GR, represents a thermal radiative connection where REF is a constant value or datum.

### 5.19.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image69.png){width="1.125in" height="0.6041666666666666in"}

### 5.19.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- -----------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  -------------------------------------------------------------------------

### 5.19.4 Ports

  --------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ---------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  --------------------------------------------------------------------------------

### 5.19.5 Data

  ----------------------------------------------------------------------------
  Name    Type           Default   Description                       Units
  ------- -------------- --------- --------------------------------- ---------
  REF     REAL           0         Radiative Exchange Factor         m2

  ----------------------------------------------------------------------------

### 5.19.6 Variables

  --------------------------------------------------------------------------
  Name        Type         Description                             Units
  ----------- ------------ --------------------------------------- ---------
  q\[n\]      REAL         Heat flow                               *W*

  VREF\[n\]   REAL         Variable radiative exchange factor      *m2*
  --------------------------------------------------------------------------

### 5.19.7 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 5.19.8 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

The Radiative Exchange Factor is distributed along the port connections:

$$VREF_{i} = \frac{REF}{n}$$

**Heat Conduction by Radiation**

$$q_{i} = \sigma \cdot VREF_{i} \cdot \left( T_{in,i}^{4} - T_{out,i}^{4} \right)$$

where:

$\sigma$: Stefan Boltzmann constant = 5.67.10-8 W/m^2^\*K^4^

$VREF_{i}$: Radiative exchange factor that is equal to a datum (VREF = REF)

$T_{in,i}^{}$: Temperature of the element i of the inlet thermal port

$T_{out,i}^{}$: Temperature of the element i of the outlet thermal port

**Conservation of Energy (Inherited from Abstract Component Conductor)**

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image67.png){width="2.6507206911636048in" height="0.7972867454068241in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 5.20 Component HeatFlowMultiplier

### 5.20.1 Description

This component, named HeatFlowMultiplier, produces an outlet heat flow, which is equal to the inlet heat flow times a factor k, provided as a datum.

This component is useful when modelling a system with repeated components, such as that shown below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image70.png){width="3.007846675415573in" height="1.2690201224846893in"}

Here, a number of identical "a" components are receiving a heat flow from 1 and are ejecting heat towards 2. Rather than including all identical "a" components in the model, it is much simpler to substitute the redundant components by an equivalent arrangement using HeatFlowMultiplier components.

In the equivalent arrangement, only one component of type "a" is required, the rest of the identical components being represented by placing HeatFlowMultiplier components at either side of "a". The presence of multiple "a" components is modelled by adjusting the values of k:

At the inlet of "a",

$$k = \frac{1}{n}$$

At the outlet of "a",

$$k = n$$

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image71.png){width="3.7403958880139982in" height="0.6930435258092739in"}

**Connecting HeatFlowMultiplier components**

Special care must be taken when connecting this type of component to others, since its ports are neither capacitive nor resistive. However, in order to comply with the general rule for connecting elements in the thermal library (the arrangement C-R-C-R-etc.), this component must be inserted in between a capacitive and a resistive port, in any order.

### 5.20.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image72.png){width="1.375in" height="0.7708333333333334in"}

### 5.20.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                  Default   Description
  ---------- --------------------- --------- ------------------------------
  n          CONST INTEGER         1         Dimension of thermal port

  -------------------------------------------------------------------------

### 5.20.4 Ports

  --------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ---------------------
  tp_in    thermal    (n = n)      IN                        Thermal inlet port

  tp_out   thermal    (n = n)      OUT                       Thermal outlet port
  --------------------------------------------------------------------------------

### 5.20.5 Data

  --------------------------------------------------------------------------------------------
  Name    Type    Default   Description                                              Units
  ------- ------- --------- -------------------------------------------------------- ---------
  K       REAL    1         Heat flow multiplying factor: outlet heat / inlet heat   \-

  --------------------------------------------------------------------------------------------

### 5.20.6 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 5.20.7 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

The heat flow at the outlet is equal to the heat flow at the inlet times a factor k:

$$q_{outlet} = {k \cdot q}_{inlet}$$

The temperatures at outlet and inlet are the same:

$$T_{outlet} = T_{inlet}$$

## 5.21 Component Heater

### 5.21.1 Description

This component represents an electrical heater connected to the control system, and it produces a heat flow equal to the value of the command signal. This component is an actuator, i.e. an interface between the Thermal System and the Control System.

### 5.21.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image73.png){width="0.71875in" height="1.0104166666666667in"}

### 5.21.3 Construction Parameters

  --------------------------------------------------------------------------
  Name       Type              Default   Description
  ---------- ----------------- --------- -----------------------------------
  n          CONST INTEGER     1         Dimension of thermal port

  --------------------------------------------------------------------------

### 5.21.4 Ports

  --------------------------------------------------------------------------------------
  Name      Type            Parameters   Direction   Cardinality   Description
  --------- --------------- ------------ ----------- ------------- ---------------------
  tp_out    thermal         (n = n)      OUT         1,1           Thermal outlet port

  s_power   analog_signal   \-           IN          \-            Input power signal
  --------------------------------------------------------------------------------------

### 5.21.5 Formulation

The heat flow produced by the heater is equal to the value of the input signal:

tp_out.q = s_power.signal

## 5.22 Component Insulation

### 5.22.1 Description

This component represents a thermal insulator.

### 5.22.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image74.png){width="0.84375in" height="0.7604166666666666in"}

### 5.22.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- -----------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  -------------------------------------------------------------------------

### 5.22.4 Ports

  -------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality   Description
  ------- ---------- ------------ ----------- ------------- ---------------------
  tp      thermal    (n = n)      IN          1,1           Thermal inlet port

  -------------------------------------------------------------------------------

### 5.22.5 Formulation

The heat flow at the port is equal to zero:

tp_in.q\[i\] = 0

## 5.23 Component Peltier

### 5.23.1 Description

This component represents a thermoelectric element (TE).

This component represents a thermoelectric heat pump consisting of a number (NTE) of n- and p-type semiconductor material. A diagram of a thermoelectric heat pump in cooling mode is shown in the next figure:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image75.png){width="3.154717847769029in" height="2.0676990376202973in"}

There are several operation modes of thermoelectric devices depending on the direction of the current and the sign of the temperature difference between the two sides of the device.

### 5.23.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image76.png){width="1.2916666666666667in" height="0.96875in"}

### 5.23.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                  Default   Description
  ---------- --------------------- --------- ------------------------------
  n          CONST INTEGER         1         Dimension of thermal port

  -------------------------------------------------------------------------

### 5.23.4 Ports

  --------------------------------------------------------------------------------------------------------------------------
  Name     Type      Parameters   Direction   Cardinality   Description
  -------- --------- ------------ ----------- ------------- ----------------------------------------------------------------
  tp_in    thermal   (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal   (n = n)      OUT         \[0, 1\]      Thermal outlet port

  e_p      elec                   IN          \-            Positive electrical port connected to the n_type semiconductor

  e_n      elec                   IN          \-            Negative electrical port connected to the p_type semiconductor
  --------------------------------------------------------------------------------------------------------------------------

### 5.23.5 Data

+-------------+-----------+--------------+--------------------------------------------------+--------------+
| Name        | Type      | Default      | Description                                      | Units        |
+=============+===========+==============+==================================================+==============+
| NTE         | INTEGER   | 1            | Number of TE elements                            | \-           |
+-------------+-----------+--------------+--------------------------------------------------+--------------+
| G           | REAL      | 0.04         | Area length of the TE elements                   | m            |
+-------------+-----------+--------------+--------------------------------------------------+--------------+
| a_coef\[3\] | REAL      | 2.2224E-05   | Temperature coefficients of Seebeck effect       | V/ K         |
|             |           |              |                                                  |              |
|             |           | 9.306E-07    |                                                  | V / K^2^     |
|             |           |              |                                                  |              |
|             |           | \- 9.905E-10 |                                                  | V / K^3^     |
+-------------+-----------+--------------+--------------------------------------------------+--------------+
| r_coef\[3\] | REAL      | 5.112E-07    | Temperature coefficients of resistivity          | Ohm m        |
|             |           |              |                                                  |              |
|             |           | 1.634E-08    |                                                  | Ohm m / K    |
|             |           |              |                                                  |              |
|             |           | 6.279E-11    |                                                  | Ohm m / K^2^ |
+-------------+-----------+--------------+--------------------------------------------------+--------------+
| k_coef\[3\] | REAL      | 6.2605       | Temperature coefficients of thermal conductivity | W / m K      |
|             |           |              |                                                  |              |
|             |           | -0.02777     |                                                  | W / m K^2^   |
|             |           |              |                                                  |              |
|             |           | 4.131E-005   |                                                  | W / m K^3^   |
+-------------+-----------+--------------+--------------------------------------------------+--------------+

### 5.23.6 Variables

  -------------------------------------------------------------------------
  Name     Type         Description                             Units
  -------- ------------ --------------------------------------- -----------
  qin      REAL         Inlet heat flow                         *W*

  qout     REAL         Outlet heat flow                        *W*

  a        REAL         Seebeck coefficient                     *V / K*

  COP      REAL         Coefficient of performance              *-*

  COPopt   REAL         Optimum coefficient of performance      *-*

  DT       REAL         Temperature jump                        *K*

  DTmax    REAL         Maximum temperature jump                *K*

  Imax     REAL         Maximum current                         *A*

  I        REAL         Current                                 *A*

  Iopt     REAL         Optimum current                         *A*

  Pel      REAL         Electrical power                        *W*

  r        REAL         Resistivity                             *Ohm m*

  k        REAL         Thermal conductivity                    *W / m K*

  Tk_ave   REAL         Average temperature                     *K*

  Tk_out   REAL         Hot temperature                         *K*

  Tk_in    REAL         Cold temperature                        *K*

  V        REAL         Voltage                                 *V*

  Z        REAL         Figure of merit                         *K*^-1^
  -------------------------------------------------------------------------

### 5.23.7 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_out

### 5.23.8 Formulation

The formulation of the Peltier element is based on the information provided in Reference \[1\].

It is assumed that in cooling mode as refrigerator the cold side is the inlet and the hot side is the outlet. The temperature at the cold side is the mean temperature at the inlet port and the temperature at the hot side is the mean temperature at the outlet port.

The average absolute temperature is calculated from:

$$T_{avg} = 0.5 \cdot \left( T_{avg,in} + T_{avg,out} \right)$$

The Seebeck coefficient, a, the resistivity, r, and the thermal conductivity, k, are polynomial functions of the average temperature:

$$a = a\_ coef\lbrack 1\rbrack + a\_ cof\lbrack 2\rbrack \cdot T_{avg} + a\_ cof\lbrack 3\rbrack \cdot {T_{avg}}^{2}$$

$$r = r\_ coef\lbrack 1\rbrack + r\_ cof\lbrack 2\rbrack \cdot T_{avg} + r\_ cof\lbrack 3\rbrack \cdot {T_{avg}}^{2}$$

$$k = k\_ coef\lbrack 1\rbrack + k\_ cof\lbrack 2\rbrack \cdot T_{avg} + k\_ cof\lbrack 3\rbrack \cdot {T_{avg}}^{2}$$

The figure of merit of the element is calculated from:

$$Z = \frac{a^{2}}{r \cdot k}$$

The temperature jump is:

$$DT = T_{avg,out} - T_{avg,in}$$

The temperature difference ($DT$) is positive when the thermoelectric device operates as a cooling device (refrigerating).

The heat pumped is:

$$q_{in} = 2\ NTE\ \left( a\ IT_{avg,in} - \frac{I^{2}r}{2G} - k\ DT\ G \right)$$

$$q_{out} = 2\ NTE\ \left( a\ IT_{out} - \frac{I^{2}r}{2G} - k\ DT\ G \right)$$

The potential difference is the sum of the resistivity and Seebeck effects:

$$V = 2\ N\ \left( \frac{Ir}{G} - a\ DT \right)$$

The electrical power is equal to the current times the voltage difference:

$$P_{el} = I \cdot V$$

The maximum temperature DT with q = 0 is:

$${DT}_{\max} = 0.5 \cdot Z \cdot T_{avg,in}^{2}$$

The maximum current corresponding to DTmax with q = 0 is:

$$I_{\max} = \frac{kG}{a}\left( \sqrt{1 + ZT_{avg,out}} - 1 \right)$$

The coefficient of performance of the Peltier is defined as:

$$COP = \frac{q}{P_{el}}$$

The optimum coefficient of performance is:

$$COP_{opt} = \frac{Tk_{avg}}{DT}\frac{\sqrt{1 + ZT_{avg}} - 1}{\sqrt{1 + ZT_{avg}} + 1} - 0.5$$

The optimum current corresponding to the optimum performance:

$$I_{opt} = k\ DT\ G\left( \frac{1 + \sqrt{1 + ZT_{avg}}}{aTk_{avg}} \right)$$

The equations in the electrical ports are the following:

$$I_{p} = I_{n}$$

$$I_{p} = I$$

It is considered that intensity is positive from the n-type material to the p-type material when the thermoelectric device is in cooling mode as a refrigerator.

And the potential difference between the ports is defined as:

$${V = V}_{p} - V_{n}$$

## 5.24 Component Periodic_Stop_Control

### 5.24.1 Description

This component type, named Periodic_Stop_Control, represents a device that can be attached to a particular node allowing stopping the simulation when the dynamic response of the measured temperature becomes periodic.

### 5.24.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image77.png){width="1.6145833333333333in" height="0.7708333333333334in"}

### 5.24.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                   Default   Description
  ---------- ---------------------- --------- -----------------------------
  n          CONST INTEGER          1         Dimension of thermal port

  node       CONST INTEGER          1         Number of nodes to sample
  -------------------------------------------------------------------------

### 5.24.4 Ports

  --------------------------------------------------------------------------------
  Name    Type       Parameters   Direction   Cardinality   Description
  ------- ---------- ------------ ----------- ------------- ----------------------
  tp_in   thermal    (n = n)      IN          1,1           Thermal inlet port

  --------------------------------------------------------------------------------

### 5.24.5 Data

  ----------------------------------------------------------------------------------------------------
  Name      Type           Default   Description                                              Units
  --------- -------------- --------- -------------------------------------------------------- --------
  To        REAL           290       Initial temperature                                      *K*

  T_error   REAL           0.001     Average temperature error to consider cyclic behaviour   *K*
  ----------------------------------------------------------------------------------------------------

### 5.24.6 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------
  Name             Type      Initial   Description                                                                               Units
  ---------------- --------- --------- ----------------------------------------------------------------------------------------- ----------
  T_After_Period   REAL      To        Temperature delayed by one period                                                         *K*

  ErrorLimit       REAL                Integrated error limit between one period and previous one to consider cyclic behaviour   *K s*

  ErrorPeriod      REAL      1         Integrated absolute error between one period and previous one                             *K s*

  Cycled           BOOLEAN   FALSE     Cycling status                                                                            *-*

  Check_Error      BOOLEAN   TRUE      Auxiliary variable to check error at the end of each period                               *-*
  -----------------------------------------------------------------------------------------------------------------------------------------

### 5.24.7 Topology

The following statement helps to simplify the connecting statements when defining thermal networks using the EcosimPro Language.

PATH tp_in TO tp_in

### 5.24.8 Formulation

The following mathematical expressions apply to this component type:

**Initialisation of the Temperature:**

$${T = T}_{o}$$

**Determine if the Temperature Dynamics is Cyclic**

It is checked after five periods if the temperature dynamics is cyclic at the end of each new period. The condition to know whether the temperature dynamics is cyclic is that the integrated absolute error between one period and the previous one is less than the maximum integrate absolute error allowed to consider cyclic behaviour. When this happens it is fixed the end of the simulation.

If (Ep \< Elimit)

tstop = TIME + period

Cycled = TRUE

where:

Ep: Integrated absolute error between one period and previous one

Elimit: Maximum integrated absolute error allowed

Tstop: Final simulation time

period : Orbit period

The integrated absolute error between one period and the previous one is calculated from:

$$\frac{dE_{p}}{dt} = T(t) - T(t - period)$$

And the maximum integrated absolute error allowed to consider cyclic behaviour is calculated from:

$$E_{limit} = \left| T_{error} \right| \cdot period$$

where:

$T_{error}$: Average temperature error to consider cycling

## 5.25 Component Plate

### 5.25.1 Description

This component, named Plate, represents a panel divided into a number of longitudinal and transversal slabs (nodes). Heat flow is considered at the sides of the plate (positive for increasing node index), and it is assumed that the remaining ends are isolated.

### 5.25.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image78.png){width="1.3333333333333333in" height="1.21875in"}

### 5.25.3 Construction Parameters

  -------------------------------------------------------------------------
  Name       Type                  Default   Description
  ---------- --------------------- --------- ------------------------------
  nx         CONST INTEGER         1         OX-Number of nodes for plate

  ny         CONST INTEGER         1         OY-Number of nodes for plate
  -------------------------------------------------------------------------

### 5.25.4 Ports

  ----------------------------------------------------------------------------
  Name           Type       Parameters   Direction   Description
  -------------- ---------- ------------ ----------- -------------------------
  tpx_in         thermal    (n = ny)     IN          OX- thermal inlet port

  tpx_out        thermal    (n = ny)     OUT         OX- thermal outlet port

  tpy_in         thermal    (n = nx)     IN          OY- thermal inlet port

  tpy_out        thermal    (n = nx)     OUT         OY- thermal outlet port
  ----------------------------------------------------------------------------

### 5.25.5 Data

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Name                    Type                  Default         Description                                                                                     Units
  ----------------------- --------------------- --------------- ----------------------------------------------------------------------------------------------- ------------
  L                       REAL                  1               OX -- Plate length                                                                              *m*

  W                       REAL                  1               OY -- Plate width                                                                               *m*

  e                       REAL                  0.003           OZ -- Plate thickness                                                                           *m*

  mat                     ENUM Material         None            Material                                                                                        *-*

  cp                      REAL                  500             Plate specific heat if material is None                                                         *J/kg K*

  k                       REAL                  0.1             Plate conductivity if material is None                                                          *W/m K*

  rho                     REAL                  1000            Plate density if material is None                                                               *Kg /m*^3^

  TemperatureDependance   BOOLEAN               TRUE            Option to consider or not the temperature dependence on the material properties                 

  init_mode               ENUM WALL_INIT_MODE   Constant_Temp   Option for the initialisation of the nodal temperatures                                         

  To                      REAL                  290             Initial temperature of nodes                                                                    *K*

  To_linear\[2\]          REAL                  {290, 290}      Initial temperatures at both sides if init_mode = Linear_Temp                                   *K*

  To_table                TABLE_1D                              Table with the initial temperatures versus non-dimensional position if init_mode = Table_Temp   *K*
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Input data cp, k and rho will be used only if "mat" = None. If not, the properties will be interpolated using the corresponding data file.

### 5.25.6 Variables

  -------------------------------------------------------------------------------------------------------------------------------
  Name                Type      Initial   Description                                                                Units
  ------------------- --------- --------- -------------------------------------------------------------------------- ------------
  T\[nx,ny\]          REAL                Nodal temperatures                                                         *K*

  cp_var\[nx,ny\]     REAL                Specific heat of nodes                                                     *J/kg K*

  cp_tpx\[2, nx\]     REAL                OX-Nodal specific heat of first last section skin                          *J/kg K*

  cp_tpy\[nx,2\]      REAL                OY-Nodal specific heat of first last section skin                          *J/kg K*

  dx                  REAL                OX -- Node width or nodal distance                                         *m*

  dy                  REAL                OY -- Node width or nodal distance                                         *m*

  k_var\[nx,ny\]      REAL                Thermal conductivity of nodes                                              *W/m K*

  C_x\[nx+1, ny\]     REAL                OX - Equivalent conductance between the thermal nodes                      *W/K*

  C_y\[nx+1, ny\]     REAL                OY - Equivalent conductance between the thermal nodes                      *W/K*

  qx\[nx + 1, ny\]    REAL                OX -- heat flow between nodes                                              *W*

  qy\[nx, ny + 1\]    REAL                OY -- heat flow between nodes                                              *W*

  rho_var             REAL                Density of plate material                                                  *Kg /m*^3^

  V                   REAL                Node volume                                                                *m*^3^

  Ax                  REAL                OX - Cross Area                                                            *m*^2^

  Ay                  REAL                OY - Cross Area                                                            *m*^2^

  icpk\[nx, ny\]      REAL                Last pointer to speed up the nodal interpolations of material properties   

  icpk_tpx\[2, ny\]   REAL                OX - Pointer to last interpolation interval for each port node             

  icpk_tpy\[nx, 2\]   REAL                OY - Pointer to last interpolation interval for each port node             

  it0                 REAL                Pointer to To                                                              

  F                   REAL                Thermal capacity ratio assigned to the surface                             *-*
  -------------------------------------------------------------------------------------------------------------------------------

### 5.25.7 Formulation

**Nodalisation**

The dimensions of the inlet and outlet vectorised thermal ports are defined by the values of nx (number of nodes in the x direction into which the plate is divided) and ny (number of nodes in the y direction). The temperature at each node is stored in an array called T\[nx,ny\].

Array qx\[nx + 1, ny\] contains the heat flows across nodes in the x direction, and array qy\[nx, ny+1\] contains the heat flows across nodes in the y direction.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image79.png){width="4.473316929133858in" height="1.9528619860017498in"}

**Initialisation**

The data named init_mode allows the user to specify the initial temperature distribution in the nodes. There are three options::

- Uniform initial temperature for all the nodes (init_mode = Constant_Temp)

- Linear initial temperature distribution in the OX direction and uniform initial temperature in the OY direction (init_mode = Linear_Temp)

- Initial temperature distribution given by a data table of the initial temperature as a function of the non-dimensional position in the OX direction (init_mode = Table_Temp). For the OY direction, the temperature distribution is considered uniform.

**Heat balance**

The following heat balance equation is applied on each node in the OX and the OY directions:

$$\rho_{var} \cdot cp_{var\ i,j} \cdot V\left( 1 - \frac{F}{nx \cdot ny} \right) \cdot \frac{\partial T_{i,j}}{\partial t} = {qx}_{i,j} - {qx}_{i + 1,j} + {qy}_{i,j} - {qy}_{i,j + 1}$$

where

$\rho$: Density of the plate material

$cp_{var\ i,j}$: Specific heat of the node \[i,j\]

$V$: Node volume

$F$: Thermal capacity ratio assigned to the ports (surface)

$dx$: Node width or nodal distance in the OX direction:

$$dx = \ \frac{L}{nx}$$

$dy$: Node width or nodal distance in the OY direction

$$dy = \ \frac{W}{ny}$$

$L$: Plate length (OX dimension)

$W$: Plate width (OY dimension)

$nx$: Number of nodes in the direction OX

$ny$: Number of nodes in the direction OY

$V$: Node volume

$T_{i,j}$: Temperature of the node \[i,j\]

${qx}_{i,j}$: Heat flow between node \[i,j\] y \[i-1,j\] in the direction OX

${qy}_{i,j}$: Heat flow between node \[i, j\] y \[i, j-1\] in the direction OY

**Heat Flows**

The heat flows are then considered in the x and y directions:

The internal heat flows in the X direction are given by:

$${qx}_{i,j} = \ \frac{k_{var\ i - 1,j} \cdot k_{var\ i,j}\ }{\frac{k_{var\ i,j} + k_{var\ i - 1,j}\ }{2}} \cdot (dy \cdot e) \cdot \frac{T_{i - 1,j} - T_{i,j}}{dx}$$

and at the ends of the plate:

$${qx}_{1,j} = \ k_{var\ 1,j} \cdot (dy \cdot e) \cdot \frac{tpx\_ in.Tk_{j} - T_{1,j}}{\frac{dx}{2}}$$

$${qx}_{n + 1,j} = \ k_{var\ nx,j} \cdot (dy \cdot e) \cdot \frac{T_{nx,j} - tpx\_ out.Tk_{j}}{\frac{dx}{2}}$$

The internal heat flows in the Y direction are given by:

$${qy}_{i,j} = \ \frac{k_{var\ i,j - 1} \cdot k_{var\ i,j}\ }{\frac{k_{var\ i,j} + k_{var\ i,j - 1}\ }{2}} \cdot (dy \cdot e) \cdot \frac{T_{i,j - 1} - T_{i,j}}{dx}$$

and at the ends of the plate:

$${qy}_{i,1} = \ k_{var\ i,1} \cdot (dx \cdot e) \cdot \frac{tpy\_ in.Tk_{i} - T_{i,1}}{\frac{dy}{2}}$$

$${qy}_{i,j + 1} = \ k_{var\ i,ny} \cdot (dx \cdot e) \cdot \frac{T_{i,ny} - tpy\_ out.Tk_{i}}{\frac{dy}{2}}$$

**Equations in the ports**

A certain thermal inertia (given by the datum F) is assigned to the thermal inlet and outlet ports. This is done to prevent the appearance of algebraic loops when calculating the heat flows at the ports. The heat balances applied to the ports are the following:

$$\rho_{var} \cdot cp\_ tpx_{1,j} \cdot V\left( \frac{F}{2(nx \cdot ny)} \right) \cdot \frac{\partial{tpx\_ in.Tx}_{j}}{\partial t} = {tpx\_ in.q}_{j} - {qx}_{1,j}$$

$$\rho_{var} \cdot cp\_ tpx_{2,j} \cdot V\left( \frac{F}{2(nx \cdot ny)} \right) \cdot \frac{\partial{tpx\_ out.Tx}_{j}}{\partial t} = {qx}_{nx + 1,j} - {tpx\_ out.q}_{j}$$

$$\rho_{var} \cdot cp\_ tpy_{i,1} \cdot V\left( \frac{F}{2(nx \cdot ny)} \right) \cdot \frac{\partial{tpy\_ in.Tx}_{j}}{\partial t} = {tpy\_ in.q}_{i} - {qy}_{i,1}$$

$$\rho_{var} \cdot cp\_ tpy_{i,2} \cdot V\left( \frac{F}{2(nx \cdot ny)} \right) \cdot \frac{\partial{tpy\_ out.Tx}_{j}}{\partial t} = {qy}_{i,ny + 1} - {tpy\_ out.q}_{i}$$

## 5.26 Component Q_sensor

Inherited from components Conductor and CONTROL.Asensor.

### 5.26.1 Description

This component represents a heat flow sensor, and it is an interface between the thermal system and the control system.

### 5.26.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image80.png){width="0.9583333333333334in" height="1.0104166666666667in"}

### 5.26.3 Construction Parameters

  ------------------------------------------------------------------------------------------------
  Name       Type                  Default   Description
  ---------- --------------------- --------- -----------------------------------------------------
  in         CONST INTEGER         1         Index of item in the heat flow array to be measured

  n          CONST INTEGER         1         Dimension of thermal port

  n_out      CONST INTEGER         1         Dimension of outputs
  ------------------------------------------------------------------------------------------------

### 5.26.4 Ports

  ----------------------------------------------------------------------------------------
  Name      Type            Parameters    Direction   Cardinality   Description
  --------- --------------- ------------- ----------- ------------- ----------------------
  s_out     analog_signal   (n = n_out)   OUT                       Outlet signal

  tp_in     thermal         (n = n)       IN          \[0, 1\]      Thermal inlet port

  tp_out    thermal         (n = n)       OUT         \[0, 1\]      Thermal outlet port
  ----------------------------------------------------------------------------------------

### 5.26.5 Data

  ----------------------------------------------------------------------------------
  Name            Type         Default   Description                       Units
  --------------- ------------ --------- --------------------------------- ---------
  Gain\[n_out\]   REAL         1         Gain                              *W-1*

  Bias\[n_out\]   REAL         0         Bias                              *-*
  ----------------------------------------------------------------------------------

### 5.26.6 Variables

  -----------------------------------------------------------------------------
  Name           Type         Description                              Units
  -------------- ------------ ---------------------------------------- --------
  q\[n\]         REAL         Heat flow                                *W*

  Var\[n_out\]   REAL         Variable being measured                  *W*
  -----------------------------------------------------------------------------

### 5.26.7 Formulation

The value being measured is:

s_out.signal = gain·tp_in.q + bias

and it is assumed that the heat flow sensor does not produce any temperature difference:

tp_in.T = tp_out.T

and the conservation of energy is inherited from the conductor component:

tp_in.q = tp_out.q = q

## 5.27 Component Radiator

### 5.27.1 Description

This component represents a radiator device for cooling purposes, with the purpose of being connected to a pipe or to a heat pipe.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image81.png){width="3.3179932195975503in" height="2.0618963254593177in"}

### 5.27.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image82.png){width="1.125in" height="1.0104166666666667in"}

### 5.27.3 Construction Parameters

  -------------------------------------------------------------------------------
  Name    Type            Default   Description                          Units
  ------- --------------- --------- ------------------------------------ --------
  nx      CONST INTEGER   5         Number of nodes in cross direction   \-

  ny      CONST INTEGER   5         Number of nodes in tube direction    \-
  -------------------------------------------------------------------------------

### 5.27.4 Ports

  --------------------------------------------------------------------------------------------------------
  Name    Type      Parameters   Direction   Description
  ------- --------- ------------ ----------- -------------------------------------------------------------
  tp_in   thermal   (n = ny)     IN          Thermal inlet port for connection to a pipe or to heat pipe

  tp_1    thermal   (n = 1)      OUT         Thermal port for radiative sink on side 1

  tp_2    thermal   (n = 1)      OUT         Thermal port for radiative sink on side 2
  --------------------------------------------------------------------------------------------------------

### 5.27.5 Data

  -----------------------------------------------------------------------------------------------------------------------------------------------
  Name                    Type            Default   Description                                                                       Units
  ----------------------- --------------- --------- --------------------------------------------------------------------------------- -----------
  n_fin                   INTEGER         1         Number of fins (see figure in Formulation)                                        *-*

  Num                     INTEGER         1         Number of parallel radiators considered                                           *-*

  cp                      REAL            500       Radiator specific heat if material is None                                        *J/kg K*

  k                       REAL            0.1       Radiator conductivity if material is None                                         *W/m K*

  rho                     REAL            1000      Radiator density if material is None                                              *Kg/m*^3^

  Lx                      REAL            0.2       Length of the fin                                                                 *m*

  Ly                      REAL            5         Width of the fin                                                                  *m*

  A                       REAL            25        Area of 1 fin                                                                     *m*^2^

  e                       REAL            0.012     Fin thickness                                                                     *m*

  mat                     ENUM Material   None      Material used for radiator                                                        *-*

  emiss1                  REAL            0.85      Emissivity of side 1 of the fin                                                   *-*

  alpha1                  REAL            0.25      Solar absorptance of side 1 of the fin                                            *-*

  F1                      REAL            0.9       Average view factor of sink node 1 from side 1                                    *-*

  beta1                   REAL            0         Incidence angle of the sun in side 1                                              *º*

  emiss2                  REAL            0.85      Emissivity of side 2 of the fin                                                   *-*

  alpha2                  REAL            0.25      Solar absorptance of side 2 of the fin                                            *-*

  F2                      REAL            0         Average view factor of sink node 2 from side 2                                    *-*

  beta2                   REAL            0         Incidence angle of the sun in side 2                                              *º*

  TemperatureDependance   BOOLEAN         TRUE      Option to consider or not the temperature dependence on the material properties   

  To                      REAL            290       Initial temperature                                                               *K*
  -----------------------------------------------------------------------------------------------------------------------------------------------

Input data cp, k and rho will be used only if "mat" = None. If not, the properties will be interpolated using the corresponding data file.

### 5.27.6 Variables

  ------------------------------------------------------------------------------------------------------------------------
  Name               Type            Description                                                               Units
  ------------------ --------------- ------------------------------------------------------------------------- -----------
  A                  REAL            Area of 1 fin                                                             *m2*

  dx                 REAL            Node length in cross direction                                            *m*

  dy                 REAL            Node length in tube direction                                             *m*

  Ax                 REAL            OX - Cross Area                                                           *m2*

  Ay                 REAL            OY - Cross Area                                                           *m2*

  rho_var            REAL            Density of radiator material                                              *kg/m*^3^

  cp_var\[nx,ny\]    REAL            Specific heat of nodes                                                    *J/kg K*

  k_var\[nx,ny\]     REAL            Thermal conductivity of radiator nodes                                    *W/m K*

  C_x\[nx+1, ny\]    REAL            Equivalent conductance in the cross direction between the thermal nodes   *W/K*

  C_y\[nx, ny+1\]    REAL            Equivalent conductance in the tube direction between the thermal nodes    *W/K*

  Tsink1             REAL            Equivalent sink temperature for side 1                                    *K*

  Tsink2             REAL            Equivalent sink temperature for side 2                                    *K*

  q_tot_sun          REAL            Total solar heat flow received by radiator                                *W*

  qx\[nx+1,ny\]      REAL            Cross direction heat flow through nodes                                   *W*

  qy\[nx,ny+1\]      REAL            Tube direction heat flow through nodes                                    *W*

  q_rad_1\[nx,ny\]   REAL            Heat flow radiated by each node on side 1                                 *W*

  q_rad_2\[nx,ny\]   REAL            Heat flow radiated by each node on side 2                                 *W*

  T\[nx,ny\]         REAL            Temperature of nodes                                                      *K*

  q_tot_rad_1        REAL            Total heat flow radiated by side 1                                        *W*

  q_tot_rad_2        REAL            Total heat flow radiated by side 2                                        *W*

  q_tot_fluid        REAL            Total heat flow received from fluid by radiator                           *W*

  A_tot              REAL            Total area of radiators                                                   

  mass               REAL            Total mass of radiators                                                   

  icpk\[nx, ny\]     INTEGER         Last pointer to speed up nodal interpolations                             *-*

  it0                INTEGER         Pointer to To                                                             *-*
  ------------------------------------------------------------------------------------------------------------------------

### 5.27.7 Formulation

Depending on the parameter n_fin (number of fins), the component can represent any of the two configurations shown in the next figure.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image83.png){width="3.9296489501312335in" height="0.9312707786526684in"}

**Nodalisation**

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image84.png){width="3.7811570428696415in" height="2.174517716535433in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image85.png){width="3.5434820647419074in" height="1.8711701662292213in"}

**Geometry**

Area of one fin:

$$A = Lx \cdot Ly$$

Calculation of node lengths:

$$dx = \frac{Lx}{nx}$$

$$dy = \frac{Ly}{ny}$$

Calculation of the heat transfer area for each direction:

$$Ax = e \cdot dy$$

$$Ay = e \cdot dx$$

where:

$Lx$: Length of the fin

$Ly$: Width of the fin

$e$: Thickness of the fin

$nx$: Number of nodes in cross direction

$ny$: Number of nodes in tube direction

The total radiator area considered is:

$$A_{tot} = A \cdot n_{fin} \cdot num$$

And the total radiator mass is:

$$mass = A_{tot} \cdot e \cdot \rho$$

**Equivalent Sink Temperature for Side 1 (Tsink1):**

$$T_{sin\ k1} = tp\_ 1.{Tk}_{1} \cdot \left( 1 + \frac{\alpha_{1\ }SC\ sin(\beta_{1})}{\varepsilon_{1}F_{1}{(tp\_ 1.Tk_{1})}^{4}} \right)^{\frac{1}{4}}$$

where

$tp\_ 1.{Tk}_{1}$: Temperature of the radiative environment for node 1

$\alpha_{1\ }$: Solar absorptance of side 1 of the fin

$SC$: Solar constant

$\beta_{1}$: Incidence angle of the sun in side 1 of the fin (0≤β1≤90)

$\varepsilon_{1}$: Emissivity of side 1 of the fin

$F_{1}$: Average view factor of the radiation environment from the fin

**Equivalent Sink Temperature for Side 2**

$$T_{sin\ k2} = tp\_ 2.T \cdot \left( 1 + \frac{\alpha_{2}SC\ sin(\beta_{2})}{\varepsilon_{2}F_{2}{(tp\_ 2.T)}^{4}} \right)^{\frac{1}{4}}$$

**Total Solar Heat Flux Received by one Fin of the Radiator**

$$q_{tot,\ sun} = \alpha_{1\ }SC\ A\sin{{(\beta}_{1}) + \alpha_{2\ }SC\ A\sin{{(\beta}_{2})}}$$

**Heat Flows in X direction**

$${qx}_{1,j} = K_{var\ 1,j} \cdot Ax \cdot \frac{\left( tp\_ in.Tk_{j} - T_{1,j} \right)}{\frac{dx}{2}}\ \ for\ j\ in\ 1,ny$$

$${qx}_{i,j} = \frac{K_{var\ i - 1,j} \cdot K_{var\ i,j}}{K_{var\ i,j} + K_{var\ i - 1,j}} \cdot Ax \cdot \frac{k \cdot \left( T_{i - 1,j} - T_{i,j} \right)}{\frac{dx}{2}}\ \ for\ i\ in\ 2,nx\ and\ for\ j\ in\ 1,ny$$

End x=Lx is isolated

$${qx}_{nx + 1,j} = 0\ \ \ for\ j\ in\ 1,ny\ $$

where:

$tp\_ in.Tk_{j}$: Temperature of the node j of the inlet port

${qx}_{i,j}$: Cross direction heat flow between the nodes \[i-1, j\] and \[i, j\]

$K_{var\ i,j}$: Thermal conductivity of node \[i, j\]

**Heat flow in y direction**

$${qy}_{i,j} = \frac{K_{var\ i,j - 1} \cdot K_{var\ i,j}}{K_{var\ i,j} + K_{var\ i,j - 1}} \cdot Ay \cdot \frac{\left( T_{i,j - 1} - T_{i,j} \right)}{\frac{dy}{2}}\ \ for\ i\ in\ 1,nx\ and\ for\ j\ in\ 2,ny$$

$${qy}_{i,ny + 1} = 0\ \ \ for\ j\ in\ 1,nx\ $$

$${qy}_{i,1} = 0\ \ \ for\ i\ in\ 1,nx\ $$

**Heat Flux radiated by each Node in Side 1**

$$q_{rad\ 1,\ i,\ j} = \varepsilon_{1} \cdot \sigma \cdot F1 \cdot dx \cdot dy \cdot (T_{i,j}^{4} - tp\_ 1.Tk_{1}^{4})$$

**Heat Flux radiated by each Node in Side 2**

$$q_{rad\ 2,\ i,\ j} = \varepsilon_{2} \cdot \sigma \cdot F2 \cdot dx \cdot dy \cdot (T_{i,j}^{4} - tp\_ 2.Tk_{1}^{4})$$

where:

$\varepsilon_{1}$: Emissivity of side 1 of the fin

$\varepsilon_{2}$: Emissivity of side 2 of the fin

$F1$: Average view factor of sink node 1 from side 1

$F2$: Average view factor of sink node 2 from side 2

$\sigma$: Stefan Boltzmann constant

**Energy Equation applied to each node:**

$$C_{i,j} \cdot \frac{\partial T_{i,j}}{\partial t} = qx_{i,j} - qx_{i + 1,j} + {qy}_{i,j} - qy_{i,j + 1} + \frac{q_{tot,sun}}{nx \cdot ny} - q_{rad\ 1,\ i,\ j} - q_{rad\ 2,\ i,\ j}$$

where

$C_{i,j}$: The thermal capacitance of one node

$$C_{i,j} = cp_{var\ i,j} \cdot \rho \cdot dx \cdot dy \cdot e$$

$q_{tot,sun}$: Total solar heat flow received by radiator

**Calculation of Total Heat Flows**

Total Heat Flow Radiated by Side 1

$$q_{tot,rad\ 1} = num \cdot n_{fin}\sum_{i = 1}^{nx}{\sum_{j = 1}^{ny}q_{rad\ 1,\ i,\ j}}$$

Total Heat Flow Radiated by Side 2

$$q_{tot,rad\ 2} = num \cdot n_{fin}\sum_{i = 1}^{nx}{\sum_{j = 1}^{ny}q_{rad\ 2,\ i,\ j}}$$

Total Heat Flow Received from Fluid by Radiator

$$q_{tot,fluid} = num \cdot n_{fin}\sum_{j = 1}^{ny}{qx_{1,j}}$$

**Equations in the Ports**

$$tp_{in}.q_{j} = num \cdot n_{fin} \cdot qx_{1,j\ \ }for\ j\ in\ 1,\ ny$$

$$tp\_ 1.q = q_{tot\ rad\ 1}$$

$$tp\_ 2.q = q_{tot\ rad\ 2}$$

where:

$tp\_ in.q_{j}$: Heat flow across the element j of the thermal inlet port

$tp\_ 1.q$: Heat flow across the thermal port to sink 1

$tp\_ 2.q$: Heat flow across the thermal port to sink 2

$num$: total number of identical radiators considered

## 5.28 Component Saddle

### 5.28.1 Description

This represents a typical saddle device used to fasten heat pipes to a surface, as shown below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image86.png){width="2.2747911198600175in" height="1.4898939195100613in"}

### 5.28.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image87.png){width="0.9583333333333334in" height="1.1770833333333333in"}

### 5.28.3 Construction Parameters

  -----------------------------------------------------------------------------
  Name    Type            Default   Description                      Units
  ------- --------------- --------- -------------------------------- ----------
  n       CONST INTEGER   5         Number of nodes                  \-

  -----------------------------------------------------------------------------

### 5.28.4 Ports

  -----------------------------------------------------------------------------
  Name     Type        Parameters   Direction   Description
  -------- ----------- ------------ ----------- -------------------------------
  tp_in    thermal_n   (n = n)      IN          Thermal inlet port

  tp_out   thermal_n   (n = n)      OUT         Thermal outlet port
  -----------------------------------------------------------------------------

### 5.28.5 Data

  --------------------------------------------------------------------------------------
  Name    Type            Default   Description                                Units
  ------- --------------- --------- ------------------------------------------ ---------
  l       REAL            1         Length of saddle                           m

  A       REAL            0.001     Cross sectional area of saddle             m2

  mat     ENUM Material   None      Material used for saddle                   \-

  rho     REAL            1000      Saddle density if material is None         Kg/m^3^

  cp      REAL            500       Saddle specific heat if material is None   J/kg K

  k       REAL            0.1       Saddle conductivity if material is None    W/m K

  G       REAL            50        Conductance of saddle per unit length      W/m K
  --------------------------------------------------------------------------------------

Input data cp, k and rho will be used only if "mat" = None. If not, the properties will be interpolated using the corresponding data file.

### 5.28.6 Variables

  ----------------------------------------------------------------------------------
  Name       Type              Description                               Units
  ---------- ----------------- ----------------------------------------- -----------
  dx         REAL              Node length                               m

  rho_var    REAL              Density of saddle material                kg/m^3^

  cp_var     REAL              Specific heat of saddle material          J/kg K

  k_var      REAL              Thermal conductivity of saddle material   W/m K

  C          REAL              Thermal capacitance of nodes              J/K

  q\[n+1\]   REAL              Axial heat flow through nodes             W

  T\[n\]     REAL              Temperature of nodes                      K
  ----------------------------------------------------------------------------------

### 5.28.7 Topology

PATH tp_in TO tp_out

### 5.28.8 Formulation

The formulation used in this component is similar to that in tube with the exception that there is a very low resistance to radial heat flow.

Heat flow through nodes:

$$q_{i} = \frac{k_{var\ i - 1} \cdot k_{var\ i}}{k_{var\ i} + k_{var\ i - 1}} \cdot A \cdot \frac{\left( T_{i - 1} - T_{i} \right)}{dx}\ \ for\ i\ in\ 2,n$$

$$q_{1} = 0\ \ \ $$

$$q_{n + 1} = 0\ \ \ $$

Radial heat flow at each node due to saddle-tube contact:

$$tp\_ in.q_{i} = 2 \cdot G \cdot dx \cdot (tp\_ in.Tk_{i} - T_{i})$$

$$tp\_ out.q_{i} = 2 \cdot G \cdot dx \cdot (T_{i} - tp\_ out.Tk_{i})$$

Energy balance due all heat flows at each node:

$$\rho \cdot cp_{i} \cdot A \cdot dx \cdot \frac{dT_{i}}{dt} = \left( q_{i} - q_{i + 1} \right) + (tp\_ in.q_{i} - tp\_ out.q_{i})$$

Where:

$tp\_ in.q_{i}$: Heat flow across the element \[i\] of the thermal inlet port

$tp\_ out.q_{i}$: Heat flow across the element \[i\] of the thermal outlet port

$tp\_ in.Tk_{i}$: Temperature of the element \[i\] of the thermal inlet port

$tp\_ out.Tk_{i}$: Temperature of the element \[i\] of the thermal outlet port

$dx$: Node length

$G$: Conductance of saddle per unit length

$T_{i}$: Temperature of node \[i\]

$k_{var\ i}$: Conductivity of node \[i\]

$q_{i}$: Heat flow between node \[i-1\] and node \[i\]

$cp_{i}$: Specific heat of node \[i\]

## 5.29 Component TD_GL

Inherited from component AGL.

### 5.29.1 Description

This component type, named TD_GL, represents a linear thermal conductor, where conductance is a tabulated function of the average temperature.

### 5.29.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image88.png){width="1.125in" height="0.8645833333333334in"}

### 5.29.3 Construction parameters

  ----------------------------------------------------------------------------
  Name           Type            Default   Description
  -------------- --------------- --------- -----------------------------------
  n              CONST INTEGER   1         Dimension of thermal port

  ----------------------------------------------------------------------------

### 5.29.4 Ports

  ---------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ----------------------
  tp_in    thermal    (n = n)      IN          \[0, 1\]      Thermal inlet port

  tp_out   thermal    (n = n)      OUT         \[0, 1\]      Thermal outlet port
  ---------------------------------------------------------------------------------

### 5.29.5 Data

  ----------------------------------------------------------------------------------------------------------------
  Name      Type       Default                     Description                                       Units
  --------- ---------- --------------------------- ------------------------------------------------- -------------
  F         REAL       0                           Area to length ratio                              m

  k_table   TABLE_1D   {{-273.15, 1000}, {1, 1}}   Thermal conductivity versus average temperature   W/m K vs ºC
  ----------------------------------------------------------------------------------------------------------------

### 5.29.6 Variables

  -----------------------------------------------------------------------------
  Name         Type           Description                             Units
  ------------ -------------- --------------------------------------- ---------
  q\[n\]       REAL           Heat flow                               W

  Vcond\[n\]   REAL           Variable thermal conductance per node   W/K
  -----------------------------------------------------------------------------

### 5.29.7 Topology

PATH tp_in TO tp_out

### 5.29.8 Formulation

The mathematical equations described in this section are employed to represent the behaviour of this component.

**Thermal conductance**

The thermal conductivity is a function of the average temperature, T~ave~, given by linear interpolation from a table:

$$k = f(T_{ave})$$

$$T_{ave} = \frac{T_{in} + T_{out}}{2}$$

The thermal conductance is equal to the thermal conductivity times the area to length ratio:

$$Vcond = kF$$

Heat Transport by Conduction for each node is calculated as follows:

$$q_{i} = \ Vcond_{i}(T_{in,i} - T_{out,i})$$

where:

$Vcond_{i}$: Thermal conductance at each array item.

**Inherited from Abstract Component Conductor**

Thermal conductors do not have any heat storage capacity by hypothesis, so the inlet heat flow is equal to the outlet heat flow, and it is also equal to the internal heat flow through the conductor:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image67.png){width="2.6507206911636048in" height="0.7972867454068241in"}

$$q_{in,i} = q_{i}\ for\ all\ i \in 1,n$$

$$q_{in,i} = q_{out,i}\ for\ all\ i \in 1,n$$

## 5.30 Component Th_Demux

### 5.30.1 Description

This component represents a thermal demultiplexer of different number of outputs. It splits a thermal port of dimension m+n into two ports with dimension m and n.

### 5.30.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image89.png){width="1.0309230096237971in" height="0.7141283902012249in"}

### 5.30.3 Construction Parameters

  -------------------------------------------------------------------------------
  Name           Type            Default   Description
  -------------- --------------- --------- --------------------------------------
  n1             CONST INTEGER   1         First outlet thermal port dimension

  n2             CONST INTEGER   1         Second outlet thermal port dimension
  -------------------------------------------------------------------------------

### 5.30.4 Ports

  ----------------------------------------------------------------------------------
  Name      Type       Parameters    Direction   Cardinality   Description
  --------- ---------- ------------- ----------- ------------- ---------------------
  tp_in     thermal    (n = n1+n2)   IN          1,1           Thermal inlet port

  tp_out1   thermal    (n = n1)      IN          1,1           Thermal outlet port

  tp_out2   thermal    (n = n2)      IN          1,1           Thermal outlet port
  ----------------------------------------------------------------------------------

### 5.30.5 Formulation

The elements of the input signal vector is divided in two outlet thermal ports. The outlet heat flows and temperatures are calculated as follows:

EXPAND(j IN 1, n1) tp_out1.q\[j\] = tp_in.q\[j\]

EXPAND(j IN 1, n1) tp_out1.Tk\[j\] = tp_in.Tk\[j\]

EXPAND(j IN 1, n2) tp_out2.q\[j\] = tp_in.q\[j+n1\]

EXPAND(j IN 1, n2) tp_out2.Tk\[j\] = tp_in.Tk\[j+n1\]

## 5.31 Component Th_Demux1

### 5.31.1 Description

This component represents a thermal demultiplexer of different number of outputs. It splits a thermal port of dimension n into n ports with dimension 1.

### 5.31.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image90.png){width="1.0414698162729659in" height="0.7284886264216973in"}

### 5.31.3 Construction Parameters

  ----------------------------------------------------------------------------
  Name           Type            Default   Description
  -------------- --------------- --------- -----------------------------------
  n              CONST INTEGER   1         Inlet thermal port dimension

  ----------------------------------------------------------------------------

### 5.31.4 Ports

  -------------------------------------------------------------------------------------
  Name          Type       Parameters   Direction   Cardinality   Description
  ------------- ---------- ------------ ----------- ------------- ---------------------
  tp_in         thermal    (n = n)      IN          1,1           Thermal inlet port

  tp_out\[n\]   thermal    (n = 1)      IN          1,1           Thermal outlet port
  -------------------------------------------------------------------------------------

### 5.31.5 Formulation

The elements of the input signal vector is divided into n outlet thermal ports. The outlet heat flows and temperatures are calculated as follows:

EXPAND(j IN 1, n) tp_out\[j\].q\[1\] = tp_in.q\[j\]

EXPAND(j IN 1, n) tp_out\[j\].Tk\[1\] = tp_in.Tk\[j\]

## 5.32 Component Th_InvIndex

### 5.32.1 Description

This component is used to invert the order of the thermal indexes.

### 5.32.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image91.png){width="0.8770734908136483in" height="0.6534372265966755in"}

### 5.32.3 Construction Parameters

  ----------------------------------------------------------------------------
  Name           Type            Default   Description
  -------------- --------------- --------- -----------------------------------
  n              CONST INTEGER   1         Inlet thermal port dimension

  ----------------------------------------------------------------------------

### 5.32.4 Ports

  ---------------------------------------------------------------------------------
  Name      Type       Parameters   Direction   Cardinality   Description
  --------- ---------- ------------ ----------- ------------- ---------------------
  tp_in     thermal    (n = n)      IN                        Thermal inlet port

  tp_out    thermal    (n = n)      IN                        Thermal outlet port
  ---------------------------------------------------------------------------------

### 5.32.5 Formulation

The temperatures and heat fluxes of the outlet port are calculated inverting the order of those variables in the input port, as follows:

EXPAND(j IN 1, n) tp_out.q\[n + 1 - i\] = tp_in.q\[i\]

EXPAND(j IN 1, n) tp_out.Tk\[n + 1 - i\] = tp_in.Tk\[i\]

## 5.33 Component Th_Mux

### 5.33.1 Description

This component is a thermal multiplexer, bringing together two thermal ports into one port

### 5.33.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image92.png){width="0.9181211723534558in" height="0.695838801399825in"}

### 5.33.3 Construction Parameters

  ------------------------------------------------------------------------------
  Name           Type            Default   Description
  -------------- --------------- --------- -------------------------------------
  n1             CONST INTEGER   1         First inlet thermal port dimension

  n2             CONST INTEGER   1         Second inlet thermal port dimension
  ------------------------------------------------------------------------------

### 5.33.4 Ports

  ----------------------------------------------------------------------------------
  Name      Type       Parameters    Direction   Cardinality   Description
  --------- ---------- ------------- ----------- ------------- ---------------------
  tp_in1    thermal    (n = n1)      IN          1,1           Thermal inlet port

  tp_in2    thermal    (n = n2)      IN          1,1           Thermal inlet port

  tp_out    thermal    (n = n1+n2)   IN          1,1           Thermal outlet port
  ----------------------------------------------------------------------------------

### 5.33.5 Formulation

The output signal vector is built concatenating the elements of the input ports. The first dimension (n1) elements of the output signal port will be the set of elements of the first input signal port, the second dimension (n2) elements of the output signal port will be the set of elements of the second input signal port.

EXPAND(j IN 1, n1) tp_in1.q\[j\] = tp_out.q\[j\]

EXPAND(j IN 1, n1) tp_in1.Tk\[j\] = tp_out.Tk\[j\]

EXPAND(j IN 1, n2) tp_in2.q\[j\] = tp_out.q\[j+n1\]

EXPAND(j IN 1, n2) tp_in2.Tk\[j\] = tp_out.Tk\[j+n1\]

## 5.34 Component Th_Mux1

### 5.34.1 Description

This component is a thermal multiplexer, bringing together n thermal ports of dimension 1 into one port of dimension n.

### 5.34.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image93.png){width="0.8860411198600175in" height="0.6598184601924759in"}

### 5.34.3 Construction Parameters

  ----------------------------------------------------------------------------
  Name           Type            Default   Description
  -------------- --------------- --------- -----------------------------------
  n              CONST INTEGER   1         Outlet thermal port dimension

  ----------------------------------------------------------------------------

### 5.34.4 Ports

  ------------------------------------------------------------------------------------
  Name         Type       Parameters   Direction   Cardinality   Description
  ------------ ---------- ------------ ----------- ------------- ---------------------
  tp_in\[n\]   thermal    (n = 1)      IN          1,1           Thermal inlet ports

  tp_out       thermal    (n = n)      OUT         1,1           Thermal outlet port
  ------------------------------------------------------------------------------------

### 5.34.5 Formulation

The output signal vector is built concatenating the element of the N input ports.

EXPAND(j IN 1, n) tp_out.q\[j\] = tp_in\[j\].q\[1\]

EXPAND(j IN 1, n) tp_out.Tk\[j\] = tp_in\[j\].Tk\[1\]

## 5.35 Component T_sensor

Inherited from component CONTROL.Asensor.

### 5.35.1 Description

This component represents a temperature sensor, and it is an interface between the thermal system and the control system.

### 5.35.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image94.png){width="0.8229166666666666in" height="1.1770833333333333in"}

### 5.35.3 Construction Parameters

  ------------------------------------------------------------------------------------------------
  Name           Type            Default   Description
  -------------- --------------- --------- -------------------------------------------------------
  in             CONST INTEGER   1         Index of the item in temperature array to be measured

  n              CONST INTEGER   1         Size of the thermal port array

  n_out          CONST INTEGER   1         Dimension of outputs
  ------------------------------------------------------------------------------------------------

### 5.35.4 Ports

  ---------------------------------------------------------------------------------------
  Name      Type            Parameters    Direction   Cardinality   Description
  --------- --------------- ------------- ----------- ------------- ---------------------
  s_out     analog_signal   (n = n_out)   OUT                       Outlet signal

  tp_in     thermal         (n = n)       IN          1,1           Thermal inlet port
  ---------------------------------------------------------------------------------------

### 5.35.5 Data

  --------------------------------------------------------------------------------
  Name            Type         Default   Description                       Units
  --------------- ------------ --------- --------------------------------- -------
  Gain\[n_out\]   REAL         1         Gain                              K^-1^

  Bias\[n_out\]   REAL         0         Bias                              \-
  --------------------------------------------------------------------------------

### 5.35.6 Variables

  ------------------------------------------------------------------------------
  Name           Type          Description                             Units
  -------------- ------------- --------------------------------------- ---------
  Var\[n_out\]   REAL          Variable being measured                 K

  ------------------------------------------------------------------------------

### 5.35.7 Formulation

The value being measured is:

s_out.signal = gain · tp_in.T + bias

and it is assumed that the sensor does not produce any heat leak, so:

tp_in.q = 0

## 5.36 Component VCHP

### 5.36.1 Description

This component represents a Variable Conductance Heat pipe (VCHP) which is modelled as an assembly of five Tube components connected in the following order: Evaporator, Adiabatic tube, Condenser, Adiabatic tube and Reservoir.

VCHP behaviour is basically the same as Tube component, particularly heat enters the pipe at the Evaporator section, some of this heat is conducted away by the pipe and some is transmitted to the working fluid (here NH3), which evaporates. The resulting vapour travels along the Adiabatic tube to the cold end of the pipe and condenses in the Condenser section, rejecting heat. When the vapour transforms into liquid again this liquid returns to the evaporator due to capillary forces and the cycle is repeated.

In many cases, it is desirable to block or reduce the condenser section, so that the heat transfer characteristics of the pipe can be controlled. This can be done in a number of ways, but this model uses non-condensing gas to control the active length of condenser. The gas is stored in the section called Reservoir, and this section can be heated or cooled in order to vary the partial pressure of the gas (here N2). Because the total pressure inside the pipe is constant, if the gas pressure is increased, the vapour pressure will be reduced, therefore decreasing the active condenser length, and vice versa.

A number of assumptions have been made regarding the VCHP model:

- In a heat pipe, the working fluid is contained within the pipe wall and a thin mesh called "wick". The wick has pores to allow the fluid to escape when it evaporates, making its cross sectional area very small so any heat transfer along it can be ignored in our model.

- There is no constraint to the fluid flow.

- The Reservoir is internally wicked, as any section of a heat pipe, and in equilibrium.

- The internal pressure is uniform throughout the pipe. Hence, the vapour pressure drop along the pipe is negligible, so we can assume that the vapour temperature remains constant along the pipe.

- The pipe has a circular cross-section, although other cross-sections can be implemented by modifying the relevant data.

- The control gas behaves as an ideal gas.

- The vapour behaves as a perfect vapour, obeying in particular the Clapeyron vapour pressure law.

- Effects of convection, stratification, diffusion at the vapour-gas front are neglected, i.e. a flat vapour-gas front is assumed. This is called a flat-front model.

### 5.36.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image95.png){width="2.18125in" height="1.108695319335083in"}

### 5.36.3 Parameters

  ---------------------------------------------------------------------------------------------------
  Name     Type            Default   Description                                              Units
  -------- --------------- --------- -------------------------------------------------------- -------
  N_evap   CONST INTEGER   1         Number of nodes in evaporator                            \-

  N_ec     CONST INTEGER   1         Number of nodes in evaporator-condenser adiabatic tube   \-

  N_cond   CONST INTEGER   5         Number of nodes in condenser                             \-

  N_cr     CONST INTEGER   1         Number of nodes in condenser-reservoir adiabatic tube    \-

  N_rese   CONST INTEGER   1         Number of nodes in reservoir                             \-
  ---------------------------------------------------------------------------------------------------

### 5.36.4 Ports

  ----------------------------------------------------------------------------------
  Name      Type         Parameters     Direction   Description
  --------- ------------ -------------- ----------- --------------------------------
  tp_evap   Thermal      (n = N_evap)   OUT         Evaporator thermal outlet port

  tp_cond   Thermal      (n = N_cond)   OUT         Condenser thermal outlet port

  tp_rese   thermal      (n = N_rese)   OUT         Reservoir thermal outlet port
  ----------------------------------------------------------------------------------

### 5.36.5 Data

  --------------------------------------------------------------------------------------------------------------------------
  Name         Type            Default   Description                                                          Units
  ------------ --------------- --------- -------------------------------------------------------------------- --------------
  l_evap       REAL            1         Length of evaporator                                                 *m*

  D_o_evap     REAL            0.02      Outer diameter of evaporator                                         *m*

  D_i_evap     REAL            0.018     Inner diameter of evaporator                                         *m*

  A_vap_evap   REAL            0.0001    Vapour cross section area in evaporator                              *m2*

  mat_evap     ENUM Material   None      Material used for evaporator                                         *-*

  h_evap       REAL            1000      Vapour-tube heat transfer coefficient in evaporator                  *W/m*^2^ *K*

  l_ec         REAL            0.5       Length of adiabatic evaporator-condenser tube                        *m*

  D_o_ec       REAL            0.02      Outer diameter of adiabatic evaporator-condenser tube                *m*

  D_i_ec       REAL            0.018     Inner diameter of adiabatic evaporator-condenser tube                *m*

  A_vap_ec     REAL            0.0001    Vapour cross section area in adiabatic evaporator-condenser tube     *m*^2^

  mat_ec       ENUM Material   None      Material used for adiabatic evaporator-condenser tube                *-*

  h_ec         REAL            1000      Vapour-tube heat transfer coefficient in evaporator-condenser tube   *W/m*^2^ *K*

  l_cond       REAL            1         Length of condenser                                                  *m*

  D_o_cond     REAL            0.02      Outer diameter of condenser                                          *m*

  D_i_cond     REAL            0.018     Inner diameter of condenser                                          *m*

  A_vap_cond   REAL            0.0001    Vapour cross section area in condenser                               *m*~2~

  mat_cond     ENUM Material   None      Material used for condenser                                          *-*

  h_cond       REAL            1000      Vapour-tube heat transfer coefficient in condenser                   *W/m*^2^ *K*

  l_cr         REAL            0.1       Length of adiabatic condenser-reservoir tube                         *m*

  D_o_cr       REAL            0.02      Outer diameter of adiabatic condenser-reservoir tube                 *m*

  D_i_cr       REAL            0.018     Inner diameter of adiabatic condenser-reservoir tube                 *m*

  A_vap_cr     REAL            0.0001    Vapour cross section area in adiabatic condenser-reservoir tube      *m*^2^

  mat_cr       ENUM Material   None      Material used for adiabatic condenser-reservoir tube                 *-*

  h_cr         REAL            1000      Vapour-tube heat transfer coefficient in condenser-reservoir tube    *W/m*^2^ *K*

  l_rese       REAL            0.1       Length of reservoir                                                  *m*

  D_o_rese     REAL            0.05      Outer diameter of reservoir                                          *m*

  D_i_rese     REAL            0.048     Inner diameter of reservoir                                          *m*

  A_vap_rese   REAL            0.0005    Vapour cross section area in reservoir                               *m*^2^

  mat_rese     ENUM Material   None      Material used for reservoir                                          *-*

  h_rese       REAL            1000      Vapour-tube heat transfer coefficient in reservoir                   *W/m*^2^ *K*

  C_vap        REAL            1         Thermal capacitance of vapour                                        *J/K*

  n_gas_o      REAL            0.01      Default number of moles of gas                                       *mol*

  Design       BOOLEAN         FALSE     Flag used to set model on design or transient mode                   *-*

  l_vap_o      REAL            2         Default total vapour length for design mode                          *m*

  T_vap_o      REAL            0         Default vapour temperature for design mode                           *K*

  T_gas_o      REAL            0         Default gas temperature for design mode                              *K*
  --------------------------------------------------------------------------------------------------------------------------

### 5.36.6 Variables

  ----------------------------------------------------------------------------
  Name       Type              Description                         Units
  ---------- ----------------- ----------------------------------- -----------
  RGAS_mol   CONST REAL        Universal gas constant              *J/mol K*

  l          REAL              Total heat pipe length              *m*

  l_vap      REAL              Total vapour length                 *m*

  T_vap      REAL              Vapour temperature in pipe          *K*

  p          REAL              Total pressure in pipe              *Pa*

  n_gas      REAL              Number of moles of gas              *mol*
  ----------------------------------------------------------------------------

### 5.36.7 Formulation

The formulation used here is explained in the tube component, but there are some conditions defining this component:

The axial heat fluxes at the ends of the tube are zero, so

$$evap.tp\_ 1.q = 0$$

$$rese.tp\_ N.q = 0$$

There can be no radial heat flux at the adiabatic sections, hence:

$$adia\_ ec.tp\_ wall.q_{i} = 0,\ \forall i$$

$$adia\_ cr.tp\_ wall.q_{i} = 0,\ \forall i$$

After this, the number of ports has been reduced to three thermal type ports. One at the evaporator section, tp_evap, another at the condenser section, tp_cond, and the last one at the reservoir, tp_rese.

The temperature at all tp_fluid must be the same, $T_{vap}$, and it is calculated taking into account all heat fluxes from vapour to pipe walls:

$$C_{vap} \cdot \frac{dT_{vap}}{dt} = - (evap.tp\_ vapour.q + adia\_ ec.tp\_ vapour.q + cond.tp\_ vapour.q + adia\_ cr.tp\_ vapour.q + rese.tp\_ vapour.q)$$

The pressure at all s_p.signal must be the same, p, and it is calculated using $P_{sat}$ as a function of vapour temperature, $T_{vap}$.

In addition, a certain number of flags have been included to inform about vapour-gas front position, then a warning message is displayed when vapour-gas front goes out of the condenser section indicating in which section it is.

## 5.37 Component View_Factors

### 5.37.1 Description

The component type, named View_Factors represents a module that calculates the radiative heat transfer among the nodes by means of the view factors.

### 5.37.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image96.png){width="1.46875in" height="1.5520833333333333in"}

### 5.37.3 Construction Parameters

  -------------------------------------------------------------------------------------------
  Name     Type        Default   Description                                          Units
  -------- ----------- --------- ---------------------------------------------------- -------
  nports   INTEGER     2         Number of thermal ports connected by the component   \-

  -------------------------------------------------------------------------------------------

### 5.37.4 Ports

  -----------------------------------------------------------------------------------------
  Name              Type      Parameters   Direction   Cardinality   Description
  ----------------- --------- ------------ ----------- ------------- ----------------------
  tp_in\[nports\]   thermal   (n = 1)      IN          \[0, 1\]      Thermal inlet port

  -----------------------------------------------------------------------------------------

### 5.37.5 Data

  ---------------------------------------------------------------------------------------------------------------
  Name                   Type     Default   Description                                                   Units
  ---------------------- -------- --------- ------------------------------------------------------------- -------
  VF\[nports, nports\]   REAL               Array of view factors for each coupling between port arrays   \-

  e\[nports\]            REAL               Emissivity                                                    \-

  A\[nports\]            REAL               Area                                                          m^2^
  ---------------------------------------------------------------------------------------------------------------

### 5.37.6 Variables

  --------------------------------------------------------------------------------------------------------------
  Name                   Type    Description                                                            Units
  ---------------------- ------- ---------------------------------------------------------------------- --------
  r\[nports\]            REAL    Reflectivity of each node                                              \-

  B\[nports, nports\]    REAL    Radiative interchange factor for each GR coupling                      \-

  GR\[nports, nports\]   REAL    Characteristic value of the radiative conductor for each GR coupling   m^2^

  Q\[nports, nports\]    REAL    Radiative Heat transfer between two nodes                              W

  Tk\[nports\]           REAL    Node absolute temperature                                              K
  --------------------------------------------------------------------------------------------------------------

### 5.37.7 Formulation

This component calculated the radiative heat flux between the nodes by means of the data of view factors. The sequence of calculation is the following:

First the radiative interchange factors are calculated:

$$\left| B_{i,j} \right| = \left| {r_{j}F}_{i,j} \right| \cdot \left| B_{i,j} \right| + \left| e_{j}F_{i,j} \right|$$

where:

$B_{i,j}$: Radiative interchange factor for each node coupling

$F_{i,j}$: View factor for each node coupling

$e_{j}$: Emissivity of each node

$r_{j}$: Reflectivity of each node

After that, the radiative exchange factors are calculated with the following expression:

$$GR_{i,j} = A_{i} \cdot B_{i,j} \cdot e_{j}$$

where:

$GR_{i,j}$: Radiative exchange factor for each coupling

$A_{i}$: Area of the first node of the coupling

$e_{j}$: Emissivity of the first node of the coupling

Finally the radiative heat flux between each pair of nodes is calculated in the following way:

$$Q_{i,j} = {GR}_{i,j} \cdot \sigma \cdot \left( T_{i}^{4} - T_{j}^{4} \right)$$

Where $T_{i}^{}$ and $T_{j}^{}$ are the absolute temperature of the nodes which forms the coupling and $Q_{i,j}$ is the radiative heat flux between these nodes.

**Ports Equations**

The equations in the ports are the following:

$$tp\_ in.q_{i} = \sum_{j = 1}^{nports}Q_{i,j}$$

$$T_{i} = tp\_ in.T_{i}$$

## 5.38 Component Wall

### 5.38.1 Description

Defines a wall component divided into a number of nodes.

### 5.38.2 Symbol

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image97.png){width="1.6064610673665791in" height="1.5272189413823272in"}

### 5.38.3 Construction Parameters

  -----------------------------------------------------------------------------------
  Name    Type            Default   Description                              Units
  ------- --------------- --------- ---------------------------------------- --------
  n       CONST INTEGER   1         Dimension of thermal port                \-

  nodes   CONST INTEGER   1         Number of nodes of wall discretisation   \-
  -----------------------------------------------------------------------------------

### 5.38.4 Ports

  --------------------------------------------------------------------------------
  Name     Type       Parameters   Direction   Cardinality   Description
  -------- ---------- ------------ ----------- ------------- ---------------------
  tp_in    thermal    (n = n)      IN                        Thermal inlet port

  tp_out   thermal    (n = n)      OUT                       Thermal outlet port
  --------------------------------------------------------------------------------

### 5.38.5 Data

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Name                    Type                  Default         Description                                                                                     Units
  ----------------------- --------------------- --------------- ----------------------------------------------------------------------------------------------- -----------
  A                       REAL                  1               Area of the wall                                                                                *m*^2^

  e                       REAL                  0.1             Wall thickness                                                                                  *M*

  mat                     ENUM Material         None            Material (see Section)                                                                          *-*

  k                       REAL                  0.1             Thermal conductivity of the wall material (only applies if mat = None)                          *W/m K*

  rho                     REAL                  1000            Density of the wall material (only applies if mat = None)                                       *kg/m*^3^

  cp                      REAL                  500             Specific heat of the wall material (only applies if mat = None)                                 *J/kg K*

  TemperatureDependance   BOOLEAN               TRUE            Flag to consider temperature dependence of the material properties                              

  init_mode               ENUM WALL_INIT_MODE   Constant_Temp   Option for the initiliazation of the nodal temperatures                                         

  To                      REAL                  290             Initial temperature of nodes                                                                    *K*

  To_linear\[2\]          REAL                  {290,290}       Initial temperatures at both side if init_mode = Linear_Temp                                    *K*

  To_table                TABLE_1D                              Table with initial wall temperature versus non-dimensional position if init_mode = Table_Temp   
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Input data cp, k and rho will be used only if "mat" = None. If not, the properties will be interpolated using the corresponding data file.

### 5.38.6 Variables

  -----------------------------------------------------------------------------------------------------
  Name                Type         Description                                              Units
  ------------------- ------------ -------------------------------------------------------- -----------
  Asme_DT1            REAL         Linear gradient temperature                              *K*

  Asme_DT2            REAL         Non linear gradient temperature                          *K*

  Asme_T_ave          REAL         Average temperature                                      *K*

  F                   CONST REAL   Thermal capacity ratio assigned to the surface (ports)   *-*

  k_var \[nodes+2\]   REAL         Conductivity of wall material                            *W/m K*

  rho_var             REAL         Density of wall material                                 *kg/m*^3^

  cp_var\[nodes+2\]   REAL         Specific heat of wall material                           *J/kg*

  dx                  REAL         Node width or nodal distance                             *m*

  T\[nodes + 2\]      REAL         Nodal temperatures                                       *K*

  q\[nodes + 1\]      REAL         Heat flow through nodes                                  *W*

  icpk\[nodes2\]      INTEGER      Last table position in cp calculation                    

  ito                 INTEGER      Pointer to time interval for To in Property Tables       
  -----------------------------------------------------------------------------------------------------

### 5.38.7 Topology

PATH tp_in TO tp_out

### 5.38.8 Formulation

**Nodalisation**

The wall is divided into a number "nodes" of slabs. The array of temperatures contains the temperatures at the mid-points of each slab plus the surface temperature at both sides. The array of heat flows contains the heat flows between slabs plus the heat flows at both sides:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image98.png){width="4.5133136482939635in" height="1.914841426071741in"}

**Initialisation**

The data named init_mode allows the user to specify the initial temperature distribution in the nodes. There are three options::

- Uniform initial temperature for all the nodes (init_mode = Constant_Temp)

- Linear initial temperature distribution in the wall (init_mode = Linear_Temp)

- Initial temperature distribution given by a data table of the initial temperature as a function of the non-dimensional position in the wall (init_mode = Table_Temp)

**Heat flows**

The heat flows between the thermal nodes are calculated as follows:

$$q_{i} = \frac{k_{var\ i} \cdot k_{var\ i + 1}}{\frac{k_{var\ i} + k_{var\ i + 1}}{2}} \cdot A \cdot \frac{\left( T_{i} - T_{i + 1} \right)}{\frac{e}{nodes}}\ \ for\ i\ in\ 2,nodes$$

$$q_{1} = k_{var\ 2} \cdot A \cdot \frac{\left( T_{1} - T_{2} \right)}{\frac{\frac{e}{nodes}}{2}}$$

$$q_{nodes + 1} = k_{var\ nodes + 1} \cdot A \cdot \frac{\left( T_{nodes + 1} - T_{nodes + 2} \right)}{\frac{\frac{e}{nodes}}{2}}$$

**Energy Balance**

For all the internal nodes:

$$\rho \cdot cp_{i} \cdot A \cdot \frac{e}{n} \cdot \left( 1 - \frac{F}{nodes} \right)\frac{dT_{i}}{dt} = q_{i - 1} - q_{i\ }\ for\ all\ i\ in\ 2,n + 1$$

For the nodes associated to the ports:

$$\rho \cdot cp_{1} \cdot A \cdot \frac{e}{n} \cdot \left( \frac{F}{2} \right)\frac{dT_{1}}{dt} = {\sum_{i = 1}^{n}{tp\_ in.}q}_{i} - q_{1\ }$$

$$\rho \cdot cp_{nodes + 2} \cdot A \cdot \frac{e}{n} \cdot \left( \frac{F}{2} \right)\frac{dT_{nodes + 2}}{dt} = q_{nodes + 1} - {\sum_{i = 1}^{n}{tp\_ out.}q}_{i}$$

**Ports Equations**

The temperatures of the thermal ports are:

$$tp\_ in.{Tk}_{i} = T_{1}\ for\ i\ in\ 1,n$$

$$tp\_ out.{Tk}_{i} = T_{n + 2}\ for\ i\ in\ 1,n$$

# 6 Functions

These functions provide some complementary functionalities for the calculation of many different values as explained below.

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Name                         Description
  ---------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------
  Bmax                         It calculates the maximum value between two input values

  Bmix                         It calculates the minimum value between two input values

  Lvap                         It calculates the vapour longitude in a tube containing a certain number of moles of non-condensing gas and vapour

  NusseltCeiling               It calculates the Nusselt number of a downward facing plate

  NusseltCylinder              It computes the natural convection correlation for a horizontal cylinder

  NusseltFloor                 It calculates the Nusselt number of a upward facing plate

  NusseltWall                  It calculates the Nusselt number of a vertical plate

  NusseltWireHorizontal        It calculates the Nusselt number for a horizontal wire

  NusseltWireVertical          It calculates the Nusselt number for a vertical wire

  Psat                         It calculates NH~3~ vapour pressure as a function of temperature

  FunConstSolidProp            It returns the value of a constant physical property of a material reading it from a text file

  FunVarSolidProp              It returns the value of a temperature dependant physical property of a material reading it from a data text file

  Ty_integ                     It returns calculates the integral of y \* T(y) between the limits y1 and y2 assuming T(y) has a linear behaviour between (y1,T1) and (y2, T2).

  fun_Wall_Thermal_Gradients   It returns the value of the temperature gradient
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 6.1 Function Bmax

### 6.1.1 Description

This function, named Bmax calculates the maximum temperature between two temperatures and stores the value in the variable xmax.

### 6.1.2 Arguments

  --------------------------------------------------------------------------------------------------------------------
  Name     Type         Description                                                                            Units
  -------- ------------ -------------------------------------------------------------------------------------- -------
  xmax     OUT REAL     Variable where the value of the maximum temperature along the simulation is stored     *K*

  x        IN REAL      Variable that represents the value of the temperature at each communication interval   *K*
  --------------------------------------------------------------------------------------------------------------------

### 6.1.3 Return Value

This function returns the value of 0. It is a way to give back the control.

### 6.1.4 Error Messages

None.

### 6.1.5 Formulation

The function calculates the maximum value between the last maximum value of temperature, x~max~, and the present value of temperature, x, in the node. Then the maximum value is stored in x~max~.

$$x_{\max} = max(x_{\max},x)$$

## 6.2 Function Bmin

### 6.2.1 Description

This function, named Bmin, calculates the minimum temperature between two temperatures and stores the value in the variable xmin.

### 6.2.2 Arguments

  ---------------------------------------------------------------------------------------------------------------------
  Name      Type         Description                                                                            Units
  --------- ------------ -------------------------------------------------------------------------------------- -------
  xmin      OUT REAL     Variable where the value of the minimum temperature along the simulation is stored     *K*

  x         IN REAL      Variable that represents the value of the temperature at each communication interval   *K*
  ---------------------------------------------------------------------------------------------------------------------

### 6.2.3 Return Value

This function returns 0. It is a way to give back the control.

### 6.2.4 Error Messages

None.

### 6.2.5 Formulation

The function calculates the minimum value between the last minimum value of temperature, x~min~, and the present value of temperature, x, in the node. Then the minimum value is stored in x~min~.

$$x_{\min} = min(x_{\min},x)$$

## 6.3 Function Lvap

### 6.3.1 Description

This function, named Lvap calculates the vapour longitude in a tube containing a certain number of moles of non-condensing gas and vapour. In addition, Lvap returns as output parameters the vapour-fluid moles ratio at each node used to determine the active length at each tube section for vapour-wall heat exchange evaluation and the remaining number of gas moles if tube is filled.

### 6.3.2 Arguments

  -------------------------------------------------------------------------------
  Name        Type         Description                                   Units
  ----------- ------------ --------------------------------------------- --------
  N           IN INTEGER   Number of nodes                               *-*

  l           IN REAL      Length of tube                                *m*

  A           IN REAL      Cross sectional inner area of tube            *m*^2^

  n_gas_in    IN REAL      Number of moles of gas at inlet node          *mol*

  p           IN REAL      Total pressure in tube                        *Pa*

  T\[N\]      IN REAL      Temperature of gas at each node               *K*

  chi\[N\]    OUT REAL     Vapour-gas moles ratio at each node section   *-*

  n_gas_out   OUT REAL     Number of moles of gas at outlet node         *mol*
  -------------------------------------------------------------------------------

### 6.3.3 Variables

  ----------------------------------------------------------------------------------------------
  Name        Type         Description                                               Units
  ----------- ------------ --------------------------------------------------------- -----------
  RGAS_mol    CONST REAL   Universal gas constant                                    *J/mol K*

  dx          REAL         Node length                                               *m*

  j           INTEGER      Auxiliary variable used to detect vapour/gas-front node   *-*

  l_vap       REAL         Vapour length measured from the start of the tube         *m*

  n_gas       REAL         Total number of moles of gas                              *mol*

  ngas\[N\]   REAL         Number of moles of gas in j-node for fully filled node    *mol*
  ----------------------------------------------------------------------------------------------

### 6.3.4 Return Value

This function returns the value of l_vap variable.

### 6.3.5 Error Messages

None.

### 6.3.6 Formulation

The formulation in this function is structured in three cases depending on the number of gas moles at the inlet node:

Number of non-condensing gas moles at input node is zero. Then tube is empty and variables are calculated as shown below:

$$\varepsilon_{i} = 0,\ \forall i$$

$$n_{out} = 0$$

$$l_{vap} = 1$$

Number of non-condensing gas moles at the input node are sufficient to fill the tube completely. Then tube is fully filled and variables are calculated as shown below, where n~tube~ is the total number of gas moles in tube:

$$\varepsilon_{i} = 1,\ \forall i$$

$$n_{out} = n_{in} - n_{tube}$$

$$l_{vap} = 0$$

Number of gas moles at input node only fills tube partially. Then it is necessary to evaluate in which section the vapour-gas front is, supposed j-node, and what the vapour-fluid moles ratio in this section is:

$$\begin{matrix}
\varepsilon_{i} = 1 & ,\ i < j \\
\varepsilon_{i} = \frac{\sum_{i = 1}^{j}{n_{i} - n_{in}}}{n_{j}} & ,i = j \\
\varepsilon_{i} = 0 & ,i > j
\end{matrix}$$

$$\ \ n_{out} = 0$$

$$\ \ l_{vap} = \left( (j - 1) + \varepsilon_{j} \right) \cdot dx$$

## 6.4 Function NusseltCeiling

### 6.4.1 Description

This function named NusseltCeiling calculates the natural convection correlation for a downward facing plate, i.e. the fluid is placed under the plate.

### 6.4.2 Arguments

  -------------------------------------------------------------------------
  Name     Type         Description                                 Units
  -------- ------------ ------------------------------------------- -------
  Ra       REAL         Rayleigh Number                             *-*

  Ts       REAL         Solid temperature                           *K*

  Tf       REAL         Fluid Temperature                           *K*
  -------------------------------------------------------------------------

### 6.4.3 Variables

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Name                       Type       Description                                                                                                           Units
  -------------------------- ---------- --------------------------------------------------------------------------------------------------------------------- -------
  Nu                         REAL       Nusselt number                                                                                                        *-*

  Nu1                        REAL       Nusselt number for first interval                                                                                     *-*

  Nu2                        REAL       Nusselt number for second interval                                                                                    *-*

  limit1                     REAL       Limit for natural convection correlation                                                                              

  limit2                     REAL       Limit for natural convection correlation                                                                              

  limit3                     REAL       Limit for natural convection correlation                                                                              

  upper_limit_correlation1   REAL       Absolute upper limit for correlation when the temperature of the plate is lower than the temperature of the fluid     

  upper_limit_correlation2   REAL       Absolute upper limit for correlation when the temperature of the plate is greater than the temperature of the fluid   
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 6.4.4 Return Value

This function returns the value of the Nusselt number

### 6.4.5 Error Messages

IF Ts\>Tf THEN

ASSERT (Ra \<upper_limit_correlation2) WARNING \"Raleigh Number in Natural Convection Correlation for Ceiling is out of limit\"

ELSE

ASSERT (Ra \<upper_limit_correlation1) WARNING \"Raleigh Number in Natural Convection Correlation for Ceiling is out of limit\"

By default the value of variable setRaleighWarnings is 1 that means the validity range of the function is checked.

### 6.4.6 Formulation

The function calculates the Nusselt number for a downward facing plate.

If the temperature of the plate is greater than the temperature of the fluid, then the correlation applied is the following:

$$Nu = 0.27 \cdot {Ra}^{1/4}$$

However, if the temperature of the plate is lower than the temperature of the fluid, then the following correlations are applied depending on the value of the Rayleigh number:

$$\begin{matrix}
\begin{matrix}
Nu = 0.96 \cdot {Ra}^{1/6} & 1 < Ra < 200 \\
Nu = 0.59 \cdot {Ra}^{1/4} & 200 < Ra < 10^{4} \\
Nu = 0.54 \cdot {Ra}^{1/4} & 2.2*10^{4} < Ra < 8*10^{6}
\end{matrix} \\
\begin{matrix}
Nu = 0.15 \cdot {Ra}^{1/3} & 8*10^{6} < Ra < 
\end{matrix}1*10^{11}
\end{matrix}$$

## 6.5 Function NusseltCylinder

### 6.5.1 Description

This function named NusseltCylinder computes the natural convection correlation for a horizontal cylinder.

### 6.5.2 Arguments

  -------------------------------------------------------------------------
  Name     Type         Description                                 Units
  -------- ------------ ------------------------------------------- -------
  Pr       REAL         Prandtl Number                              *-*

  Ra       REAL         Rayleigh Number                             *-*
  -------------------------------------------------------------------------

### 6.5.3 Variables

  ----------------------------------------------------------------------------------------
  Name                       Type       Description                                Units
  -------------------------- ---------- ------------------------------------------ -------
  Nu                         REAL       Nusselt number                             *-*

  lower_limit_correlation    REAL       Lower limit for the correlation validity   *-*

  upper_limit_correlation2   REAL       Upper limit for the correlation validity   *-*
  ----------------------------------------------------------------------------------------

### 6.5.4 Return Value

This function returns the value of the Nusselt number for a horizontal cylinder

### 6.5.5 Error Messages

ASSERT (Ra \<= upper_limit_correlation) WARNING \"Raleigh Number in Natural Convection Correlation for Cylinder is out of upper limit\"

ASSERT (Ra \>= lower_limit_correlation) WARNING \"Raleigh Number in Natural Convection Correlation for Cylinder is out of lower limit\"

### 6.5.6 Formulation

The function calculates the Nusselt number for a horizontal cylinder using the following correlation.

$$Nu = \begin{matrix}
\left\{ 0.6 + \frac{0.387 \cdot {Ra}^{1/6}}{\left\lbrack 1 + \left( \frac{0.559}{\Pr} \right)^{9/16} \right\rbrack^{8/27}} \right\} & 10^{9} < Ra < 10^{13}
\end{matrix}$$

## 6.6 Function NusseltFloor

### 6.6.1 Description

This function named NusseltFloor calculates the natural convection correlation for a upward facing plate, i.e. the fluid is placed over the plate.

### 6.6.2 Arguments

  -------------------------------------------------------------------------
  Name     Type         Description                                 Units
  -------- ------------ ------------------------------------------- -------
  Ra       REAL         Rayleigh Number                             *-*

  Ts       REAL         Solid temperature                           *K*

  Tf       REAL         Fluid Temperature                           *K*
  -------------------------------------------------------------------------

### 6.6.3 Variables

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  Name                       Type     Description                                                                                                           Units
  -------------------------- -------- --------------------------------------------------------------------------------------------------------------------- -------
  Nu                         REAL     Nusselt number                                                                                                        *-*

  Nu1                        REAL     Nusselt number for first interval                                                                                     *-*

  Nu2                        REAL     Nusselt number for second interval                                                                                    *-*

  limit1                     REAL     Limit for natural convection correlation                                                                              

  limit2                     REAL     Limit for natural convection correlation                                                                              

  limit3                     REAL     Limit for natural convection correlation                                                                              

  upper_limit_correlation1   REAL     Absolute upper limit for correlation when the temperature of the plate is lower than the temperature of the fluid     

  upper_limit_correlation2   REAL     Absolute upper limit for correlation when the temperature of the plate is greater than the temperature of the fluid   
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------

### 6.6.4 Return Value

This function returns the value of the Nusselt number for a upward facing plate

### 6.6.5 Error Messages

IF Ts\<Tf THEN

ASSERT (Ra \<upper_limit_correlation2 OR setRaleighWarnings==0) WARNING \"Raleigh Number in Natural Convection Correlation for Floor is out of limit\"

Nu = 0.27\*Ra\*\*(1./4.)

ELSE

ASSERT (Ra \<upper_limit_correlation1 OR setRaleighWarnings==0) WARNING \"Raleigh Number in Natural Convection Correlation for Floor is out of limit\"

By default the value of variable setRaleighWarnings is 1 that means the validity range of the function is checked.

### 6.6.6 Formulation

The function calculates the Nusselt number for a upward facing plate.

If the temperature of the plate is lower than the temperature of the fluid, then the correlation applied is the following:

$$Nu = 0.27 \cdot {Ra}^{1/4}$$

However, if the temperature of the plate is greater than the temperature of the fluid, then the following correlations are applied depending on the value of the Rayleigh number:

$$\begin{matrix}
\begin{matrix}
Nu = 0.96 \cdot {Ra}^{1/6} & 1 < Ra < 200 \\
Nu = 0.59 \cdot {Ra}^{1/4} & 200 < Ra < 10^{4} \\
Nu = 0.54 \cdot {Ra}^{1/4} & 2.2*10^{4} < Ra < 8*10^{6}
\end{matrix} \\
\begin{matrix}
Nu = 0.15 \cdot {Ra}^{1/3} & 8*10^{6} < Ra < 
\end{matrix}1*10^{11}
\end{matrix}$$

## 6.7 Function NusseltWall

### 6.7.1 Description

This function named NusseltWall calculates the natural convection correlation for a vertical plate (a wall).

### 6.7.2 Arguments

  -------------------------------------------------------------------------
  Name     Type         Description                                 Units
  -------- ------------ ------------------------------------------- -------
  Pr       REAL         Prandtl Number                              *-*

  Ra       REAL         Rayleigh Number                             *-*
  -------------------------------------------------------------------------

### 6.7.3 Variables

  ----------------------------------------------------------------------------------------
  Name                      Type        Description                                Units
  ------------------------- ----------- ------------------------------------------ -------
  Nu                        REAL        Nusselt number                             *-*

  Nu1                       REAL        Nusselt number for first interval          *-*

  Nu2                       REAL        Nusselt number for second interval         *-*

  limit                     REAL        Limit for natural convection correlation   

  deviation                 REAL                                                   

  upper_limit_correlation   REAL        Upper limit for correlation validity       
  ----------------------------------------------------------------------------------------

### 6.7.4 Return Value

This function returns the value of the Nusselt number for a vertical plate.

### 6.7.5 Error Messages

ASSERT (Ra \<upper_limit_correlation OR setRaleighWarnings==0) WARNING \"Raleigh Number in Natural Convection Correlation for Wall is out of limit\"

By default the value of variable setRaleighWarnings is 1 that means the validity range of the function is checked.

### 6.7.6 Formulation

The function calculates the Nusselt number for a vertical plate using the following correlations as a function of the Rayleigh number:

$$Nu = \begin{matrix}
\left\{ 0.68 + \frac{0.67 \cdot {Ra}^{1/4}}{\left\lbrack 1 + \left( \frac{0.492}{\Pr} \right)^{9/16} \right\rbrack^{4/9}} \right\} & 10^{- 1} < Ra < 10^{9}
\end{matrix}$$

$$Nu = \begin{matrix}
\left\{ 0.825 + \frac{0.387 \cdot {Ra}^{1/6}}{\left\lbrack 1 + \left( \frac{0.492}{\Pr} \right)^{9/16} \right\rbrack^{8/27}} \right\} & 10^{9} < Ra < 10^{12}
\end{matrix}$$

## 6.8 Function NusseltWireHorizontal

### 6.8.1 Description

This function named NusseltWireHorizontal computes the natural convection correlation for a horizontal wire.

### 6.8.2 Arguments

  -------------------------------------------------------------------------
  Name     Type         Description                                 Units
  -------- ------------ ------------------------------------------- -------
  Pr       REAL         Prandtl Number                              *-*

  Ra       REAL         Rayleigh Number                             *-*
  -------------------------------------------------------------------------

### 6.8.3 Variables

  ------------------------------------------------------------------------------------
  Name                      Type        Description                            Units
  ------------------------- ----------- -------------------------------------- -------
  Nu                        REAL        Nusselt number                         *-*

  c                         REAL        Calculated parameter                   *-*

  n                         REAL        Calculated exponent                    *-*

  lower_limit_correlation   REAL        Lower limit for correlation validity   

  upper_limit_correlation   REAL        Upper limit for correlation validity   
  ------------------------------------------------------------------------------------

### 6.8.4 Return Value

This function returns the value of the Nusselt number for a horizontal wire.

### 6.8.5 Error Messages

ASSERT (Ra \<= upper_limit_correlation) WARNING \"Raleigh Number in Natural Convection Correlation for Horizontal Wire is out of upper limit\"

ASSERT (Ra \>= lower_limit_correlation) WARNING \"Raleigh Number in Natural Convection Correlation for Horizontal Wire is out of lower limit\"

### 6.8.6 Formulation

The function calculates the Nusselt number for a horizontal wire:

$$\begin{matrix}
\frac{2}{Nu} = ln\left( 1 + \frac{3.3}{c \cdot Ra^{n}} \right) & 10^{- 8} < Ra < 10^{6}
\end{matrix}$$

where c and n is calculated as follows:

$$c = \frac{0.671}{\left\lbrack 1 + \left( \frac{0.492}{\Pr} \right)^{9/16} \right\rbrack^{4/9}}$$

$$n = 0.25 + \frac{1}{10 + 5 \cdot Ra^{0.175}}$$

## 6.9 Function NusseltWireVertical

### 6.9.1 Description

This function named NusseltWireVertical computes the natural convection correlation for a vertical wire.

### 6.9.2 Arguments

  -------------------------------------------------------------------------
  Name     Type         Description                                 Units
  -------- ------------ ------------------------------------------- -------
  Pr       REAL         Prandtl Number                              *-*

  Ra       REAL         Rayleigh Number                             *-*

  d        REAL         Diameter                                    *m*

  L        REAL         Length of the wire                          *m*
  -------------------------------------------------------------------------

### 6.9.3 Variables

  ------------------------------------------------------------------------------------
  Name                      Type        Description                            Units
  ------------------------- ----------- -------------------------------------- -------
  Nu                        REAL        Nusselt number                         *-*

  c                         REAL        Calculated parameter                   *-*

  n                         REAL        Calculated exponent                    *-*

  lower_limit_correlation   REAL        Lower limit for correlation validity   
  ------------------------------------------------------------------------------------

### 6.9.4 Return Value

This function returns the value of the Nusselt number for a vertical wire.

### 6.9.5 Error Messages

ASSERT (c\*(Ra\*d/L)\*\*0.25 \> lower_limit_correlation) WARNING \"Raleigh Number in Natural Convection Correlation for Vertical Wire is out of lower limit\"

### 6.9.6 Formulation

The function calculates the Nusselt number for a vertical wire:

$$Nu\begin{matrix}
 = c \cdot \left( Ra \cdot \frac{D}{L} \right)^{0.25} + 0.763 \cdot c^{1/6} \cdot \left( Ra \cdot \frac{D}{L} \right)^{1/24} & \begin{matrix}
 & & c \cdot \left( Ra \cdot \frac{D}{L} \right)^{0.25} > 2*10^{- 3}
\end{matrix}
\end{matrix}$$

where c and n is calculated as follows:

$$c = \frac{0.671}{\left\lbrack 1 + \left( \frac{0.492}{\Pr} \right)^{9/16} \right\rbrack^{4/9}}$$

$$n = 0.25 + \frac{1}{10 + 5 \cdot Ra^{0.175}}$$

And D and L are the diameter and the length of the wire respectively.

## 6.10 Function Psat

### 6.10.1 Description

This function, named Psat calculates the pressure of NH~3~ vapour as a function of vapour temperature using a polynomial of 7th order.

### 6.10.2 Arguments

  ------------------------------------------------------------------------
  Name      Type          Description                           Units
  --------- ------------- ------------------------------------- ----------
  T         IN REAL       Temperature of NH3                    K

  ------------------------------------------------------------------------

### 6.10.3 Return Value

This function returns the value of NH~3~ vapour pressure in Pa at temperature T.

### 6.10.4 Error Messages

None.

### 6.10.5 Formulation

The expression used to evaluate NH3 pressure is:

$$p_{var} = 4.283253 \cdot 10^{5} + 1.598058 \cdot 10^{4} \cdot T_{vap} + 2.371318 \cdot 10^{2} \cdot T_{vap}^{2} + 1.616482 \cdot T_{vap}^{3} + 2.325724 \cdot 10^{- 3} \cdot T_{vap}^{4} - 1.272831 \cdot 10^{- 5} \cdot T_{vap}^{5} + 1.313368 \cdot 10^{- 7} \cdot T_{vap}^{6}$$

where $T_{vap}$ is expressed in ºC

## 6.11 Function FunConstSolidProp

### 6.11.1 Description

This function named FunConstSolidProp returns the value of a constant physical property of a material reading it from a text file.

### 6.11.2 Arguments

  -----------------------------------------------------------------------------
  Name     Type             Description                                 Units
  -------- ---------------- ------------------------------------------- -------
  mat      ENUM Material    Material                                    *-*

  prop     ENUM PropSolid   Property                                    *-*

  v_None   REAL             Value of the property if Material = None    *-*
  -----------------------------------------------------------------------------

### 6.11.3 Variables

  --------------------------------------------------------------------------
  Name             Type        Description                           Units
  ---------------- ----------- ------------------------------------- -------
  v                REAL        Output value                          *-*

  ier              INTEGER     Error identifier                      *-*
  --------------------------------------------------------------------------

### 6.11.4 Return Value

This function returns the value of the constant physical property defined by the function parameter \"prop\" of the material defined by the function parameter \"mat\".

### 6.11.5 Error Messages

IF (ier != 0) THEN

PRINT(\"\*\*\*\*Error: Problems with Table of Properties for material \$mat\")

PRINT(\" Error code ier = \$ier\")

END IF

ASSERT(ier == 0) FATAL \"Execution aborted: Table for Solid Properties not found or wrong\"

### 6.11.6 Formulation

If the parameter mat is equal to \"None\" then the value returned by the function is equal to the parameter v_None.

If the user has specified a material, then the function calls the EL function get_const_prop_from_file in order to read the property defined in the parameter prop from the corresponding text file.

v = get_const_prop_from_file(path_tables,Mat_internal_name\[mat\],IdProp\[prop\],IdMat\[mat\],ier)

## 6.12 Function FunVarSolidProp

### 6.12.1 Description

This function named FunVarSolidProp returns the value of a temperature dependant physical property of a material reading it from a data text file.

### 6.12.2 Arguments

  ----------------------------------------------------------------------------------------------------
  Name           Type                Description                                               Units
  -------------- ------------------- --------------------------------------------------------- -------
  mat            IN ENUM Material    Material                                                  *-*

  prop           IN ENUM PropSolid   Property                                                  *-*

  Tk             IN REAL             Temperature                                               *K*

  v_None         IN REAL             Value of the property if Material = None                  *-*

  itab_pointer   OUT INTEGER         Pointer to last table interval for speed up calculation   *-*
  ----------------------------------------------------------------------------------------------------

### 6.12.3 Variables

  --------------------------------------------------------------------------
  Name             Type        Description                           Units
  ---------------- ----------- ------------------------------------- -------
  tab              TABLE_1D    Table of properties                   

  Tmin             REAL        Minimum temperature range             *K*

  Tmax             REAL        Maximum temperature range             *K*

  v                REAL        Output value                          *-*

  ier              INTEGER     Error identifier                      *-*
  --------------------------------------------------------------------------

### 6.12.4 Return Value

This function returns the value of the physical property defined by the input parameter \"prop\" of the material defined by the input parameter \"mat\" as function of the temperature.

### 6.12.5 Error Messages

IF (ier != 0) THEN

PRINT(\"\*\*\*\*Error: Problems with Table of Properties for material \$mat\")

END IF

ASSERT(ier == 0) FATAL \"Execution aborted: Table for Solid Properties not found or wrong\"

IF(Tk \< T_min) THEN

IF(ier_mi\[mat\] == 0)THEN

WRITE(\"\\n \*\*\*\* Material: %s. Temperature (%g) below minimum range: %g\\n\\n\", Mat_internal_name\[mat\],Tk,T_min)

END IF

END IF

IF(Tk \> T_max) THEN

IF(ier_ma\[mat\] == 0)THEN

WRITE(\"\\n \*\*\*\* Material: %s. Temperature (%g) above maximum range: %g\\n\\n\", Mat_internal_name\[mat\],Tk,T_max)

END IF

END IF

### 6.12.6 Formulation

If the parameter mat is equal to \"None\" then the value returned by the function is equal to the parameter v_None.

If the user has specified a material, then the function calls the EL function get_table_prop_from_file in order to read the data table of the property as a function of the temperature (TABLE_1D).

get_table_prop_from_file(path_tables, Mat_internal_name\[mat\], IdProp\[prop\], tab, T_min,T_max, IdMat\[mat\], ier)

Then the EL function called \"linearInterpHist1D) is called in order to calculate the value of the property at specified temperature interpolating in the data table.

v = linearInterpHist1D(tab, Tk, itab_pointer)

## 6.13 Function Ty_integ

### 6.13.1 Description

This function named Ty_integ returns calculates the integral of y \* T(y) between the limits y1 and y2 assuming T(y) has a linear behaviour between (y1,T1) and (y2, T2).

### 6.13.2 Arguments

  -------------------------------------------------------------------------
  Name     Type         Description                                 Units
  -------- ------------ ------------------------------------------- -------
  T1       IN REAL      Temperature at point 1                      *K-*

  T2       IN REAL      Temperature at point 2                      *K*

  y1       IN REAL      Position at point 1                         *-*

  y2       IN REAL      Position at point 2                         *-*
  -------------------------------------------------------------------------

### 6.13.3 Variables

  --------------------------------------------------------------------------------------------
  Name             Type        Description                                             Units
  ---------------- ----------- ------------------------------------------------------- -------
  alpha            REAL        Slope of the function T(y) in the interval considered   *-*

  integ            REAL        Value of the integral                                   *-*
  --------------------------------------------------------------------------------------------

### 6.13.4 Return Value

This function returns the value of the integral of the following function y \* T(y).

### 6.13.5 Error Messages

None

### 6.13.6 Formulation

Considering that the function T(y) has a linear behaviour between (y1,T1) and (y2, T2), the integral of the function (y \* T(y)) is computed as follows:

$$\int_{y1}^{y2}{T(y) \cdot y \cdot dy = \frac{T_{1}\left( y_{2}^{2} - y_{1}^{2} \right)}{2} + \alpha \cdot \left( \frac{y_{2}^{3}}{3} + \frac{y_{2}^{2} \cdot y_{1}}{2} + \frac{y_{1}^{3}}{6} \right)}$$

where α is equal to:

$$\alpha = \frac{T_{2} - T_{1}}{y_{2} - y_{1}}$$

And the function T(y) in the interval \[y1, y2\] is equal to:

$$T(y) = \alpha \cdot \left( y - y_{1} \right) + T_{1}$$

## 6.14 Function fun_Wall_Thermal_Gradients

### 6.14.1 Description

This function named fun_Wall_Thermal_Gradients returns the value of the temperature gradient

### 6.14.2 Arguments

  -----------------------------------------------------------------------------
  Name         Type         Description                                 Units
  ------------ ------------ ------------------------------------------- -------
  nodes        IN INTEGER   Number of nodes                             *-*

  T\[nodes\]   IN REAL      Nodal temperatures                          *K-*

  e            IN REAL      Wall thickness                              *m*

  T_ave        OUT REAL     Average temperature                         *K*

  DT1          OUT REAL     Linear thermal gradient                     *K*

  DT2          OUT REAL     Linear thermal gradient                     *K*
  -----------------------------------------------------------------------------

### 6.14.3 Variables

### 6.14.4 Return Value

None

### 6.14.5 Error Messages

None

### 6.14.6 Formulation

This function computes the absolute value of the range for that portion of the nonlinear thermal gradient (∆T2) through the wall thickness not included in ∆T1 and the absolute value of the range of the temperature difference (∆T1) between the temperature of the outside surface and the temperature of the inside surface of the piping product assuming moment generating equivalent linear temperature distribution.

$$\mathrm{\Delta}T_{1} = \left( \frac{12}{t^{2}} \right) \cdot \int_{- \frac{t}{2}}^{\frac{t}{2}}{y \cdot T(y)dy}$$

$$\mathrm{\Delta}T_{2} = max\left( \left| T_{0} - T \right| - \frac{1}{2} \cdot \left| \mathrm{\Delta}T_{1} \right|,\left| T_{i} - T \right| - \frac{1}{2} \cdot \left| \mathrm{\Delta}T_{1} \right|,0 \right)$$

## 6.15 Function Fun_prop_vs_pT

### 6.15.1 Description

This function named Fun_prop_vs_pT computes the value of the specific heat, viscosity, density and thermal conductivity of a 1-phase pure fluid as a function of the temperature and the pressure.

### 6.15.2 Arguments

  -------------------------------------------------------------------------------------------------
  Name     Type               Description                                               Units
  -------- ------------------ --------------------------------------------------------- -----------
  chem     IN ENUM ThFluids   Name of the fluid                                         *-*

  p        IN REAL            Pressure                                                  *Pa*

  T        IN REAL            Temperature                                               *K*

  Cp       OUT REAL           Specific heat                                             *W/kg K*

  vis      OUT REAL           Viscosity                                                 *kg/m/s*

  rho      OUT REAL           Density                                                   *kg/m*^3^

  K        OUT REAL           Thermal conductivity                                      *W/m K*

  itab     OUT INTEGER        Pointer to last table interval for speed up calculation   *-*
  -------------------------------------------------------------------------------------------------

### 6.15.3 Variables

  ------------------------------------------------------------------------------
  Name             Type        Description                           Units
  ---------------- ----------- ------------------------------------- -----------
  MW               REAL        Molecular mass                        *kg/kmol*

  ier              INTEGER     Error identifier                      *-*
  ------------------------------------------------------------------------------

### 6.15.4 Return Value

None

### 6.15.5 Error Messages

IF (ier != 0) THEN

WRITE(\"\"\*\*\*\*\*Error: Problems reading fluid properties.)

END IF

ASSERT(ier == 0) FATAL \" \"Execution aborted: Table for Simplified Fluid Properties not found or wrong\"

\--Test alLowed ranges

IF(Tk \< 0.9\*T_min) THEN

IF(ier_fl_mi\[liq\] == 0)THEN

WRITE(\"\\n \*\*\*\* fluid: %s. Temperature (%g) below minimum range: %g\\n\\n\", FluidFileName\[liq\],Tk,T_min)

END IF

ier_fl_mi\[liq\] = 1

END IF

IF(Tk \> 1.1\*T_max) THEN

IF(ier_fl_ma\[liq\] == 0)THEN

WRITE(\"\\n \*\*\*\* fluid: %s. Temperature (%g) above maximum range: %g\\n\\n\", FluidFileName\[liq\],Tk,T_max)

END IF

ier_fl_ma\[liq\] = 1

END IF

## 6.16 Function Fun_beta_vs_T

### 6.16.1 Description

This function named Fun_beta_vs_T computes the value coefficient of volumetric expansion of a 1-phase pure fluid as a function of the temperature.

### 6.16.2 Arguments

  ---------------------------------------------------------------------------------------------
  Name     Type               Description                                               Units
  -------- ------------------ --------------------------------------------------------- -------
  chem     IN ENUM ThFluids   Name of the fluid                                         *-*

  T        IN REAL            Temperature                                               *K*

  itab     OUT INTEGER        Pointer to last table interval for speed up calculation   *-*
  ---------------------------------------------------------------------------------------------

### 6.16.3 Variables

  --------------------------------------------------------------------------
  Name             Type        Description                           Units
  ---------------- ----------- ------------------------------------- -------
  B                REAL        Coefficient of volumetric expansion   *1/K*

  ier              INTEGER     Error identifier                      *-*
  --------------------------------------------------------------------------

### 6.16.4 Return Value

This function returns the value of the coefficient of volumetric expansion of the 1-phase fluid defined by the input parameter \"chem\" as function of the temperature.

# 7 Building a Model

This chapter describes how to build a simple model using the THERMAL library, and how to simulate it. The basic methodology to create and simulate this simple model is the same as that for more complex models.

## 7.1 Guidelines for Building a Model

Here are some hints and guidelines to help you to build your models:

- Generally when building a thermal model, work first on paper drawing a basic schema of the system you want to model trying to reduce the system to a 1-dimensional problem and then build it using the schematic tool.

- The construction of thermal network models using the components in the library follows a very basic rule: components having ports of the types described above (C and R) must be connected to each other in an alternating arrangement represented by the string C-R-C-R-C...etc. This computational scheme prevents the appearance of algebraic loops and high index DAE (Differential Algebraic Equations) in the mathematical model of the thermal network.

  - Anyway it is possible to connect two Capacitive ports or to connect two Resistive ports because the software is able to manage the mathematical problems that arise due to these connections (high index problem and algebraic loop respectively). But it is advisable to follow the aforementioned connection rule.

- In order to assist the Thermal Library user in correctly arranging the components (alternating C ports and R ports), component symbols display each port type in a slightly different manner.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image99.png){width="2.5487423447069117in" height="0.6250317147856518in"}

- Both symbols (labelled capacitive_port and resistive_port) represent a regular thermal inlet port, but are drawn differently in order to highlight a special feature of the formulation of the component to which they are attached.

- When a symbol displays a capacitive port, it emphasises that the formulation of the component assigns a certain thermal inertia to the thermal inlet or outlet port. This is better illustrated by components such as Cylinder and Wall: in these components, it means that a small slab of material is created in between the inlet port and the first node in the component. In computational terms, it means that the temperature is a state variable and this prevents the appearance of algebraic loops when calculating the heat flows at the ports.

<!-- -->

- In order to connect components successfully, it is essential for the user to keep in mind some notions about ports of the thermal type:

  - It is possible to create thermal ports having more than one connection i.e. a thermal port can effectively contain an array of thermal ports: this is referred to as a vectorised port. As a result, it is very important for the user to specify the same dimensions for the ports that are to be linked.

  - The units used throughout the Thermal Library are S.I. units. All temperatures within the components including initial conditions are given in Kelvin. However, internally, thermal ports handle temperature arrays in both Celsius and Kelvin scales. These arrays are called tp_in.Tc\[n\] and tp_in.Tk\[n\] respectively, so the user must ensure that the correct temperature scale tp_in.Tk\[n\] is used inside the component formulation. Special attention must be paid to the units of the variables passed by analog_signal ports because they are also S.I. units. For instance, the value of the signals (s_temperature.signal\[n\]) used to specify the temperatures in the BNode component must be expressed in Kelvin.

  - The ports used in the components in the Thermal Library often contain the cardinality flag, which specifies the minimum and maximum number of connections allowed to this port. For instance, it is only possible to connect any of the thermal ports in the GL component to one other thermal port. This ensures that each of the GL components is used as a link between two nodes, one on each side. Nevertheless you can connect several conductors (GLs or GRs) to the same thermal diffusive node DNode.

  - The graphical symbols for the components in the library display an arrow next to each inlet or outlet port. This provides information about the direction of positive heat flow, and assists the user in identifying the type of port when connecting components.

- It is advisable not to leave thermal ports unconnected because the models are easier to read and understand. If you leave one port unconnected some variables will have to be assigned in the BOUNDARY block of the experiment.

  - The component BNode is used to specify the evolution of the temperature in one point of the thermal network. The analog_signal port of this component called s_temperature can be connected to an AnalogSource component from Control library to specify the evolution of the temperature along the time.

  - The component Heater is used to specify the evolution of the heat flow in one point of the thermal network. The analog_signal port of this component called s_power can be connected to an AnalogSource component from Control library to specify the evolution of the heat flow along the time.

- The radiation heat transfer is calculated using the radiative exchange factors. The radiative exchange factors calculations involve complicated geometric formulae. These formulae are available for standard shapes, but for a complicated structure the calculations, specific programs like ESARAD or THERMICA must be used to calculated them.

## 7.2 Description of the example

The model described in this chapter represents a bar insulated along its length, radiating to deep space at both ends and containing a constant heat source at one end. All material properties are constant. The bar is represented by five diffusive nodes (DNode). And the deep space is represented by a boundary node (BNode). The following figures shows this example and its translation to a schematic:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image100.png){width="6.496527777777778in" height="1.9361111111111111in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image101.png){width="6.496527777777778in" height="3.03125in"}

It is important to note that the constant heat source Qin must be specify in the component DNode_1 using the data called qi.

The data of the model are the following:

- The initial temperature of the diffusive nodes: 300 K

- The capacitance of intermediate diffusive nodes (DNode_2, DNode_3, DNode_4): 77.85 J/K

- The capacitance of end diffusive nodes (DNode_1, DNode_5): 38.925 J/K

- The impressed heat in diffusive node DNode_1: 70.0 W

- The conductance of the linear conductors: 11.25 W/K

- The radiative exchange factors of the radiative conductors: 3.75E-4 m2

## 7.3 How to Build the Model

This section describes how to build a simple model using the library. After you create the model, you can simulate it as described in the following section \"Simulating the Model\".

To create the model you must follow this steps:

- Create a new schematic using the botton ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image102.png){width="0.16263998250218722in" height="0.17305336832895887in"} or the File \> New \> Schematic. Save it in the THERMAL_EXAMPLES library with the name myFirstModel. The active Workspace must have the THERMAL, THERMAL_EXAMPLES and the CONTROL libraries loaded.

- To create the simple model in this chapter, you need the following components:

  - DNode from THERMAL library

  - BNode from THERMAL library

  - GL from THERMAL library

  - GR from THERMAL library

  - AnalogSource from CONTROL library

- Select the different component one by one in the icon explorer and drag them to the schematic window

- Arrange the components in the schematic like the following figure.

  - Use the Rotate buttons if necessary.

  - To change the size of a component, select the component, right button, select "component shape option" and change the size by dragging the symbol's corners.

  - To change the position of the component's name, press the SHIFT key at the same time as you move the mouse pointer over the labels, and drag it.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image103.png){width="6.496527777777778in" height="3.172222222222222in"}

- Draw connectors between the components like the following figure.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image101.png){width="6.496527777777778in" height="3.03125in"}

- Select the connection button on the right-hand toolbar ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image104.png){width="0.16893372703412074in" height="0.15856080489938756in"}, or press the SHIFT key at the same time as you move the mouse pointer over a port

- Left-click on the port to be connected

- Click the various points of the schematic drawing where the connector is required to run (if any)

- Left-click the target port, which must be of the same type as the origin port

- To connect different components with right angles, there are two options: 1) select right angle connections mode by pressing ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image105.png){width="0.1980194663167104in" height="0.1858606736657918in"} button and connect components as explained before. 2) Create a connection straight line between two components, press SHIFT and left click over the line. A point will be created to divide the line in two different segments. Drag the point to the desired place and use ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image106.png){width="0.18316819772528434in" height="0.1644225721784777in"} button to force right angles.

- To delete extra points of a connector line, just press SHIFT over the point and click on the point to be deleted

- A tooltip will appear whenever the mouse runs over a port, displaying the information of that port.

<!-- -->

- Now you must customize the component data and names according to the model overview.

  - To change data of a component double-click on the corresponding symbol to open the Attributes Editor. For the GL1 change the data of the total thermal conductance (cond) to11.25 W/K.

  - The AnalogSource1 component is used to set the temperature of the component BNode1 that represents the space. Because we are going to consider that the space temperature is constant and equal to 0 K, we must specify in the Attributes Editor of the AnalogSource1 component that the Waveform (source) of the signal is a Source_Constant type and the signal amplitude (Amp) is equal to 0 as follows:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image107.png){width="6.496527777777778in" height="4.092361111111111in"}

- Finally, generate the model using the button ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image108.png){width="0.14907042869641296in" height="0.13860017497812774in"}. The following window will be display. Click OK and you will have finalised the construction of your model and you can simulate it as described in the following section, "Simulating the Model":

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image109.png){width="3.2432217847769027in" height="1.4445188101487314in"}

## 7.4 Simulate the Model

Now it is ready for the simulation. Go to the Simulation View.

- Select \"myFirstModel.default\" (if the name of the partition you have created is "default") from the THERMAL_EXAMPLES library, right-click, select option \"New experiment\". The following window will be display. Type a name for the experiment:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image110.png){width="6.062811679790026in" height="4.458562992125985in"}

- A default experiment text should appear in the editing window. Change the TSTOP, CINT (Communications Interval) and other values as indicated here below:

\...

REPORT_TABLE(\"reportAll\",\"\*\")

\...

\-- simulate a transient in range\[TIME,TSTOP\] reporting at every CINT

TIME = 0

TSTOP = 100

CINT = 1

IMETHOD = DASSL_SPARSE

INTEG()

END EXPERIMENT

- "IMETHOD = DASSL_SPARSE" means that the DASSL sparse integration method will be employed (See the User Manual).

- "REPORT_TABLE\" is a function that creates a file called reportAll which consists of a report of all the variables of the model

<!-- -->

- Save the experiment

- Now you are going to simulate the experiment using the Monitor. Right button over the experiment name in the Workspace area, and select "Simulate in Monitor". Clicking ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image111.png){width="0.21458333333333332in" height="0.21458333333333332in"} button will produce same action

- The Experiments monitor comes up. . Add one plot for the port temperatures of the five diffusive nodes in Celsius, e.g. for the node DNode1 the name of the variable would be DNode_1.tp_in.Tc\[1\].

  - To add a plot click on \"Tab_1" and then click "New Plot" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image112.png){width="0.25277777777777777in" height="0.22777777777777777in"}. A window will appear with the "drawable / plotable" variables of the experiment.

  - Apply a filter to help you selecting variables. Tick the boxes alongside selected variables:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image113.png){width="6.496527777777778in" height="5.021527777777778in"}

- Just as you may wish to plot the evolution of a variable compared with another, you may also wish to track the numerical values of the variables. The main task of the Watch is to display the variable values of the experiment, enabling them to be modified wherever possible.

  - The first step is to add variables by doing right click in the Watch Area and selecting the option "Edit Watch".

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image114.png){width="4.697916666666667in" height="3.65625in"}

- A menu similar to that of the plots will appear, enabling the user to add or delete variables.

<!-- -->

- To simulate the experiment click "Simulate" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image115.png){width="0.1736111111111111in" height="0.25277777777777777in"}. The following figure shows the simulation results.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image116.png){width="6.495138888888889in" height="4.61875in"}

- The temperatures in the diffusive nodes increase because the heat flow provided by the heat source is greater than the heat losses by radiation at the end nodes. The time simulated has not been enough to calculate the steady state of the system. Therefore it would be advisable to continue simulating the model.

- Experiment integration time can be changed by modifying the simulation start and end time, enabling the simulation to be extended or started at new times. The communication interval of the experiment can also be modified. These operations can be carried out simply by clicking "New Integration" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image117.png){width="0.1918853893263342in" height="0.188332239720035in"} on the toolbar.

- The new integration values are defined in the following dialogue box:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image118.png){width="2.833478783902012in" height="1.541745406824147in"}

- Once the user has correctly defined the values and clicked OK, the new integration time commences. If the new integration time causes the simulation to skip time, new branches will be created for the plots. The following figure shows the simulation results after performing the new integration. Now the model even reaches a steady state.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image119.png){width="6.291990376202975in" height="4.458562992125985in"}

# 8 Application examples

## 8.1 WallConvection

### 8.1.1 Problem Description

The first example of this library is a simple model representing the convection heat transfer of an aluminium container wall with the ambient air. Two different analyses will be performed for this example, the first one is parametric and discusses the temperature of the wall for a certain heat inserted or extracted from the wall, while the other one will show the evolution of the wall temperature over time if the inner side of the wall is kept insulated.

### 8.1.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image120.png){width="6.495833333333334in" height="3.9298611111111112in"}

Figure 4.- WallConvection Schematic

The model is composed by four components. Three of them come from the Thermal library represent the physical environment and behaviour of the model, the wall (Wall component), the convection interface (FreeConvec_Plate component) and the environment (BNode component). The other component is contained on the Control library, and is used to set the temperature of the ambient air (AnalogSource component). As shown in the figure, the only changes to the components represent the physical and initial conditions of the wall and the convection interface.

### 8.1.3 Partition and experiments

One partition will be created for the experiments of this example. For this partition, the user must select the option to transform component data into unknowns, so the ambient temperature can be selected as a boundary for the calculations. The program requires one additional boundary to this one, which in this case will be the heat transfer in the inner side of the wall. With this, the partition creation is finished.

For the first experiment, container will be subjected to a hot environment of 450 K. Since it may contain precious materials inside, its temperature may be limited below a certain level. In this way, a steady experiment will be created where the cooling of the wall is varied in the range \[0, -100 KW\] (note the sign is negative since it is being extracted) to see if the steady temperature of the wall is acceptable.

![Ex1_1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image121.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 2.- WallConvection Parametric Experiment Results

The figure shows the temperature of both wall sides for a different range of heat extraction. As expected, the higher the heat removed, the lower the steady temperature of the wall. Since the heat is removed on the inner side of the wall, there is a gradient of temperature over its thickness, although it is small due to the good conductive properties of aluminium. It is left for the user to test this example changing the material of the wall component.

The other experiment will be a transient one, where the outer temperature is set to 400 K. In this case there is no heat extraction, so the heat transfer boundary will be set to 0. Convection is a slow process, so the model will be integrated for 8000 s.

![Ex1_2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image122.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 3.- WallConvection Transient Experiment Results

As expected, the outer wall, subjected to convection, has a higher temperature. The heating process is very slow, meaning that a very long time is needed to reach the steady state. Since no heat is extracted, both lines would converge asymptotically to the ambient temperature for longer integration times.

## 8.2 WallSandwichRadiation

### 8.2.1 Problem Description

This example is somehow similar to the previous one but introducing a higher level of complexity. It represents the heat transfer by radiation of a sandwich panel made of GCF and titanium. The panel is being tested on a vacuum chamber to study its performance in outer space, so there is no convection. Again, two analyses will be done, the first to study the system if the inner side of the wall temperature is kept constant, and the other one to discuss the response of the system for a certain inserted heat.

### 8.2.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image123.png){width="6.495833333333334in" height="2.8680555555555554in"}

Figure 4.- WallSandwichRadiation Schematic

In this model the only new component is the Radiation interface (GR component), which substitutes convection, with the added complexity of the triple wall. The outer wall has a finned surface such that more heat can be radiated, resulting in a higher interface area. For the simplicity of the analysis, as well as the reduced computation time, the internal nodes of the walls have been set to 1.

### 8.2.3 Partition and experiments

This example will have two different partitions, each of them with one experiment. The first partition corresponds to the steady (can be understood as design) analysis of the model. Again, the user must select the option to convert data into unknowns. However, in this specific case the remove derivatives option is required too in order to be able to select a dynamic variable (the temperature) as a boundary. In this way, the boundaries are the ambient temperature (transformed into unknown) and the inner temperature of the wall. The algebraic variables are set default.

So, in the steady experiment, the inner side of the wall is kept at constant temperature (20ºC), while the ambient temperature is in the range \[220, 350\]. This allows to compute the required heat to keep the temperature constant.

![Ex2_2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image124.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 5.- WallSandwichRadiation Parametric Experiment Temperature

![Ex_21](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image125.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 6.- WallSandwichRadiation Parametric Experiment Heat

The first figure shows the steady state temperature of each of the interfaces of the walls. As expected, since titanium is a good conductor, the temperature drop along the middle wall is almost negligible. On the other hand, GCF is a good insulator, producing a larger drop in the inner and outer walls. The second figure shows the required heat transfer, which, as the previous image already suggested, for low temperatures outside, heat must be introduced, while if the outside is hot, heat is removed.

In the second partition no additional unknowns are required, resulting in only one boundary needed. The heat transfer in the inner wall is selected as the boundary. No algebraics are required this time. The experiment for this partition is transient. The boundary is set to 4000 W, meaning that heat is inserted, and the model is integrated up to 6000 s.

![Ex2_3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image126.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 7.- WallSandwichRadiation Transient Experiment Results

Radiation heat transfer is usually a faster process than convection, and can be appreciated in the figure since is nearly reached in 6000 seconds. Again, the temperature drop is smaller in the titanium wall section.

## 8.3 WallConvectionRadiation

### 8.3.1 Problem Description

This example serves simply as an explanation of the importance of how connections during the modelling of the schematic can affect the results of the simulations. This will be represented by a model similar to WallConvection, but combining radiation in convection. Then, two different types of connection will be analysed, convection and radiation in series or in parallel. A steady experiment will be performed, followed by a transient one.

### 8.3.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user. No new components are used for this schematic.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image127.png){width="6.495833333333334in" height="3.384027777777778in"}

Figure 8.- WallConvectionRadiation Schematic

### 8.3.3 Partition and experiments

The first partition correspond again to the steady analysis of the problem and, again converting the ambient temperature into unknown and removing derivatives. This temperature is selected as boundary together with the inner temperature of each of the walls. Algebraic variables are left default. In the experiment, the algebraic variables are initialized, the wall temperatures set to 20ºC, and the ambient temperature varied in the range \[220-340\]. The required heat to keep the wall temperature constant is plotted, together with some useful quantities for the understanding of the solution.

![Ex3_2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image128.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 9.- WallConvectionRadiation Experiment Total Heat

Heat transfer happens to be larger when modelling the problem in parallel than in series. As expected, for ambient temperature equal to the wall one, heat is 0. For the problem analysed in this case, the correct formulation is the parallel model. The reason behind this is easily understood after observing the following figures.

![Plot_2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image129.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 10.- WallConvectionRadiation Experiment Temperatures

Figure 10 shows the inner temperature of the convection and radiation components for both cases. This is, the temperature of the surface where convection or radiation is taking place. The lines for parallel configuration coincide, which is logical since the surface is the same, the wall. On the other hand, the difference in the temperature of the series configuration has no physical sense and is indicating an incorrect formulation of the problem. As the radiation component is before the convection one, convection is taking place at an imaginary surface after radiation. Heat transfer contribution of each of the processes further illustrates this concept.

![Plot_3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image130.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 11.- WallConvectionRadiation Experiment Component Heat

In this case, coinciding lines are the ones of the series configuration. They are actually coincident with the total heat transfer of this configuration, which indeed is illogical. In the case analysed here, convection and radiation are two separate processes dissipating a different amount of heat from the wall, which is added to form the total. This is what happens in the parallel configuration. This example showed the importance of correctly modelling the schematic of a problem. Not doing so can lead to unreasonable results as in the series configuration, and can be difficult to fix if one is not very fluent in the program.

## 8.4 CylinderHeatTransfer

### 8.4.1 Problem Description

This example describes a fictional entropy modulation experimental device. The device is modelled as a hollow cylinder with flat bases, insulated at all its faces, in which interior heat is released and extracted. The transient response to a sinusoidal heat signal will studied.

### 8.4.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image131.png){width="6.495833333333334in" height="3.540277777777778in"}

Figure 12.- CylinderHeatTransfer Schematic

In this schematic, the bases of the cylinder are modelled with walls. Instead of setting the heat transfer to 0 in the outer sides by means of boundaries in the partition and experiment, in this case it was decided to do it in the schematic. This is done by means of the Insulation component. The cylinder (Cylinder component) has the properties described in the figure and is insulated in the outer side.

### 8.4.3 Partition and experiments

Only one partition is created for this example. The only boundary selected is the heat transfer in the inner side of the cylinder. A transient experiment is created and integrated up to 60000 seconds, where the heat boundary is introduced as a sinusoidal signal of 2500 W in amplitude and a period of 5000 seconds.

![Ex4](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image132.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 13.- CylinderHeatTransfer Experiment Results

The bases of the cylinder are thicker and have a higher heat capacity, so the temperature here is not oscillating at an observable frequency. As expected, the inner temperature of the cylinder has the largest amplitude since it the place where the heat is applied. The outer temperature of the cylinder oscillates with a smaller amplitude and is delayed, although only slightly because the thickness is small. For long times, a periodic state is reached, where the wall temperature is nearly constant.

## 8.5 RadiationNodes

### 8.5.1 Problem Description

This example analyses the different types of nodes included in the thermal library, apart from the already commented BNode used in some of the previous examples. For this purpose, a simple radiation model is built for each of the four nodes analysed.

### 8.5.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image133.png){width="6.5in" height="3.9208333333333334in"}

Figure 14.- RadiationNodes Schematic

The first type of node analysed is a diffusive node of constant heat capacity (DNode Component). The second type represents again a diffusive node, but in this case it is made of a specific material and has a certain mass (DNodeMat component). The third one is a room filled with air (DNodeRoom component), while the last is a diffusive node of water allowing phase changes (DNphases component) with a certain mass. All nodes are radiating into ambient with an effective area of 30 m\^2.

### 8.5.3 Partition and experiments

One partition is created for this model, converting the ambient temperature into an unknown and later selecting it as the only boundary of the problem. A transient experiment is created and integrated up to 10000 seconds, where the ambient temperature is set to 350 K.

![Ex5](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image134.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 15.- RadiationNodes Experiment Results

The figure shows the evolution of the temperature of each of the nodes over time. Even though each of the nodes performs in a different way subjected to the ambient conditions, this does not mean their working principle is different. Some tuning of the nodal parameters is left for the user to reach similar performance in each branch of the model.

## 8.6 ControlledWallHeating

### 8.6.1 Problem Description

This example combines elements from the Thermal and Control libraries (apart from the already commented source component). It represent the controlled heating of a container, which is exchanging heat with the ambient both by convection and radiation. The wall of the container is made of 3 layers, the inner one made of titanium and the others of aluminium. Temperature in the interior of the container is measured by a sensor and used for control purposes with the aid of a PID.

### 8.6.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image135.png){width="6.495833333333334in" height="2.3965277777777776in"}

Figure 16.- ControlledWallHeating Schematic

The temperature of the wall will be controlled by a PID (Cntrl_PID component of the Control library) which receives as an input the temperature of the wall, measured by a sensor (T_sensor component). PID output signal is converted into heat in the Heater (Heater component) and connected to the inner wall, at the same place as the sensor. It is relevant to comment that convection and radiation components are connected in parallel, which is the correct configuration as described in WallConvectionRadiation.

### 8.6.3 Partition and experiments

One partition is created for this model, where 3 transient experiments will be developed. For the partition, the ambient and the target temperature of the PID are converted into unknowns, and are later selected as the only two boundaries. For all the experiments, the ambient temperature will be set to 235 K while the target temperature is 23ºC. The first experiment will be a simple transient one integrated up to 55000 seconds.

![Ex6_1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image136.png){width="6.342361111111111in" height="2.1055555555555556in"}

Figure 17.- ControlledWallHeating Experiment 1 Results

The controller is able to control the temperature and reach the target steady state in about 40000 seconds. The response has some overshoot and it may need some tuning in order to meet the requirements of the product specifications.

The other two experiments are very similar. They describe the response of the system for the ambient temperature in the range \[200, 270\]. The difference between them is the change in the proportional constant of the PID integrator. In the first one, it will be set to 100, the same as before, while in the second one it will be reduced to 50.

![Ex6_2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image137.png){width="6.36875in" height="2.1055555555555556in"}

![Ex6_3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image138.png){width="6.36875in" height="2.1055555555555556in"}

Figure 18.- ControlledWallHeating Experiment 2 Results

As expected, the heat required in steady state is smaller if the ambient temperature is more similar to the target. However, it is observed that there is a larger overshoot in this case. Common sense may make one think the contrary should happen, but this occurs due to the initial temperature of the wall, and its heat capacity, which leads to slight overheating of the wall.

![Ex6_4](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image139.png){width="6.473611111111111in" height="2.157638888888889in"}

![Ex6_5](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image140.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 19.- ControlledWallHeating Experiment 3 Results

The results of the experiment where the proportional coefficient k is halved show similar results, but in this case control requires more time to reach steady conditions. This was expected since less heat is inserted for the same temperature difference. One must bear in mind that increasing k too much can make the system unstable and the solution may never converge to the intended value.

## 8.7 PipeFins

### 8.7.1 Problem Description

A titanium pipe in the outer structure of the ISS (International Space Station) is exchanging heat by radiation with the environment by means of 10 radial copper fins equally spaced in the azimuthal direction. The ISS is orbiting around Earth, meaning that the ambient temperature may depend on the relative position of the three bodies of the problem. This will be introduced as a simple periodic model in this analysis. The evolution of the heat exchange and the temperature of the pipe will be studied until the periodic state is reached.

### 8.7.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image141.png){width="6.5in" height="2.6840277777777777in"}

Figure 20.- PipeFins Schematic

Three new components are used in this case. The first one is a Multiplier (component HeatFlowMultiplier) which is used to model the 10 fins placed in the outer side of the pipe. The value of the multiplication factor is 1/10 since the heat flow in the root of each fin is smaller than the total flow into the cylinder. The second new component is the Fin (Radiator component) representing heat transfer with the environment by a custom sized radiator. The last one is the Pipe (Cylinder_AI component), very similar to the one used for CylinderHeatTransfer, but in this case the axial ends are automatically insulated.

The analogSource component will be used in a different way as the previous cases, so now it is a sinusoidal signal which models in a simple way the already commented orbital relative position of the ISS with respect to the celestial bodies.

### 8.7.3 Partition and experiments

One partition is created for this model, in which two experiments will take place. For the creation of the partition, two boundaries are needed. The solar irradiance (the power per unit area received from the sun at a certain point in space) and the heat flow in the inner side of the cylinder are selected for this purpose. The first experiment is a simple transient experiment in which the temperature and the heat flow will be integrated for 12 hours. As boundaries, the solar irradiance is set to 1360 W/m\^2 and the inner cylinder side is insulated.

![pipe1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image142.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 21.- PipeFins Experiment 1 Temperatures

![pipe2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image143.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 22.- PipeFins Experiment 1 Heat Flow

As expected, the temperature of the pipe is oscillating with a 90º phase shift with respect to environment temperature. The pipe reaches its maximum temperature when the ambient goes to the negative part of the sinusoidal shape, and thus the 90º shift. The amplitude of the oscillations is smaller since the heat flow through the fins is limited. Regarding the second figure, the heat flow through the pipe is 10 times the one of each of the fins, constrained by the multiplier.

The other experiment is a parametric transient experiment with the same boundary conditions as the previous one, but, in this case, the number of fins present in the cylinder is increasing after each of the integrations, sweeping the range \[1, 19\]. In this way, the effectiveness of the radiator fins can be measured and analysed.

![pipe3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image144.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 23.- PipeFins Experiment 2 results

As expected, increasing the number of fins also increases the heat exchange effectiveness of the structure. So, by doing this, the temperature of the pipe becomes more and more similar to the environment one. Note that the more fins present in the structure, the less is the gain in effectiveness for adding more of them. Since the temperature difference between the pipe and the environment is smaller, less heat flows per fin, and thus, even though effectiveness still increases, it does at a decreasing rate.

## 8.8 PlateBC

### 8.8.1 Problem Description

A thin 1x1 m square copper plate insulated on one of its ends is subjected to certain boundary conditions on the other three. Transient and steady analyses will be performed to study the heat flow and temperature in the plate nodes for different boundary conditions in the plate ends, regarding temperature or heat flow.

### 8.8.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image145.png){width="5.947222222222222in" height="2.657638888888889in"}

Figure 24.- PlateBC schematic

This example will make use of a new component in order to model the Plate (Plate component). The parameters changed are related to the physical characteristics of the plate and to the dimensions of the ports in order to adapt to the finite element discretization of the plate.

### 8.8.3 Partition and experiments

Two different partitions are created for this experiment. The first of them corresponds to the transient behaviour of the model, in which two experiments will be created. For creating the partition, the heat flows through the 3 free ends of the plate are selected as boundaries (a total of 30 parameters). No algebraic variables are needed.

The first experiment will simulate the behaviour of the system for a sinusoidal heat input in the right and top ends of the plate. The bottom end will be kept insulated. The introduction of the boundaries to represent the sinusoidal shape of the heat is more difficult than the ones of the previous examples, and is shown in the figure below. The equations are integrated for 2500 s.

BOUNDS

Plate.tpx_out.q\[01\] = -70\*sin(2\*PI/500\*TIME)

Plate.tpx_out.q\[02\] = -70\*sin(2\*PI/500\*TIME+PI/9)

Plate.tpx_out.q\[03\] = -70\*sin(2\*PI/500\*TIME+2\*PI/9)

Plate.tpx_out.q\[04\] = -70\*sin(2\*PI/500\*TIME+3\*PI/9)

Plate.tpx_out.q\[05\] = -70\*sin(2\*PI/500\*TIME+4\*PI/9)

Plate.tpx_out.q\[06\] = -70\*sin(2\*PI/500\*TIME+5\*PI/9)

Plate.tpx_out.q\[07\] = -70\*sin(2\*PI/500\*TIME+6\*PI/9)

Plate.tpx_out.q\[08\] = -70\*sin(2\*PI/500\*TIME+7\*PI/9)

Plate.tpx_out.q\[09\] = -70\*sin(2\*PI/500\*TIME+8\*PI/9)

Plate.tpx_out.q\[10\] = -70\*sin(2\*PI/500\*TIME+9\*PI/9)

Plate.tpy_out.q\[01\] = -70\*sin(2\*PI/500\*TIME)

Plate.tpy_out.q\[02\] = -70\*sin(2\*PI/500\*TIME+PI/9)

Plate.tpy_out.q\[03\] = -70\*sin(2\*PI/500\*TIME+2\*PI/9)

Plate.tpy_out.q\[04\] = -70\*sin(2\*PI/500\*TIME+3\*PI/9)

Plate.tpy_out.q\[05\] = -70\*sin(2\*PI/500\*TIME+4\*PI/9)

Plate.tpy_out.q\[06\] = -70\*sin(2\*PI/500\*TIME+5\*PI/9)

Plate.tpy_out.q\[07\] = -70\*sin(2\*PI/500\*TIME+6\*PI/9)

Plate.tpy_out.q\[08\] = -70\*sin(2\*PI/500\*TIME+7\*PI/9)

Plate.tpy_out.q\[09\] = -70\*sin(2\*PI/500\*TIME+8\*PI/9)

Plate.tpy_out.q\[10\] = -70\*sin(2\*PI/500\*TIME+9\*PI/9)

In order to fully represent the sine shape in the boundary, a shift is included at each of the nodes. The function will have an amplitude of 70 W and a period of 500 s. Note that in this formulation there will be a symmetry axis in the plate diagonal which goes from the bottom left corner to the top right corner.

![plate1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image146.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 25.- PlateBC Transient Experiment 1 Right Boundary Temperature

![plate2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image147.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 26.- PlateBC Transient Experiment 1 Left Boundary Temperature

The figures show the evolution of the temperature of some nodes of the left and right plates. Due to the already commented symmetry, it is not necessary to show the top and bottom ends, as they are coincident with the right and left ends respectively. In the first figure it is clearly seen the delay of the signal for the later nodes coming from the definition of the boundaries. In the second one it is observed that, as expected, the further away from the non-insulated end (the first nodes of the left plate), the less sensitive the nodes will be to be to the temperature change.

The second experiment is similar to the first one, but in this case the top end is also insulated, meaning that heat exchange only happens in the right boundary. The configuration of the heat exchange in this boundary is the same sinusoidal function as in the previous experiment. Again, the model will be integrated for 2500 s.

![plate4](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image148.png){width="6.184027777777778in" height="2.0527777777777776in"}

Figure 27.- PlateBC Transient Experiment 2 Lateral Boundaries Temperatures

This figure shows the temperature for the left and right plates. As expected the temperature of the left boundary is not affected in a considerable way by the heat exchanged in the right end. In this boundary, the results obtained are similar to the ones of the first experiment.

![plate3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image149.png){width="6.473611111111111in" height="2.157638888888889in"}

Figure 28.- PlateBC Transient Experiment 2 Vertical Boundaries Temperatures

In the top and bottom plates, again, the temperature oscillates with a higher amplitude if the one is near the right plate.

The second partition will model the steady behaviour of the system. To create it, it is needed to select the remove derivatives option if the partition wizard. As boundaries, the heat flows through the free plate ends are selected (again 30 boundaries in total). Note that the net heat flow in the whole plate must be 0 in order to get reasonable results (if the net flow is negative the simulation will converge at 0 K and if positive, it will not converge as it will be eternally gaining heat). Two experiments will be created for this partition. In the first one, heat is generated in the bottom end, removed in the top end and, in the right one, heat is removed at the top and generated at the bottom. A draft of these boundaries is shown below.

![autodraw 12_11_2021 10_45_40](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image150.png){width="3.526388888888889in" height="2.657638888888889in"}

Figure 29.- PlateBC Steady Experiment 1 Boundaries

In this sketch, the sign convention is red for positive flow (heat generation) and blue for negative flow (heat removal). Once this is done, the experiment can be run.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image151.png){width="6.030160761154856in" height="4.625984251968504in"}

Figure 30.- PlateBC Steady Experiment 1 Temperature

This is the result of the steady simulation. The figure has been produced using Python and later shown in Monitor application with the new Render tool, available form version 6.4 onwards. This tool will call a custom python script which makes use of used defined variables and parameters to plot the temperature map. To be able to obtain this figure in the monitor, the user must have Python installed together with numpy and matplotlib libraries. All these are open source and can be downloaded for free. The user may also need to change the path of the Python executable according to its location in the user\'s computer. For more information about the Render tool, please refer to the appropriate manual included with the installation of the tool. As expected, temperature is higher where heat is generated and lower where heat is removed, reaching maximum temperature in the corners of the plate.

In the second experiment, the right end of the plate is insulated too and the heat flow in the top and bottom end are different. Another sketch is shown below.

![autodraw 12_11_2021 10_51_50](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image152.png){width="2.7368055555555557in" height="2.8944444444444444in"}

Figure 31.- PlateBC Steady Experiment 2 Boundaries

The same sign convention as in the previous case is applied here. Once the boundaries are implemented, the experiment can be run in the monitor. Results are shown below.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image153.png){width="5.080645231846019in" height="3.937007874015748in"}

Figure 32.- PlateBC Steady Experiment 2 Temperature

In this case, the temperature peaks are not on the corners, but in the middle of the bottom and top corners, which is consistent with the heat flow boundaries of the experiment, as the highest heat flows happen at these points.

## 8.9 Peltier

### 8.9.1 Problem Description

A cooling thermoelectric heat pump transforms an electrical current into a heat flux, cooling the cold side of the cell while heating the other side. A simple simulation is carried out to obtain the system parameters and then a parametric study is carried on to simulate the performance of the cell according to two parameters: *I* and *DT.*

### 8.9.2 Schematics

The schematic of the example is shown below, along with the parameters of each component that are not default and require to be changed by the user.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image154.png){width="5.229896106736658in" height="2.8233103674540683in"}

Figure 33.-Peltier Schematic

The model is composed of 3 components. Two of them are electrical components, to fix the desired current in the electrical circuit with a current of 1 Amp. The Peltier Cell parameters have been changed to match the results of an experiment found online.

### 8.9.3 Partition and experiments

Two different partitions will be created, the first one to obtain the system parameters and the second one to obtain the performance of the system.

In the first one, *Par1,* both the jump temperature *Peltier.DT* and the hot side temperature *Peltier.Tk_out* are selected as *boundary variables.* In the steady experiment *exp1* a jump temperature of 30 and a Hot temperature of 300 K are imposed. The obtained results are shown in the following table:

  ------------------- ---------------------------- ----------------- ------------------
  Variable            Description                  Value             Units

  Peltier.COP         Coefficient of Performance   0.586             \-

  Peltier.Pel         Electrical Power             5.2               W

  Peltier.V           Voltage Difference           5.2               V

  Peltier.qin         Heat Absorbed                3.05              W

  Peltier.Imax        Maximum Intensity            3.39              I

  Peltier.DTmax       Maximum DT                   89                K
  ------------------- ---------------------------- ----------------- ------------------

Table 1.-Peltier *Par1* and *Exp1* results obtained

In the second partition *Maps*, in the wizard settings, the option *transform data into unknown variables* is selected, and the *CurrentConstant.I* is selected in the next window. The new boundaries are *Peltier.DT* , *Peltier.Tk_in*, and *CurrentConstant.I.* This last one has been selected so it can be used in a parametric steady.

In the steady experiment *Performance, Peltier.Tk_in* = 270 K is set as a boundary condition. However, regarding the two other parameters, two new variables have to be declared:

$$RelativeIntensity = \frac{I}{I_{\max}\ }\ \ $$

$$RelativeDT = \frac{DT}{{DT}_{\max}\ }$$

Where I~max~ and DT~max~ are the values obtained in the previous partition. In this parametric study these two parameters are variated between 0 and 1, creating a *NEW_BRANCH().* The experiment should look like this:

FOR( j IN 1,10)

RelativeDT=0.1\*j

Peltier.DT=RelativeDT\*88

NEW_BRANCH(\"RelativeDT = \$RelativeDT\")

FOR(i IN 1,100)

RelativeIntensity=0.01\*i

CurrentConstant.I =RelativeIntensity\*3.3

STEADY()

END FOR

END FOR

The results obtained in this experiments are shown in the following figure:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image155.png){width="5.367924321959755in" height="3.4483475503062118in"}

Figure 34.-Peltier COP vs RelI for different RelDT

These results are the expected results and show that there is an optimum COP for each DT.

## 8.10 Thruster

### 8.10.1 Problem Description

A complex simulation of the heat flux across a thruster is shown here. A steady temperature profile is going to be obtained.

### 8.10.2 Schematics

The schematic of the example is shown below. There are 15 DNode, 11 TD_GL, 6 GL, 8 GR, an external thermal port, *tp_N13* and 1 Boundary Node, *N105*. The radiation heat flux between the thruster and the space and the heat flux in the material while the thermal conductance is modelled with linear components. The connections of these components are done according to the following figure:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image156.png){width="7.010660542432196in" height="4.185110454943132in"}

Figure 35.-Thruster Schematic

Since this model is quite complex and including the data in the schematic would prove to be counterproductive, the modifications done to the DATA variables of the components are shown in the following tables below:

**Dnode**

  ------------------ ----------------- ----------------- -----------------
  Name               C (J/K)           Qi (W)            T0 (K)

  N1                 4.6               0                 \-

  N2                 25.0              0                 473.15

  N3                 8.0               0                 \-

  N4                 3.5               0                 \-

  N5                 1.9               0                 \-

  N6                 1.9               0                 \-

  N7                 1.90              0                 \-

  N8                 0.1706            0                 \-

  N9                 0.680             0                 \-

  N10                0.065             0                 \-

  N11                7.28              0                 \-

  N12                1.2720e+01        0                 \-

  N13                1.46e+01          0                 \-

  N14                1.0350e+01        0                 \-

  N15                54.83             0                 \-
  ------------------ ----------------- ----------------- -----------------

Table 2.-Changed DATA Variables of *Dnodes* for Thruster

**TD_GL**

  ------------------ ----------------- ----------------------
  Name               F (m)             k_table (W/m·K vs K)

  TD_GL1             0.0015            Cond_Tab

  TD_GL2             0.0053            Cond_Tab

  TD_GL3             4.32e-3           Cond_Tab

  TD_GL4             8.23e-4           Cond_Tab

  TD_GL5             8.23e-4           Cond_Tab

  TD_GL6             4.32e-3           Cond_Tab

  TD_GL7             7.e-3             Cond_Tab

  TD_GL8             2.361e-4          Cond_Tab

  TD_GL9             5.059e-5          Cond_Tab

  TD_GL10            4.086e-5          Cond_Tab

  TD_GL11            1.518e-4          Cond_Tab
  ------------------ ----------------- ----------------------

Table 3.-Changed DATA Variables of *TD_GL* for Thruster

Where *Cond_Table* can be edited in the code of the schematic:

TABLE_1D Cond_Tab = { {-273.15, 0. , 400. , 2000.},{9.5 , 9.5, 16.6, 16.6 }}

**GL**

  ------------------ -----------------
  Name               Cond(W/K)

  GL1                0.0085

  GL2                0.15

  GL3                0.0041

  GL4                0.0041

  GL5                0.0024

  GL6                0.069
  ------------------ -----------------

Table 4.-Changed DATA Variables of *GL* for Thruster

**GR**

  ------------------ -----------------
  Name               REF (m^2^)

  GR1                2.1324e-04

  GR2                6.1080e-04

  GR3                7.20e-05

  GR4                3.90e-05

  GR5                3.90e-05

  GR6                6.e-06

  GR7                2.32e-05

  GR8                2.06e-04
  ------------------ -----------------

Table 5.-Changed DATA Variables of *GR* for Thruster

### 8.10.3 Partition and experiments

A simple partition, *Par1*, is created, with the following boundaries selected: *Space.Tk\[1\]*, *BNode_N105.s_temperature.signal\[1\]* and *tp_N13.q\[1\]*. These represent the exterior temperature, the chamber temperature and an external connection. In the steady experiment *exp1* the set values are 105 K, 1400 K and 0 W, respectively.

The monitor shows the temperature across the different nodes, and the user can find the heat fluxes in the monitor. For instance, the temperature profile across the nodes *N105-N14-N13-N7-N6-N5-N4-N2-N1-Space*, is shown in the following figure:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image157.png){width="4.176040026246719in" height="3.543307086614173in"}

Figure 36.-Temperature Profile for a single Thruster

The temperature drops as we get further away from the chamber, as expected. The big drops are due to the radiative conductance with space.

## 8.11 Two Thruster

### 8.11.1 Problem Description

In this case, two thrusters connected in their port tp_N13 through a radiative thermal conductance, and in contact with space. The same temperature profile that was obtained in the previous example is going to be obtained for two different thrusters that operate at different temperature.

### 8.11.2 Schematics

The schematic of the example is shown below. The thruster symbol is equivalent to the schematic obtained in the previous example. The space temperature input can be changed via *Input_T*. The value of the Radiative Exchange Factor of GR_1 is changed to properly model the system.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image158.png){width="3.4170516185476814in" height="3.0786023622047245in"}

Figure 37.- Two Thrusters Configuration Schematic

### 8.11.3 Partition and experiments

A simple partition *Par1,* is created, with the following boundaries selected: *Input_T.Amp*, *ThrusterSchematic_1. BNode_N105.s_temperature.signal\[1\]* and *ThrusterSchematic_2. BNode_N105.s_temperature.signal\[1\].* To select *Input_T.Amp* as a boundary, the *transform data into unknown variables* option has been checked. In the steady experiment *exp1* the set values are 105 K, 1000 K and 1400 K, respectively.

The monitor shows the temperature across the different nodes, and the user can find the heat fluxes in the monitor. For instance, the temperature profile across the nodes N105-N14-N13-N7-N6-N5-N4-N2-N1-Space of the 1400K thruster is shown in the following figure, comparing it with the results obtained in the previous simulation.

Before running this experiment, you must first complete the experiment described in Section [7.10.3.](#partition-and-experiments-9) , as its results are required for comparison.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\THERMAL\source_files\THERMAL_Library_Reference_Manual_media/media/image159.png){width="4.148135389326335in" height="3.543307086614173in"}

Figure 38.-Temperature Profile comparison for a single thruster and a double thruster configuration

As it can be seen, the temperature is lower in the places close to where the heat transfer occurs, because the higher temperature thruster radiates heat to the lower temperature thruster.

An interesting simulation left for the reader would be to change the values of the temperature signal during an eclipse, changing the space temperature between 105K and 400 K, the temperature variance that suffers a satellite in LEO.

# 9 References

1\. [http://www.melcor.com/formula.htm](http://www.melcor.com/formula.htm)

2\. EcosimPro User Manual

3\. ESATAN User Manual. UM-ESATAN-004. ESATAN 9.2. October 2004

4\. ESATAN Training Manual. TM-ESATAN-008. ESATAN 9.2. October 2004

5\. Ingeniería Química. Costa Novella E. Vol 4. Transmisión de calor. Ed. Alhambra. 1986

6\. Heat Transfer, A Practical Approach. Yunus A. Çengel. 2nd Edition. McGraw Hill. 2003.

7\. 2005 ASHRAE Handbook Fundamentals. SI Edition
