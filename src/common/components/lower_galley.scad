include <../lib.scad>

cabinet_unit_width = feet(4) + inches(11.5);
cabinet_unit_height = inches(17);
cabinet_unit_depth = feet(1.5);

cooler_area_width = inches(30);
water_jug_area_width = inches(16);
water_jug_divider_offset = cooler_area_width + water_jug_area_width + inches(0.75);
lower_cabinet_width = cabinet_unit_width - cooler_area_width - water_jug_area_width - inches(1.5);

silverware_drawer_height = inches(4.25);
silverware_drawer_depth = inches(16.5);
silverware_drawer_width = lower_cabinet_width;

module lower_cabinet(open = 0) {
  color_hdpe()
  translate([0, inches(16.5), 0])
  rotate([0, 0, 90 * open])
    cube([lower_cabinet_width, inches(0.75), inches(12)]);
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

module counter_top(anchor = CENTER, spin = 0, orient = UP) {
  color_this(COLOR_HDPE)
    cube([cabinet_unit_width, feet(2.5), inches(0.75)], anchor = anchor, spin = spin, orient = orient) {
      children();
    }
}

module foot_wall() {
  color_wood()
    cube([cabinet_unit_width, inches(0.75), cabinet_unit_height]);
}

module bottom_cabinet_divider() {
  color_wood()
    cube([inches(0.75), cabinet_unit_height + inches(0.25), cabinet_unit_height]);
}

module water_jug_divider() {
  color_wood()
    cube([inches(0.75), cabinet_unit_depth - inches(0.75), cabinet_unit_height]);
}

module electrical_cabinet_top() {
  color_wood()
    cube([lower_cabinet_width, cabinet_unit_depth - inches(0.75), inches(0.75)]);
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

module lower_galley(open = 0, anchor = CENTER, spin = 0, orient = UP) {
  attachable(anchor, spin, orient, size = [cabinet_unit_width, cabinet_unit_depth, cabinet_unit_height]) {
    translate([cabinet_unit_width / -2, cabinet_unit_depth / -2, cabinet_unit_height / -2])
    union() {
      lower_galley_bare();
      translate([water_jug_divider_offset + inches(0.75), feet(1) + inches(4.5), inches(12.75)])
        silverware_drawer(open);

      translate([water_jug_divider_offset + inches(0.75), 0, 0])
        lower_cabinet(open);
    }
    children();
  }
}

lower_galley(0);
