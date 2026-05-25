# STANDARD_2.8

# STANDARD 2.8

STANDARD 2.8 is a core EcosimPro / PROOSIS workspace that provides reusable engineering libraries for building multi-domain, continuous-discrete simulation models in the EcosimPro Language (EL).

The workspace is intended as a foundation for developing, validating, and running simulation models across common engineering domains such as control systems, electrical networks, hydraulic circuits, mechanical systems, and thermal systems.

## Overview

This repository contains the STANDARD workspace for EcosimPro / PROOSIS version 2.8. It includes a set of reusable libraries, shared port definitions, examples, and supporting modelling assets that can be used to create hierarchical simulation models.

EcosimPro / PROOSIS models are typically built from:

* **Libraries**, which group reusable modelling elements by discipline.
* **Components**, which define physical or logical behaviour using variables, equations, topology, and events.
* **Ports**, which define typed connection interfaces between components.
* **Partitions**, which define the mathematical model generated from a component.
* **Experiments**, which define simulation scenarios, boundary conditions, initial conditions, and solver settings.

## Included Libraries

The STANDARD workspace includes the following main libraries.

### PORTS_LIB

Defines common connection ports used across the workspace, including:

* `analog_signal` for real-valued signal vectors.
* `bool_signal` for Boolean signal vectors.
* `mech_rot` for one-dimensional rotational mechanical connections.
* `mech_trans` for one-dimensional translational mechanical connections.
* `elec` for electrical pins.
* `thermal` for thermal connections using temperature and heat flow arrays.

### MATH

Provides mathematical utilities, constants, units, and helper functions required by the other libraries.

### CONTROL

Provides standard control-oriented modelling blocks such as signal sources, transfer functions, controllers, and signal-processing components.

### ELECTRICAL

Provides reusable electrical and electronic components for modelling electrical networks.

### HYDRAULIC

Provides components for modelling hydraulic and fluid systems, including typical elements such as tanks, pipes, restrictions, and valves.

### MECHANICAL

Provides reusable components for rotational and translational mechanical systems, such as inertias, springs, dampers, actuators, sensors, and mechanical connections.

### THERMAL

Provides thermal modelling components such as thermal nodes, conductors, heat-capacity elements, and heat-transfer components.

## Requirements

To use this workspace, you need:

* EcosimPro or PROOSIS installed.
* A valid EcosimPro / PROOSIS license.
* A supported C++ compiler configured in the tool.
* The STANDARD 2.8 workspace loaded in the EcosimPro / PROOSIS environment.

For simulation execution, EcosimPro / PROOSIS generates and compiles C++ code from the EL models, so a compatible compiler must be available and correctly configured.

## Basic EL Example

The following simplified example shows the style of an EL component used in EcosimPro / PROOSIS:

```el
COMPONENT firstOrderSystem "Simple first-order dynamic system"

   DATA
      REAL tau = 1.0 UNITS u_s "Time constant"

   DECLS
      REAL x UNITS no_units "Input signal"
      REAL y UNITS no_units "Output signal"

   CONTINUOUS
      y' = (x - y) / tau

END COMPONENT
```

## Experiments

Experiments define how a compiled model is simulated. They may include initial conditions, bounds, solver configuration, reporting, steady-state calculations, or transient integration.

Example experiment structure:

```el
EXPERIMENT exp1 ON ExampleComponent.default

   INIT
      -- Initial conditions

   BOUNDS
      -- Boundary conditions

   BODY
      TIME = 0
      TSTOP = 10
      CINT = 0.1
      INTEG()

END EXPERIMENT
```

## Modelling Guidelines

When adding or modifying EL components, follow these guidelines:

* Keep components modular and reusable.
* Use typed ports instead of connecting variables manually.
* Place component blocks in the standard order: `PORTS`, `DATA`, `DECLS`, `OBJECTS`, `TOPOLOGY`, `INIT`, `DISCRETE`, `CONTINUOUS`.
* Use `OBJECTS` only for class instances.
* Instantiate components and define connections in `TOPOLOGY`.
* Use construction parameters for structural sizes such as array dimensions.
* Use `DATA` variables for configurable simulation values.
* Avoid semicolons at the end of EL statements.
* Use `DISCRETE` for `WHEN` event logic.
* Use `CONTINUOUS` for algebraic and differential equations.

## License

Please refer to the license information included in this repository or provided with your EcosimPro / PROOSIS distribution.

## Support

For questions related to EcosimPro / PROOSIS installation, licensing, or commercial support, contact the official EcosimPro / PROOSIS support channels.

For repository-specific issues, use the GitHub issue tracker if it is enabled for this project.
