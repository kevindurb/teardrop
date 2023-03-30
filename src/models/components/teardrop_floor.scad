use <../lib/convert.scad>
use <../lib/colors.scad>

floor_thickness = inches(2.5);
floor_width = feet(5);
floor_length = feet(8) + inches(3);
wheel_well_offset = (floor_width / 2) - inches(3);

module wheel_well() {
  union() {
    translate([0, 0, 0])
      cube([inches(6), inches(21.3), inches(0.75)], center=true);

    translate([0, inches(-10.5), 0])
    rotate([45, 0, 0])
    translate([0, inches(-3.5), 0])
      cube([inches(6), inches(7.3), inches(0.75)], center=true);

    mirror([0, 1, 0])
    translate([0, inches(-10.5), 0])
    rotate([45, 0, 0])
    translate([0, inches(-3.5), 0])
      cube([inches(6), inches(7.3), inches(0.75)], center=true);
  }
}

module wheel_well_cutout() {
  translate([(floor_width / 2) - inches(2.5), feet(1) + inches(1.5), inches(-1)])
    cube([inches(7), inches(30), floor_thickness + inches(3)], center=true);
}

module teardrop_floor() {
  translate([0, 0, floor_thickness / 2])
  color_wood()
  union() {
    difference() {
      cube([floor_width, floor_length, floor_thickness], center = true);

      wheel_well_cutout();

      mirror([1, 0, 0])
      wheel_well_cutout();
    }

    translate([wheel_well_offset, inches(13.5), inches(6)])
      wheel_well();

    mirror([1, 0, 0])
    translate([wheel_well_offset, inches(13.5), inches(6)])
      wheel_well();
  }
}

teardrop_floor();
