use <../common/lib/convert.scad>
use <../common/lib/colors.scad>

module side() {
  color_wood()
  translate([inches(-31), feet(-4.5), 0])
  rotate([90, 0, 90])
  linear_extrude(inches(1.25))
    polygon([
      [0, 0],
      [0, feet(4)],
      [feet(8.75), feet(4)],
      [feet(8.75), 0],
    ]);
}

module shell() {
  union() {
    side();

    mirror([1, 0, 0])
      side();
  }
}

shell();
