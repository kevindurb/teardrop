include <../common/lib.scad>

use <../common/components/lower_galley.scad>
use <../common/components/cooler.scad>
use <../common/components/water_tank.scad>

use <./upper_galley.scad>
use <./cabinets.scad>

module galley(open = 0) {
  translate([inches(1.5), inches(1), inches(3.25)])
    water_tank();

  translate([inches(9.5), inches(1), inches(3.25)])
    water_tank();

  translate([feet(-2.5) + inches(1.25), inches(-2), inches(3.25)])
    cooler();

  translate([0, inches(-3), inches(2.5)])
    teardrop_cabinets(open);

  translate([feet(-2) - inches(5.75), inches(-3), feet(2) + inches(10.25)])
    upper_galley();

  translate([feet(-2) - inches(5.75), inches(-3), inches(2.5)])
    lower_galley(open);

  translate([feet(-2) - inches(5.75), inches(-15), feet(1) + inches(7.5)])
    counter_top();
}

galley();
