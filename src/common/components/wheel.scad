include <../lib.scad>

wheel_diameter = inches(15);
tire_diameter = inches(26);
tire_width = inches(7);
wheel_width = inches(6);

module wheel() {
  diff()
  recolor(COLOR_BLACK)
  cyl(h = tire_width, d = tire_diameter) {
    tag("remove") cyl(h = tire_width + inches(2), d = wheel_diameter);
    tag("keep") color_steel() cyl(h = wheel_width, d = wheel_diameter);
  }
}

wheel();
