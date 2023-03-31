use <../lib/convert.scad>
use <../lib/colors.scad>

wheel_well_top_width = inches(22);
wheel_well_base_width = inches(32);
wheel_well_depth = inches(13);
wheel_well_base_thickness = inches(2.5);
wheel_well_height = inches(6) + wheel_well_base_thickness;


module wheel_well_cutout() {
  translate([0, 0, -1])
  cube([wheel_well_depth + 1, wheel_well_base_width, wheel_well_base_thickness + 2]);
}

module wheel_well_shape() {
  color_wood()
  hull() {
    translate([0, (wheel_well_base_width - wheel_well_top_width) / 2, wheel_well_height])
      cube([wheel_well_depth, wheel_well_top_width, inches(0.75)]);

    cube([wheel_well_depth, wheel_well_base_width, wheel_well_base_thickness]);
  }
}

module wheel_well_inside() {
  scale_y = (wheel_well_base_width - inches(1.5)) / wheel_well_base_width;
  scale_z = (wheel_well_height - inches(0.75)) / wheel_well_height;

  color_black()
  scale([1, scale_y, scale_z])
    wheel_well_shape();
}

module wheel_well() {
  difference() {
    wheel_well_shape();

    translate([inches(0.75), inches(0.75), -1])
      wheel_well_inside();
  }
}

wheel_well();
