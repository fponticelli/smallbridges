include <materials.scad>

cart_position = 300;

module big_screw() {
  len = 650;
  r1 = 5;
  r2 = 6;

  r3 = 14;
  r4 = 24;
  h1 = 34;
  h2 = 10.2;

  w = 40.5;

  cw = 200;

  color(Stainless) {
    rotate([-90,0,0]) {
      cylinder(len, r1, r1);
      translate([0, 0, 10])
        cylinder(len - 25, r2, r2);
      translate([0, 0, cart_position - h1 - h2]) {
        difference() {
          union() {
            cylinder(h1, r3, r3);
            translate([0, 0, h1])
              cylinder(h2, r4, r4);
          }
          translate([w/2,-cw/2,0])
            cube([cw,cw,cw]);
          translate([-w/2-cw,-cw/2,0])
            cube([cw,cw,cw]);
        }
      }
    }
  }
}