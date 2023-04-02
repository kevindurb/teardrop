use <../lib/convert.scad>
use <../lib/colors.scad>
use <./wheel_well.scad>
include <../constants/trailer.scad>

wheel_well_y_offset = AXEL_OFFSET_Y + (FRAME_LENGTH / 2) - inches(3);

module mattress() {
  color_white()
  difference() {
    cube([inches(59), inches(79.5), inches(6)]);

    translate([inches(-6.5), wheel_well_y_offset + inches(2.25), inches(-2.5)])
      wheel_well_shape();

    translate([FRAME_WIDTH + inches(5), wheel_well_y_offset + inches(2.25), inches(-2.5)])
      wheel_well_shape();
  }
}

mattress();
