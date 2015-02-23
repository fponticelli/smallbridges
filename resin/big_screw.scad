include <materials.scad>

module big_screw() {
  len = 650;
  r1 = 5;
  r2 = 6;
  color(Stainless)
    rotate([-90,0,0]) {
      cylinder(len, r1, r1);
      translate([0, 0, 10])
        cylinder(len - 25, r2, r2);
    }
}