use <../lib/convert.scad>
use <../lib/colors.scad>

module mattress() {
  color_white()
    cube([inches(59.5), inches(79.5), inches(6)]);
}

mattress();
