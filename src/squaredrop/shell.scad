use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

use <../common/components/wheel_well.scad>
use <../common/components/door.scad>

include <../common/constants/trailer.scad>

module side_shape() {
  color_wood()
  translate([inches(-31), feet(-4.5), 0])
  rotate([90, 0, 90])
  linear_extrude(inches(1.25))
    polygon([
      // Bottom Front
      [inches(6), 0],
      [0, inches(10)],

      // Top Front
      [0, feet(3)],
      [feet(1), feet(4)],

      // Top Back
      [feet(5.5), feet(4)],
      [feet(8.5), feet(3.5)],
      [feet(9.5), feet(2.5)],

      // Bottom Back
      [feet(9.5), inches(10)],
      [feet(9) - inches(2), 0],
    ]);
}

module side() {
  difference() {
    side_shape();

    translate([feet(-3), inches(6), 0])
      wheel_well_shape();

    translate([feet(-3), inches(6), 0])
      wheel_well_cutout();
  }
}

module shell() {
  union() {
    side();

    mirror([1, 0, 0])
      side();
  }
}

shell();
