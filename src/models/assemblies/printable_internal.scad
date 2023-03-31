use <../lib/convert.scad>

use <../components/trailer_frame.scad>
use <../components/teardrop_floor.scad>
use <../components/teardrop_cabinets.scad>
use <../components/headboard.scad>
use <../components/mattress.scad>
use <../components/cooler.scad>

/* [Show / Hide] */
show_ceiling = true;
show_sides = true;
show_galley_door = true;

/* [Open / Close] */
galley_open = 0; // [0:0.1:1]
silverware_open = 0; // [0:0.1:1]
electrical_open = 0; // [0:0.1:1]
cabinets_open = 0; // [0:0.1:1]

translate([0, inches(30), inches(2.5)])
  teardrop_cabinets_bare();

translate([0, inches(-1.5), 0])
  teardrop_floor();

translate([0, inches(-50.25), inches(2.5)])
  headboard();

trailer_frame();
