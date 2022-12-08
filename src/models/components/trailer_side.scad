use <../lib/convert.scad>

side_thickness = inches(1.25);
bottom_offset = inches(-0.67);
front_offset = feet(-8) + inches(-10.1);
scale_fix = 1.002;

module trailer_side() {
  translate([front_offset, 0, bottom_offset])
  rotate([90, 0, 0])
  linear_extrude(height = side_thickness)
  scale([scale_fix, scale_fix])
      import("../../drawings/sidewall.dxf");
}

trailer_side();
