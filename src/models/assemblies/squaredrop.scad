use <../lib/convert.scad>

use <../components/trailer_frame.scad>
use <../components/teardrop_floor.scad>
use <../components/teardrop_cabinets.scad>
use <../components/headboard.scad>
use <../components/mattress.scad>
use <../components/cooler.scad>
use <../components/water_tank.scad>

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

translate([0, inches(33), inches(2.5)])
  teardrop_cabinets(silverware_open, electrical_open, cabinets_open);

translate([0, inches(1.5), 0])
  teardrop_floor();

translate([feet(-2.5) + inches(0.5), feet(-3) + inches(-11.25), inches(2.5)])
  mattress();

translate([feet(-2.5) + inches(1.25), feet(3) - inches(2), inches(3.25)])
  cooler();

translate([0, inches(-47.25), inches(2.5)])
  headboard();

translate([inches(1.5), feet(3) + inches(1), inches(3.25)])
  water_tank();

translate([inches(9.5), feet(3) + inches(1), inches(3.25)])
  water_tank();

trailer();
