use <../common/lib/convert.scad>

use <../common/components/lower_galley.scad>
use <../common/components/cooler.scad>
use <../common/components/water_tank.scad>

use <./cabinets.scad>

module galley(silverware_open = 0, electrical_open = 0, cabinets_open = 0) {
  translate([inches(1.5), inches(1), inches(3.25)])
    water_tank();

  translate([inches(9.5), inches(1), inches(3.25)])
    water_tank();

  translate([feet(-2.5) + inches(1.25), inches(-2), inches(3.25)])
    cooler();

  translate([feet(-2) - inches(5.75), inches(-3), inches(2.5)])
    lower_galley(silverware_open, electrical_open);

  translate([feet(-2) - inches(5.75), inches(-10), feet(1) + inches(7.5)])
    counter_top();

  translate([feet(-2) - inches(5.75), inches(1), feet(1) + inches(8.25)])
    cabinets(cabinets_open);
}

galley();
