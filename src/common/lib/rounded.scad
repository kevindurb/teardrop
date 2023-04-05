use <./convert.scad>

module rounded_flat(width, height, radius = inches(1), thickness = inches(1.25)) {
  radius_offset = radius * 2;

  rotate([90, 0, 0])
  translate([radius, radius, 0])
  hull() {
    // bottom left
    translate([0, 0, 0])
      cylinder(thickness, r = radius);

    // bottom right
    translate([width - radius_offset, 0, 0])
      cylinder(thickness, r = radius);

    // top left
    translate([0, height -  radius_offset, 0])
      cylinder(thickness, r = radius);

    // top right
    translate([width -  radius_offset, height -  radius_offset, 0])
      cylinder(thickness, r = radius);
  }
}
