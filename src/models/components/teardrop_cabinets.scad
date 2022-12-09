use <../lib/convert.scad>
use <./silverware_drawer.scad>
use <./lower_galley.scad>
use <./upper_galley.scad>

cabinet_unit_width = feet(4) + inches(11.5);
main_cabinets_height = inches(16);

module cabinet_walls() {
  color("#f2ba52")
  union() {
    translate([inches(12), 0, 0])
      cube([inches(0.75), feet(1.5), main_cabinets_height]);

    translate([feet(2.5) - inches(0.65), 0, 0])
      cube([inches(0.75), feet(1.5), main_cabinets_height]);

    translate([feet(4) - inches(1.125), 0, 0])
      cube([inches(0.75), feet(1.5), main_cabinets_height]);
  }
}

module cabinet_shelf() {
  color("#f2ba52")
    cube([cabinet_unit_width - inches(24), feet(1.5), inches(0.75)]);
}

module hinge_up(open = 0) {
  translate([0, 0, open * inches(0.75)])
  rotate([open * -90, 0, 0])
    children();
}

module inside_cabinet_doors(open = 0) {
  small_width = 12.325;
  large_width = 17.425;

  color("#ccd")
  union() {
    // 1
    hinge_up(open)
    translate([0, inches(-0.75), inches(-17.5)])
      cube([inches(small_width), inches(0.75), inches(17.5)]);
    // 2
    translate([inches(small_width), 0, 0])
    hinge_up(open * 0.8)
    translate([0, inches(-0.75), inches(-17.5)])
      cube([inches(large_width), inches(0.75), inches(17.5)]);
    // 3
    translate([inches(small_width + large_width), 0, 0])
    hinge_up(open * 0.6)
    translate([0, inches(-0.75), inches(-17.5)])
      cube([inches(large_width), inches(0.75), inches(17.5)]);
    // 3
    translate([inches(small_width + large_width + large_width), 0, 0])
    hinge_up(open * 0.4)
    translate([0, inches(-0.75), inches(-17.5)])
      cube([inches(small_width), inches(0.75), inches(17.5)]);
  }
}

module teardrop_cabinets(silverware_open = 0, electrical_open = 0, inside_cabinets_open = 0) {
  center_offset = -cabinet_unit_width / 2;
  upper_galley_zoffset = main_cabinets_height + inches(15) +inches(0.75);
  union() {
    lower_galley(silverware_open, electrical_open);
    translate([center_offset, 0, upper_galley_zoffset])
      upper_galley();

    translate([center_offset, feet(-1), inches(15) + inches(0.75)])
      cabinet_walls();
    translate([center_offset + inches(12), feet(-1), inches(24)])
      cabinet_shelf();
    translate([center_offset, feet(-1), feet(2) + inches(8.5)])
      inside_cabinet_doors(inside_cabinets_open);
  }
}

teardrop_cabinets(0.25, 0.5, 1);
