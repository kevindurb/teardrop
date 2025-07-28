# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an OpenSCAD project for designing parametric trailer campers (teardrops and squaredrops). The project generates 3D models and renders using OpenSCAD through Docker containers, with build automation via Just.

## Development Environment

The project requires Docker and Just (command runner). OpenSCAD runs inside Docker containers with X11 forwarding for GUI operations. The BOSL2 library is used for advanced geometric operations.

## Common Commands

- `just` - Install BOSL2 library (default target)
- `just install-bosl2` - Download and install BOSL2 library to OpenSCAD libraries directory
- `just preview` - Generate PNG previews for both teardrop and squaredrop designs
- `just preview-teardrop` - Generate PNG preview of teardrop design only  
- `just preview-squaredrop` - Generate PNG preview of squaredrop design only
- `just build` - Generate STL files for both designs
- `just build-teardrop` - Generate STL file for teardrop design only
- `just build-squaredrop` - Generate STL file for squaredrop design only
- `just openscad [args]` - Run OpenSCAD with hardware warnings in Docker container
- `just xvfb-openscad [args]` - Run OpenSCAD with virtual display (for headless rendering)

## Architecture

### Project Structure
- `src/common/` - Shared components, libraries, and constants used by both designs
  - `components/` - Modular 3D components (wheels, doors, mattress, etc.)
  - `constants/trailer.scad` - Frame dimensions and measurements
  - `lib/` - Utility libraries (colors, unit conversion, rounded edges)
  - `lib.scad` - Main library import that includes BOSL2 and local utilities
- `src/teardrop/` - Traditional teardrop trailer design files
- `src/squaredrop/` - Square-back trailer design files  
- `dist/` - Output directory for generated STL and PNG files

### Key Design Patterns
- All designs inherit from a common `trailer()` module providing the base frame structure
- Components use BOSL2's attachment system (`attachable()`, `position()`, `attach()`) for modular positioning
- Unit conversion functions (`inches()`, `feet()`) provide readable dimensional specifications
- JSON parameter files define different visualization presets (Closed, X-Ray, Showcase)
- Parametric controls allow interactive adjustment of door positions and visibility settings

### Component System
Components are modular and reusable between designs:
- Frame and structural elements (trailer_frame, floor, wheels)
- Interior components (mattress, headboard, cabinets, ceiling_fan)  
- Doors and access panels (galley_door with rotation parameters)
- Utility components (battery, cooler, water_tank, solar_panel)

### Rendering Configuration
- Camera positioning and image sizes are pre-configured in justfile
- Docker container mounts source code and output directories
- Parameter sets in JSON files control what elements are visible/hidden
- BOSL2 attachment system enables precise component positioning and relationships