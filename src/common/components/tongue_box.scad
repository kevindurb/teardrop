include <../lib.scad>

use <./battery.scad>

/* [Open / Close] */
open = 0; // [0:0.1:1]

tongue_box_width = feet(5);
tongue_box_depth = feet(2);
tongue_box_height = feet(2);

module tongue_box_divider() {
  color_wood()
    cube([inches(0.75), tongue_box_depth - inches(1.5), tongue_box_height - inches(1.5)]);
}

module tongue_box_shell() {
  difference() {
    color_black()
      cube([tongue_box_width, tongue_box_depth, tongue_box_height]);

    translate([inches(-1), inches(0.75), inches(0.75)])
    color_wood()
      cube([tongue_box_width + inches(2), tongue_box_depth - inches(1.5), tongue_box_height - inches(1.5)]);
  }
}

module tongue_box_door() {
  color_black()
    cube([inches(0.75), tongue_box_depth - inches(1.5), tongue_box_height - inches(1.5)]);
}

module tongue_box(open = 0, anchor = CENTER, spin = 0, orient = UP) {
  attachable(anchor, spin, orient, size = [tongue_box_width, tongue_box_depth, tongue_box_height]) {
    translate([tongue_box_width / -2, tongue_box_depth / -2, tongue_box_height / -2])
    union() {
      tongue_box_shell();

      translate([feet(3), inches(0.75), inches(0.75)])
        tongue_box_divider();

      translate([0, inches(0.75), inches(0.75)])
      rotate([0, 0, 180 * open])
        tongue_box_door();

      translate([tongue_box_width, inches(0.75), inches(0.75)])
      rotate([0, 0, -180 * open])
      translate([inches(-0.75), 0, 0])
        tongue_box_door();


      translate([tongue_box_width - inches(18), inches(0.75), inches(0.75)])
        battery();
    }
    children();
  }
}

tongue_box(open);
