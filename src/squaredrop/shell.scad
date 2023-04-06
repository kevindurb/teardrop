use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

use <./side.scad>
use <./ceiling.scad>

include <./constants.scad>

module shell(show_ceiling = true, show_sides = true, doors_open = 0) {
  if (show_sides) {
    side(doors_open);

    mirror([1, 0, 0])
      side(doors_open);
  }

  if (show_ceiling) {
    translate([-(ceiling_width / 2), feet(-4.5), 0])
    ceiling();
  }
}

shell();
