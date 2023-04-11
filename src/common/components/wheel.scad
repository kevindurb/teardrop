include <../lib.scad>

wheel_diameter = inches(15);
tire_diameter = inches(26);
tire_width = inches(7);
wheel_width = inches(6);

module wheel() {
  color_black()
  difference() {
      cylinder(h = tire_width, d = tire_diameter, center = true);
      cylinder(h = tire_width + inches(2), d = wheel_diameter, center = true);
  }
  color_steel()
    cylinder(h = wheel_width, d = wheel_diameter, center = true);
}

wheel();
