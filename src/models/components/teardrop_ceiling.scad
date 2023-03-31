use <../lib/convert.scad>
use <../lib/colors.scad>

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
    color_outside()
    translate([front_offset, 0, bottom_offset])
    rotate([90, 0, 0])
    linear_extrude(height = ceiling_width / 2)
    scale([scale_fix, scale_fix])
        import("../../drawings/sidewall.dxf");

    // cut out inside
    color_wood()
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
  color_wood()
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

    // fan cutout
    color_black()
    translate([feet(-3), 0, feet(4)])
      cube([inches(14), inches(14), inches(6)], center = true);

    // stargazer window cutout
    color_black()
    translate([feet(-0.25), 0, feet(3.25)])
    rotate([0, 45, 0])
      cube([feet(1), feet(3), inches(6)], center = true);
  }
}

teardrop_ceiling();
