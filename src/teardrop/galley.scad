use <../common/lib/convert.scad>

use <../common/components/upper_galley.scad>
use <../common/components/lower_galley.scad>
use <../common/components/cabinets.scad>
use <../common/components/cooler.scad>
use <../common/components/water_tank.scad>

module galley(silverware_open = 0, electrical_open = 0, cabinets_open = 0) {
  translate([inches(1.5), inches(1), inches(3.25)])
    water_tank();

  translate([inches(9.5), inches(1), inches(3.25)])
    water_tank();

  translate([feet(-2.5) + inches(1.25), inches(-2), inches(3.25)])
    cooler();

  translate([0, inches(-3), inches(2.5)])
    teardrop_cabinets(cabinets_open);

  translate([feet(-2) - inches(5.75), inches(-3), feet(2) + inches(10.25)])
    upper_galley();

  translate([feet(-2) - inches(5.75), inches(-3), inches(2.5)])
    lower_galley(silverware_open, electrical_open);
}

galley();
