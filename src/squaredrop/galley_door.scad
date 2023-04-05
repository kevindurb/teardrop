use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

use <./ceiling.scad>
include <./constants.scad>

module galley_door() {
  translate([(-body_width / 2), feet(-8) - inches(6), inches(-41.75)])
  intersection() {
    full_ceiling();

    galley_door_cutout();
  }
}

galley_door();
