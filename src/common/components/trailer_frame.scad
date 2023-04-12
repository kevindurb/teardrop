include <../lib.scad>
use <../components/wheel.scad>
include <../constants/trailer.scad>

module trailer_axel() {
  recolor(COLOR_BLACK)
  xcyl(h = FRAME_WIDTH + inches(5), d = inches(3)) {
    children();
  }
}

module frame_tube(l, anchor = CENTER, spin = 0, orient = UP) {
  cube([l, FRAME_THICKNESS, FRAME_THICKNESS], anchor = anchor, spin = spin, orient = orient) children();
}

module trailer_frame(anchor = CENTER, spin = 0, orient = UP) {
  recolor(COLOR_BLACK)
  attachable(anchor, spin, orient, size = [FRAME_LENGTH, FRAME_WIDTH, FRAME_THICKNESS]) {
    union() {
      back(FRAME_WIDTH / 2) frame_tube(FRAME_LENGTH, anchor = BACK) {
        right(feet(2))
        position(LEFT+BOTTOM)
        zrot(20)
          frame_tube(feet(5.5), anchor = RIGHT+TOP);
      }

      fwd(FRAME_WIDTH / 2) frame_tube(FRAME_LENGTH, anchor = FRONT) {
        right(feet(2))
        position(LEFT+BOTTOM)
        zrot(-20)
          frame_tube(feet(5.5), anchor = RIGHT+TOP);
      };

      xcopies(l = FRAME_LENGTH - FRAME_THICKNESS, n = 5) frame_tube(FRAME_WIDTH - (FRAME_THICKNESS * 2), spin = 90);
    }
    children();
  }
}

module trailer() {
  trailer_frame(spin = 90) {
    position(RIGHT+BOTTOM)
    frame_tube(FRAME_LENGTH * 1.5, anchor = TOP+RIGHT);
  };

  translate([0, AXEL_OFFSET_Y, inches(-10)])
  trailer_axel() {
    attach(LEFT, BOTTOM) wheel();
    attach(RIGHT, BOTTOM) wheel();
  }
}

trailer();
