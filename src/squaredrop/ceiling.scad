use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

use <./side.scad>
include <./constants.scad>

module ceiling() {
  difference() {
    color_outside()
      side_profile(ceiling_width);

    translate([-1, ceiling_thickness, -1])
    scale([2, 1 - ((ceiling_thickness * 2) / body_length), 1 - (ceiling_thickness / body_height)])
    color_wood()
      side_profile(ceiling_width);

    translate([-body_width / 2, body_length - feet(5.5),  -body_height / 4])
    rotate([-45, 0, 0])
    color_wood()
      cube([body_width * 2, feet(3), body_height * 2]);
  }
}

ceiling();
