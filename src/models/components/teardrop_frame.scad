use <../lib/convert.scad>
use <../lib/colors.scad>
use <../components/wheel.scad>

frame_width = feet(4);
frame_length = feet(8);
frame_thickness = inches(3);

module driver_wheel() {
  translate([feet(2.5), inches(15), inches(-10)])
  rotate([0, 90, 0])
    wheel();
}

module passenger_wheel() {
  mirror([1, 0, 0])
    driver_wheel();
}

module trailer_tongue() {
  union() {
    translate([inches(-1.5), 0, 0])
    rotate([0, 0, -60])
      cube([frame_width, frame_thickness, frame_thickness]);

    mirror([1, 0, 0])
    translate([inches(-1.5), 0, 0])
    rotate([0, 0, -60])
      cube([frame_width, frame_thickness, frame_thickness]);
  }
}

module trailer_frame_half() {
  union() {
    translate([(frame_width / 2) - frame_thickness, -frame_length / 2, 0])
      cube([frame_thickness, frame_length, frame_thickness]);

    translate([0, 0, 0])
      cube([frame_width / 2, frame_thickness, frame_thickness]);

    translate([0, -frame_thickness, 0])
      cube([frame_width / 2, frame_thickness, frame_thickness]);

    translate([0, (frame_length / 4) - (frame_thickness / 2), 0])
      cube([frame_width / 2, frame_thickness, frame_thickness]);

    translate([0, (frame_length / 2) - frame_thickness, 0])
      cube([frame_width / 2, frame_thickness, frame_thickness]);

    translate([0, -((frame_length / 4) + (frame_thickness / 2)), 0])
      cube([frame_width / 2, frame_thickness, frame_thickness]);

    translate([0, -(frame_length / 2), 0])
      cube([frame_width / 2, frame_thickness, frame_thickness]);
  }
}

module trailer_frame() {
  union() {
    trailer_frame_half();

    mirror([1, 0, 0])
      trailer_frame_half();
  }
}

module trailer() {
  translate([0, 0, -frame_thickness])
  color_black()
  rotate([0, 0, 180])
  union() {
    trailer_frame();

    translate([0, frame_length / 1.5, -frame_thickness])
    trailer_tongue();

    translate([0, frame_length / 4, -frame_thickness / 2])
      cube([frame_thickness, frame_length * 1.5, frame_thickness], center = true);
  }

  driver_wheel();
  passenger_wheel();
}

trailer();
