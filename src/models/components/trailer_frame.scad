use <../lib/convert.scad>

trailer_thickness = inches(3);
trailer_width = feet(5);
trailer_length = feet(9);

module trailer_frame() {
  translate([0, 0, -trailer_thickness / 2])
    color("#888")
      cube([trailer_width, trailer_length, trailer_thickness], center = true);
}
