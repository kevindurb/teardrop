use <../common/lib/convert.scad>

use <../common/components/trailer_frame.scad>
use <../common/components/floor.scad>
use <../common/components/headboard.scad>
use <../common/components/mattress.scad>

use <./shell.scad>
use <./galley.scad>

/* [Show / Hide] */
show_ceiling = true;
show_sides = true;
show_galley_door = true;

/* [Open / Close] */
open = 0; // [0:0.1:1]
doors_open = 0.75; // [0:0.1:1]

/* if (show_galley_door) { */
/*   galley_deg = galley_open * 90; */
/*   translate([0, feet(2.5) + inches(0.75), inches(40.75)]) */
/*   rotate([galley_deg, 0, 0]) */
/*   rotate([0, 0, -90]) */
/*     teardrop_galley_door(); */
/* } */

shell(show_ceiling, show_sides, doors_open);

translate([0, inches(1.5), 0])
  teardrop_floor();

// z - 1 cause it needs to be lower than the wheel wells to not glitch
translate([feet(-2.5) + inches(0.5), feet(-3) + inches(-11.25), inches(2.5) - 1])
  mattress();

translate([0, inches(-47.25), inches(2.5)])
  headboard();

translate([0, feet(3), 0])
  galley(open);

trailer();
