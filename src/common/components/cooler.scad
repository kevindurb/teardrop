use <../lib/convert.scad>
use <../lib/colors.scad>

module cooler() {
  color_steel()
    cube([inches(27.5), inches(16.25), inches(15.5)]);
}
