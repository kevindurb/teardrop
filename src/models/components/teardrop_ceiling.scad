use <../lib/convert.scad>

ceiling_width = feet(5);
ceiling_thickness = inches(1.75);

// Fixes for dxf import
bottom_offset = inches(-0.67);
front_offset = feet(-8) + inches(-11.07);
scale_fix = 1.002;

module teardrop_ceiling_half() {
  cutout_scale = (feet(4) - ceiling_thickness) / feet(4);
  difference() {
    // side shape from dxf
    translate([front_offset, 0, bottom_offset])
    rotate([90, 0, 0])
    linear_extrude(height = ceiling_width / 2)
    scale([scale_fix, scale_fix])
        import("../../drawings/sidewall.dxf");

    // cut out inside
    translate([-ceiling_thickness, 1, -1])
    scale([cutout_scale, 1.1, cutout_scale])
    translate([front_offset, 0, bottom_offset])
    rotate([90, 0, 0])
    linear_extrude(height = ceiling_width / 2)
    scale([scale_fix, scale_fix])
        import("../../drawings/sidewall.dxf");
  }
}

module teardrop_ceiling_galley_cutout() {
  translate([feet(-8) + inches(-12), -(ceiling_width / 2) - 1, inches(-3)])
    cube([inches(26.25), ceiling_width + 2, feet(4)]);
}

module teardrop_ceiling() {
  difference() {
    union() {
      mirror([0, 1, 0])
        teardrop_ceiling_half();
      teardrop_ceiling_half();
    }

    // cut out galley
    teardrop_ceiling_galley_cutout();
  }
}

teardrop_ceiling();
