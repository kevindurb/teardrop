use <../lib/convert.scad>
use <../lib/colors.scad>

module person() {
  color_white()
  union() {
    // Head
    translate([inches(7), inches(3), feet(6) - inches(6)])
    scale([1, 1, 1.5])
      sphere(d = inches(6));

    // Chest
    translate([inches(0), inches(0), feet(3)])
      cube([inches(14), inches(6), feet(2)]);

    // Legs
    translate([inches(3), inches(3), feet(0)])
      cylinder(h = feet(3), r = inches(2));
    translate([inches(11), inches(3), feet(0)])
      cylinder(h = feet(3), r = inches(2));

    // Arms
    translate([inches(-1), inches(3), feet(2)])
      cylinder(h = feet(3), r = inches(2));
    translate([inches(15), inches(3), feet(2)])
      cylinder(h = feet(3), r = inches(2));
  }
}

person();
