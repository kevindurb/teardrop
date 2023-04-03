use <../lib/convert.scad>
use <./teardrop_ceiling.scad>

module teardrop_galley_door() {
  translate([inches(81.75), 0, inches(-40.75)])
  intersection() {
    teardrop_ceiling_shell();

    // cut out galley
    teardrop_ceiling_galley_cutout();
  }
}

teardrop_galley_door();
