use <../lib/convert.scad>
use <../lib/colors.scad>

door_width = inches(30);
door_height = inches(36);
door_radius = inches(3);
door_thickness = inches(1.25);

window_width = inches(24);
window_height = inches(12);
window_radius = inches(2);

module door_window() {
  radius_offset = window_radius * 2;

  rotate([90, 0, 0])
  translate([window_radius, window_radius, -door_thickness / 2])
  color_tinted_window()
  hull() {
    // bottom left
    translate([0, 0, 0])
      cylinder(door_thickness, r1 = window_radius, r2 = window_radius);

    // bottom right
    translate([window_width - radius_offset, 0, 0])
      cylinder(door_thickness, r1 = window_radius, r2 = window_radius);

    // top left
    translate([0, window_height -  radius_offset, 0])
      cylinder(door_thickness, r1 = window_radius, r2 = window_radius);

    // top right
    translate([window_width -  radius_offset, window_height -  radius_offset, 0])
      cylinder(door_thickness, r1 = window_radius, r2 = window_radius);
  }
}

module door_frame() {
  radius_offset = door_radius * 2;

  rotate([90, 0, 0])
  translate([door_radius - door_width, door_radius, -door_thickness / 2])
  color_black()
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

module door() {
  difference() {
    door_frame();

    translate([(door_width / 2) - (window_width / 2) - door_width, 0, door_height - window_height - inches(3)])
    scale([1, 2, 1])
      door_window();
  }

  translate([(door_width / 2) - (window_width / 2) - door_width, 0, door_height - window_height - inches(3)])
    door_window();
}

door();
