use <../lib/convert.scad>
use <../lib/colors.scad>

frame_width = feet(5);
frame_length = feet(9);
frame_thickness = inches(3);

module teardrop_frame() {
  translate([0, 0, -frame_thickness / 2])
    color_steel()
      cube([frame_width, frame_length, frame_thickness], center = true);
}

teardrop_frame();
