use <../lib/convert.scad>

cabinet_unit_width = feet(4) + inches(11.5);
main_cabinets_height = inches(16);

module cabinet_top() {
  cube([cabinet_unit_width, feet(1.5), inches(0.75)]);
}

module cabinet_walls() {
  translate([inches(12), 0, 0])
    cube([inches(0.75), feet(1.5), main_cabinets_height]);

  translate([feet(2.5) - inches(0.75), 0, 0])
    cube([inches(0.75), feet(1.5), main_cabinets_height]);

  translate([feet(4) - inches(0.75), 0, 0])
    cube([inches(0.75), feet(1.5), main_cabinets_height]);
}

module counter_top() {
  cube([cabinet_unit_width, feet(2.5), inches(0.75)]);
}

module foot_wall() {
  cube([cabinet_unit_width, inches(0.75), inches(15)]);
}

module spice_rack_wall() {
  cube([cabinet_unit_width, inches(0.75), inches(3.75)]);
}

module top_cabinet_front() {
  difference() {
    cube([cabinet_unit_width, inches(0.75), inches(7.5)]);

    translate([inches(1.5), inches(-0.125), inches(1.5)])
      cube([cabinet_unit_width - inches(3), inches(1), inches(4.5)]);
  }
}

module teardrop_cabinets() {
  center_offset = -cabinet_unit_width / 2;
  spice_rack_zoffset = main_cabinets_height + inches(15) +inches(0.75);
  color("#888")
  union() {
    translate([center_offset, 0, 0])
      foot_wall();
    translate([center_offset, feet(-1), inches(15)])
      counter_top();
    translate([center_offset, feet(-1), inches(15) + inches(0.75)])
      cabinet_walls();
    translate([center_offset, feet(-1), spice_rack_zoffset])
      cabinet_top();
    translate([center_offset, 0, spice_rack_zoffset + inches(0.75)])
      spice_rack_wall();
    translate([center_offset, feet(-1), spice_rack_zoffset + inches(0.75)])
      top_cabinet_front();
  }
}

teardrop_cabinets();
