use <../lib/convert.scad>
use <../lib/colors.scad>
use <./wheel_well.scad>
use <./teardrop_ceiling.scad>
use <./door.scad>
use <../sketches/teardrop_profile.scad>

include <../constants/trailer.scad>

side_skin_thickness = inches(0.25);
side_frame_thickness = inches(0.75);
door_offset = inches(10);

wheel_well_x_offset = AXEL_OFFSET_Y + feet(4) + inches(0);

module outside_side_skin() {
  color_outside()
  difference() {
    trailer_profile(side_skin_thickness);

    // door cut out
    translate([-door_offset, 0, inches(3)])
      door_frame();

    translate([-wheel_well_x_offset, inches(-3), 0])
    rotate([0, 0, 90])
      wheel_well_shape();

    translate([-wheel_well_x_offset, inches(-3), 0])
    rotate([0, 0, 90])
      wheel_well_cutout();
  }
}

module inside_side_skin() {
  color_wood()
  difference() {
    outside_side_skin();

    // inside 1/4" ply doesnt extend all the way down
    translate([feet(-9), inches(-0.5), inches(-0.5)])
      cube([feet(10), inches(0.75), inches(3)]);

    // Cut out the ceiling
    translate([10, 1, -1])
    scale([1.01, 1, 1.01])
    teardrop_ceiling_shell();
  }
}

module side_frame() {
  color_wood()
  difference() {
    union() {
      // outer frame
      difference() {
        trailer_profile(side_frame_thickness);

        translate([inches(-3), inches(0.25), inches(3)])
          scale([0.93, 1, 0.88])
          trailer_profile(side_frame_thickness * 2);

      }

      // door frame
      difference() {
        translate([inches(-32) - door_offset, inches(-0.75), 0])
          cube([inches(35), inches(0.75), inches(42)]);

        translate([-door_offset, inches(-0.5), inches(3)])
          door_frame();
      }

      // door virt
      translate([-door_offset - inches(35), inches(-0.75), 0])
        cube([inches(3), inches(0.75), inches(46)]);

      // first virt
      translate([feet(-5.25), inches(-0.75), 0])
        cube([inches(3), inches(0.75), inches(44)]);

      // second virt
      translate([feet(-6) + inches(-10), inches(-0.75), 0])
        cube([inches(3), inches(0.75), inches(39)]);

      // front horz
      translate([-door_offset + inches(3), inches(-0.75), inches(20)])
        cube([door_offset, inches(0.75), inches(3)]);

      // back lower
      translate([feet(-8) + inches(-2), inches(-0.75), inches(18)])
        cube([feet(4.75), inches(0.75), inches(3)]);

      // back upper
      translate([feet(-7.5), inches(-0.75), inches(32)])
        cube([feet(4), inches(0.75), inches(3)]);
    }

    translate([-wheel_well_x_offset, inches(-3), 0])
    rotate([0, 0, 90])
      wheel_well_shape();

    translate([-wheel_well_x_offset, inches(-3), 0])
    rotate([0, 0, 90])
      wheel_well_cutout();
  }
}


module teardrop_side(door_open = 0) {
  union() {
    translate([0, -(side_skin_thickness + side_frame_thickness), 0])
      outside_side_skin();

    translate([0, -side_skin_thickness, 0])
      side_frame();

    inside_side_skin();

    translate([-door_offset, inches(-0.75), inches(3)])
    rotate([0, 0, 90 * door_open])
      door();
  }
}

teardrop_side();
