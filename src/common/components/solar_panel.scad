include <../lib.scad>

// 41.8 x 20.9 x 1.4
module solar_panel() {
  translate([inches(-21), 0, 0])
  color_black()
    cube([inches(42), inches(21), inches(1.5)]);
}

solar_panel();
