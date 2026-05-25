---
input_mode: dir
title: docs \> ELECTRICAL \> Source Files \> ELECTRICAL_Library_Reference_Manual
---

# 1 Overview of the library

ELECTRICAL is an library for the transient and steady simulation of electrical circuits. Most of the typical electrical units are included as components ([^1]) that can be used to build graphically complex systems.

## 1.1 Description

The following are the most important features of the library:

- The most basic two- or four-pin components are programmed based on Ohm\'s law (resistance devices), Faraday's law (devices storing energy in an electric field), and Henry's law (devices storing energy in a magnetic field).

- Special components simulating Amplifiers, RC lines, Switches, Diodes, Transistors and Electromotive Force are included.

- Generic sources of current & voltage are included.

- Sensor components measuring the current and the voltage in a branch (which allows coupling electrical circuits to control blocks) are also available.

A detailed examination of the formulation ([^2]) reveals that components in the Electrical library calculate the current and the voltage in different ways; indeed, capacitive components explicitly calculate the voltage at their ports, while inductors explicitly calculate the current. Other components include linear or non-linear algebraic equations. A a result, the final model yields a complex system of equations with discrete events to be captured.

Application\'s job is to order all the equations involved, regardless of how the user includes the different components in a particular electrical network.

Typical electrical boxes that could be frequently used in complex models can be built topologically, and then considered as new components thanks to object-oriented programming properties, i.e. Encapsulation, Inheritance and Aggregation.

## 1.2 Change log

+---------+----------------------------------------------------------------------------------------------------------------------+
| Version | New Features                                                                                                         |
+---------+----------------------------------------------------------------------------------------------------------------------+
| 3.2.0   | - The following new components have been included in the library: CapacitivePhasor, InductivePhasor and Multiplexer. |
+---------+----------------------------------------------------------------------------------------------------------------------+
| 3.2.1   | - The Reference Manual has been updated.                                                                             |
+---------+----------------------------------------------------------------------------------------------------------------------+
| 3.2.2   | - The new component SensorPower has been added.                                                                      |
+---------+----------------------------------------------------------------------------------------------------------------------+
| 3.2.3   | - The new component ResistorHeat has been added.                                                                     |
+---------+----------------------------------------------------------------------------------------------------------------------+
| 3.2.4   | - The new component IdealBattery has been added.                                                                     |
+---------+----------------------------------------------------------------------------------------------------------------------+

## 1.3 Ports

ELECTRICAL Library uses the following types of elementary standard ports that are defined in the library PORTS_LIB:

  -----------------------------------------------------------------------
  Port Type       Description                           Colour
  --------------- ------------------------------------- -----------------
  analog_signal   1-dimension array of analog signal    orange

  elec            electrical pin                        green

  Mech_rot        1D rotational flange                  black
  -----------------------------------------------------------------------

The variables defined in each port are the following:

- analog_signal port

  -------------------------------------------------------------------------
  Name                    Description               Units
  ----------------------- ------------------------- -----------------------
  signal\[n\]             Array of analog signals   \-

  -------------------------------------------------------------------------

- elec port

  --------------------------------------------------------------------------------
  Name                    Description                      Units
  ----------------------- -------------------------------- -----------------------
  i                       Intensity (electrical current)   A

  v                       Voltage (electrical potential)   V
  --------------------------------------------------------------------------------

- mech_rot port

  -----------------------------------------------------------------------
  Name                    Description             Units
  ----------------------- ----------------------- -----------------------
  T                       Torque                  N\*m

  n                       Angular velocity        rpm

  omega                   Angular velocity        rad/s
  -----------------------------------------------------------------------

- bool_signal

  -------------------------------------------------------------------------------------------
  NAME           TYPE                  INITIAL    RANGE    DESCRIPTION              UNITS  
  -------------- --------------------- ---------- -------- ------------------------ ---------
  signal\[n\]    EQUAL OUT BOOLEAN                         Boolean signal values    - 

  -------------------------------------------------------------------------------------------

## 1.4 Palette of symbols

The components available in this library are depicted in the table below.

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Symbol                                                                                                                                              Component Name                                                                                                                                                                                                                                                                                           Description
  --------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image3.png)    [CCCS](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#CCCS#CCCS)                                                                                 Linear current-controlled current source

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image4.png)    [CCVS](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#CCVS#CCVS)                                                                                 Linear current-controlled voltage source

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image5.png)    [Capacitor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Capacitor#Capacitor)                                                                  Device that stores [energy](http://encyclopedia.thefreedictionary.com/energy) in the [electric field](http://encyclopedia.thefreedictionary.com/electric+field) created between a pair of conductors

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image6.png)    [Conductor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Conductor#Conductor)                                                                  The linear conductor connects the voltage difference v with the branch current i by i = v\*G

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image7.png)    [ControlledIdealCommutingSwitch](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#ControlledIdealCommutingSwitch#ControlledIdealCommutingSwitch)   Ideal commuting switch. If its voltage exceeds the level value, the inlet pin e_p is short cut to the pin e_n2. Otherwise, the pin e_p is short cut to the pin e_n1

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image8.png)    [ControlledIdealSwitch](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#ControlledIdealSwitch#ControlledIdealSwitch)                              Controlled Ideal Switch. If its voltage exceeds the level value, the pins e_p and e_n are open, otherwise the pins e_p and e_n are shortcut

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image9.png)    [CoupledInductor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#CoupledInductor#CoupledInductor)                                                It represents two inductors coupled by a mutual inductance

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image10.png)   [CurrentConstant](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#CurrentConstant#CurrentConstant)                                                Source for constant Current

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image11.png)   [CurrentSignal](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#CurrentSignal#CurrentSignal)                                                      Generic Current source using the input signal as source Current

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image12.png)   [CurrentSine](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#CurrentSine#CurrentSine)                                                            Sine Current source

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image13.png)   [Diode](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Diode#Diode)                                                                              Semiconductor diode.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image14.png)   [EMF](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#EMF#EMF)                                                                                    Electromotive force (electric/mechanic transformer). It is used as basic building block of an electrical motor

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image15.png)   [Ground](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Ground#Ground)                                                                           Ground of an electrical circuit

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image16.png)   [Gyrator](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Gyrator#Gyrator)                                                                        [Gyrator](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Gyrator#Gyrator)

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image17.png)   [IdealDiode](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#IdealDiode#IdealDiode)                                                               Ideal electrical diode
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Symbol                                                                                                                                                                                                          Component Name                                                                                                                                                                                                                                                    Description
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image18.png)                                                               [IdealGTOThyristor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#IdealGTOThyristor#IdealGTOThyristor)   Ideal GTO thyristor. It acts as a switch, conducting when their gate receives a current pulse, and continue to conduct for as long as they are forward biased

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image19.png)                                                               [IdealOpAmp](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#IdealOpAmp#IdealOpAmp)                        Ideal Operational Amplifier.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image20.png)                                                               [IdealOpAmp3Pin](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#IdealOpAmp3Pin#IdealOpAmp3Pin)            Ideal Operational Amplifier with 3 pins.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image21.png)                                                               [IdealSwitch](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#IdealSwitch#IdealSwitch)                     Ideal electrical switch

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image22.png)                                                               [IdealThyristor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#IdealThyristor#IdealThyristor)            [Ideal Thyristor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#IdealThyristor#IdealThyristor)

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image23.png)                                                               [IdealTransformer](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#IdealTransformer#IdealTransformer)      Ideal electrical transformer

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image24.png)                                                               [Inductor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Inductor#Inductor)                              An inductor is a passive electrical device that stores energy in a magnetic field, typically by combining the effects of many loops of electric current

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image25.png)                                                               [Line_LRCG](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Line_LRCG#Line_LRCG)                           Lossy transmission line

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image26.png)                                                               [Line_RC](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Line_RC#Line_RC)                                 Uniform Distributed RC Line

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image27.png)                                                               [NMOS](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#NMOS#NMOS)                                          Simple NMOS Transistor

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image28.png)                                                               [NPN](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#NPN#NPN)                                             Bipolar NPN Junction Transistor component

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image29.png)                                                               [PMOS](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#PMOS#PMOS)                                          Simple PMOS Transistor.

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image30.png)                                                               [PNP](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#PNP#PNP)                                             Bipolar PNP Junction Transistor component

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image31.png)                                                               [Resistor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Resistor#Resistor)                              A resistor is a two-terminal electrical or electronic component that resists the flow of current, producing a voltage drop between its terminals in accordance with Ohm\'s law

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image32.png){width="0.8918832020997375in" height="0.5721948818897638in"}   ResistorHeat                                                                                                                                                                                                                                                      A resistor with a thermal interface to evacuate the generated heat
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Symbol                                                                                                                                                                                                          Component Name                                                                                                                                                                                                                                              Description
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------
  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image33.png)                                                               [SensorCurrent](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#SensorCurrent#SensorCurrent)         Sensor to measure the current in a branch

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image34.png)                                                               [SensorPotential](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#SensorPotential#SensorPotential)   Sensor to measure the potential in point

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image35.png)                                                               [SensorVoltage](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#SensorVoltage#SensorVoltage)         Sensor to measure the voltage between two pins

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image36.png){width="0.5566043307086614in" height="0.7319728783902012in"}   SensorPower                                                                                                                                                                                                                                                 Sensor to measure the power dissipated in a resistor

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image37.png)                                                               [Short](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Short#Short)                                 Short cut branch

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image38.png)                                                               [VCCS](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#VCCS#VCCS)                                    Linear voltage-controlled current source

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image39.png)                                                               [VCVS](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#VCVS#VCVS)                                    Linear voltage-controlled voltage source

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image40.png)                                                               [VoltageConstant](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#VoltageConstant#VoltageConstant)   Source for constant voltage

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image41.png)                                                               [VoltageSignal](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#VoltageSignal#VoltageSignal)         Generic voltage source using the input signal as source voltage

  ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image42.png)                                                               [VoltageSine](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#VoltageSine#VoltageSine)               Sine Voltage Source
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Other components that a user may possibly require can be easily built by means of inheritance and aggregation of existing components.

In this respect, the \"[Line_LRCG](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Documents%20and%20Settings\frj\Configuración%20local\Archivos%20temporales%20de%20Internet\Content.IE5\VV34C0TO\ELECTRICAL.html#Line_LRCG#Line_LRCG)\" component is an example of a topological model behaving as a new component where several more simple units have been aggregated.

For a detailed description of the formulation the input data, please refer to the "htm" file present in the DOC directory of the Library

## 1.5 Sign convention

The sign convention within a component is: Current ("i" variable) is positive if it goes from a positive electrical port (normally named e_p and marked with a + in the symbol) to a negative one (normally named e_n and marked with a - in the symbol).

Due to the \"IN\" definition of both, the positive and negative elec ports, the value of the current at a port (called \*.i) is positive if it enters into the component to which the port is connected, independently of whether it is a positive or negative port, and it is negative if it goes out of the component:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image43.png){width="3.53125in" height="1.9895833333333333in"}

There is no restriction in the way the ports of a component are connected: Positive with negative, two positive ports together or two negative ports. Once the ports and the internal variables have been correctly formulated, the equation system is consequently assumed and solved.

The instantaneous power ("p") provided or consumed by each component is also calculated:

$p = i*v$

According to the current convention, a positive value is obtained when the element is consuming electrical power, and a negative value when it acts as a power source for the electrical system.

# 2 Components

## 2.1 Linear current-controlled current source

The Linear current controlled current source component allows users to obtain an output current that is controlled by the input current. The relation between the input current and the output current is established by the component gain. The output current also contemplates an additional current that depends on the voltage established in the load terminals, v2. The component was modelled based on the abstract component \"TwoPins\". In this way, all the ports are defined as inputs. Therefore, the currents will be positive when they have an input direction, and negative in the opposite case. The operation of the source is defined as per?? the following diagram:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image44.png){width="6.489583333333333in" height="2.7291666666666665in"}

However, the component was not established in atopologically, but by establishing the following relations in the continuous section of the component:

$$i_{2} = i_{1}*gain - \frac{v_{2}}{R_{2}}$$

$$v_{1} = i_{1}*R_{1}$$

Ports:

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                                                                     PARAMETERS   DIRECTION    CARDINALITY    DESCRIPTION  
  --------- -------------------------------------------------------------------------------------------------------------------------------------------------------- ------------ ------------ -------------- -------------------------
  e_n1      [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                 IN                          Negative pin of port 1 

  e_n2      [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                 IN                          Negative pin of port 2 

  e_p1      [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                 IN                          Positive pin of port 1 

  e_p2      [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                 IN                          Positive pin of port 2 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  ---------------------------------------------------------------------------------
  NAME    TYPE     DEFAULT    RANGE    DESCRIPTION                        UNITS  
  ------- -------- ---------- -------- ---------------------------------- ---------
  R1      REAL     0                   Input resistance                   Ohm 

  R2      REAL     1e+040              Output resistance                  Ohm 

  gain    REAL     1                   Current gain                       - 
  ---------------------------------------------------------------------------------

Variables:

  ---------------------------------------------------------------------------------------------------------
  NAME    TYPE     INITIAL    RANGE    DESCRIPTION                                                UNITS  
  ------- -------- ---------- -------- ---------------------------------------------------------- ---------
  i1      REAL                         Current flowing from pos. to neg. pin of the left port     A 

  i2      REAL                         Current flowing from pos. to neg. pin of the right port    A 

  v1      REAL                         Voltage drop over the left port                            V 

  v2      REAL                         Voltage drop over the right port                           V 
  ---------------------------------------------------------------------------------------------------------

## 2.2 Current Controlled Voltage Source

The component Current Controlled Voltage Source (CCVS), allows users to obtain an output voltage controlled by the input current. The input voltage determines the input current according to the input resistance of the source (R1). The relation between the input current and outlet voltage is established by means of a transfer resistance (transresistance). The output voltage also contemplates the voltage drop that takes place in the output impedance of the source (R2) as the output current passes through it. This component inherits its topology from the abstract component \"TwoPort\" and has the following structure:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image45.png){width="6.489583333333333in" height="2.6875in"}

The following equations comprise the continuous part of the component and define its behaviour:

$$v_{2} = i_{1}*trans\_ resistance - i_{2}*R_{2}$$

$$v_{1} = i_{1}*R_{1}$$

Ports:

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                                                                     PARAMETERS   DIRECTION    CARDINALITY    DESCRIPTION  
  --------- -------------------------------------------------------------------------------------------------------------------------------------------------------- ------------ ------------ -------------- -------------------------
  e_n1      [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                 IN                          Negative pin of port 1 

  e_n2      [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                 IN                          Negative pin of port 2 

  e_p1      [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                 IN                          Positive pin of port 1 

  e_p2      [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                 IN                          Positive pin of port 2 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  --------------------------------------------------------------------------------------
  NAME               TYPE        DEFAULT    RANGE       DESCRIPTION            UNITS  
  ------------------ ----------- ---------- ----------- ---------------------- ---------
  R1                 REAL        0                      Input resistance       Ohm 

  R2                 REAL        0                      Output resistance      Ohm 

  transResistance    REAL        1                      Transresistance        Ohm 
  --------------------------------------------------------------------------------------

Variables:

  ---------------------------------------------------------------------------------------------------------
  NAME    TYPE     INITIAL    RANGE    DESCRIPTION                                                UNITS  
  ------- -------- ---------- -------- ---------------------------------------------------------- ---------
  i1      REAL                         Current flowing from pos. to neg. pin of the left port     A 

  i2      REAL                         Current flowing from pos. to neg. pin of the right port    A 

  v1      REAL                         Voltage drop over the left port                            V 

  v2      REAL                         Voltage drop over the right port                           V 
  ---------------------------------------------------------------------------------------------------------

## 2.3 Capacitor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image46.png){width="2.0104166666666665in" height="1.6041666666666667in"}

The capacitor model included in the ELECTRICAL library inherits the characteristics of the abstract component OnePort. Its formulation corresponds to the following well-known condenser equation:

$$v_{C} = \frac{1}{C}*\int i_{C}(t)dt$$

Said expression is restated in derivative terms in accordance with the software philosophy:

$$i_{C} = C\frac{dv_{C}(t)}{dt}$$

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                                                                     PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  --------- -------------------------------------------------------------------------------------------------------------------------------------------------------- ------------- ------------ -------------- ---------------
  e_n       [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p       [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -----------------------------------------------------------------------------
  NAME      TYPE        DEFAULT    RANGE       DESCRIPTION            UNITS  
  --------- ----------- ---------- ----------- ---------------------- ---------
  C         REAL        1e-006                 Capacitance            F 

  -----------------------------------------------------------------------------

Variables:

  ---------------------------------------------------------------------------------------------------
  NAME    TYPE     INITIAL    RANGE    DESCRIPTION                                          UNITS  
  ------- -------- ---------- -------- ---------------------------------------------------- ---------
  i       REAL                         Current flowing from pin e_p to pin e_n              A 

  v       REAL                         Voltage drop between the two pins = e_p.v - e_n.v    V 
  ---------------------------------------------------------------------------------------------------

## 2.4 CapacitivePhasor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image47.png){width="1.8125in" height="0.6875in"}

An inductive phasor is a combination of a resistive component and a capacitor in series. The user is able to define the capacitance of the component using real and imaginary numbers, instead of parameters with different units.

The following equations comprise the continuous part of the component and define its behaviour:

$$R\_ cap = \ Real\_ component$$

$$C\_ cap = \ \frac{1}{2 \cdot \pi \cdot Frequency \cdot Imaginary\_ component}$$

This topology is shown below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image48.png){width="3.5734153543307086in" height="1.2397561242344708in"}

Ports

  ------------------------------------------------------------------------------
  Name        Type        Parameters   Direction    Cardinality   Description
  ----------- ----------- ------------ ------------ ------------- --------------
  pos         elec        (n = 1)      IN                         Positive pin

  neg         elec        (n = 1)      IN                         Negative pin
  ------------------------------------------------------------------------------

Parameters

  ------------------------------------------------------------------------------------------------
  Name                  Type       Default   Range   Description                       Units
  --------------------- ---------- --------- ------- --------------------------------- -----------
  Real_component        REAL       1000              Real component of the load        Ohm

  Imaginary_component   REAL       3200              Imaginary component of the load   Ohm

  Frequency             REAL       50                Frequency of the grid             Hz
  ------------------------------------------------------------------------------------------------

## 2.5 Conductor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image49.png){width="2.1875in" height="0.9895833333333334in"}

The conductor inherits its behaviour from the abstract component OnePort. Its formulation corresponds to Ohm\'s Law expressed in terms of conductivity. This law is described by the following equation which is established in the continuous section.

$$i = v*G$$

Ports:

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                                                                     PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------------------------------------------------------------------- ------------- ------------ -------------- ---------------
  e_n     [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -------------------------------------------------------------------------------
  NAME    TYPE            DEFAULT    RANGE       DESCRIPTION            UNITS  
  ------- --------------- ---------- ----------- ---------------------- ---------
  G       REAL            1                      Conductance            S 

  -------------------------------------------------------------------------------

Variables:

  ---------------------------------------------------------------------------------------------------
  NAME    TYPE     INITIAL    RANGE    DESCRIPTION                                          UNITS  
  ------- -------- ---------- -------- ---------------------------------------------------- ---------
  i       REAL                         Current flowing from pin e_p to pin e_n              A 

  v       REAL                         Voltage drop between the two pins = e_p.v - e_n.v    V 
  ---------------------------------------------------------------------------------------------------

## 2.6 Ideal Switch

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image50.png){width="2.4270833333333335in" height="1.4583333333333333in"}

The Ideal Switch component models the behaviour of an ideal switch controlled by means of a Boolean type signal. The behaviour of the control signal is evaluated in the discrete section of the component. When it changes from low level to high level, the switch is activated (ON mode). When it changes from 1 to 0, the switch is deactivated (OFF mode). The difference between one mode and the other one is given by the internal resistance, which will be high in OFF mode and low in ON mode.

WHEN (b_fire.signal\[1\]) THEN

open = FALSE

closed = TRUE

END WHEN

WHEN (NOT b_fire.signal\[1\]) THEN

closed = FALSE

open = TRUE

END WHEN

In order to model this component, an auxiliary variable \"s\" is used, which responds to the current when the component is in OFF mode and to the voltage when it is in ON mode. This component is described by means of Ohm\'s resistive and conductive laws using the ZONE statement.

\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--

COMMENT

*There is an error in the component\'s code which is corrected here. Ron and Goff are inverted (in the code they are Roff and Gon). The same ocurrs in the rest of the switches.*

*\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--*

v = ZONE (open) s

OTHERS Ron\*s

i = ZONE (open) Goff\*s

OTHERS s

The above analysis can be summarized by representing the ideal switch component by means of the following characteristic I-V curve, which shows the values of Ron and Goff far removed from the ideal to emphasize their influence.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image51.png){width="3.8958333333333335in" height="3.8854166666666665in"}

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                       PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  --------- ---------------------------------------------------------------------------------------------------------- ------------- ------------ -------------- ---------------
  b_fire    [PORTS_LIB.bool_signal](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.bool_signal.html)                  IN                           

  e_n       [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                IN                          Negative pin 

  e_p       [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                IN                          Positive pin 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  ------------------------------------------------------------------------------------
  NAME    TYPE        DEFAULT    RANGE       DESCRIPTION                     UNITS  
  ------- ----------- ---------- ----------- ------------------------------- ---------
  Gon     REAL        1e-005     0,1e+038    Opened thyristor conductance    S 

  Roff    REAL        1e-005     0,1e+038    Closed thyristor resistance     Ohm 
  ------------------------------------------------------------------------------------

Variables:

  --------------------------------------------------------------------------------------------------------
  NAME      TYPE        INITIAL    RANGE    DESCRIPTION                                          UNITS  
  --------- ----------- ---------- -------- ---------------------------------------------------- ---------
  closed    BOOLEAN     FALSE                                                                     

  i         REAL                            Current flowing from pin e_p to pin e_n              A 

  open      BOOLEAN     TRUE                                                                      

  s         REAL                            Auxiliary variable                                    

  v         REAL                            Voltage drop between the two pins = e_p.v - e_n.v    V 
  --------------------------------------------------------------------------------------------------------

## 2.7 Controlled Ideal Switch

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image52.png){width="4.375in" height="2.3125in"}

The component Controlled Ideal Switch responds to the same operation as described in the previous point for the component Ideal Switch, the only difference being the type of control signal used. It is no longer Boolean type, but an electrical signal. An infinite input impedance is also established for the control terminals, which rejects the current through it. The control therefore is carried out under voltage. For all other aspects, this component behaves identically to the above-mentioned Ideal Switch.

Ports:

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME         TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------------ -------------------------------------------------------------------------------------------- ------------- ------------ -------------- ---------------------------------------------------------
  e_control    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Control pin: control.v \> level open, otherwise closed 

  e_n          [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p          [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  ------------------------------------------------------------------------------------
  NAME     TYPE       DEFAULT    RANGE       DESCRIPTION                  UNITS  
  -------- ---------- ---------- ----------- ---------------------------- ------------
  Gon      REAL       1e-005     0,1e+040    Opened switch conductance    S 

  Roff     REAL       1e-005     0,1e+040    Closed switch resistance     Ohm 

  level    REAL       0.5                    Switch level                 V 
  ------------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------
  NAME    TYPE       INITIAL    RANGE       DESCRIPTION            UNITS  
  ------- ---------- ---------- ----------- ---------------------- ------------
  s       REAL                              Auxiliary variable      

  -----------------------------------------------------------------------------

## 2.8 Controlled Ideal Commuting Switch

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image53.png){width="3.3645833333333335in" height="1.5729166666666667in"}

The ideal commuter has two output ports, and depending on the value of the control signal, the input port is connected to one of the two output ports. The formulation is completed by establishing the sum of the currents as null: the inlet current shall be equal to and of opposite sign to the sum of the two output currents.

Ports:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME         TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------------ -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -----------------------------------------------------------
  e_control    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Control pin: control.v \> level p\--n2, otherwise p\--n1 

  e_n1         [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 1 

  e_n2         [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 2 

  e_p          [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -----------------------------------------------------------------------------------
  NAME     TYPE        DEFAULT    RANGE       DESCRIPTION                  UNITS  
  -------- ----------- ---------- ----------- ---------------------------- ----------
  Gon      REAL        1e-005     0,1e+040    Opened switch conductance    S 

  Roff     REAL        1e-005     0,1e+040    Closed switch resistance     Ohm 

  level    REAL        0.5                    Switch level                 V 
  -----------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------
  NAME    TYPE        INITIAL    RANGE     DESCRIPTION               UNITS  
  ------- ----------- ---------- --------- ------------------------- ----------
  s1      REAL                             Auxiliary variable 1       

  s2      REAL                             Auxiliary variable 2       
  -----------------------------------------------------------------------------

## 2.9 Coupled inductor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image54.png){width="1.7395833333333333in" height="1.2916666666666667in"}

The component Coupled Inductor models a structure formed by two mutually coupled inductors. Each one has its own inductivity and in addition is sensitive to the inductivity of the other winding. Thus, the voltage at the ends of each inductor depends on its own internal current ... and, by means of a coupling coefficient, on the current through the other inductor. The law on which the component\'s behaviour is based is the same one as for the simple winding:

$$v_{L} = L*\frac{di_{L}(t)}{dt}$$

This equation adapts itself to the modelling concept that must be applied, in which it is always necessary to try to establish the value of the derivatives so that the variables can be solved by means of an integrator as dynamic variables. If the influence of the second inductor and the coupling is taken into consideration, the continuous section of the couple inductor is completed by the following equations:

$$v_{L1} = L_{1}*\frac{di_{L1}(t)}{dt} + M*\frac{di_{L2}(t)}{dt}$$

$$v_{L2} = L_{2}*\frac{di_{L2}(t)}{dt} + M*\frac{di_{L1}(t)}{dt}$$

Where the mutual induction, M, is calculated according to the following expression:

$$M = K*\sqrt{L_{1}*L_{2}}$$

Where K is the coupling coefficient.

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 1 

  e_n2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 2 

  e_p1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 1 

  e_p2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 2 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  --------------------------------------------------------------------------------------------
  NAME    TYPE        DEFAULT    RANGE           DESCRIPTION                         UNITS  
  ------- ----------- ---------- --------------- ----------------------------------- ---------
  K       REAL        0.5        0,1 - 1e-006    Coefficient of Coupling Coupling    - 

  L1      REAL        1          0,Inf           Primary inductance                  H 

  L2      REAL        1          0,Inf           Secondary inductance                H 
  --------------------------------------------------------------------------------------------

Variables:

  ------------------------------------------------------------------------------------------------------------
  NAME    TYPE        INITIAL    RANGE    DESCRIPTION                                                UNITS  
  ------- ----------- ---------- -------- ---------------------------------------------------------- ---------
  M       REAL                            Coupling inductance (H)                                    H 

  i1      REAL                            Current flowing from pos. to neg. pin of the left port     A 

  i2      REAL                            Current flowing from pos. to neg. pin of the right port    A 

  v1      REAL                            Voltage drop over the left port                            V 

  v2      REAL                            Voltage drop over the right port                           V 
  ------------------------------------------------------------------------------------------------------------

## 2.10 Current Constant

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image55.png){width="1.8541666666666667in" height="1.09375in"}

$$i(t) = I$$

The component Current Constant allows users to set the current of a branch to a constant value. It inherits the characteristics of the abstract component OnePort. The value of the current is set by making the internal variable *i* of said component equal to a referred parameter like *I*. Its definition as OnePort means that it is has two electrical ports and that their internal variables are its internal current *i* and its positive to negative voltage.

Ports:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY                 DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ --------------------------- ---------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                                       Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                                       Positive pin 
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -------------------------------------------------------------------------------
  NAME    TYPE         DEFAULT    RANGE    DESCRIPTION                  UNITS  
  ------- ------------ ---------- -------- ---------------------------- ---------
  I       REAL         1                   Value of constant Current    A 

  -------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE         INITIAL    RANGE    DESCRIPTION                                          UNITS  
  ------- ------------ ---------- -------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

## 2.11 Current Signal

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image56.png){width="2.0833333333333335in" height="1.7604166666666667in"}

$$i(t) = s\_ in.signal$$

The component Current Signal allows users to convert a control signal to electrical current along a branch. It adds a control port type analog_signal to a OnePort type component. The value of said control signal is made equal to the variable *i* of the source.

Ports:

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                           PARAMETERS    DIRECTION    CARDINALITY       DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------------------------- ------------- ------------ ----------------- -----------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                             Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                             Positive pin 

  s_in    [PORTS_LIB.analog_signal](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.analog_signal.html)                  IN                              Control signal
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE     DESCRIPTION                                          UNITS  
  ------- --------- ---------- --------- ---------------------------------------------------- ---------
  i       REAL                           Current flowing from pin e_p to pin e_n              A 

  v       REAL                           Voltage drop between the two pins = e_p.v - e_n.v    V 
  -----------------------------------------------------------------------------------------------------

## 2.12 Current Sine

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image57.png){width="1.8333333333333333in" height="1.2395833333333333in"}

$$i(t) = sin(Ipeak,freqHz,phase,offset,starttime)$$

The component Current Sine establishes a steady sinusoidal current in the branch in which it is located. Like the other one-phase current sources, it inherits its behaviour from the abstract component OnePort. In addition, by means of topological programming, a Sine type source is defined that acts as a control of Current Signal source. This type of source allows the configuration of amplitude, frequency, phase, offset and startup time of the signal. In addition, the inheritance and topological programming avoids redundancies and unnecessary lines of code.

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY            DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ ---------------------- ---------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                                  Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                                  Positive pin 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  ------------------------------------------------------------------------------------
  NAME         TYPE        DEFAULT    RANGE    DESCRIPTION                   UNITS  
  ------------ ----------- ---------- -------- ----------------------------- ---------
  Ioffset      REAL        0                   Current offset                A 

  Ipeak        REAL        1                   Current amplitude             A 

  freqHz       REAL        1                   Frequencies of sine waves     Hz 

  phase        REAL        0                   Phases of sine waves          rad 

  startTime    REAL        0                   Output = offset for time      s 
  ------------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE         INITIAL    RANGE    DESCRIPTION                                          UNITS  
  ------- ------------ ---------- -------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

Component instances (Topology Block):

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  OBJECT             COMPONENT TYPE                                                                                                                                                                 DESCRIPTION  
  ------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -----------------------------------
  current            [CurrentSignal](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.CurrentSignal.html)     

  source             [Sine](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.Sine.html)                       
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Component instances Data:

  -------------------------------------------------------------------------------------------
  DATUM               VALUE        POS       TYPE     DESCRIPTION                  UNITS  
  ------------------- ------------ --------- -------- ---------------------------- ----------
  source.amplitude    Ipeak        DATA      REAL     Amplitudes of sine waves     \"-\" 

  source.freqHz       freqHz       DATA      REAL     Frequencies of sine waves    \"Hz\" 

  source.offset       Ioffset      DATA      REAL     Offsets of output signals    \"-\" 

  source.phase        phase        DATA      REAL     Phases of sine waves         \"rad\" 

  source.startTime    startTime    DATA      REAL     Output = offset for time     \"s\" 
  -------------------------------------------------------------------------------------------

## 2.13 Diode

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image58.png){width="1.6145833333333333in" height="1.0104166666666667in"}

The Diode component inherits its characteristics from the component OnePort. The CONTINUOUS section contains the continuous equation of the diode. This equation establishes the current through the diode as a function of an exponential of the anode to cathode voltage of the component.

$$i_{D} = I_{DS}*(e^{\frac{v}{V_{T}}} - 1) + V_{R}$$

The graphical behaviour of the diode equation is represented by the following Voltage-Current characteristic curve:

![caracteristica](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image59.png){width="5.166666666666667in" height="4.614583333333333in"}

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY            DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ ---------------------- ---------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                                  Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                                  Positive pin 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  ------------------------------------------------------------------------------------------------
  NAME    TYPE        DEFAULT      RANGE    DESCRIPTION                                  UNITS  
  ------- ----------- ------------ -------- -------------------------------------------- ---------
  Ids     REAL        1e-006                Saturation current                           A 

  R       REAL        100000000             Parallel ohmic resistance                    Ohm 

  Vt      REAL        0.04                  Voltage equivalent of temperature = kT/qn    V 
  ------------------------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE         INITIAL    RANGE    DESCRIPTION                                          UNITS  
  ------- ------------ ---------- -------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

## 2.14 Electromotive Force

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image60.png){width="1.625in" height="1.4270833333333333in"}

The Electromotive Force component is an ideal version of a direct current motor. This component has two electrical terminals (positive and negative) and a rotary mechanical shaft. The rotation speed of the shaft depends on the voltage applied at the ends, while the torque depends on the current. The component does not contemplate the equivalent circuit of the motor, so the consumption of the motor deopends exclusively on the torque applied to the shaft. If there is no resistant torque, the current is null. It is assumed, therefore, that the speed is always determined by feed voltage independently of the mechanical load. Neither does it contemplate the dynamics of the motor: there are no mechanical or electrical time constants, nor are there any inertias or frictions. The voltage-speed and current-torque ratios are given by a constant *k.*

$$Shaft\_ Torque(t) = K*i(t)$$

$$Shaft\_ Speed(t) = K*v(t)$$

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY            DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ ---------------------- ---------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                                  Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                                  Positive pin 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -------------------------------------------------------------------------------
  NAME    TYPE        DEFAULT    RANGE    DESCRIPTION                   UNITS  
  ------- ----------- ---------- -------- ----------------------------- ---------
  k       REAL        1                   Transformation coefficient    Nw.m/A 

  -------------------------------------------------------------------------------

Variables:

  ----------------------------------------------------------------------------------------------------
  NAME     TYPE         INITIAL    RANGE    DESCRIPTION                                      UNITS  
  -------- ------------ ---------- -------- ------------------------------------------------ ---------
  i        REAL                             Current flowing from positive to negative pin    A 

  omega    REAL                             Angular velocity of flange_b                     rad/s 

  v        REAL                             Voltage drop between the two pins                V 
  ----------------------------------------------------------------------------------------------------

## 2.15 Ground

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image61.png){width="0.71875in" height="0.7291666666666666in"}

The Ground component is used to establish a reference potential based on which voltage levels at all points of a circuit can be determined. The currents through the component are not defined in any way, but it is the rest of the circuit that determines their values. Therefore, the component has a single elec type port and its voltage is set to zero.

$$Ground.v = 0$$

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -----------------
  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                           

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

## 2.16 Gyrator

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image62.png){width="1.6458333333333333in" height="1.3333333333333333in"}

The Gyrator component carries out an exchange between the voltage-current ratio at the input and output of a TwoPort type component. The current at the input depends on the voltage at the output, while the current at the output depends on the voltage at the input. These relationships are defined by the input and output conductances, G~1~ and G~2~. It inherits all its characteristics from the abstract component TwoPort.

$$i_{1}(t) = G_{2}*v_{2}(t)$$

$$i_{2}(t) = - G_{1}*v_{1}(t)$$

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 1 

  e_n2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 2 

  e_p1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 1 

  e_p2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 2 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  --------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE     DESCRIPTION                    UNITS  
  ------- ---------- ---------- --------- ------------------------------ ---------
  G1      REAL       1                    Gyration conductance           S 

  G2      REAL       1                    Gyration conductance           S 
  --------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE     DESCRIPTION                                                UNITS  
  ------- --------- ---------- --------- ---------------------------------------------------------- ---------
  i1      REAL                           Current flowing from pos. to neg. pin of the left port     A 

  i2      REAL                           Current flowing from pos. to neg. pin of the right port    A 

  v1      REAL                           Voltage drop over the left port                            V 

  v2      REAL                           Voltage drop over the right port                           V 
  -----------------------------------------------------------------------------------------------------------

## 2.17 Ideal Battery

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image63.png){width="1.2916666666666667in" height="0.7300721784776902in"}

This component models the behaviour of an Ideal Battery defined only by its open-circuit voltage (OCV) as a function of the state of charge (SOC). This variable is updated using a simple coulomb-counting approach, based on the current flowing through the battery and its nominal capacity. The OCV is obtained from a table relating SOC to voltage, scaled by the nominal battery voltage.

Ports:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- ----------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  ----------------------------------------------------------------------------------------------------------------------------------------------------
  NAME     TYPE       DEFAULT                                             RANGE     DESCRIPTION                                           UNITS  
  -------- ---------- --------------------------------------------------- --------- ----------------------------------------------------- ------------
  Q        REAL       2                                                             Nominal capacity                                      Ah 

  V_nom    REAL       3.7                                                           Battery VOC nominal voltage                           V 

  V_SOC    TABLE_1D   {{-0.1,0,0.25,0.9,1,1.1}, {0,0.68,1,1,1.14,1.14}}             Battery open-circuit voltage versus state of charge   V per unit

  soc0     REAL       0.1                                                           Initial state of charge (0...1)                       
  ----------------------------------------------------------------------------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE     DESCRIPTION                    UNITS  
  ------- --------- ---------- --------- ------------------------------ ---------
  soc     REAL                           State of charge (0...1)        

  voc     REAL                           Open-circuit voltage           V 
  -------------------------------------------------------------------------------

## 2.18 Ideal Diode

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image64.png){width="1.2916666666666667in" height="0.8229166666666666in"}

The Ideal Diode component approximates the characteristic C-V curve of the diode by means of straight sections. It uses a basic Ohm\'s Law in which the internal resistance of the diode changes as a function of the polarization of the diode. Depending on whether the anode-cathode voltage of the diode is positive or negative, the component takes on a high or low internal resistance, respectively. In this way it reproduces ON-OFF or conducting-insulating behaviour. The component inherits the characteristics of the abstract element OnePort.

Ports:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- ----------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  --------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE     DESCRIPTION                    UNITS  
  ------- ---------- ---------- --------- ------------------------------ ---------
  Gon     REAL       1e-005               Opened diode conductance       S 

  Roff    REAL       1e-005               Closed diode resistance        Ohm 
  --------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE        INITIAL    RANGE     DESCRIPTION                                          UNITS  
  ------- ----------- ---------- --------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  off     BOOLEAN     TRUE                 Switching state of diode                              

  s       REAL                             Auxiliary variable                                    

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

## 2.19 Ideal GTO Thyristor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image65.png){width="1.7604166666666667in" height="0.9583333333333334in"}

The ideal GTO thyristor models the behaviour of a thyristor in which, in addition, it is possible to interrupt its conductance even though the current through it has not been annulled. It is sufficient to remove the voltage applied at the control terminal gate. Its model inherits the characteristics of the abstract component OnePort and implements an internal resistance that is high or low depending on the polarization and on the control of the device. The device is controlled by a bool_signal type port.

Ports:

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                       PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  --------- ---------------------------------------------------------------------------------------------------------- ------------- ------------ -------------- ----------------
  b_fire    [PORTS_LIB.bool_signal](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.bool_signal.html)                  IN                           

  e_n       [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                IN                          Negative pin 

  e_p       [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                IN                          Positive pin 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -----------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE       DESCRIPTION                     UNITS  
  ------- ---------- ---------- ----------- ------------------------------- ---------
  Gon     REAL       1e-005     0,1e+038    Opened thyristor conductance    S 

  Roff    REAL       1e-005     0,1e+038    Closed thyristor resistance     Ohm 
  -----------------------------------------------------------------------------------

Variables:

  ---------------------------------------------------------------------------------------------------------
  NAME      TYPE        INITIAL    RANGE     DESCRIPTION                                          UNITS  
  --------- ----------- ---------- --------- ---------------------------------------------------- ---------
  closed    BOOLEAN     FALSE                                                                      

  i         REAL                             Current flowing from pin e_p to pin e_n              A 

  open      BOOLEAN     TRUE                                                                       

  s         REAL                             Auxiliary variable                                    

  v         REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  ---------------------------------------------------------------------------------------------------------

## 2.20 Ideal Operational Amplifier

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image66.png){width="1.4479166666666667in" height="1.5833333333333333in"}

The ideal operational amplifier component takes an input voltage and transfers it to the output via an infinite impedance, and in addition applies a given gain. The component is defined as TwoPort and the infinite inlet impedance is established by setting the inlet current to zero. The output current is established based on the output voltage and the rest of the circuit.

$$v_{2}(t) = G*v_{1}(t)$$

$$i_{1}(t) = 0$$

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 1 

  e_n2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 2 

  e_p1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 1 

  e_p2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 2 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  --------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE     DESCRIPTION                    UNITS  
  ------- ---------- ---------- --------- ------------------------------ ---------
  G       REAL       1000000              Amplifier gain                 - 

  --------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE     DESCRIPTION                                                UNITS  
  ------- --------- ---------- --------- ---------------------------------------------------------- ---------
  i1      REAL                           Current flowing from pos. to neg. pin of the left port     A 

  i2      REAL                           Current flowing from pos. to neg. pin of the right port    A 

  v1      REAL                           Voltage drop over the left port                            V 

  v2      REAL                           Voltage drop over the right port                           V 
  -----------------------------------------------------------------------------------------------------------

## 2.21 Three-Pin Ideal Operational Amplifier 

The tree-pin ideal operational amplifier works in the same way as the four-pin ideal operational amplifier described above but, instead of supplying the outlet voltage between two pins, it supplies it at a single pin. Therefore, that voltage at this point is referred to zero. The use of this component makes it necessary to design the circuit on the basis of this criterion and to establish a reference voltage in order to determine the voltage drop at load extremes. Consequently, the component is not modelled as a TwoPort, but instead three electric points are defined to complete the model. The component lacks intenal variables as it is modelled using only the variables of the ports.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image67.png){width="1.59375in" height="1.2395833333333333in"}

$$e\_ out.v = G(e\_ in\_ p.v - e\_ in\_ n.v)$$

$$e\_ in\_ p.i = 0$$

$$e\_ in\_ n.i = 0$$

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  --------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- ---------------------------------
  e_in_n    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of the input port 

  e_in_p    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of the input port 

  e_out     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Output pin 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parámetros:

  ------------------------------------------------------------------------------
  NAME    TYPE          DEFAULT    RANGE      DESCRIPTION       UNITS  
  ------- ------------- ---------- ---------- ----------------- ----------------
  G       REAL          1000000               Amplifier gain    - 

  ------------------------------------------------------------------------------

## 2.22 Ideal Thyristor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image68.png){width="1.6666666666666667in" height="1.0833333333333333in"}

The model of the ideal thyristor is based on a combination of continuous and discrete formulations. This component responds to a basic Ohm\'s Law in which the resistance becomes very high when the device is blocked (OFF), and takes on a negligible value if it is conducting (ON). The activation of the thyristor, is established in the discrete section and it depends on the direct polarization of the thyristor and on the arrival of the activation signal at the gate terminal. Once activated, the thyristor continues to conduct until the current through it changes its direction. Therefore, in essence, the thyristor is a diode whose conduction can be controlled and even prevented by means of a control terminal. The component inherits the characteristics of the abstract element OnePort and is controlled by means of a bool_signal type port that acts as a gate terminal.

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME      TYPE                                                                                                       PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  --------- ---------------------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------
  b_fire    [PORTS_LIB.bool_signal](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.bool_signal.html)                  IN                           Control gate pin

  e_n       [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                IN                          Negative pin 

  e_p       [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                IN                          Positive pin 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -----------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE       DESCRIPTION                     UNITS  
  ------- ---------- ---------- ----------- ------------------------------- ---------
  Gon     REAL       1e-005     0,1e+038    Opened thyristor conductance    S 

  Roff    REAL       1e-005     0,1e+038    Closed thyristor resistance     Ohm 
  -----------------------------------------------------------------------------------

Variables:

  ---------------------------------------------------------------------------------------------------------
  NAME      TYPE        INITIAL    RANGE     DESCRIPTION                                          UNITS  
  --------- ----------- ---------- --------- ---------------------------------------------------- ---------
  closed    BOOLEAN     FALSE                 Thyristor state = ON when TRUE                       

  i         REAL                             Current flowing from pin e_p to pin e_n              A 

  open      BOOLEAN     TRUE                  Thyristor state = OFF when TRUE                      

  s         REAL                             Auxiliary variable                                    

  v         REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  ---------------------------------------------------------------------------------------------------------

## 2.23 Transformador Ideal

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image69.png){width="1.4479166666666667in" height="1.21875in"}

The ideal transformer model in ELECTRICAL Library ignores all the undesired effects that arise in a real transformer \[1\]. The user has to establish the transformation ratio between the input and the output, which in a real transformer would be given by the quotient of the number of spirals in each winding. The component inherits the characteristics of the abstract component TwoPort and therefore it is necessary to invert the sign of the currents at its passage from the primary to the secondary to establish as positive the outgoing current from the secondary as all the ports are defined as inlets.

$$v_{1} = n*v_{2}$$

$$i_{2} = - n*i_{1}$$

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 1 

  e_n2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 2 

  e_p1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 1 

  e_p2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 2 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  --------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE     DESCRIPTION                    UNITS  
  ------- ---------- ---------- --------- ------------------------------ ---------
  n       REAL       2                    Turns ratio                    - 

  --------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE     DESCRIPTION                                                UNITS  
  ------- --------- ---------- --------- ---------------------------------------------------------- ---------
  i1      REAL                           Current flowing from pos. to neg. pin of the left port     A 

  i2      REAL                           Current flowing from pos. to neg. pin of the right port    A 

  v1      REAL                           Voltage drop over the left port                            V 

  v2      REAL                           Voltage drop over the right port                           V 
  -----------------------------------------------------------------------------------------------------------

\[1\] More detailed models of Electric Transformer considering undesired effects are available in ELECTRIC_SYSTEMS Library.

## 2.24 Inductor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image70.png){width="1.3645833333333333in" height="0.8125in"}

The model of the inductor inherits its behaviour from the abstract component OnePort and from the following continuous equation:

$$\frac{di_{L}(t)}{dt} = \frac{v_{L}(t)}{L}$$

Ports:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- ----------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  --------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE     DESCRIPTION                    UNITS  
  ------- ---------- ---------- --------- ------------------------------ ---------
  L       REAL       1                    Inductance                     H 

  --------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE     DESCRIPTION                                          UNITS  
  ------- --------- ---------- --------- ---------------------------------------------------- ---------
  i       REAL                           Current flowing from pin e_p to pin e_n              A 

  v       REAL                           Voltage drop between the two pins = e_p.v - e_n.v    V 
  -----------------------------------------------------------------------------------------------------

## 2.25 InductivePhasor

An inductive phasor is a combination of a resistive component and an inductor in series. The user is able to define the inductance of the component using real and imaginary numbers, instead of parameters with different units.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image71.png){width="1.7085717410323709in" height="0.645923009623797in"}

The equations, which dictate the behaviour of the component, are the following:

$$R\_ ind = \ Real\_ component$$

$$L\_ ind = \ \frac{Imaginary\_ component}{2 \cdot \pi \cdot Frequency}$$

The topology is shown below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image72.png){width="3.333798118985127in" height="0.7605227471566054in"}

Parameters

  ------------------------------------------------------------------------------------------------------
  Name                  Type       Default     Range       Description                       Units
  --------------------- ---------- ----------- ----------- --------------------------------- -----------
  Real_component        REAL       1                       Real component of the load        Ohm

  Imaginary_component   REAL       1                       Imaginary component of the load   Ohm

  Frequency             REAL       50                      Frequency of the grid             Hz
  ------------------------------------------------------------------------------------------------------

Ports

  ------------------------------------------------------------------------------
  Name        Type        Parameters   Direction    Cardinality   Description
  ----------- ----------- ------------ ------------ ------------- --------------
  pos         elec        (n = 1)      IN                         Positive pin

  neg         elec        (n = 1)      IN                         Negative pin
  ------------------------------------------------------------------------------

## 2.26 Lossy transmission Line

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image73.png){width="3.6770833333333335in" height="1.9791666666666667in"}

The lossy transmission line (Line_LRCG) is modelled as a combination of elements that approximate the behaviour of a real long electrical connection. The value of the components that form the line will be proportional to the distance from the line which is configured as DATA. By this conception the transmission line has a common point at both extremes and two not common points between which transmission takes place via the undesired elements. The elements that form the equivalent circuit of the line are the capacitors, inductances and resistances of the actual ELECTRICAL library. Its formulation and object oriented language make it sufficient to define its connections to guarantee a joint behaviour as desired. The component comprises N parallel lines that simulate the number of conductors that comprise it.

Construction parameters:

  ------------------------------------------------------------------------------
  NAME    TYPE               DEFAULT      DESCRIPTION                  UNITS  
  ------- ------------------ ------------ ---------------------------- ---------
  N       INTEGER            10            Number of line components    

  ------------------------------------------------------------------------------

Ports:

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- ---------------------------
  e_p1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                           Input Positive Terminal

  e_p2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                           Output Positive Terminal

  e_p3    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                           Common Terminal
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -----------------------------------------------------------------------------------
  NAME      TYPE       DEFAULT    RANGE            DESCRIPTION              UNITS  
  --------- ---------- ---------- ---------------- ------------------------ ---------
  c         REAL       1          1e-040,1e+040    Capacitance per meter    F/m 

  g         REAL       1          1e-040,1e+040    Conductance per meter    S/m 

  l         REAL       1          1e-040,1e+040    Inductance per meter     H/m 

  length    REAL       1          1e-040,1e+040    Length of line           m 

  r         REAL       1          1e-040,1e+040    Resistance per meter     Ohm/m 
  -----------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE    DESCRIPTION                         UNITS  
  ------- --------- ---------- -------- ----------------------------------- ---------
  i1      REAL                           Input positive terminal current     A

  i2      REAL                           Output positive terminal current    A

  v13     REAL                           Input voltage                       V

  v23     REAL                           Output voltage                      V
  -----------------------------------------------------------------------------------

Component instances:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  OBJECT    COMPONENT TYPE                                                                                                                                                         DESCRIPTION  
  --------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------
  R         [Resistor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.Resistor.html)       Parasite resistance

  L         [Inductor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.Inductor.html)       Parasite Inductance

  C         [Capacitor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.Capacitor.html)     Parasite Capacitance

  G         [Conductor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.Conductor.html)     Parasite Conductance
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Component instances data:

  -----------------------------------------------------------------------------------------
  DATUM           VALUE                    POS       TYPE      DESCRIPTION       UNITS  
  --------------- ------------------------ --------- --------- ----------------- ----------
  C\[N\].C        c \* length / N          DATA      REAL      Capacitance       \"F\" 

  G\[N\].G        g \* length / N          DATA      REAL      Conductance       \"S\" 

  L\[N + 1\].L    l \* length / (N + 1)    DATA      REAL      Inductance        \"H\" 

  R\[N + 1\].R    r \* length / (N + 1)    DATA      REAL      Resistance        \"Ohm\" 
  -----------------------------------------------------------------------------------------

## 2.27 Multiplexer

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image74.png){width="1.718989501312336in" height="1.718989501312336in"}

A Multiplexer is a device used for signal selection. Among multiple electrical inlets, the user is able to select one using a combination of bits. In this case, by using two bits, the total number of options is four.

to calculate the amount of options available, the equation used is the following:

$$2^{n} = Options$$

The schematics behind this component are the following:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image75.png){width="6.496527777777778in" height="2.4944444444444445in"}

Ports

  ---------------------------------------------------------------------------------------------------------------
  Name        Type          Parameters   Direction    Cardinality   Description
  ----------- ------------- ------------ ------------ ------------- ---------------------------------------------
  in_1        elec          (n = 1)      IN                         Inlet electrical signal

  in_2        elec          (n = 1)      IN                         Inlet electrical signal

  in_3        elec          (n = 1)      IN                         Inlet electrical signal

  in_4        elec          (n = 1)      IN                         Inlet electrical signal

  out         elec          (n = 1)      IN                         Outlet electrical signal

  sel_0       bool_signal   (n = 1)      IN                         Boolean input for the least significant bit

  sel_1       bool_signal   (n = 1)      IN                         Boolean input for the most significant bit
  ---------------------------------------------------------------------------------------------------------------

Using logic gates, the user is able to select one of the four options. Given that this number is dictated by binary digits,

## 2.28 Uniformly Distributed RC Line

The RC line contemplates the undesired effects of a transmission line as uniformly distributed. Its model is formed by means of a series resistance and a condenser in parallel. The capacitance and resistance values are proportional to the distance of the line, which is indicated as DATA. The user also has to indicate, as a construction parameter, the width of the line (number of lines in parallel). It is modelled by means of topological programming, making use of capacitors and resistances from the actual library. The component communicates with the rest of the circuit by means of two electrical ports corresponding to the points of interconnection of the transmission line and a third point common to both.

Construction parameters:

  ------------------------------------------------------------------------------
  NAME    TYPE               DEFAULT      DESCRIPTION                  UNITS  
  ------- ------------------ ------------ ---------------------------- ---------
  N       INTEGER            10            Number of line components    

  ------------------------------------------------------------------------------

Ports:

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- ---------------------------
  e_p1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                           Input Positive Terminal

  e_p2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                           Output Positive Terminal

  e_p3    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                           Common Terminal
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -----------------------------------------------------------------------------------
  NAME      TYPE       DEFAULT    RANGE            DESCRIPTION              UNITS  
  --------- ---------- ---------- ---------------- ------------------------ ---------
  c         REAL       1          1e-040,1e+040    Capacitance per meter    F/m 

  length    REAL       1          1e-040,1e+040    Length of line           m 

  r         REAL       1          1e-040,1e+040    Resistance per meter     Ohm/m 
  -----------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE    DESCRIPTION                         UNITS  
  ------- --------- ---------- -------- ----------------------------------- ---------
  i1      REAL                           Input positive terminal current     A

  i2      REAL                           Output positive terminal current    A

  v13     REAL                           Input voltage                       V

  v23     REAL                           Output voltage                      V
  -----------------------------------------------------------------------------------

Component instances:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  OBJECT    COMPONENT TYPE                                                                                                                                                         DESCRIPTION  
  --------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------
  R         [Resistor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.Resistor.html)       Line resistance

  C         [Capacitor](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.Capacitor.html)     Line capacitance
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Component instances data:

  -----------------------------------------------------------------------------------------
  DATUM           VALUE                    POS       TYPE      DESCRIPTION       UNITS  
  --------------- ------------------------ --------- --------- ----------------- ----------
  C\[N\].C        c \* length / N          DATA      REAL      Capacitance       \"F\" 

  R\[N + 1\].R    r \* length / (N + 1)    DATA      REAL      Resistance        \"Ohm\" 
  -----------------------------------------------------------------------------------------

## 2.29 NMOS Transistor 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image76.png){width="1.5625in" height="1.4166666666666667in"}

The NMOS field-effect transistor is modelled by establishing a series of characteristics using DATA for the channel. According to these channel characteristics and to the whole circuit configuration , the drain-source voltage of the transistor and the current through it are established. The field effect transistor requires the application of a positive gate voltage for it to conduct. The figure shows a slice image with the profile of an NMOS transistor. This type of transistor requires direct polarization of the gate-substrate junction. This polarization will attract the free electrons present in the P substrate and create a type N channel between the source and the drain that allows circulation of electrons between the terminals.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image77.png){width="4.3125in" height="2.9791666666666665in"}

As can be observed in the physical structure of the transistor, there are two PN junctions (diodes) between the P substrate and the contact N+ regions of the source and drain. These diodes must be inversely polarized for the correct operation of the transistor. In addition, the current of the channel I~d~ depends on the voltages between Gate-Source, Drain-Source and Base-Source. Voltages that establish the region in which the transistor operates. In MOSFETs there are three regions of operation:

- Cut.

- Linear or Ohmic.

- Saturation.

In the model developed, the PN junctions have been modelled by means of ZONE expressions, as a function of the status of these junctions, and three possible expressions are defined for the current of the drain, according to the region in which the transistor is located. In addition, it takes into account the shape of the channel (width-length ratio) and the modulation effect of the channel. The following characteristic C-V curve is produced:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image78.png){width="5.572916666666667in" height="4.125in"}

Thus the equations that describe the current of the drain of a transistor with N channel and which were used as the basis for the model developed, are the following:

$$V_{GS} \leq V_{T};V_{DS} > 0 \rightarrow I_{D} = 0 \rightarrow Cut$$

$$V_{GS} > V_{T};0 < V_{DS} < V_{GS} - V_{T} \rightarrow I_{D} = \frac{\beta W}{L}\left\lbrack (V_{GS} - V_{T})V_{DS} - \frac{V_{DS}^{2}}{2} \right\rbrack \rightarrow Lineal - Ohmic$$

$$V_{GS} > V_{T};V_{DS} > V_{GS} - V_{T} \rightarrow I_{D} = \frac{\beta W}{2L}(V_{GS} - V_{T}) \rightarrow Saturation$$

Where V~T~ is the threshhold voltage, W and L is the width and length of the channel respectively and β is the so-called trans-conductance parameter.

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS      DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- --------------- ------------ -------------- ---------------
  e_B     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                    IN                          Bulk 

  e_D     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                    IN                          Drain 

  e_G     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                    IN                          Gate 

  e_S     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                    IN                          Source 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

Parámetros:

  -------------------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT      RANGE            DESCRIPTION                      UNITS  
  ------- ---------- ------------ ---------------- -------------------------------- ---------
  Beta    REAL       0.041                         Transconductance parameter       A/V\^2 

  K2      REAL       1.144                         Bulk threshold parameter         - 

  K5      REAL       0.7311                        Reduction of pinch-off region    - 

  L       REAL       6e-006                        Length                           m 

  Vt      REAL       0.8                           Zero bias threshold voltage      V 

  W       REAL       2e-005                        Width                            m 

  dL      REAL       -1.5e-006                     Shortening of channel            m 

  dW      REAL       -2.5e-006                     Narrowing of channel             m 
  -------------------------------------------------------------------------------------------

Variables:

  ---------------------------------------------------------------------------------------
  NAME    TYPE      INITIAL    RANGE           DESCRIPTION                      UNITS  
  ------- --------- ---------- --------------- -------------------------------- ---------
  id      REAL                                  Drain current                    A

  ubs     REAL                                  Bulk-Source voltage              V

  ud      REAL                                  Drain voltage                    V

  uds     REAL                                  Drain-Source voltage             V

  ugst    REAL                                  Gate source thermical voltage    V

  us      REAL                                  Source voltage                   V

  v       REAL                                  Channel transconductance         A/V^2^
  ---------------------------------------------------------------------------------------

## 2.30 NPN Bipolar Transistor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image79.png){width="1.75in" height="1.4375in"}

The NPN transistor responds to the characteristic curves shown in the figure below. The model developed reproduces the behaviour of the equivalent circuit with a small signal. The capacities of the different junctions are calculated by means of calls to the JunctionCap function, included in the ELECTRICAL library.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image80.png){width="2.75in" height="2.0in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image81.png){width="5.677083333333333in" height="5.09375in"}

The model of the bipolar transmitter developed is based in the Ebers-Moll equations:

$$I_{bc} = I_{S}(e^{\frac{v_{bc}}{v_{t}}} - 1) + V_{bc}G_{bc}$$

$$I_{be} = I_{S}(e^{\frac{v_{be}}{v_{t}}} - 1) + V_{be}G_{be}$$

In addition, it models the existing capacities between the different PN junctions by means of the JunctionCap function and an estimation based on the polarization conditions.

Ports:

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS      DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- --------------- ------------ -------------- ---------------
  e_B     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                    IN                          Base 

  e_C     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                    IN                          Collector 

  e_E     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                    IN                          Emitter 
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -------------------------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT     RANGE    DESCRIPTION                                     UNITS  
  ------- ---------- ----------- -------- ----------------------------------------------- ---------
  Bf      REAL       50                   Forward beta                                    - 

  Br      REAL       0.1                  Reverse beta                                    - 

  Ccs     REAL       1e-012               Collector-substrat ground capacitance           F 

  Cjc     REAL       5e-013               Base-coll. zero bias depletion capacitance      F 

  Cje     REAL       4e-013               Base-emitter zero bias depletion capacitance    F 

  Gbc     REAL       1e-015               Base-collector conductance                      S 

  Gbe     REAL       1e-015               Base-emitter conductance                        S 

  Is      REAL       1e-016               Transport saturation current                    A 

  Mc      REAL       0.333                Base-collector gradation exponent               - 

  Me      REAL       0.4                  Base-emitter gradation exponent                 - 

  Phic    REAL       0.8                  Base-collector diffusion voltage                V 

  Phie    REAL       0.8                  Base-emitter diffusion voltage                  V 

  Tauf    REAL       1.2e-010             Ideal forward transit time                      s 

  Taur    REAL       5e-009               Ideal reverse transit time                      s 

  Vak     REAL       0.02                 Early voltage inverse                           1/V 

  Vt      REAL       0.02585              Voltage equivalent of temperature               V 
  -------------------------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------------
  NAME      TYPE      INITIAL    RANGE     DESCRIPTION                                  UNITS  
  --------- --------- ---------- --------- -------------------------------------------- ---------
  Capcjc    REAL                            Collector junction capacitance               F

  Capcje    REAL                            Emitter junction capacitance                 F

  cbc       REAL                            Collector base capacitance                   F

  cbe       REAL                            Emitter base capacitance                     F

  ibc       REAL                            Base collector current                       A

  ibe       REAL                            Base emitter current                         A

  qbk       REAL                            Early Effect                                 

  vbc       REAL                           Voltage difference from collector to base    V 

  vbe       REAL                           Voltage difference from emitter to base      V 
  -----------------------------------------------------------------------------------------------

## 2.31 PMOS Transistor 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image82.png){width="1.96875in" height="1.5520833333333333in"}

The essence of the model is the same as for the NMOS transistor. However, the P and N regions of each component are exchanged and therefore the voltages and currents are also exchanged. The model of the P channel MOS transistor can be summarized by means of the following characteristic curves and equations:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image83.png){width="6.25in" height="4.833333333333333in"}

$$V_{GS} \geq V_{T};V_{DS} < 0 \rightarrow I_{D} = 0 \rightarrow Cut$$

$$V_{GS} < V_{T};0 > V_{DS} \geq V_{GS} - V_{T} \rightarrow I_{D} = \frac{\beta W}{L}\left\lbrack (V_{GS} - V_{T})V_{DS} - \frac{V_{DS}^{2}}{2} \right\rbrack \rightarrow Lineal - Ohmic$$

$$V_{GS} < V_{T};V_{DS} < V_{GS} - V_{T} \rightarrow I_{D} = \frac{\beta W}{2L}(V_{GS} - V_{T}) \rightarrow Saturation$$

Ports:

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS          DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------------- ------------ -------------- ---------------
  e_B     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                        IN                          Bulk 

  e_D     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                        IN                          Drain 

  e_G     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                        IN                          Gate 

  e_S     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                        IN                          Source 
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -------------------------------------------------------------------------------------
  NAME    TYPE        DEFAULT      RANGE     DESCRIPTION                      UNITS  
  ------- ----------- ------------ --------- -------------------------------- ---------
  Beta    REAL        0.0105                 Transconductance parameter       A/V\^2 

  K2      REAL        0.41                   Bulk threshold parameter         - 

  K5      REAL        0.839                  Reduction of pinch-off region    - 

  L       REAL        6e-006                 Length (m)                       m 

  Vt      REAL        -1                     Zero bias threshold voltage      V 

  W       REAL        2e-005                 Width (m)                        m 

  dL      REAL        -2.1e-006              Shortening of channel            m 

  dW      REAL        -2.5e-006              Narrowing of channel             m 
  -------------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------
  NAME    TYPE        INITIAL    RANGE           DESCRIPTION                      UNITS  
  ------- ----------- ---------- --------------- -------------------------------- ---------
  id      REAL                                    Drain current                    A

  ubs     REAL                                    Base-source voltage              V

  ud      REAL                                    Drain voltage                    V

  uds     REAL                                    Drain source voltage             V

  ugst    REAL                                    Gate-Source thermical voltage    V

  us      REAL                                    Source voltage                   V

  v       REAL                                    Channel transconductance         A/V^2^
  -----------------------------------------------------------------------------------------

## 2.32 PNP Bipolar Transistor 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image84.png){width="1.8854166666666667in" height="1.625in"}

The model of the PNP transistor is the same as for the NPN transistor, but reversing the distribution of the P and N zones, as well as the signs of the voltages and currents. The model of the bipolar transistor developed is based on the Ebers-Moll equations:

$$I_{bc} = I_{S}(e^{\frac{v_{bc}}{v_{t}}} - 1) + V_{bc}G_{bc}$$

$$I_{be} = I_{S}(e^{\frac{v_{be}}{v_{t}}} - 1) + V_{be}G_{be}$$

It also models the capacitances existing between the different PN junctions by means of the JunctionCap functions and an estimation based on the polarization conditions.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image85.png){width="3.5208333333333335in" height="2.1770833333333335in"}

Ports:

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS         DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------------ ------------ -------------- ---------------
  e_B     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                       IN                          Base 

  e_C     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                       IN                          Collector 

  e_E     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                       IN                          Emitter 
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  --------------------------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT     RANGE     DESCRIPTION                                     UNITS  
  ------- ---------- ----------- --------- ----------------------------------------------- ---------
  Bf      REAL       50                    Forward beta                                    - 

  Br      REAL       0.1                   Reverse beta                                    - 

  Ccs     REAL       1e-012                Collector-substrat(ground) capacitance          F 

  Cjc     REAL       5e-013                Base-coll. zero bias depletion capacitance      F 

  Cje     REAL       4e-013                Base-emitter zero bias depletion capacitance    F 

  Gbc     REAL       1e-015                Base-collector conductance                      S 

  Gbe     REAL       1e-015                Base-emitter conductance                        S 

  Is      REAL       1e-016                Transport saturation current                    A 

  Mc      REAL       0.333                 Base-collector gradation exponent               - 

  Me      REAL       0.4                   Base-emitter gradation exponent                 - 

  Phic    REAL       0.8                   Base-collector diffusion voltage                V 

  Phie    REAL       0.8                   Base-emitter diffusion voltage                  V 

  Tauf    REAL       1.2e-010              Ideal forward transit time                      s 

  Taur    REAL       5e-009                Ideal reverse transit time                      s 

  Vak     REAL       0.02                  Early voltage inverse                           1/V 

  Vt      REAL       0.02585               Voltage equivalent of temperature               V 
  --------------------------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------------
  NAME      TYPE      INITIAL    RANGE     DESCRIPTION                                  UNITS  
  --------- --------- ---------- --------- -------------------------------------------- ---------
  Capcjc    REAL                            Collector junction capacitance               F

  Capcje    REAL                            Emitter junction capacitance                 F

  cbc       REAL                            Collector base capacitance                   F

  cbe       REAL                            Emitter base capacitance                     F

  ibc       REAL                            Base collector current                       A

  ibe       REAL                            Base emitter current                         A

  qbk       REAL                            Early Effect                                 

  vbc       REAL                           Voltage difference from collector to base    V 

  vbe       REAL                           Voltage difference from emitter to base      V 
  -----------------------------------------------------------------------------------------------

## 2.33 Resistor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image86.png){width="2.1458333333333335in" height="0.7291666666666666in"}

The resistance has been modelled by means of direct inheritance from the abstract component OnePort. The only additional specification that this component requires is Ohm\'s Law as a continuous equation.

$$v(t) = R*i(t)$$

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE      DESCRIPTION                  UNITS  
  ------- ---------- ---------- ---------- ---------------------------- ---------
  R       REAL       1                     Resistance                   Ohm 

  -------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE       INITIAL    RANGE      DESCRIPTION                                          UNITS  
  ------- ---------- ---------- ---------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

## 2.34 ResistorHeat

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image32.png){width="1.947707786526684in" height="1.2495669291338583in"}

It inherits the overall behavior of the \"Resistor\" component. Additionally, it adds a thermal port (tp) as an interface to exchange the generated heat, which is all the power consumed by the resistor:

$$P\_ th(t) = v(t)*i(t)$$

Thus, the component allows the interconnection of ELECTRICAL and THERMAL libraries.

Ports:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                                                       PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------------------------------------- ------------- ------------ -------------- ----------------------------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                                IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                                IN                          Positive pin 

  tp      [PORTS_LIB.thermal](file:///C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs\PORTS_LIB\docs\PORTS_LIB.thermal.html)   (n = 1)       OUT                         Thermal port for heat evacuation
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -------------------------------------------------------------------------------
  NAME    TYPE       DEFAULT    RANGE      DESCRIPTION                  UNITS  
  ------- ---------- ---------- ---------- ---------------------------- ---------
  R       REAL       1                     Resistance                   Ohm 

  -------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE       INITIAL    RANGE      DESCRIPTION                                          UNITS  
  ------- ---------- ---------- ---------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  p       REAL                             Power                                                W

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

## 2.35 Current Sensor 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image87.png){width="1.8645833333333333in" height="2.0in"}

The current sensor allows the user to measure the current in a branch without electrically altering its behaviour. It also provides the possibility of using the measured signal without influencing the rest of the circuit (filtering, mathematical operations, etc). The current sensor has a null impedance and shows the current that is flowing by means of an analog_signal type port. This is the format used in the majority of the components in the CONTROL library, which facilitates subsequent handling of the signal. For correct measuring of the current, the component should be placed in series with the branch to be measured, like an amperemeter. The component inherits the main characteristics of the abstract component RelativeSensor.

Ports:

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME     TYPE                                                                                                           PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  -------- -------------------------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------
  e_n      [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                          Negative pin 

  e_p      [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                          Positive pin 

  s_out    [PORTS_LIB.analog_signal](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.analog_signal.html)                  OUT                          Measured current
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Variables:

  ---------------------------------------------------------------------------------------------
  NAME    TYPE           INITIAL     RANGE       DESCRIPTION                          UNITS  
  ------- -------------- ----------- ----------- ------------------------------------ ---------
  i       REAL                                   Current in the branch from p to n    A 

  ---------------------------------------------------------------------------------------------

## 2.36 Voltage Sensor 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image88.png){width="1.3333333333333333in" height="1.9583333333333333in"}

The voltage sensor measures the voltage at a point with respect to level zero. This is the reference level that the Ground component established for a circuit and normally it will be the level used in the designs. The inlet impedance of this sensor is infinite, so it does not perturb the rest of the circuit. It is also possible to isolate the measurement of the electrical part and therefore to carry out post-treatments of the signal without affecting the behaviour of the electrical system being simulated.

Ports:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME     TYPE                                                                                                           PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  -------- -------------------------------------------------------------------------------------------------------------- ------------- ------------ -------------- ---------------------
  e_p      [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                          Pin to be measured 

  s_out    [PORTS_LIB.analog_signal](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.analog_signal.html)                  OUT                          Measured Potential
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Variables:

  --------------------------------------------------------------------------------------
  NAME    TYPE           INITIAL     RANGE       DESCRIPTION                   UNITS  
  ------- -------------- ----------- ----------- ----------------------------- ---------
  phi     REAL                                   Absolute voltage potential    V 

  --------------------------------------------------------------------------------------

## 2.37 Voltage Sensor 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image89.png){width="1.5in" height="1.7083333333333333in"}

The voltage sensor allows users to measure the voltage between two points of a circuit without altering the electrical behaviour of the circuit. It also allows users to work with the measured signal without influencing the rest of the circuit (filtering, mathematical operations, etc). The voltage sensor has an infinite series impedance and shows the voltage in its ends by means of an analog_signal type port. This is the format used in most of the components in the CONTROL library, making subsequent work on the signal easier. For correct measurement of the signal, the component should be located in parallel with the branch to be measured like a voltmeter. The component inherits the main characteristics of the abstract component RelativeSensor.

Ports:

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME     TYPE                                                                                                           PARAMETERS    DIRECTION    CARDINALITY     DESCRIPTION  
  -------- -------------------------------------------------------------------------------------------------------------- ------------- ------------ --------------- -------------------
  e_n      [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                           Negative pin 

  e_p      [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                           Positive pin 

  s_out    [PORTS_LIB.analog_signal](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.analog_signal.html)                  OUT                           Measured voltage
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Variables:

  --------------------------------------------------------------------------------------------------
  NAME    TYPE           INITIAL    RANGE     DESCRIPTION                                  UNITS  
  ------- -------------- ---------- --------- -------------------------------------------- ---------
  v       REAL                                Voltage between pin p and n (= p.v - n.v)    V 

  --------------------------------------------------------------------------------------------------

## 2.38 Power Sensor

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image90.png){width="1.3139555993000875in" height="1.7347659667541557in"}

The power sensor allows users to measure the power dissipated between two points of a circuit without altering the electrical behaviour of the circuit. It also allows users to work with the measured signal without influencing the rest of the circuit (filtering, mathematical operations, etc). The component is topologically built by a current sensor and a voltage sensor as shown below:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image91.png){width="4.3882622484689415in" height="2.5522003499562556in"}

The current sensor measures the current that flows through the resistor and the voltage sensor obtains the voltage between pin p and n. Then, both signals are multiplied to return the power dissipated by the resistor. The port S must be connected in series with the branch where the resistor is placed, and pin p and n in parallel with the pin of the resistor which power will be measured.

Ports:

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME     TYPE                                                                                                           PARAMETERS    DIRECTION    CARDINALITY     DESCRIPTION  
  -------- -------------------------------------------------------------------------------------------------------------- ------------- ------------ --------------- --------------------
  S        PORTS_LIB.elec                                                                                                               IN                           Current signal pin

  e_n      [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                           Negative pin 

  e_p      [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                                    IN                           Positive pin 

  s_out    [PORTS_LIB.analog_signal](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.analog_signal.html)                  OUT                           Measured voltage
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Variables:

  -----------------------------------------------------------------------------------------------------------------------
  NAME    TYPE           INITIAL    RANGE     DESCRIPTION                                                       UNITS  
  ------- -------------- ---------- --------- ----------------------------------------------------------------- ---------
  p       REAL                                Power between pin p and n (= SensorCurrent.i\*SensorVoltage.v)    W

  -----------------------------------------------------------------------------------------------------------------------

## 2.39 Short-circuit

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image92.png){width="1.96875in" height="0.8020833333333334in"}

The component Short allows users to connect two points of a circuit with no difference in voltage between them. Therefore the current will be determined by the rest of the circuit. It inherits its main characteristics from the component OnePort.

Ports:

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY        DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ ------------------ -----------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                              Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                              Positive pin 
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE        INITIAL    RANGE     DESCRIPTION                                          UNITS  
  ------- ----------- ---------- --------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

## 2.40 Voltage Controlled Current Source

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image93.png){width="2.8125in" height="1.6145833333333333in"}

This component allows the users to generate an output current controlled by an input voltage. It is a component with four pins, and it inherits the characteristics of the abstract component TwoPort. The relation between the input voltage and the output current is established by means of trans-conductance of the source.

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 1 

  e_n2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 2 

  e_p1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 1 

  e_p2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 2 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -----------------------------------------------------------------------------------
  NAME                TYPE       DEFAULT    RANGE      DESCRIPTION          UNITS  
  ------------------- ---------- ---------- ---------- -------------------- ---------
  R1                  REAL       1e+040                Input resistance     Ohm 

  R2                  REAL       1e+040                Output resistance    Ohm 

  transConductance    REAL       1                     Transconductance     S 
  -----------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------------
  NAME    TYPE       INITIAL    RANGE      DESCRIPTION                                                UNITS  
  ------- ---------- ---------- ---------- ---------------------------------------------------------- ---------
  i1      REAL                             Current flowing from pos. to neg. pin of the left port     A 

  i2      REAL                             Current flowing from pos. to neg. pin of the right port    A 

  v1      REAL                             Voltage drop over the left port                            V 

  v2      REAL                             Voltage drop over the right port                           V 
  -------------------------------------------------------------------------------------------------------------

## 2.41 Voltage Controlled Voltage Source

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image94.png){width="2.5416666666666665in" height="1.5208333333333333in"}

This component allows users to generate an output voltage controlled by an input voltage. It is a component with four pins and it inherits the characteristics of the abstract component TwoPort. The relation between the input voltage and the output voltage is established by means of the gain of the source.

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 1 

  e_n2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin of port 2 

  e_p1    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 1 

  e_p2    [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin of port 2 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  -------------------------------------------------------------------------------
  NAME            TYPE       DEFAULT    RANGE      DESCRIPTION          UNITS  
  --------------- ---------- ---------- ---------- -------------------- ---------
  R1              REAL       1e+040                Input resistance     Ohm 

  R2              REAL       0                     Output resistance    Ohm 

  gain            REAL       1                     Voltage gain         - 
  -------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------------
  NAME    TYPE       INITIAL    RANGE      DESCRIPTION                                                UNITS  
  ------- ---------- ---------- ---------- ---------------------------------------------------------- ---------
  i1      REAL                             Current flowing from pos. to neg. pin of the left port     A 

  i2      REAL                             Current flowing from pos. to neg. pin of the right port    A 

  v1      REAL                             Voltage drop over the left port                            V 

  v2      REAL                             Voltage drop over the right port                           V 
  -------------------------------------------------------------------------------------------------------------

## 2.42 Constant Voltage 

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image95.png){width="1.2291666666666667in" height="1.4895833333333333in"}

The constant voltage source allows users to establish a given voltage between two points in a circuit. It inherits the characteristics of the abstract component OnePort and only adds one continuous equation by means of which variable *v* is made equal to a datum *V*. The current through the component is defined by the rest of the circuit. Specifically it will be defined by the total load connected. Usually a component Ground will be connected to the negative terminal of the source, even if the configuration may be different depending on the needs of the user and the model.

$$v(t) = V$$

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  ---------------------------------------------------------------------------------------
  NAME            TYPE       DEFAULT    RANGE      DESCRIPTION                  UNITS  
  --------------- ---------- ---------- ---------- ---------------------------- ---------
  V               REAL       1                     Value of constant voltage    V 

  ---------------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE       INITIAL    RANGE      DESCRIPTION                                          UNITS  
  ------- ---------- ---------- ---------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

## 2.43 Voltage signal

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image96.png){width="1.40625in" height="1.375in"}

The voltage signal source allows users to establish a voltage between two points in a circuit at the same level as that indicated in the control terminal. This control terminal consists of an analog_signal type port in order to guarantee compatibility with the CONTROL library and to simplify as much as possible the need to create new components. Similarly to other one-phase components in the library, its formal characteristics are inherited directly from the abstract component OnePort. Thus the voltage signal source can also be interpreted as an *analog_signal* to *elec.v* format converter.

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE       INITIAL    RANGE      DESCRIPTION                                          UNITS  
  ------- ---------- ---------- ---------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

## 2.44 Voltage Sine

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image97.png){width="1.7395833333333333in" height="0.96875in"}

The voltage sine wave source allows users to establish a steady state voltage sine wave difference between two points in a circuit. The source calls the sine function of the ELECTRICAL library. This function generates a sine wave at the frequency, amplitude, phase, startup instant and offset that are indicated as parameters. The signal returned by the function is assigned as the voltage of the component, which inherits its characteristics from the abstract component OnePort. In addition, this assignation is done indirectly as it uses the described component topologically as described above for Voltage Signal, where the control terminal of said component is associated to the sine wave function.

Ports:

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  NAME    TYPE                                                                                         PARAMETERS    DIRECTION    CARDINALITY    DESCRIPTION  
  ------- -------------------------------------------------------------------------------------------- ------------- ------------ -------------- -------------------------
  e_n     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Negative pin 

  e_p     [PORTS_LIB.elec](file:///D:\EcosimPro_5.1.0\USER_LIBS\PORTS_LIB\docs\PORTS_LIB.elec.html)                  IN                          Positive pin 
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Parameters:

  ---------------------------------------------------------------------------------------
  NAME            TYPE       DEFAULT    RANGE      DESCRIPTION                  UNITS  
  --------------- ---------- ---------- ---------- ---------------------------- ---------
  Voffset         REAL       0                     Voltage offset               V 

  Vpeak           REAL       1                     Voltage amplitude            V 

  freqHz          REAL       1                     Frequencies of sine waves    Hz 

  phase           REAL       0                     Phases of sine waves         rad 

  startTime       REAL       0                     Output = offset for time     s 
  ---------------------------------------------------------------------------------------

Variables:

  -------------------------------------------------------------------------------------------------------
  NAME    TYPE       INITIAL    RANGE      DESCRIPTION                                          UNITS  
  ------- ---------- ---------- ---------- ---------------------------------------------------- ---------
  i       REAL                             Current flowing from pin e_p to pin e_n              A 

  v       REAL                             Voltage drop between the two pins = e_p.v - e_n.v    V 
  -------------------------------------------------------------------------------------------------------

Instances to components (Topology block);

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  OBJECT                COMPONENT TYPE                                                                                                                                                                 DESCRIPTION  
  --------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ----------------------------------------
  voltage               [VoltageSignal](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.VoltageSignal.html)     Voltage Signal topological reference.

  source                [Sine](file:///D:\tmpDocsLibrerias\ELECTRICAL\AppData\Local\Microsoft\Windows\Temporary%20Internet%20Files\Content.Outlook\25U20M82\ELECTRICAL.Sine.html)                       Sine Function invocation.
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# 3 Building a Model

Models of electrical networks are built by arrangement of ELECTRICAL, CONTROL, MECHANICAL ... (engine shaft) components. This library is designed for building electrical models by dragging and pasting components as if it was a real circuit.

The following sections describe how to build a simple model, and how to simulate it. The basic methodology to create and simulate this simple model is the same as that for more complex models.

## 3.1 Description of the example

The model described in this chapter represents an emitter amplifier circuit:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image98.png){width="5.903080708661418in" height="3.166829615048119in"}

The system consists of an NPN transistor fed with constant and variable voltage sources, and provided with capacitors and resistors to accommodate the input/output voltage signals.

## 3.2 Build the Model

To build the model users should follow the steps to create a schematic, as described below. The MATH, PORTS_LIB, ELECTRICAL, ELECTRICAL \_EXAMPLES and CONTROL libraries must first be loaded into the active Workspace:

- Create a new schematic using the botton ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image99.png){width="0.16263998250218722in" height="0.17305336832895887in"} or the File \> New \> Schematic. Save it in the ELECTRICAL \_EXAMPLES library and choose a name (for example, my_circuit).

- From the icon explorer tab of the ELECTRICAL library, select one by one the different components shown in the figure above and drag them to the schematic window

- Arrange the components in the schematic like in the figure above:

  - Use the Rotate buttons if necessary

  - To change the size of a component, select the component, right button, select "component shape option" and change the size by dragging the symbol's corners

  - To change the position of the component's name, press the SHIFT key at the same time as you move the mouse pointer over the labels, and drag it

- Draw connectors between the components like in the figure above. A tooltip will appear whenever the mouse hovers over a port, displaying the information of that port:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image100.png){width="2.7084722222222224in" height="1.5695253718285214in"}

- Select the connection button on the right-hand toolbar ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image101.png){width="0.16893372703412074in" height="0.15856080489938756in"}, or press the SHIFT key at the same time as you move the mouse pointer over a port

- Left-click on the port to be connected

- Click the various points of the schematic drawing where the connector is required to run (if any)

- Left-click the target port, which must be of the same type as the origin port

- To connect different components with right angles, there are two options:

- Select right angle connections mode by pressing the ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image102.png){width="0.1980194663167104in" height="0.1858606736657918in"} button and connect components as explained before, or

- Create a straight line connection between two components, press SHIFT and left click over the line. A point will be created to divide the line into two different segments. Drag the point to the desired place and use the ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image103.png){width="0.18316819772528434in" height="0.1644225721784777in"} button to force right angles

- To delete extra points of a connector line, just press SHIFT over the point and click on the point to be deleted

<!-- -->

- Set the data of the components. Now you must customize the component data according to the table below:

COMPONENT INSTANCES DATA:

  --------------------------------------------------------------------------------------------------------
  DATUM                      VALUE       DESCRIPTION                                         UNITS  
  -------------------------- ----------- --------------------------------------------------- -------------
  Cin.C                      1e-005      Capacitance (F)                                     \"F\" 

  Cout.C                     0.0001      Capacitance (F)                                     \"F\" 

  NPN_1.Bf                   50          Forward beta (-)                                    \"-\" 

  NPN_1.Br                   0.1         Reverse beta (-)                                    \"-\" 

  NPN_1.Ccs                  1e-012      Collector-substrat ground capacitance (F).          \"F)\" 

  NPN_1.Cjc                  5e-013      Base-coll. zero bias depletion capacitance (F)      \"F\" 

  NPN_1.Cje                  4e-013      Base-emitter zero bias depletion capacitance (F)    \"F\" 

  NPN_1.Gbc                  1e-015      Base-collector conductance (S)                      \"S\" 

  NPN_1.Gbe                  1e-015      Base-emitter conductance (S)                        \"S\" 

  NPN_1.Is                   1e-016      Transport saturation current (A)                    \"A\" 

  NPN_1.Mc                   0.333       Base-collector gradation exponent (-)               \"-\" 

  NPN_1.Me                   0.4         Base-emitter gradation exponent (-)                 \"-\" 

  NPN_1.Phic                 0.8         Base-collector diffusion voltage (V)                \"V\" 

  NPN_1.Phie                 0.8         Base-emitter diffusion voltage (V)                  \"V\" 

  NPN_1.Tauf                 1.2e-010    Ideal forward transit time (s)                      \"s\" 

  NPN_1.Taur                 5e-009      Ideal reverse transit time (s)                      \"s\" 

  NPN_1.Vak                  0.02        Early voltage inverse, 1/Volt (1/V)                 \"1/V\" 

  NPN_1.Vt                   0.02585     Voltage equivalent of temperature (V)               \"V\" 

  R0.R                       0.01        Resistance (Ohm)                                    \"Ohm\" 

  R1.R                       9000        Resistance (Ohm)                                    \"Ohm\" 

  R2.R                       1000        Resistance (Ohm)                                    \"Ohm\" 

  Rc.R                       5000        Resistance (Ohm)                                    \"Ohm\" 

  Re.R                       500         Resistance (Ohm)                                    \"Ohm\" 

  Rload.R                    50000       Resistance (Ohm)                                    \"Ohm\" 

  VoltageConstant_1.V        10          Value of constant voltage (V)                       \"V\" 

  VoltageSine_1.Voffset      0           Voltage offset (V)                                  \"V\" 

  VoltageSine_1.Vpeak        0.25        Voltage amplitude (V)                               \"V\" 

  VoltageSine_1.freqHz       200         Frequencies of sine waves (Hz)                      \"Hz\" 

  VoltageSine_1.phase        0           Phases of sine waves (radian)                       \"radian\" 

  VoltageSine_1.startTime    0           Output = offset for time                            \"s\" 
  --------------------------------------------------------------------------------------------------------

- To change data of a component double-click on the corresponding symbol to open the Attributes Editor. For example, for the NPN_1 component, the data values should look like this:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image104.png){width="6.496527777777778in" height="3.9972222222222222in"}

- Lastly, generate the model using the button ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image105.png){width="0.14907042869641296in" height="0.13860017497812774in"}. The following window will be displayed. Click OK and you will have finalized the construction of your model and you can simulate it as described in the following section, "Simulating the Model":

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image106.png){width="3.2501673228346455in" height="1.4236843832020998in"}

## 3.3 Simulate the Model

The model is now ready for simulation. Go to the Simulation View.

- Select \"my_circuit.default\" (if the name of the partition you have created is "default") from the ELECTRICAL_EXAMPLES library, right-click, select option \"New experiment\". The following window will be displayed. Type a name for the experiment:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image107.png){width="5.9794739720034995in" height="4.375225284339457in"}

- A default experiment text should appear in the editing window. Change the REPORT_MODE, TSTOP, CINT (Communications Interval) and other values as indicated below:

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

- Now you are ready to simulate the experiment using the Monitor. Right button over the experiment name in the Workspace area, and select "Simulate in Monitor". Clicking the ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image108.png){width="0.21458333333333332in" height="0.21458333333333332in"} button will produce the same effect

- The Experiments monitor comes up. Add the necessary plots to view the results.

  - To add a plot click on \"Tab_1" and then click "New Plot" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image109.png){width="0.25277777777777777in" height="0.22777777777777777in"}. A window will appear with the "drawable/ plotable" variables of the experiment.

  - Apply a filter to help you to select variables. Tick the boxes alongside the selected variables:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image110.png){width="6.496527777777778in" height="5.034722222222222in"}

- Just as users may wish to plot the evolution of a variable compared to another, they may also wish to track the numerical values of the variables. The main task of Watch is to display the variable values of the experiment, enabling them to be modified wherever possible.

  - The first step is to add variables by right clicking on the Watch Area and selecting the option "Edit Watch"

  - A menu very similar to that of the plots will appear, enabling users to add or delete variables

- To simulate the experiment click "Simulate" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image111.png){width="0.1736111111111111in" height="0.25277777777777777in"}. By clicking "New Integration" ![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image112.png){width="0.2625in" height="0.25763888888888886in"} on the toolbar, the simulation can be extended or started at new times

The figure below shows some typical time histories of the main variables of the model:

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image113.png){width="6.496527777777778in" height="4.388888888888889in"}

# 4 Application examples

## 4.1 Electrical circuits

### 4.1.1 Basic circuit

#### 4.1.1.1 Problem description

A basic circuit is composed of a capacitive element and a resistive one, as well as a voltage source. This sums up the behaviour of a distribution line.

![circuit](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image114.png){width="3.5416666666666665in" height="2.0833333333333335in"}

**Components**

In order to replicate this the components that are changed as follows:

- ELECTRICAL.VoltageSine (VAC1):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             10                V                 Voltage amplitude

  freqHz            50                Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

- ELECTRICAL.Capacitor (C1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  C                 5e004             F                 Capacitance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (R1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 5500              Ohm               Resistance

  -----------------------------------------------------------------------

#### 4.1.1.2 Schematics

![basicCircuit](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image115.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.1.3 Results

The results shown in the monitor should be the signals created by the voltage source (VAC1.v) and by the two ports (Elec1.v and Elec2.v). As seen in the Plots, both ports share the same voltage, as does the voltage source. The reason for this is the parallel disposition both these components have.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image116.png){width="6.5in" height="3.5208333333333335in"}

### 4.1.2 InductiveAndCapacitive

#### 4.1.2.1 Description

Inductive and capacitive components can also be expressed in Ohms as phasors. However, in order to do so, the frequency at which the circuit operates must be known. In Europe is common to use 50Hz in most circuits, as is in Asia, Africa and Oceania, with a few exceptions. Most of America uses 60Hz. Knowing this, the resistive values of capacitors and coils can be calculated. The expression after which these elements are defined can be seen in the Figure below. The objective of this case study is to see how they behave when exposed to alternating current (AC).

![circuit(3)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image117.png){width="3.3333333333333335in" height="2.2916666666666665in"}![mon_phase_ex1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image118.png){width="2.4479166666666665in" height="2.09375in"}

**Components**

To replicate this, the components that are changed are as follows:

- CONTROL.AnalogSource (AnalogSource_1):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               220                                 Signal amplitude or height

  Period            0.02              s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

#### 4.1.2.2 Schematics

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image119.png){width="6.495833333333334in" height="3.3944444444444444in"}

#### 4.1.2.3 Results

When subjected to an alternating current, the capacitive components will be 90º slower than the resistive ones, whereas the inductive ones will be 90º faster. The current will remain the same for all components, as they are connected in series. The behaviour will be shown in the monitor, and can be expressed as vector, as shown in the following schematics.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image120.png){width="6.5in" height="3.5208333333333335in"}

### 4.1.3 CapacitorAndInductiveLoad

#### 4.1.3.1 Description

In this case, the main object of study will be the influence of capacitor values on the circuit. The capacitor will be placed in parallel to one of the components, which will act as a load. This is common practice to influence on the efficiency of the system.

![circuit(1)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image121.png){width="3.5625in" height="1.9583333333333333in"}

#### 4.1.3.2 Components

To replicate this, the components that are changed are as follows:

- CONTROL.AnalogSource (AnalogSource_1):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               220                                 Signal amplitude or height

  Period            0.02              s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- ELECTRICAL.Capacitor (C1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  C                 2.3e006           F                 Capacitance

  -----------------------------------------------------------------------

- ELECTRICAL_EDUCATIONAL_EXAMPLES.Ind_component (Ind_component_1):

  -------------------------------------------------------------------------------------------
  Variable              Value             Units             Description
  --------------------- ----------------- ----------------- ---------------------------------
  Real_component        10                Ohm               Real component of the load

  Imaginary_component   15                Ohm               Imaginary component of the load
  -------------------------------------------------------------------------------------------

- ELECTRICAL_EDUCATIONAL_EXAMPLES.Ind_component (Ind_component_2):

  -------------------------------------------------------------------------------------------
  Variable              Values            Units             Description
  --------------------- ----------------- ----------------- ---------------------------------
  Real_component        100               Ohm               Real component of the load

  Imaginary_component   100               Ohm               Imaginary component of the load
  -------------------------------------------------------------------------------------------

#### 4.1.3.3 Schematics

![monophase_ex2](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image122.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.3.4 Results

The results shown in the monitor should resemble those in the following picture. As the capacitance rises, so does the power consumed by the load components.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image123.png){width="6.5in" height="3.5208333333333335in"}

### 4.1.4 Transformer

#### 4.1.4.1 Description

A transformer is an essential element to energy distribution. By adjusting the value of the voltage the losses in transport are reduced. This is achieved by a very simple phenomenon, induction. The number of turns in the coil of a transformer will dictate the relation by which the voltage and current are converted.

![circuit(4)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image124.png){width="3.75in" height="2.2916666666666665in"}

#### 4.1.4.2 Components

To replicate this, the components that are changed are as follows:

- CONTROL.AnalogSource (AnalogSource_1):

  ---------------------------------------------------------------------------------------------------------
  Variable          Values            Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               220                                 Signal amplitude or height

  Period            0.02              s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- ELECTRICAL.IdealTransformer (IdealTransformer_1):

  -----------------------------------------------------------------------
  Variable          Values            Units             Description
  ----------------- ----------------- ----------------- -----------------
  n                 0.25                                Turns ratio

  -----------------------------------------------------------------------

#### 4.1.4.3 Schematics

![monophase_ex3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image125.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.4.4 Results

In the case study, the transformer will be placed between the grid, a high voltage source, and a load, an inductive component. An additional inductive component will be added before the transformer in order to simulate the losses in the grid. The expected output are two signals with values directly related to the \"turns ratio\" in the transformer.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image126.png){width="6.5in" height="3.5in"}

### 4.1.5 DiodeAndInductiveLoad

#### 4.1.5.1 Description

The diode is the electric equivalent to a hydraulic oneway valve. In the following case study, it will be used to erase the negative values. However, as the component used is not purely resistive, but instead has an inductive part, the outcome will be different.

![circuit(5)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image127.png){width="4.791666666666667in" height="2.2916666666666665in"}

#### 4.1.5.2 Components

To replicate this, the components that are changed are as follows:

- CONTROL.AnalogSource (AnalogSource_1): This component is used to generate a signal of a certain shape and parameters. The specifications used in this component are the following:

  -----------------------------------------------------------------------------------------------------------
  Variable            Value             Units             Description
  ------------------- ----------------- ----------------- ---------------------------------------------------
  source              Source_Sine                         Waveform

  Amp                 220                                 Signal amplitude or height

  Period              0.02              s                 Period of sine, pulse, sawtooth, or square source
  -----------------------------------------------------------------------------------------------------------

- ELECTRICAL.IdealTransformer (IdealTransformer_1):

  -------------------------------------------------------------------------
  Variable            Values            Units             Description
  ------------------- ----------------- ----------------- -----------------
  n                   0.25                                Turns ratio

  -------------------------------------------------------------------------

#### 4.1.5.3 Schematics

![monophase_ex4](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image128.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.1.5.4 Results

As shown in the diagrams created by the monitor, the current is cut where it becomes negative, resulting in half a sine wave. In spite of that, the voltage does not behave in the same manner, a slight negative value can be seen in its signal. This is caused by the fact that there is a gap between resistive and inductive voltages.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image129.png){width="6.5in" height="3.5208333333333335in"}

### 4.1.6 Battery 1 RC

#### 4.1.6.1 Description

The following circuit represents a more realistic battery model that includes the Ideal Battery, a Thévenin resistance and a parallel Resistor-Capacitor circuit. This circuit allow the user to simulate more realistic dynamic transients and hysteresis effects.

![Diagrama, Esquemático El contenido generado por IA puede ser incorrecto.](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image130.png){width="3.18251968503937in" height="2.2815879265091863in"}

#### 4.1.6.2 Components

To replicate this, the components that are changed are as follows:

- ELECTRICAL.Resistor (R0):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 0.025             Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (R1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 0.05              Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Capacitor (C1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  C                 0.0015            F                 Capacitance

  -----------------------------------------------------------------------

- ELECTRICAL.IdealBattery (Battery_1):

  --------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------------
  Q                 4                 Ah                Nominal capacity

  soc0              0.5                                 Initial state of charge (0..1)
  --------------------------------------------------------------------------------------

#### 4.1.6.3 Schematics

![Diagrama El contenido generado por IA puede ser incorrecto.](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image131.png){width="6.495833333333334in" height="3.7847222222222223in"}

#### 4.1.6.4 Results

To carry out a simple study of the system, a partition was created in which the chosen boundaries were the input current to the circuit at the positive port, *e_p*, and the voltage at the negative port, *e_n*. The values set for each variable were 5 A and 0 V, respectively.

With these values, the voltage across the terminals of the ideal battery and the voltage across the terminals of the complete circuit were plotted to analyse how the additional elements affect the total system voltage.

![Gráfico, Gráfico de líneas El contenido generado por IA puede ser incorrecto.](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image132.png){width="5.586594488188976in" height="2.791505905511811in"}

The graph clearly shows how, during the battery charging process, the additional elements increase the terminal voltage of the system, which in turn influences the subsequent discharge of the battery (see example: *Battery Comparison*).

### 4.1.7 Battery comparison

#### 4.1.7.1 Description

The following circuit represents a closed system prepared to study the charging and discharging of a battery. In this example, two similar circuits are used to analyse the differences between an ideal battery and a more realistic battery model. It is important to note that the real battery considered here is the one presented in *Battery 1 RC*.

![Diagrama El contenido generado por IA puede ser incorrecto.](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image133.png){width="2.934727690288714in" height="2.853468941382327in"}

#### 4.1.7.2 Components

To replicate this, the components that are changed are as follows (both circuits have the same values):

- ELECTRICAL.IdealBattery (Battery_2):

  ------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------
  Q                 4                 Ah                Nominal capacity

  ------------------------------------------------------------------------

- CONTROL.AnalogSource (Charge):

  --------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- --------------------------------------------------
  source            Source_Pulse                        Waveform

  Amp               3.7                                 Signal amplitude or height

  Period            200               s                 Period of sine, pulse, sawtooth or square source

  pulseWidth        100               s                 Pulse width of pulse wave
  --------------------------------------------------------------------------------------------------------

- CONTROL.SourcebPulse (Discharge):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  Period            200               s                 Period of pulse

  pulseWidth        100               s                 Pulse width

  Tstart            100               s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

#### 4.1.7.3 Schematics

![Diagrama, Esquemático El contenido generado por IA puede ser incorrecto.](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image134.png){width="6.495833333333334in" height="4.552777777777778in"}

#### 4.1.7.4 Results

For this example, a cycle of a 100-second charging phase followed by a 100-second discharging phase is simulated. During charging, Switch_disch is open so that all the current from the source flows directly into the battery. During discharging, the current source is disconnected and the switch is closed, so the battery becomes the source supplying the load resistance RL. This setup allows the user to analyse the differences in the state of charge of each battery, resulting from the differences in discharge voltage.

![Gráfico, Gráfico de líneas El contenido generado por IA puede ser incorrecto.](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image135.png){width="5.394148075240595in" height="2.695343394575678in"}

The previous graph shows how the voltage of the real battery evolves relative to the ideal battery. The real battery exhibits greater voltage variation due to the current flowing through the additional RC and Thévenin network. During charging, its terminal voltage is higher than that of the ideal battery; however, during discharging, it becomes lower. This lower discharge voltage reduces the current flowing from the battery to supply the load, given the same voltage difference between the connected nodes. As a result, the lower discharge current affects the state of charge of the batteries, remaining higher in the real battery, as shown in the following chart.

![Gráfico, Gráfico de líneas El contenido generado por IA puede ser incorrecto.](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image136.png){width="5.547433289588802in" height="2.7719378827646546in"}

## 4.2 Electronic circuits

### 4.2.1 P_ideal_amp

#### 4.2.1.1 Description

The following circuit showcases the behaviour of an operational amplifier which increases the voltage signal by a factor of 1E6.

![circuit(7)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image137.png){width="4.270833333333333in" height="2.84375in"}

#### 4.2.1.2 Components

To replicate this, the components that are changed are as follows:

- ELECTRICAL.Resistor (Ra):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 100000000         Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.VoltageSine (V):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             10                V                 Voltage amplitude

  freqHz            50                Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

#### 4.2.1.3 Results

As can be seen in the graph, there is no current in the right side of the operational amplifier.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image138.png){width="6.5in" height="3.5104166666666665in"}

### 4.2.2 Amplifier

An operational amplifier is mainly used for signal amplification. This is done using resistor as a mean to multiply the amplitude of the voltage. This behaviour can be observed in the graph below. However, there are other uses for these devices, the most common are:

- Buffer: used to uncouple phases of the circuit.

- Noninverting amplifier: amplifies the signal while not changing its sign.

- Inverting amplifier: amplifies the signal changing the sign to 1.

- Noninverting differential opamp: subtracts two or more signals.

- Inverting differential opamp: subtracts two or more signals, and then inverts them.

- Noninverting summing opamp: sums two or more signals.

- Inverting summing opamp: sums two or more signals, and then inverts them.

- Differentiator opamp: Calculates the derivative of the signal.

- Integrator opamp: Integrates the signal.

In this case, the option used is the noninverting amplifier.

![circuit(6)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image139.png){width="4.291666666666667in" height="2.6770833333333335in"}

#### 4.2.2.1 Components

To replicate this, the components that are changed are as follows:

- ELECTRICAL.Resistor (RI):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 100               Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (RF): This component acts as a resistor. The specifications used in this component are the following:

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 400               Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (Ra): This component acts as a resistor. The specifications used in this component are the following:

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 0.1               Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.VoltageSine (V): Voltage source which produces tension with a userdefined sine wave signal. The specifications used in this component are the following:

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             10                V                 Voltage amplitude

  freqHz            50                Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

#### 4.2.2.2 Schematics

![Amplifier](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image140.png){width="6.479166666666667in" height="4.541666666666667in"}

#### 4.2.2.3 Results 

The results that should display an amplification proportional to the resistors used in the schematics

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image141.png){width="6.5in" height="3.5208333333333335in"}

### 4.2.3 CommonEmitterAmplifier

#### 4.2.3.1 Description

A common emitter amplifier is used to amplify an alternating signal to a certain value. To achieve this, it utilizes voltage divisor biasing.

![circuit(8)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image142.png){width="6.46875in" height="2.9166666666666665in"}

#### 4.2.3.2 Components

To replicate this, the components that are changed are as follows:

- ELECTRICAL.Capacitor (Cin):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  C                 1e005             F                 Capacitance

  -----------------------------------------------------------------------

- ELECTRICAL.Capacitor (Cout):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  C                 0.0001            F                 Capacitance

  -----------------------------------------------------------------------

- ELECTRICAL.VoltageConstant (VoltageConstant_1):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  V                 10                V                 Value of constant voltage

  ---------------------------------------------------------------------------------

- ELECTRICAL.VoltageSine (VoltageSine_1):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             0.25              V                 Voltage amplitude

  freqHz            200               Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

- ELECTRICAL.Resistor (Rc):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 5000              Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (Re):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 500               Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (R1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 9000              Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (R2):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 1000              Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (R0):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 0.01              Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (Rload):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 50000             Ohm               Resistance

  -----------------------------------------------------------------------

#### 4.2.3.3 Schematics

![CommonEmitterAmplifier](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image143.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.3.4 Results

The monitor shows the expected result, an amplified signal.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image144.png){width="6.5in" height="3.5208333333333335in"}

### 4.2.4 diodeBridge

#### 4.2.4.1 Description

A diode bridge is used to rectify a signal. Given that the diode acts as some sort of valve, an oscillating signal can become constant in value.

![circuit(11)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image145.png){width="6.03125in" height="3.9583333333333335in"}

#### 4.2.4.2 Components

To replicate this, the components that are changed are as follows:

- ELECTRICAL.Resistor (R1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 1000              Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.VoltageSine (VAC1):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             10                V                 Voltage amplitude

  freqHz            50                Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

- ELECTRICAL.Capacitor (C1)

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  C                 0.0001            F                 Capacitance

  -----------------------------------------------------------------------

#### 4.2.4.3 Schematics

![diodeBridge](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image146.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.4.4 Results

The monitor shows how the diodes with aid from a capacitor turn the sine wave into some sort of sawtooth signal. The drop in voltage seen between peaks is caused by the capacitor discharging itself before charging again.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image147.png){width="6.5in" height="3.53125in"}

### 4.2.5 Transistor

#### 4.2.5.1 Description

The transistor can act either as an amplifier or an electric switch. The circuit in this case study amplifies a signal. The results can be seen in the monitor.

![circuit(14)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image148.png){width="2.2916666666666665in" height="3.125in"}

#### 4.2.5.2 Components

To replicate this, the components that are changed are as follows:

- ELECTRICAL.VoltageConstant (DC_Source):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  V                 3.3               V                 Value of constant voltage

  ---------------------------------------------------------------------------------

- ELECTRICAL.VoltageConstant (VoltageConstant_1):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  V                 220               V                 Value of constant voltage

  ---------------------------------------------------------------------------------

- ELECTRICAL.Resistor (Resistor_1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 100               Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (Resistor_2):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 1000              Ohm               Resistance

  -----------------------------------------------------------------------

### 4.2.6 Schematics

![electronics_ex1](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image149.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.6.1 Results

The monitor shows the expected results. When a current goes through the device, the transistor amplifies the signal.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image150.png){width="6.495833333333334in" height="2.783333333333333in"}

### 4.2.7 SignalRectifier

#### 4.2.7.1 Description

One of the ways of turning an alternating signal into a continuous one is by using a rectifier. The main components of this circuit are a diode and a capacitor. The former only lets the positive values of the signal in. This way, the sine wave is turned into a half wave signal. In order to supply voltage between the peaks created by the diode, a capacitor is added. The diagram below shows the whole system. A transformer is connected between the grid and the rectifier to turn the voltage into manageable values.

![circuit(16)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image151.png){width="6.479166666666667in" height="1.5in"}

Signal rectifier circuit.

#### 4.2.7.2 Schematics

The schematic would look like the picture below.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image152.png){width="6.5in" height="1.9479166666666667in"}

Schematics

The values that have been changed in the components are

  -------------------------------------------------------------------------------
  Component                    Name              Value            Units
  ---------------------------- ----------------- ---------------- ---------------
  ELECTRICAL.VoltageSine       AC_Source         220              V

  ELECTRICAL.IdealTransforme   Transformer       1000             

  ELECTRICAL.Resistor          Resistor_1        100              Ohms

  ELECTRICAL.Resistor          Resistor_2        10000            Ohms

  ELECTRICAL.Resistor          Resistor_3        4700             Ohms

  ELECTRICAL.Resistor          Resistor_4        10000            Ohms

  ELECTRICAL.Capacitor         Capacitor_1       200·10^-6^       F
  -------------------------------------------------------------------------------

#### 4.2.7.3 Experiment and results

The experiment analyses the experiment during 0.1s with integrating intervals of 0.001s. The reason behind such short integrating intervals is the frequency of the sine signal. When using an integrating time greater than the period of the voltage, the resulting wave may not be accurate.

As the current goes through the diode, the negative values are turned into zero, which is why there are only positive values from that point on. The final signal is clearly not perfectly constant. This is caused by the capacitor not having an infinite capacitance.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image153.png){width="6.5in" height="2.7708333333333335in"}

Signal being rectified by the circuit

### 4.2.8 Ripple

#### 4.2.8.1 Description

As seen before, the combination of a diode and a capacitor can be used for signal rectification. However, the signal is not perfect, there is a slight gap between peaks in the wave. This phenomenon is known as a ripple, and can be adjusted by merely changing the capacity in the capacitor.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image154.png)

#### 4.2.8.2 Components

To replicate this, the components that are changed are as follows:

- ELECTRICAL.IdealTransformer (Transformer):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  n                 1000                                Turns ratio

  -----------------------------------------------------------------------

- ELECTRICAL.VoltageSine (AC_Source):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             220               V                 Voltage amplitude

  freqHz            50                Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

- ELECTRICAL.Resistor (R1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 100               Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (R2):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 10000             Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (R3):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 4700              Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Resistor (R4):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  R                 10000             Ohm               Resistance

  -----------------------------------------------------------------------

- ELECTRICAL.Capacitor (C1):

  -----------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- -----------------
  C                 200e06            F                 Capacitance

  -----------------------------------------------------------------------

#### 4.2.8.3 Schematics

![electronics_ex3](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image155.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.8.4 Results

The graphs below show how the ripple relates to the capacitance. As the capacitance rises, the ripple decreases, and the signal becomes more uniform.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image156.png){width="6.5in" height="3.5208333333333335in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image157.png){width="6.5in" height="3.5208333333333335in"}

### 4.2.9 Filters

#### 4.2.9.1 Description

Filters are used to clean up signals. By adding three signals with different frequencies, the noise in a wave can be simulated. The three different filters are:

- Lowpass filter: Only low frequencies pass this filter. This is accomplished using a combination of one resistor and one capacitor parallel to the load.

- Highpass filter: Only high frequencies pass this filter. This is accomplished using a combination of one resistor parallel to the load and one capacitor.

- Bandpass filter: Only a certain range of frequencies pass this filter. This is accomplished using both filters in series

. ![circuit(15)](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image158.png){width="6.489583333333333in" height="1.6979166666666667in"}

#### 4.2.9.2 Components

To replicate this, the components that are changed are as follows:

- CONTROL.AnalogSource (High_freq):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               5                                   Signal amplitude or height

  Period            0.02              s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (Low_freq):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               5                                   Signal amplitude or height

  Period            2                 s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- CONTROL.AnalogSource (Mid_freq):

  ---------------------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------------------------------
  source            Source_Sine                         Waveform

  Amp               5                                   Signal amplitude or height

  Period            0.2               s                 Period of sine, pulse, sawtooth, or square source
  ---------------------------------------------------------------------------------------------------------

- ELECTRICAL.Capacitor:

  -------------------------------------------------------------------------------------------------
  Component                                 Variable      Value         Units         Description
  ----------------------------------------- ------------- ------------- ------------- -------------
  ELECTRICAL.Capacitor (Capacitor_1)        C             4e06          F             Capacitance

  ELECTRICAL.Capacitor (Capacitor_1_1):     C             100e09        F             Capacitance

  ELECTRICAL.Capacitor (Capacitor_1_1_1):   C             100e09        F             Capacitance

  ELECTRICAL.Capacitor (Capacitor_1_2):     C             1e09          F             Capacitance
  -------------------------------------------------------------------------------------------------

- 

- ELECTRICAL.Resistor:

  ----------------------------------------------------------------------------------------------
  Component                              Variable      Value         Units         Description
  -------------------------------------- ------------- ------------- ------------- -------------
  ELECTRICAL.Resistor (Resistor_1)       R             1000          Ohm           Resistance

  ELECTRICAL.Resistor (Resistor_2)       R             1             Ohm           Resistance

  ELECTRICAL.Resistor (Resistor_1_1)     R             3062224.4     Ohm           Resistance

  ELECTRICAL.Resistor (Resistor_2_1)     R             1             Ohm           Resistance

  ELECTRICAL.Resistor (Resistor_1_1_1)   R             19904459      Ohm           Resistance

  ELECTRICAL.Resistor (Resistor_1_2)     R             530786        Ohm           Resistance

  ELECTRICAL.Resistor (Resistor_3)       R             1             Ohm           Resistance
  ----------------------------------------------------------------------------------------------

#### 4.2.9.3 Schematics

![electronics_ex5](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image159.png){width="6.489583333333333in" height="4.541666666666667in"}

#### 4.2.9.4 Results

The resulting signal is represented in the first plot. It is a combination of three different frequencies. The High Pass filter should only let through the highest frequencies, those over 40 Hz. The Low pass Filter should do the same for those under 10 Hz. Finally, the Band Pass Filter would let a range between those values. The resulting signals have quite low values. This is caused by the filters being passive. In order to get values close to those going in, an operational amplifier should be included.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image160.png){width="6.5in" height="3.5208333333333335in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image161.png){width="6.5in" height="3.5104166666666665in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image162.png){width="6.5in" height="3.5208333333333335in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image163.png){width="6.5in" height="3.5208333333333335in"}

### 4.2.10 ElectronicMultiplexer

#### 4.2.10.1 Description

A multiplexer is a device used for the selection of a single signal between many. The model uses logical inputs and switches to replicate this contraption. Different switches open and close inside the multiplexer depending on the state of the Boolean inputs. Given that there are two of these, there are four different possible outcomes, and, therefore, four different currents. The CONTROL library uses a similar component with analog inputs.

#### 4.2.10.2 Components

- ELECTRICAL.VoltageSine (VoltageSine_1):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             5                 V                 Voltage amplitude

  freqHz            0.5               Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

- ELECTRICAL.VoltageSine (VoltageSine_2):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             5                 V                 Voltage amplitude

  freqHz            1                 Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

- ELECTRICAL.VoltageSine (VoltageSine_3):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             5                 V                 Voltage amplitude

  freqHz            1.5               Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

- ELECTRICAL.VoltageSine (VoltageSine_4):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             5                 V                 Voltage amplitude

  freqHz            2                 Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

#### 4.2.10.3 Schematics

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image164.png){width="6.495833333333334in" height="4.538888888888889in"}

#### 4.2.10.4 Results

The following experiment analyses the influence of the multiplexer on the circuit. In order to do this, the code assigns alternating values to the Boolean inputs, so that the whole sequence is covered. The plot shows how the frequency in the output changes as different signals are selected.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image165.png){width="6.495833333333334in" height="2.763888888888889in"}

### 4.2.11 Thyristors

#### 4.2.11.1 Description

Thyristors act as diodes with switches. When a current, or a Boolean signal, is passed to the component, the circuit will close and current will be able to pass through. There are two different types of thyristors, those, which close only when interrupting the logical input; and those, which are able to close when a negative current goes through the terminal.

#### 4.2.11.2 Components

- CONTROL.SourcebPulse (Switch, Switch_1):

  ------------------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ------------------------------------
  Period            15                s                 Period of pulse

  pulseWidth        1                 s                 Pulse width

  Tstart            1                 s                 Starting time of signal generation
  ------------------------------------------------------------------------------------------

- ELECTRICAL.VoltageSine(AC_Current, AC_Current_1):

  ---------------------------------------------------------------------------------
  Variable          Value             Units             Description
  ----------------- ----------------- ----------------- ---------------------------
  Vpeak             220               V                 Voltage amplitude

  freqHz            10                Hz                Frequencies of sine waves
  ---------------------------------------------------------------------------------

- 

#### 4.2.11.3 Schematics

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image166.png){width="6.495833333333334in" height="4.538888888888889in"}

#### 4.2.11.4 Results

The following plots show how both types of thyristors behave. When the switch signal is \"True\", the thyristor behaves as a regular diode. However, when it is \"False\" the circuit is open and current does not go through the component. Both devices act the same given that it is not possible to drive a negative current throught the terminal of the GTO Thyristor.

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image167.png){width="6.495833333333334in" height="2.765972222222222in"}

![](C:\Users\LPU\EcosimPro\02_Toolkits\STANDARD_DEMO\docs_md\ELECTRICAL\Source Files\ELECTRICAL_Library_Reference_Manual_media/media/image168.png){width="6.495833333333334in" height="2.7625in"}

# 5 References

User Manual

Getting Started

[^1]: 1 A component is the basic simulation unit generated by EcosimPro Language (EL) representing some physical/logical behaviour. Components are used as symbols that can be dragged & pasted graphically to build more complex models.

[^2]: For a detailed description of the formulation and input data, please refer to the on-line Reference Manual available over any of the components inserted in a model diagram (documentation button of the Attributes Editor).
