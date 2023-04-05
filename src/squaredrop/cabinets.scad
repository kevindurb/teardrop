use <../common/lib/convert.scad>
use <../common/lib/colors.scad>
use <../common/lib/rounded.scad>

include <./constants.scad>

cabinet_unit_width = body_width - inches(0.5);
cabinet_unit_height = inches(21.25);
third_cabinet_width = (cabinet_unit_width / 3);
half_cabinet_width = (cabinet_unit_width / 2);
interior_cabinets_height = cabinet_unit_height + inches(2);

module interior_cabinet_doors() {
  // left door
  translate([inches(2.125), inches(-11), inches(1.375)])
  color_wood()
    rounded_flat(third_cabinet_width - inches(4.25), interior_cabinets_height - inches(3.25), thickness = inches(0.75));

  // right door
  translate([(third_cabinet_width * 2) + inches(2.125), inches(-11), inches(1.375)])
  color_wood()
    rounded_flat(third_cabinet_width - inches(4.25), interior_cabinets_height - inches(3.25), thickness = inches(0.75));

  // middle top door
  translate([third_cabinet_width + inches(2.125), inches(-11), inches(9.375)])
  color_wood()
    rounded_flat(third_cabinet_width - inches(4.25), inches(12), thickness = inches(0.75));
}

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
  interior_cabinet_doors();

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

module galley_cabinets_face() {
  difference() {
    translate([0, inches(7), 0])
    color_wood()
      cube([cabinet_unit_width, inches(0.75), cabinet_unit_height - inches(1)]);

    // left cutout
    translate([half_cabinet_width + inches(5), inches(8), inches(3)])
    color_wood()
      rounded_flat(half_cabinet_width - inches(8), cabinet_unit_height - inches(6));

    // right cutout
    translate([inches(10), inches(8), inches(3)])
    color_wood()
      rounded_flat(half_cabinet_width - inches(8), cabinet_unit_height - inches(6));
  }
}

module galley_cabinet_doors() {
  // left cutout
  translate([half_cabinet_width + inches(5.125), inches(7.75), inches(3.125)])
  color_wood()
    rounded_flat(half_cabinet_width - inches(8.25), cabinet_unit_height - inches(6.25), thickness = inches(0.75));

  // right cutout
  translate([inches(10.125), inches(7.75), inches(3.125)])
  color_wood()
    rounded_flat(half_cabinet_width - inches(8.25), cabinet_unit_height - inches(6.25), thickness = inches(0.75));
}

module galley_cabinets() {
  galley_cabinets_face();
  galley_cabinet_doors();
}

module cabinets() {

  // middle wall
  color_wood()
    cube([cabinet_unit_width, inches(0.75), cabinet_unit_height]);

  galley_cabinets();

  interior_cabinets();
}

cabinets();
