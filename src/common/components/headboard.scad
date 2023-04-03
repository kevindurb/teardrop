use <../lib/convert.scad>
use <../lib/colors.scad>

headboard_width = feet(4) + inches(11.5);

module headboard() {
  color_wood()
  translate([headboard_width / -2, 0, 0])
  union() {
    translate([0, inches(-0.75), 0])
      cube([headboard_width, inches(0.75), inches(9)]);
    translate([0, inches(-5.25), inches(7.75)])
      cube([headboard_width, inches(4.5), inches(0.75)]);
  }
}

headboard();
