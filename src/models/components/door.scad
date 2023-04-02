use <../lib/convert.scad>

door_width = inches(30);
door_height = inches(36);
door_radius = inches(3);
door_thickness = inches(1.25);

module door() {
  radius_offset = door_radius * 2;

  rotate([90, 0, 0])
  translate([door_radius, door_radius, -door_thickness / 2])
  hull() {
    // bottom left, this creates a angled corner to fit the wheelwell
    translate([0, inches(6), 0])
      cylinder(door_thickness, r1 = door_radius, r2 = door_radius);
    translate([inches(4.75), 0, 0])
      cylinder(door_thickness, r1 = door_radius, r2 = door_radius);

    // bottom right
    translate([door_width - radius_offset, 0, 0])
      cylinder(door_thickness, r1 = door_radius, r2 = door_radius);

    // top left
    translate([0, door_height -  radius_offset, 0])
      cylinder(door_thickness, r1 = door_radius, r2 = door_radius);

    // top right
    translate([door_width -  radius_offset, door_height -  radius_offset, 0])
      cylinder(door_thickness, r1 = door_radius, r2 = door_radius);
  }
}

door();
