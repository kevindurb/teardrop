use <../lib/convert.scad>
use <./teardrop_ceiling.scad>

module teardrop_galley_door() {
  translate([inches(81.25), 0, inches(-40.75)])
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
