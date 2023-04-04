use <../common/lib/convert.scad>
/* include <../common/lib/viewport.scad> */

use <../common/components/trailer_frame.scad>
use <../common/components/floor.scad>
use <../common/components/headboard.scad>
use <../common/components/mattress.scad>

use <./shell.scad>

/* [Show / Hide] */
show_ceiling = true;
show_sides = true;
show_galley_door = true;

/* [Open / Close] */
galley_open = 0; // [0:0.1:1]
silverware_open = 0; // [0:0.1:1]
electrical_open = 0; // [0:0.1:1]
cabinets_open = 0; // [0:0.1:1]

/* if (show_galley_door) { */
/*   galley_deg = galley_open * 90; */
/*   translate([0, feet(2.5) + inches(0.75), inches(40.75)]) */
/*   rotate([galley_deg, 0, 0]) */
/*   rotate([0, 0, -90]) */
/*     teardrop_galley_door(); */
/* } */

shell();

translate([0, inches(1.5), 0])
  teardrop_floor();

translate([feet(-2.5) + inches(0.5), feet(-3) + inches(-11.25), inches(2.5)])
  mattress();

translate([0, inches(-47.25), inches(2.5)])
  headboard();

/* translate([0, feet(3), 0]) */
/*   galley(silverware_open, electrical_open, cabinets_open); */

trailer();
