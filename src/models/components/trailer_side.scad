use <../lib/convert.scad>

side_thickness = inches(1.25);
bottom_offset = inches(-0.67);
front_offset = feet(-8) + inches(-11.09);
scale_fix = 1.002;

door_width = inches(30);
door_height = inches(36);
door_radius = inches(3);

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


module trailer_side() {

  difference() {
    translate([front_offset, 0, bottom_offset])
    rotate([90, 0, 0])
    linear_extrude(height = side_thickness)
    scale([scale_fix, scale_fix])
        import("../../drawings/sidewall.dxf");

    translate([-door_width + inches(-18), 0, inches(3)])
    rotate([90, 0, 0])
      door_cutout();
  }
}

trailer_side();
