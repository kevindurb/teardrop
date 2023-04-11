include <../common/lib.scad>

cabinet_unit_width = feet(4) + inches(11.5);
main_cabinets_height = inches(14);
center_offset = -cabinet_unit_width / 2;
upper_galley_zoffset = main_cabinets_height + inches(17) +inches(0.75);

module cabinet_structure() {
  color_wood()
  union() {
    // wall 1
    translate([inches(12), 0, 0])
      cube([inches(0.75), feet(1.5), main_cabinets_height]);

    // wall 2
    translate([feet(2.5) - inches(0.65), 0, 0])
      cube([inches(0.75), feet(1.5), main_cabinets_height]);

    // wall 3
    translate([feet(4) - inches(1.125), 0, 0])
      cube([inches(0.75), feet(1.5), main_cabinets_height]);

    // shelf
    translate([inches(12.75), 0, inches(9)])
      cube([cabinet_unit_width - inches(25.5), feet(1.5), inches(0.75)]);

    // inside/outside wall
    translate([inches(12.75), inches(9), 0])
      cube([cabinet_unit_width - inches(25.5), inches(0.75), main_cabinets_height]);

    // trofast back 1
    translate([0, inches(17.25), 0])
      cube([inches(12), inches(0.75), main_cabinets_height]);

    // trofast back 2
    translate([feet(3) + inches(11.5), inches(17.25), 0])
      cube([inches(12), inches(0.75), main_cabinets_height]);
  }
}

module inside_cabinet_doors(open = 0) {
  small_width = inches(12.75);
  large_width = inches(17.425);
  color_hdpe()
  union() {
    // 1
    translate([small_width, 0, 0])
    translate([open * inches(-0.75), 0, 0])
    rotate([0, 0, open * 90])
    translate([-small_width, inches(-0.75), inches(-15.5)])
      cube([small_width, inches(0.75), inches(15.5)]);
    // 3
    translate([(cabinet_unit_width - small_width), 0, 0])
    translate([open * inches(0.75), 0, 0])
    rotate([0, 0, open * -90])
    translate([0, inches(-0.75), inches(-15.5)])
      cube([small_width, inches(0.75), inches(15.5)]);
  }
}

module teardrop_cabinets(inside_cabinets_open = 0) {
  union() {
    translate([center_offset, feet(-1), inches(17) + inches(0.75)])
      cabinet_structure();
    translate([center_offset, feet(-1), feet(2) + inches(8.5)])
      inside_cabinet_doors(inside_cabinets_open);
  }
}

module teardrop_cabinets_bare() {
  union() {
    translate([center_offset, feet(-1), inches(17) + inches(0.75)])
      cabinet_structure();
  }
}

teardrop_cabinets(0.25, 0.5, 0);
