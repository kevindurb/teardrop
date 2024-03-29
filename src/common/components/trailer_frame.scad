include <../lib.scad>
use <../components/wheel.scad>
include <../constants/trailer.scad>

module trailer_axel(anchor = CENTER, spin = 0, orient = UP) {
  color_this(COLOR_BLACK)
    xcyl(h = FRAME_WIDTH + inches(5), d = inches(3), anchor = anchor, spin = spin, orient = orient) {
      children();
    }
}

module frame_tube(l, anchor = CENTER, spin = 0, orient = UP) {
  cube([l, FRAME_CROSS_MEMBER_WIDTH, FRAME_THICKNESS], anchor = anchor, spin = spin, orient = orient) children();
}

module trailer_tongue() {
  back(FRAME_WIDTH / 2)
    frame_tube(FRAME_LENGTH, anchor = BACK) {
      right(feet(2))
        position(LEFT+BOTTOM)
        zrot(20)
        frame_tube(feet(5.5), anchor = RIGHT+TOP);
    }

  fwd(FRAME_WIDTH / 2)
    frame_tube(FRAME_LENGTH, anchor = FRONT) {
      right(feet(2))
        position(LEFT+BOTTOM)
        zrot(-20)
        frame_tube(feet(5.5), anchor = RIGHT+TOP);
    };
}

module trailer_frame(anchor = CENTER, spin = 0, orient = UP) {
  color_this(COLOR_BLACK)
    attachable(anchor, spin, orient, size = [FRAME_LENGTH, FRAME_WIDTH, FRAME_THICKNESS]) {
      union() {
        trailer_tongue();
        left(inches(23.25))
        xcopies(l = FRAME_LENGTH / 2, n = 3)
          frame_tube(FRAME_WIDTH - (FRAME_CROSS_MEMBER_WIDTH * 2), spin = 90);
        right(inches(23.25))
        xcopies(l = FRAME_LENGTH / 2, n = 3)
          frame_tube(FRAME_WIDTH - (FRAME_CROSS_MEMBER_WIDTH * 2), spin = 90);
      }
      children();
    }
}

module trailer(anchor = CENTER, spin = 0, orient = UP) {
  attachable(anchor, spin, orient, size = [FRAME_WIDTH, FRAME_LENGTH, FRAME_THICKNESS]) {
    trailer_frame(spin = 90) {
      position(RIGHT+BOTTOM)
        color_this(COLOR_BLACK)
        frame_tube(FRAME_LENGTH * 1.5, anchor = TOP+RIGHT);

      down(inches(6))
        right(inches(6))
        position(BOTTOM)
        trailer_axel(spin = 90, anchor = TOP) {
          attach(LEFT, BOTTOM) wheel();
          attach(RIGHT, BOTTOM) wheel();
        }
    }

    children();
  }
}

trailer();
