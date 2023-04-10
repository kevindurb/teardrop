use <../lib/convert.scad>
use <../lib/colors.scad>

cover_width = inches(16.4);
cover_length = inches(23);
cover_height = inches(5);

cutout_width = inches(14);
cutout_length = inches(14);
cutout_depth = cover_height + inches(3);

/* [Open / Close] */
open = 0; // [0:0.1:1]

$fa = 0.01;

module ceiling_fan_cover() {
  cover_diameter = cover_length * 2;

  color_black()
  intersection() {
    cube([cover_width, cover_length, cover_height]);

    translate([0, cover_length / 2, (cover_diameter / -2) + cover_height])
    rotate([0, 90, 0])
      cylinder(h = cover_width, d = cover_diameter);
  }
}

module ceiling_fan_body(open = 0) {
  color_white()
  difference() {
    cube([cutout_width, cutout_length, cutout_depth]);

    translate([-1, -1, inches(2.5)])
    rotate([20 * open, 0, 0])
      cube([cutout_width + 2, cutout_length * 2, cutout_depth]);
  }
}

module ceiling_fan(open = 0) {
  cover_offset = (cover_width - cutout_width) / 2;

  translate([-cutout_width / 2, 0, 0])
  union() {
    translate([0, 0, inches(-2)])
      ceiling_fan_body(open);

    translate([-cover_offset, -cover_offset, 0])
    rotate([20 * open, 0, 0])
      ceiling_fan_cover();
  }
}

ceiling_fan(open);
