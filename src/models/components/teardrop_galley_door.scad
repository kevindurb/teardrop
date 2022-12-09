use <../lib/convert.scad>
use <./teardrop_ceiling.scad>

module teardrop_galley_door() {
  translate([feet(6.5), 0, feet(-3.5)])
  intersection() {
    union() {
      mirror([0, 1, 0])
        teardrop_ceiling_half();
      teardrop_ceiling_half();
    }

    // cut out galley
    teardrop_ceiling_galley_cutout();
  }
}

teardrop_galley_door();
