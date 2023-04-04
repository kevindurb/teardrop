use <../lib/convert.scad>
use <../lib/colors.scad>
use <../components/battery.scad>

cabinet_unit_width = feet(4) + inches(11.5);
cooler_area_width = inches(30);
water_jug_area_width = inches(16);
water_jug_divider_offset = cooler_area_width + water_jug_area_width + inches(0.75);
battery_area_width = cabinet_unit_width - cooler_area_width - water_jug_area_width - inches(1.5);

silverware_drawer_height = inches(4.25);
silverware_drawer_depth = inches(16.5);
silverware_drawer_width = battery_area_width;

module battery_tray(open = 0) {
  translate([0, open * inches(16), 0])
  union() {
    color_wood()
    translate([0, 0, inches(0.5)])
      cube([battery_area_width, inches(16.5), inches(0.75)]);

    color_hdpe()
    translate([0, inches(16.5), 0])
      cube([battery_area_width, inches(0.75), inches(12)]);

    translate([inches(0.25), inches(0.25), inches(1.25)])
      battery();
  }
}

module silverware_drawer(open = 0) {
  translate([0, open * inches(16), 0])
  union() {
    // front
    color_hdpe()
    cube([silverware_drawer_width, inches(0.75), silverware_drawer_height]);

    // right side
    color_wood()
    translate([0, -silverware_drawer_depth, 0])
      cube([inches(0.5), silverware_drawer_depth, silverware_drawer_height]);

    // left side
    color_wood()
    translate([silverware_drawer_width - inches(0.5), -silverware_drawer_depth, 0])
      cube([inches(0.5), silverware_drawer_depth, silverware_drawer_height]);

    // bottom
    color_wood()
    translate([0, -silverware_drawer_depth, 0])
      cube([silverware_drawer_width, silverware_drawer_depth, inches(0.25)]);

    // back
    color_wood()
    translate([0, -silverware_drawer_depth, 0])
      cube([silverware_drawer_width, inches(0.5), silverware_drawer_height]);
  }
}

module counter_top() {
  color_hdpe()
    cube([cabinet_unit_width, feet(2.5), inches(0.75)]);
}

module foot_wall() {
  color_wood()
    cube([cabinet_unit_width, inches(0.75), inches(17)]);
}

module bottom_cabinet_divider() {
  color_wood()
    cube([inches(0.75), inches(17.25), inches(17)]);
}

module water_jug_divider() {
  color_wood()
    cube([inches(0.75), feet(1.5) - inches(0.75), inches(17)]);
}

module electrical_cabinet_top() {
  color_wood()
    cube([battery_area_width, feet(1.5) - inches(0.75), inches(0.75)]);
}

module cooler_slide(open = 0) {
}

module lower_galley_bare() {
  union() {
    translate([0, inches(-0.75), 0])
      foot_wall();
    translate([cooler_area_width, 0, 0])
      bottom_cabinet_divider();
    translate([water_jug_divider_offset, 0, 0])
      water_jug_divider();
    translate([water_jug_divider_offset + inches(0.75), 0, inches(12)])
      electrical_cabinet_top();
  }
}

module lower_galley(silverware_open = 0, electrical_open = 0) {
  union() {
    lower_galley_bare();
    translate([water_jug_divider_offset + inches(0.75), feet(1) + inches(4.5), inches(12.75)])
      silverware_drawer(silverware_open);

    translate([water_jug_divider_offset + inches(0.75), 0, 0])
      battery_tray(electrical_open);
  }
}

lower_galley(0, 0);
