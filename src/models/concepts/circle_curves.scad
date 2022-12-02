cabin_height = 1220; // 4ft
cabin_width = 1520; // 5ft
cabin_length = 2740; // 9ft

$fn = 50; // fragment number

union() {
  difference() {
    // Starting cylinder
    rotate([90, 0, 0])
      cylinder(cabin_width, r = cabin_height, center = true);

    // left half remove
    translate([0, 0, -cabin_height + (cabin_height / 2)])
      cube([cabin_height * 2, cabin_width, cabin_height], center = true);

    // bottom half remove
    translate([-cabin_height + (cabin_height / 2), 0, 0])
      cube([cabin_height, cabin_width, cabin_height * 2], center = true);
  }

  difference() {
    cabin_block_size = cabin_length - cabin_height;

    translate([-cabin_block_size, -(cabin_width / 2), 0])
      cube([cabin_block_size, cabin_width, cabin_height]);

    translate([-(cabin_block_size - (cabin_height / 2)), 0, cabin_height / 2])
    difference() {
      translate([-(cabin_height / 2), -(cabin_width / 2), 0])
        cube([cabin_height / 2, cabin_width, cabin_height / 2]);

      rotate([90, 0, 0])
        cylinder(cabin_width, d = cabin_height, center = true);
    }
  }
}
