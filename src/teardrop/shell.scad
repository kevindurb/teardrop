include <../common/lib.scad>
use <./ceiling.scad>
use <./side.scad>

module passenger_side(door_open = 0) {
  translate([feet(-2.5) + inches(0.25), inches(-51), 0])
  rotate([0, 0, -90])
    teardrop_side(door_open);
}

module driver_side(door_open = 0) {
  mirror([1, 0, 0])
    passenger_side(door_open);
}

module shell(show_ceiling = true, show_sides = true, doors_open = 0) {
  if (show_sides) {
    passenger_side(doors_open);
    driver_side(doors_open);
  }

  if (show_ceiling) {
    translate([0, feet(-3) + inches(-15), 0])
    rotate([0, 0, -90])
      teardrop_ceiling();
  }
}

shell();
