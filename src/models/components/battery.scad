use <../lib/convert.scad>
use <../lib/colors.scad>

module battery() {
  color_black()
    cube([inches(11.4), inches(6.8), inches(7.4)]);
}

battery();
