use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

use <../common/components/wheel_well.scad>
use <../common/components/door.scad>

include <../common/constants/trailer.scad>

door_offset_x = inches(30.5);
door_offset_y = inches(37);

module side_profile() {
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

module side_shape() {
  difference() {
    side_profile();

    translate([feet(-3), inches(6), 0])
      wheel_well_shape();

    translate([feet(-3), inches(6), 0])
      wheel_well_cutout();

    translate([-door_offset_x, -door_offset_y, inches(3)])
    scale([2, 1, 1])
    rotate([0, 0, -90])
      door_frame();
  }
}

module side(door_open = 0) {
  side_shape();

  translate([-door_offset_x, -door_offset_y, inches(3)])
  rotate([0, 0, 90 * door_open - 90])
    door();
}

side();
