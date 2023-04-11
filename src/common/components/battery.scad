include <../lib.scad>

module battery() {
  color_hdpe()
    cube([inches(11.4), inches(6.8), inches(7.4)]);

  translate([inches(2), inches(5), inches(7.4)])
  color("red")
    cylinder(inches(0.5), d = inches(0.75));

  translate([inches(8.5), inches(5), inches(7.4)])
  color("black")
    cylinder(inches(0.5), d = inches(0.75));
}

battery();
