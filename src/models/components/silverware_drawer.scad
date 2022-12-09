use <../lib/convert.scad>
use <../lib/colors.scad>

module silverware_drawer(open = 0) {
  translate([0, open * inches(14.5), 0])
  union() {
    // front
    color_hdpe()
    cube([inches(11.5), inches(0.75), inches(3)]);

    // right side
    color_wood()
    translate([inches(0.75), inches(-15), inches(0.75)])
      cube([inches(0.5), inches(15), inches(2.25)]);

    // left side
    color_wood()
    translate([inches(11), inches(-15), inches(0.75)])
      cube([inches(0.5), inches(15), inches(2.25)]);

    // bottom
    color_wood()
    translate([inches(1), inches(-15), inches(0.75)])
      cube([inches(10), inches(15), inches(0.25)]);

    // back
    color_wood()
    translate([inches(0.75), inches(-15), inches(0.75)])
      cube([inches(10.75), inches(0.5), inches(2.25)]);
  }
}
