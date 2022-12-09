use <../lib/convert.scad>

cabinet_unit_width = feet(4) + inches(11.5);
main_cabinets_height = inches(16);

module shelf() {
  color("#f2ba52")
    cube([cabinet_unit_width, feet(1.5), inches(0.75)]);
}

module spice_rack_wall() {
  color("#f2ba52")
    cube([cabinet_unit_width, inches(0.75), inches(4)]);
}

module spice_rack_lip() {
  color("#f2ba52")
    cube([cabinet_unit_width, inches(0.75), inches(1)]);
}

module cubby_front() {
  color("#f2ba52")
  difference() {
    cube([cabinet_unit_width, inches(0.75), inches(7.5)]);

    translate([inches(1.5), inches(-0.125), inches(1.5)])
      cube([cabinet_unit_width - inches(3), inches(1), inches(4.5)]);
  }
}

module upper_galley() {
  union() {
    translate([0, feet(-1), 0])
      shelf();
    translate([0, feet(-1), inches(0.75)])
      cubby_front();
    translate([0, 0, inches(0.75)])
      spice_rack_wall();
    translate([0, inches(5), inches(0.75)])
      spice_rack_lip();
  }
}

upper_galley();
