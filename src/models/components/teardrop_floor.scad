use <../lib/convert.scad>

floor_thickness = inches(2.5);
floor_width = feet(5);
floor_length = feet(8) + inches(3);

module teardrop_floor() {
  translate([0, 0, floor_thickness / 2])
    color("#f2ba52")
      cube([floor_width, floor_length, floor_thickness], center = true);
}

teardrop_floor();
