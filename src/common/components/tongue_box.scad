use <../lib/convert.scad>
use <../lib/colors.scad>

tongue_box_width = feet(5);
tongue_box_depth = feet(2);
tongue_box_height = feet(2);
tongue_box_inset = inches(0);

module tongue_box() {
  color_black()
  linear_extrude(tongue_box_height)
    polygon([
      [0, 0],
      [tongue_box_width, 0],
      [tongue_box_width - tongue_box_inset, tongue_box_depth],
      [tongue_box_inset, tongue_box_depth],
    ]);
}

tongue_box();
