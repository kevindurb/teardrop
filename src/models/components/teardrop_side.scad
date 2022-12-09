use <../lib/convert.scad>
use <../sketches/side_sketch.scad>

side_thickness = inches(1.25);

door_width = inches(30);
door_height = inches(36);
door_radius = inches(3);

// Fixes for dxf import
bottom_offset = inches(-0.67);
front_offset = feet(-8) + inches(-11.07);
scale_fix = 1.002;

module door_cutout() {
  thickness = inches(3);
  radius_offset = door_radius * 2;

  translate([door_radius, door_radius, -thickness / 2])
  hull() {
    cylinder(thickness, r1 = door_radius, r2 = door_radius);
    translate([door_width - radius_offset, 0, 0])
      cylinder(thickness, r1 = door_radius, r2 = door_radius);
    translate([0, door_height -  radius_offset, 0])
      cylinder(thickness, r1 = door_radius, r2 = door_radius);
    translate([door_width -  radius_offset, door_height -  radius_offset, 0])
      cylinder(thickness, r1 = door_radius, r2 = door_radius);
  }
}


module teardrop_side() {
  difference() {
    // side shape from dxf
    translate([front_offset, 0, bottom_offset])
    rotate([90, 0, 0])
    linear_extrude(height = side_thickness)
    scale([scale_fix, scale_fix])
        import("../../drawings/sidewall.dxf");

    // door cut out
    translate([-door_width + inches(-18), 0, inches(3)])
    rotate([90, 0, 0])
      door_cutout();

    // inside 1/4" ply doesnt extend all the way down
    translate([feet(-9), inches(-0.25), inches(-0.5)])
      cube([feet(10), inches(0.5), inches(3)]);
  }
}

teardrop_side();