include <../common/lib.scad>

use <../common/components/lower_galley.scad>
use <../common/components/cooler.scad>
use <../common/components/water_tank.scad>

use <./cabinets.scad>

module galley(open = 0, anchor = CENTER, spin = 0, orient = UP) {
  /* translate([inches(1.5), inches(1), inches(3.25)]) */
  /*   water_tank(); */

  /* translate([inches(9.5), inches(1), inches(3.25)]) */
  /*   water_tank(); */

  /* translate([feet(-2.5) + inches(1.25), inches(-2), inches(3.25)]) */
  /*   cooler(); */

  lower_galley(open, anchor = anchor, spin = spin, orient = orient) {
    attach(TOP, BOTTOM) counter_top() {
      fwd(inches(0.75))
      position(TOP+FRONT)
        cabinets(open, anchor = BOTTOM + FRONT);
    }
  }
}

galley();
