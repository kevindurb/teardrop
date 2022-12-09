use <../lib/convert.scad>
use <./silverware_drawer.scad>

cabinet_unit_width = feet(4) + inches(11.5);
main_cabinets_height = inches(16);

module cabinet_top() {
  color("#f2ba52")
    cube([cabinet_unit_width, feet(1.5), inches(0.75)]);
}

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

module counter_top() {
  color("#ccd")
    cube([cabinet_unit_width, feet(2.5), inches(0.75)]);
}

module foot_wall() {
  color("#f2ba52")
    cube([cabinet_unit_width, inches(0.75), inches(15)]);
}

module spice_rack_wall() {
  color("#f2ba52")
    cube([cabinet_unit_width, inches(0.75), inches(4)]);
}

module spice_rack_lip() {
  color("#f2ba52")
    cube([cabinet_unit_width, inches(0.75), inches(1)]);
}

module top_cabinet_front() {
  color("#f2ba52")
  difference() {
    cube([cabinet_unit_width, inches(0.75), inches(7.5)]);

    translate([inches(1.5), inches(-0.125), inches(1.5)])
      cube([cabinet_unit_width - inches(3), inches(1), inches(4.5)]);
  }
}

module bottom_cabinet_divider() {
  color("#f2ba52")
    cube([inches(0.75), feet(1.5), inches(15)]);
}

module water_jug_divider() {
  color("#f2ba52")
    cube([inches(0.75), feet(1.5) - inches(0.75), inches(15)]);
}

module electrical_cabinet_top() {
  color("#f2ba52")
    cube([inches(10.75), feet(1.5) - inches(0.75), inches(0.75)]);
}

module electrical_cabinet_door(open = 0) {
  color("#ccd")
  translate([open * inches(0.75), 0, 0])
  rotate([0, 0, open * 90])
    cube([inches(11.5), inches(0.75), inches(12)]);
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
  spice_rack_zoffset = main_cabinets_height + inches(15) +inches(0.75);
  union() {
    translate([center_offset, 0, 0])
      foot_wall();
    translate([center_offset, feet(-1), inches(15)])
      counter_top();
    translate([center_offset, feet(-1), inches(15) + inches(0.75)])
      cabinet_walls();
    translate([center_offset, feet(-1), spice_rack_zoffset])
      cabinet_top();
    translate([center_offset, feet(-1), spice_rack_zoffset + inches(0.75)])
      top_cabinet_front();

    translate([center_offset, 0, spice_rack_zoffset + inches(0.75)])
      spice_rack_wall();
    translate([center_offset, inches(5), spice_rack_zoffset + inches(0.75)])
      spice_rack_lip();

    translate([center_offset + feet(2) + inches(9), 0, 0])
      bottom_cabinet_divider();
    translate([center_offset + feet(4), 0, 0])
      water_jug_divider();
    translate([center_offset + feet(4) + inches(0.75), 0, inches(12)])
      electrical_cabinet_top();
    translate([center_offset + feet(4), feet(1.5) - inches(0.75), 0])
      electrical_cabinet_door(electrical_open);
    translate([center_offset + feet(4), feet(1.5) - inches(0.75), inches(12)])
      silverware_drawer(silverware_open);

    translate([center_offset, feet(-1), feet(2) + inches(8.5)])
      inside_cabinet_doors(inside_cabinets_open);
  }
}

teardrop_cabinets(0.25, 0.5, 1);
