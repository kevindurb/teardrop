use <../common/lib/convert.scad>

// Fixes for dxf import
bottom_offset = inches(-0.67);
front_offset = feet(-8) + inches(-11.07);
scale_fix = 1.002;

module trailer_profile(extrusion_distance) {
  translate([front_offset, 0, bottom_offset])
  rotate([90, 0, 0])
  linear_extrude(height = extrusion_distance)
  scale([scale_fix, scale_fix])
      import("./sidewall.dxf");
}
