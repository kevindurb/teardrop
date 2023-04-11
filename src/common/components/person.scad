include <../lib.scad>

module person() {
  color_white()
  translate([inches(0), inches(0), feet(3)])
  // body
  cube([inches(14), inches(6), feet(2)]) {
    // head
    position(TOP) scale([1, 1, 1.5]) sphere(d = inches(6), anchor=BOTTOM);

    // legs
    left(inches(3)) position(BOTTOM) cylinder(h = feet(3), r = inches(2), anchor=TOP);
    right(inches(3)) position(BOTTOM) cylinder(h = feet(3), r = inches(2), anchor=TOP);

    // arms
    right(inches(1)) position(TOP + LEFT) cylinder(h = feet(3), r = inches(2), anchor=TOP + RIGHT);
    left(inches(1)) position(TOP + RIGHT) cylinder(h = feet(3), r = inches(2), anchor=TOP + LEFT);
  }
}

person();
