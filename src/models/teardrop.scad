use <./lib/convert.scad>

use <./components/teardrop_frame.scad>
use <./components/teardrop_floor.scad>
use <./components/teardrop_side.scad>
use <./components/teardrop_ceiling.scad>
use <./components/teardrop_galley_door.scad>
use <./components/teardrop_cabinets.scad>

show_ceiling = true;
show_sides = true;
show_galley_door = true;
galley_open = false;

module passenger_side() {
  translate([feet(-2.5) + inches(0.25), inches(-45), 0])
  rotate([0, 0, -90])
    teardrop_side();
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
    teardrop_ceiling();
}

if (show_galley_door) {
  galley_deg = galley_open ? 90 : 0;
  translate([0, feet(2.75), feet(3.5)])
  rotate([galley_deg, 0, 0])
  rotate([0, 0, -90])
    teardrop_galley_door();
}

translate([0, feet(2) + inches(9), inches(2.5)])
  teardrop_cabinets();

translate([0, inches(4.5), 0])
  teardrop_floor();

teardrop_frame();
