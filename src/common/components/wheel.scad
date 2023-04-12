include <../lib.scad>

wheel_diameter = inches(15);
tire_diameter = inches(26);
tire_width = inches(7);
wheel_width = inches(6);

module wheel(anchor = BOTTOM, spin = 0, orient = UP) {
  attachable(anchor, spin, orient, r = tire_diameter / 2, l = tire_width) {
    diff("hole", "wheel")
    recolor(COLOR_BLACK)
    cyl(h = tire_width, d = tire_diameter) {
      tag("hole") cyl(h = tire_width + inches(2), d = wheel_diameter);
      tag("wheel") color_steel() cyl(h = wheel_width, d = wheel_diameter);
    }

    children();
  }
}

wheel() show_anchors(s = 100);
