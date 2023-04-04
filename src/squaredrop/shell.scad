use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

use <./side.scad>
use <./ceiling.scad>

include <./constants.scad>

module shell(door_open = 0) {
  side(door_open);

  mirror([1, 0, 0])
    side(door_open);

  translate([-(ceiling_width / 2), feet(-4.5), 0])
  ceiling();
}

shell();
