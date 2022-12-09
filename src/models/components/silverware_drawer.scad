use <../lib/convert.scad>
use <../lib/colors.scad>

height = inches(5);

module silverware_drawer(open = 0) {
  translate([0, open * inches(14.5), 0])
  union() {
    // front
    color_hdpe()
    cube([inches(11.5), inches(0.75), height]);

    // right side
    color_wood()
    translate([inches(0.75), inches(-15), inches(0.75)])
      cube([inches(0.5), inches(15), height - inches(0.75)]);

    // left side
    color_wood()
    translate([inches(11), inches(-15), inches(0.75)])
      cube([inches(0.5), inches(15), height - inches(0.75)]);

    // bottom
    color_wood()
    translate([inches(1), inches(-15), inches(0.75)])
      cube([inches(10), inches(15), inches(0.25)]);

    // back
    color_wood()
    translate([inches(0.75), inches(-15), inches(0.75)])
      cube([inches(10.75), inches(0.5), height - inches(0.75)]);
  }
}
