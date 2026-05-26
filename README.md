# STANDARD_2.8

This repository contains **source code and reference manuals from the EcosimPro / PROOSIS STANDARD 2.8 workspace**.

The libraries documented here are **not intended to be downloaded, installed, or distributed from this repository**. The STANDARD libraries are part of the official EcosimPro / PROOSIS installation. This repository is intended to expose readable source material and manuals so they can be indexed, searched, and used as technical context.

## Purpose

The main purpose of this repository is to make the STANDARD 2.8 workspace easier to consult.

## Important clarification

This repository is **not** a package, installer, or replacement for the STANDARD workspace delivered with EcosimPro / PROOSIS.

The official libraries are provided with the EcosimPro / PROOSIS installation. This repository only contains material intended for consultation, documentation, and knowledge retrieval.

Do not treat this repository as:

* A package manager source.
* A standalone build environment.
* A replacement for the official EcosimPro / PROOSIS installation.
* A complete runtime distribution of STANDARD libraries.
* The authoritative source for licensing, installation, or commercial support.

## Repository contents

The repository is organized by library and example area:

```text
STANDARD_2.8/
├── CONTROL/
│   ├── sources/
│   └── CONTROL_Library_Reference_Manual.md
├── CONTROL_EXAMPLES/
│   ├── autocode/
│   └── sources/
├── ELECTRICAL/
│   └── sources/
├── ELECTRICAL_EXAMPLES/
├── HYDRAULIC/
│   ├── sources/
│   └── HYDRAULIC_Library_Reference_Manual.md
├── HYDRAULIC_EXAMPLES/
├── MATH/
├── MATH_EXAMPLES/
│   └── sources/
├── MECHANICAL/
│   ├── sources/
│   └── MECHANICAL_Library_Reference_Manual.md
├── MECHANICAL_EXAMPLES/
├── PORTS_LIB/
│   └── sources/
├── THERMAL/
└── THERMAL_EXAMPLES/
```

## Main sections

### PORTS_LIB

Contains common port definitions used by the STANDARD workspace.

These ports define typed connection interfaces used across physical and logical domains, such as signals, mechanical connections, electrical pins, and thermal connections.

Typical topics include:

* Component interfaces.
* Port variable names and meanings.
* Connection semantics.
* How different STANDARD libraries connect components together.

### MATH

Contains mathematical utilities, constants, units, and helper functions used by the other STANDARD libraries.

Typical topics include:

* Mathematical functions.
* Units and constants.
* Utility functions used by STANDARD components.
* Shared mathematical conventions.

### CONTROL

Contains control-oriented modelling blocks and their reference documentation.

Typical topics include:

* Signal sources.
* Signal processing blocks.
* Transfer functions.
* Controllers.
* Continuous and discrete control components.

Use `CONTROL/sources/` for implementation examples and `CONTROL/CONTROL_Library_Reference_Manual.md` for reference documentation.

### CONTROL_EXAMPLES

Contains examples showing how CONTROL components can be used in models and experiments.

This section is especially useful when the question is about practical usage rather than component internals.

### ELECTRICAL

Contains STANDARD electrical modelling components.

Typical topics include electrical networks, electrical pins, electrical component equations, and related modelling patterns.

### ELECTRICAL_EXAMPLES

Contains examples of electrical systems built using STANDARD electrical components.

Use this section when the question is about how to assemble, connect, or simulate electrical components in practice.

### HYDRAULIC

Contains hydraulic and fluid-system modelling components and reference documentation.

Typical topics include hydraulic nodes, pipes, tanks, restrictions, valves, and other hydraulic modelling elements.

Use `HYDRAULIC/sources/` for implementation details and `HYDRAULIC/HYDRAULIC_Library_Reference_Manual.md` for reference documentation.

### HYDRAULIC_EXAMPLES

Contains usage examples for hydraulic systems.

Use this section for practical questions about assembling hydraulic circuits, setting boundary conditions, or interpreting example simulations.

### MECHANICAL

Contains mechanical modelling components and reference documentation.

Typical topics include rotational and translational mechanical systems, inertias, springs, dampers, actuators, sensors, and mechanical connections.

Use `MECHANICAL/sources/` for source-level implementation and `MECHANICAL/MECHANICAL_Library_Reference_Manual.md` for reference documentation.

### MECHANICAL_EXAMPLES

Contains examples of mechanical models built with STANDARD components.

Use this section for practical modelling and simulation examples.

### THERMAL

Contains thermal modelling components.

Typical topics include thermal nodes, heat flows, conductors, heat capacities, and heat-transfer components.

### THERMAL_EXAMPLES

Contains examples of thermal models and simulations.

Use this section when the question concerns practical use of thermal components in EcosimPro / PROOSIS models.

## How to use this repository

This repository can be browsed directly as documentation and reference material.

Recommended workflow:

1. Select the domain of interest, such as `CONTROL`, `HYDRAULIC`, or `MECHANICAL`.
2. Read the corresponding reference manual when available.
3. Inspect source files to understand implementation details.
4. Review the related `*_EXAMPLES` folder to see practical usage patterns.
5. Validate execution or behaviour against the official EcosimPro / PROOSIS installation.

## Requirements

To consult this repository as documentation or AI context, no EcosimPro / PROOSIS installation is required.

To execute, validate, or modify the models in an EcosimPro / PROOSIS environment, you need:

* A valid EcosimPro or PROOSIS installation.
* The STANDARD 2.8 libraries included with that installation.
* A valid license.
* A compatible C++ compiler configured in the tool, when simulation code generation and compilation are required.

## Example consultation scenarios

### Asking about a CONTROL block

A user may ask:

> How does a standard PID controller work in EcosimPro?

The assistant should search the CONTROL reference manual and the relevant files under:

```text
CONTROL/sources/
CONTROL_EXAMPLES/sources/
```

### Asking about a hydraulic component

A user may ask:

> What parameters does this hydraulic valve component use?

The assistant should inspect:

```text
HYDRAULIC/HYDRAULIC_Library_Reference_Manual.md
HYDRAULIC/sources/
HYDRAULIC_EXAMPLES/
```

### Asking how to connect components

A user may ask:

> Which port type should I use to connect two thermal components?

The assistant should inspect:

```text
PORTS_LIB/sources/
THERMAL/sources/
THERMAL_EXAMPLES/
```

## Documentation files

The repository includes Markdown reference manuals for several libraries, including:

```text
CONTROL/CONTROL_Library_Reference_Manual.md
HYDRAULIC/HYDRAULIC_Library_Reference_Manual.md
MECHANICAL/MECHANICAL_Library_Reference_Manual.md
```

Additional Markdown manuals may be added to improve AI retrieval and human readability.

## Recommended format for AI-oriented documentation

When adding or updating documentation, prefer:

* Markdown files with clear headings.
* Tables for components, parameters, variables, ports, units, and examples.
* Short, focused code snippets.
* Explicit references to related source files.
* Separate sections for assumptions, limitations, and usage notes.
* Consistent terminology across source code and manuals.

## Recommended metadata for source examples

When adding or updating examples, consider using a short header such as:

```ecosimpro
/*-----------------------------------------------------------------------------------------
 LIBRARY: <LIBRARY_NAME>
 FILE: <FILE_NAME>
 PURPOSE: Short description of the example
 DOMAIN: Control | Electrical | Hydraulic | Mechanical | Thermal | Math | Ports
 TOPICS: keyword1, keyword2, keyword3
 RELATED_COMPONENTS: ComponentA, ComponentB
-----------------------------------------------------------------------------------------*/
```

This makes the examples easier to retrieve through semantic search.

## Maintainer

Maintained by **Empresarios Agrupados Internacional**.
