use <../lib/convert.scad>
use <../lib/colors.scad>

frame_width = feet(5);
frame_length = feet(8);
frame_thickness = inches(3);

module teardrop_frame() {
  translate([0, 0, -frame_thickness / 2])
  color_steel()
  rotate([0, 0, 180])
  union() {
    cube([frame_width, frame_length, frame_thickness], center = true);

    translate([0, frame_length / 2, 0])
    rotate([0, 0, 45])
      cube([feet(2), feet(2), frame_thickness], center = true);

    translate([0, frame_length / 2, 0])
      cube([inches(3), frame_length, frame_thickness], center = true);
  }
}

teardrop_frame();
