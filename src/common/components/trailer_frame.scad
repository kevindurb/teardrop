use <../lib/convert.scad>
use <../lib/colors.scad>
use <../components/wheel.scad>
include <../constants/trailer.scad>

module trailer_axel() {
  color_black()
  translate([0, AXEL_OFFSET_Y, inches(-10)])
  rotate([0, 90, 0])
    cylinder(h = FRAME_WIDTH + inches(5), d = inches(3), center  = true);
}

module driver_wheel() {
  translate([feet(2.5), AXEL_OFFSET_Y, inches(-10)])
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
      cube([FRAME_WIDTH, FRAME_THICKNESS, FRAME_THICKNESS]);

    mirror([1, 0, 0])
    translate([inches(-1.5), 0, 0])
    rotate([0, 0, -60])
      cube([FRAME_WIDTH, FRAME_THICKNESS, FRAME_THICKNESS]);
  }
}

module trailer_frame_half() {
  union() {
    translate([(FRAME_WIDTH / 2) - FRAME_THICKNESS, -FRAME_LENGTH / 2, 0])
      cube([FRAME_THICKNESS, FRAME_LENGTH, FRAME_THICKNESS]);

    translate([0, 0, 0])
      cube([FRAME_WIDTH / 2, FRAME_THICKNESS, FRAME_THICKNESS]);

    translate([0, -FRAME_THICKNESS, 0])
      cube([FRAME_WIDTH / 2, FRAME_THICKNESS, FRAME_THICKNESS]);

    translate([0, (FRAME_LENGTH / 4) - (FRAME_THICKNESS / 2), 0])
      cube([FRAME_WIDTH / 2, FRAME_THICKNESS, FRAME_THICKNESS]);

    translate([0, (FRAME_LENGTH / 2) - FRAME_THICKNESS, 0])
      cube([FRAME_WIDTH / 2, FRAME_THICKNESS, FRAME_THICKNESS]);

    translate([0, -((FRAME_LENGTH / 4) + (FRAME_THICKNESS / 2)), 0])
      cube([FRAME_WIDTH / 2, FRAME_THICKNESS, FRAME_THICKNESS]);

    translate([0, -(FRAME_LENGTH / 2), 0])
      cube([FRAME_WIDTH / 2, FRAME_THICKNESS, FRAME_THICKNESS]);
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
  translate([0, 0, -FRAME_THICKNESS])
  color_black()
  rotate([0, 0, 180])
  union() {
    trailer_frame();

    translate([0, FRAME_LENGTH / 1.5, -FRAME_THICKNESS])
    trailer_tongue();

    translate([0, FRAME_LENGTH / 4, -FRAME_THICKNESS / 2])
      cube([FRAME_THICKNESS, FRAME_LENGTH * 1.5, FRAME_THICKNESS], center = true);
  }

  driver_wheel();
  passenger_wheel();
  trailer_axel();
}

trailer();
