use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

use <./side.scad>
include <./constants.scad>

module galley_door_cutout() {
  translate([-body_width / 2, body_length - feet(5.5),  -body_height / 4])
  rotate([-45, 0, 0])
  color_wood()
    cube([body_width * 2, feet(3), body_height * 2]);
}

module full_ceiling() {
  difference() {
    color_outside()
      side_profile(ceiling_width);

    translate([-ceiling_width / 2, ceiling_thickness, -1])
    scale([1, 1 - ((ceiling_thickness * 2) / body_length), 1 - (ceiling_thickness / body_height)])
    color_wood()
      side_profile(ceiling_width * 2);
  }
}

module ceiling() {
  difference() {
    full_ceiling();

    galley_door_cutout();
  }
}

ceiling();
