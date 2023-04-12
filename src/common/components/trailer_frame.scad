include <../lib.scad>
use <../components/wheel.scad>
include <../constants/trailer.scad>

module trailer_axel() {
  recolor(COLOR_BLACK)
  xcyl(h = FRAME_WIDTH + inches(5), d = inches(3)) {
    children();
  }
}

module trailer_tongue() {
  union() {
    translate([inches(-1.5), 0, 0])
    rotate([0, 0, -70])
      cube([feet(5.5), FRAME_THICKNESS, FRAME_THICKNESS]);

    mirror([1, 0, 0])
    translate([inches(-1.5), 0, 0])
    rotate([0, 0, -70])
      cube([feet(5.5), FRAME_THICKNESS, FRAME_THICKNESS]);
  }
}

module frame_tube(l, anchor = CENTER, spin = 0, orient = UP) {
  cube([l, FRAME_THICKNESS, FRAME_THICKNESS], anchor = anchor, spin = spin, orient = orient) children();
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

module trailer_frame(anchor = CENTER, spin = 0, orient = UP) {
  recolor(COLOR_BLACK)
  attachable(anchor, spin, orient, size = [FRAME_LENGTH, FRAME_WIDTH, FRAME_THICKNESS]) {
    union() {
      back(FRAME_WIDTH / 2) frame_tube(FRAME_LENGTH, anchor = BACK);
      xcopies(l = FRAME_LENGTH - FRAME_THICKNESS, n = 5) frame_tube(FRAME_WIDTH - (FRAME_THICKNESS * 2), spin = 90);
      fwd(FRAME_WIDTH / 2) frame_tube(FRAME_LENGTH, anchor = FRONT);
    }
    children();
  }
}

module trailer() {
  trailer_frame(spin = 90) {
    trailer_tongue();
  }

/*     translate([0, FRAME_LENGTH / 4, -FRAME_THICKNESS / 2]) */
/*       cube([FRAME_THICKNESS, FRAME_LENGTH * 1.5, FRAME_THICKNESS], center = true); */
/*   } */

  translate([0, AXEL_OFFSET_Y, inches(-10)])
  trailer_axel() {
    attach(LEFT, BOTTOM) wheel();
    attach(RIGHT, BOTTOM) wheel();
  }
}

trailer();
