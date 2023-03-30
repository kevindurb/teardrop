use <../lib/convert.scad>
use <../lib/colors.scad>

module wheel() {
  color_black()
  difference() {
      cylinder(h = inches(10), d = inches(28), center = true);
      cylinder(h = inches(13), d = inches(15), center = true);
  }
  color_steel()
    cylinder(h = inches(8), d = inches(15), center = true);
}

wheel();
