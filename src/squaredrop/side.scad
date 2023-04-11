include <../common/lib.scad>

use <../common/components/wheel_well.scad>
use <../common/components/door.scad>
use <./ceiling.scad>

include <../common/constants/trailer.scad>
include <./constants.scad>

door_offset_x = inches(31.125);
door_offset_y = inches(37);

module mountains_logo() {
  color_white()
  rotate([90, 0, 90])
  linear_extrude(0.25)
  scale([7, 8])
    import("./mountains.svg", center = true);
}

module side_profile(extrusion_distance) {
  rotate([90, 0, 90])
  linear_extrude(extrusion_distance)
    polygon([
      // Bottom Front
      [inches(6), 0],
      [0, inches(10)],

      // Top Front
      [0, feet(3)],
      [feet(1), feet(4)],

      // Top Back
      [feet(5.5), feet(4)],
      [body_length - feet(1), body_height - feet(0.5)],
      [body_length, body_height - feet(1.5)],

      // Bottom Back
      [body_length, inches(10)],
      [body_length - inches(8), 0],
    ]);
}

module side_shape() {
  difference() {
    color_outside()
    translate([inches(-31), feet(-4.5), 0])
      side_profile(inches(1));

    translate([feet(-3), inches(6), 0])
      wheel_well_shape();

    translate([feet(-3), inches(6), 0])
      wheel_well_cutout();

    translate([-door_offset_x + inches(1), -door_offset_y, inches(3)])
    scale([2, 1, 1])
    rotate([0, 0, -90])
      door_frame();
  }
}

module side(door_open = 0) {
  side_shape();

  translate([-door_offset_x, -door_offset_y, inches(3)])
  rotate([0, 0, (180 * door_open)])
    door();

  translate([feet(2) + inches(7), feet(2) + inches(2), feet(2)])
    mountains_logo();
}

side();
