use <../lib/convert.scad>

use <../components/trailer_frame.scad>
use <../components/trailer_floor.scad>
use <../components/trailer_side.scad>
use <../components/trailer_ceiling.scad>
use <../components/trailer_galley_door.scad>

show_ceiling = true;
show_sides = true;
show_galley_door = true;
galley_open = false;

module passenger_side() {
  translate([feet(-2.5) + inches(0.25), inches(-45), 0])
  rotate([0, 0, -90])
    trailer_side();
}

module driver_side() {
  mirror([1, 0, 0])
    passenger_side();
}

if (show_sides) {
  passenger_side();
  driver_side();
}

if (show_ceiling) {
  translate([0, feet(-3) + inches(-9), 0])
  rotate([0, 0, -90])
    trailer_ceiling();
}

if (show_galley_door) {
  galley_deg = galley_open ? 90 : 0;
  translate([0, feet(2.75), feet(3.5)])
  rotate([galley_deg, 0, 0])
  rotate([0, 0, -90])
    trailer_galley_door();
}

translate([0, inches(4.5), 0])
  trailer_floor();

trailer_frame();
