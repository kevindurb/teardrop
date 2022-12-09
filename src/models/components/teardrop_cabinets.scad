use <../lib/convert.scad>

cabinet_unit_width = feet(4) + inches(11.5);

module cabinet_top() {
  cube([cabinet_unit_width, feet(1.5), inches(0.75)]);
}

module cabinet_walls() {
  translate([inches(12), 0, 0])
    cube([inches(0.75), feet(1.5), feet(1.5)]);

  translate([feet(2.5) - inches(0.75), 0, 0])
    cube([inches(0.75), feet(1.5), feet(1.5)]);

  translate([feet(4) - inches(0.75), 0, 0])
    cube([inches(0.75), feet(1.5), feet(1.5)]);
}

module counter_top() {
  cube([cabinet_unit_width, feet(2.5), inches(0.75)]);
}

module foot_wall() {
  cube([cabinet_unit_width, inches(0.75), inches(15)]);
}

module teardrop_cabinets() {
  center_offset = -cabinet_unit_width / 2;
  color("#888")
  union() {
    translate([center_offset, 0, 0])
      foot_wall();
    translate([center_offset, feet(-1), inches(15)])
      counter_top();
    translate([center_offset, feet(-1), inches(15) + inches(0.75)])
      cabinet_walls();
    translate([center_offset, feet(-1), inches(33) + inches(0.75)])
      cabinet_top();
  }
}

teardrop_cabinets();
