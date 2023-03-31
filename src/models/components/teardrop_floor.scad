use <../lib/convert.scad>
use <../lib/colors.scad>
use <./wheel_well.scad>

floor_thickness = inches(2.5);
floor_width = feet(5);
floor_length = feet(8) + inches(3);
wheel_well_x_offset = feet(2);
wheel_well_y_offset = feet(1);

module teardrop_floor() {
  color_wood()
  union() {
    difference() {
      translate([0, 0, floor_thickness / 2])
        cube([floor_width, floor_length, floor_thickness], center = true);

      translate([wheel_well_x_offset, wheel_well_y_offset, 0])
        wheel_well_cutout();

      mirror([1, 0, 0])
      translate([wheel_well_x_offset, wheel_well_y_offset, 0])
        wheel_well_cutout();
    }

    translate([wheel_well_x_offset, wheel_well_y_offset, 0])
      wheel_well();

    mirror([1, 0, 0])
    translate([wheel_well_x_offset, wheel_well_y_offset, 0])
      wheel_well();
  }
}

teardrop_floor();
