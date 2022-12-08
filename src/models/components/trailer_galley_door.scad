use <./trailer_ceiling.scad>

module trailer_galley_door() {
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
