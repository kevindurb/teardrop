include <../lib.scad>
use <./wheel_well.scad>
include <../constants/trailer.scad>

wheel_well_y_offset = AXEL_OFFSET_Y - inches(4);

mattress_width = inches(59);
mattress_length = inches(79.5);
mattress_thickness = inches(6);

module mattress(anchor = CENTER, spin = 0, orient = UP) {
  color_white()
  diff() {
    cube([mattress_width, mattress_length, mattress_thickness], anchor = anchor, spin = spin, orient = orient) {
      back(AXEL_OFFSET_Y + inches(8.25))
      down(inches(2))
      left(inches(6))
      position(LEFT + BOTTOM)
      tag("remove")
        wheel_well_shape();

      back(AXEL_OFFSET_Y + inches(8.25))
      down(inches(2))
      left(inches(6))
      position(RIGHT + BOTTOM)
      tag("remove")
        wheel_well_shape();
    }
  }
}

mattress();
