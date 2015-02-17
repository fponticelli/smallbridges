include <MCAD/materials.scad>;
include <bom.scad>;

module angle_corner_connector() {
  r1 = 5.5;
  r2 = 3.57;
  d  = 3.5;
  AnodizedBlack = [0.17, 0.17, 0.2];
  bom("ob-angle-corner-connector", "Angle Cotner Connector", ["bracket", "hardware"]);
  color(AnodizedBlack) {
    difference() {
      rotate([90,0,0])
        translate([0,0,-20])
          linear_extrude(height=20)
            polygon(points=[[0,0],[20,0],[20,1],[1,20],[0,20]], paths=[[0,1,2,3,4]]);
      rotate([0,0,0]) {
        translate([10,10,d]) {
          cylinder(30, r1, r1);
          translate([0,0,-2*d])
            cylinder(30, r2, r2);
        }
      }


      rotate([0,90,0]) {
        translate([-10,10,d]) {
          cylinder(30, r1, r1);
          translate([0,0,-2*d])
            cylinder(30, r2, r2);
        }
      }
    }
  }
}

module brackets_test() {
  angle_corner_connector();
}