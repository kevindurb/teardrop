use <../common/lib/convert.scad>
use <../common/lib/colors.scad>
use <../common/lib/rounded.scad>

include <./constants.scad>

cabinet_unit_width = body_width - inches(0.5);
cabinet_unit_height = inches(21.25);
third_cabinet_width = (cabinet_unit_width / 3);
interior_cabinets_height = cabinet_unit_height + inches(2);

module interior_cabinets_face() {
  difference() {
    translate([0, inches(-11.75), inches(-0.75)])
    color_wood()
      cube([cabinet_unit_width, inches(0.75), interior_cabinets_height + inches(0.75)]);

    // left cutout
    translate([inches(2), inches(-10.75), inches(1.25)])
    color_wood()
      rounded_flat(third_cabinet_width - inches(4), interior_cabinets_height - inches(3));

    // right cutout
    translate([(third_cabinet_width * 2) + inches(2), inches(-10.75), inches(1.25)])
    color_wood()
      rounded_flat(third_cabinet_width - inches(4), interior_cabinets_height - inches(3));

    // middle bottom cutout
    translate([third_cabinet_width + inches(2), inches(-10.75), inches(1.25)])
    color_wood()
      rounded_flat(third_cabinet_width - inches(4), inches(4));

    // middle top cutout
    translate([third_cabinet_width + inches(2), inches(-10.75), inches(9.25)])
    color_wood()
      rounded_flat(third_cabinet_width - inches(4), inches(12.25));
  }
}

module interior_cabinets() {
  interior_cabinets_face();

  // vertical divider
  translate([third_cabinet_width - (inches(0.75) / 2), inches(-11), 0])
  color_wood()
    cube([inches(0.75), inches(11), interior_cabinets_height]);

  // vertical divider
  translate([(third_cabinet_width * 2) - (inches(0.75) / 2), inches(-11), 0])
  color_wood()
    cube([inches(0.75), inches(11), interior_cabinets_height]);

  // horizontal divider
  translate([third_cabinet_width, inches(-11), inches(6.25)])
  color_wood()
    cube([third_cabinet_width, inches(11), inches(0.75)]);
}

module galley_cabinets() {
  // galley cabinet face
  translate([0, inches(7), 0])
  color_wood()
    cube([cabinet_unit_width, inches(0.75), cabinet_unit_height - inches(1)]);
}

module cabinets() {

  // middle wall
  color_wood()
    cube([cabinet_unit_width, inches(0.75), cabinet_unit_height]);

  galley_cabinets();

  interior_cabinets();
}

cabinets();
