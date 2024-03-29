include <../common/lib.scad>

use <./side_profile.scad>

ceiling_width = feet(5);
ceiling_thickness = inches(1.75);
stargazer_window_width = feet(4);

module teardrop_ceiling_shell() {
  cutout_scale = (feet(4) - ceiling_thickness) / feet(4);
  translate([0, ceiling_width / 2, 0])
  difference() {
    // side shape from dxf
    color_outside()
      trailer_profile(ceiling_width);

    // cut out inside
    color_wood()
    translate([-ceiling_thickness, 1, -1])
    scale([cutout_scale, 1.1, cutout_scale])
      trailer_profile(ceiling_width);
  }
}

module teardrop_ceiling_galley_cutout() {
  color_wood()
  translate([feet(-8) + inches(-12), -(ceiling_width / 2) - 1, inches(-3)])
    cube([inches(26.25), ceiling_width + 2, feet(4)]);
}

module stargazer_window_cutout() {
  color_black()
  translate([feet(-0.25), 0, feet(3.25)])
  rotate([0, 45, 0])
    cube([feet(1), stargazer_window_width, inches(6)], center = true);
}

module stargazer_window() {
  color_tinted_window()
  translate([feet(-0.25), 0, feet(3.25)])
  rotate([0, 45, 0])
    cube([feet(1), stargazer_window_width, inches(0.25)], center = true);
}

module teardrop_ceiling() {
  difference() {
    teardrop_ceiling_shell();

    // cut out galley
    teardrop_ceiling_galley_cutout();

    // fan cutout
    color_black()
    translate([feet(-3), 0, feet(4)])
      cube([inches(14), inches(14), inches(6)], center = true);

    // stargazer window cutout
    stargazer_window_cutout();
  }

  stargazer_window();
}

teardrop_ceiling();
