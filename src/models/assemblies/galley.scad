use <../lib/convert.scad>

use <../components/cabinets.scad>
use <../components/cooler.scad>
use <../components/water_tank.scad>

module galley(silverware_open = 0, electrical_open = 0, cabinets_open = 0) {
  translate([inches(1.5), inches(1), inches(3.25)])
    water_tank();

  translate([inches(9.5), inches(1), inches(3.25)])
    water_tank();

  translate([feet(-2.5) + inches(1.25), inches(-2), inches(3.25)])
    cooler();

  translate([0, inches(-3), inches(2.5)])
    teardrop_cabinets(silverware_open, electrical_open, cabinets_open);
}

galley();
