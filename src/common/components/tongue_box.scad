use <../lib/convert.scad>
use <../lib/colors.scad>

tongue_box_width = feet(5);
tongue_box_depth = feet(2);
tongue_box_height = feet(2);

module tongue_box() {
  union() {
    difference() {
      color_black()
        cube([tongue_box_width, tongue_box_depth, tongue_box_height]);

      translate([inches(-1), inches(0.75), inches(0.75)])
      color_wood()
        cube([tongue_box_width + inches(2), tongue_box_depth - inches(1.5), tongue_box_height - inches(1.5)]);
    }
    translate([feet(3), inches(0.75), inches(0.75)])
    color_wood()
      cube([inches(0.75), tongue_box_depth - inches(1.5), tongue_box_height - inches(1.5)]);
  }
}

tongue_box();
