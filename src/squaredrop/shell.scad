use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

module side() {
  color_wood()
  translate([inches(-31), feet(-4.5), 0])
    cube([inches(1.25), feet(8.75), feet(4)]);
}

module shell() {
  union() {
    side();

    mirror([1, 0, 0])
      side();
  }
}

shell();
