use <../lib/convert.scad>
use <../lib/colors.scad>

floor_thickness = inches(2.5);
floor_width = feet(5);
floor_length = feet(8) + inches(3);

module teardrop_floor() {
  translate([0, 0, floor_thickness / 2])
    color_wood()
      cube([floor_width, floor_length, floor_thickness], center = true);
}

teardrop_floor();
