use <../lib/convert.scad>

side_thickness = inches(1.25);
bottom_offset = inches(16.71);
front_offset = inches(-51.85);

module trailer_side() {
  translate([front_offset, 0, bottom_offset])
  rotate([90, 0, 0])
    linear_extrude(height = side_thickness)
      import("../../drawings/sidewall.dxf");
}

trailer_side();
