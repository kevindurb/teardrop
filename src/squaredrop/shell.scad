use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

use <./side.scad>

include <../common/constants/trailer.scad>

module shell(door_open = 0) {
  union() {
    side(door_open);

    mirror([1, 0, 0])
      side(door_open);
  }
}

shell();
