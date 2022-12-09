use <../lib/convert.scad>
use <./trailer_ceiling.scad>

module trailer_galley_door() {
  translate([feet(6.5), 0, feet(-3.5)])
  intersection() {
    union() {
      mirror([0, 1, 0])
        trailer_ceiling_half();
      trailer_ceiling_half();
    }

    // cut out galley
    trailer_ceiling_galley_cutout();
  }
}

trailer_galley_door();
