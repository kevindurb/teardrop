use <../lib/convert.scad>
use <../components/teardrop_ceiling.scad>
use <../components/teardrop_side.scad>

module passenger_side() {
  translate([feet(-2.5) + inches(0.25), inches(-51), 0])
  rotate([0, 0, -90])
    teardrop_side();
}

module driver_side() {
  mirror([1, 0, 0])
    passenger_side();
}

module shell(show_ceiling = true, show_sides = true) {
  if (show_sides) {
    passenger_side();
    driver_side();
  }

  if (show_ceiling) {
    translate([0, feet(-3) + inches(-15), 0])
    rotate([0, 0, -90])
      teardrop_ceiling();
  }
}

shell();
