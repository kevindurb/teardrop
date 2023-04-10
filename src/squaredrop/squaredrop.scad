use <../common/lib/convert.scad>

use <../common/components/trailer_frame.scad>
use <../common/components/floor.scad>
use <../common/components/headboard.scad>
use <../common/components/mattress.scad>
use <../common/components/tongue_box.scad>

use <./cabinets.scad>
use <./galley.scad>
use <./galley_door.scad>
use <./shell.scad>

/* [Show / Hide] */
show_ceiling = true;
show_sides = true;
show_galley_door = true;

/* [Open / Close] */
open = 0; // [0:0.1:1]
doors_open = 0; // [0:0.1:1]

if (show_galley_door) {
  galley_deg = doors_open * 90;
  translate([0, feet(4), inches(41.75)])
  rotate([galley_deg, 0, 0])
    galley_door();
}

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

if (open >= 0.5) {
  translate([feet(2) + inches(7), feet(2.5), feet(1.5)])
    rotate([90, 0, 90])
    galley_cabinet_door_single();

  mirror([1, 0, 0])
  translate([feet(2) + inches(7), feet(2.5), feet(1.5)])
    rotate([90, 0, 90])
    galley_cabinet_door_single();
}

trailer();

translate([feet(-2.5), feet(-6.5), inches(-3)])
  tongue_box(doors_open);
