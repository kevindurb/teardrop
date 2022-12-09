use <../lib/convert.scad>
use <../lib/colors.scad>
use <./silverware_drawer.scad>

cabinet_unit_width = feet(4) + inches(11.5);

module counter_top() {
  color_hdpe()
    cube([cabinet_unit_width, feet(2.5), inches(0.75)]);
}

module foot_wall() {
  color_wood()
    cube([cabinet_unit_width, inches(0.75), inches(15)]);
}

module bottom_cabinet_divider() {
  color_wood()
    cube([inches(0.75), feet(1.5), inches(15)]);
}

module water_jug_divider() {
  color_wood()
    cube([inches(0.75), feet(1.5) - inches(0.75), inches(15)]);
}

module electrical_cabinet_top() {
  color_wood()
    cube([inches(10.75), feet(1.5) - inches(0.75), inches(0.75)]);
}

module electrical_cabinet_door(open = 0) {
  color_hdpe()
  translate([open * inches(0.75), 0, 0])
  rotate([0, 0, open * 90])
    cube([inches(11.5), inches(0.75), inches(12)]);
}

module lower_galley(silverware_open = 0, electrical_open = 0) {
  union() {
    translate([0, 0, 0])
      foot_wall();
    translate([0, feet(-1), inches(15)])
      counter_top();
    translate([0 + feet(2) + inches(9), 0, 0])
      bottom_cabinet_divider();
    translate([0 + feet(4), 0, 0])
      water_jug_divider();
    translate([0 + feet(4) + inches(0.75), 0, inches(12)])
      electrical_cabinet_top();
    translate([0 + feet(4), feet(1.5) - inches(0.75), 0])
      electrical_cabinet_door(electrical_open);
    translate([0 + feet(4), feet(1.5) - inches(0.75), inches(12)])
      silverware_drawer(silverware_open);
  }
}

lower_galley(0.25, 0.5, 1);
