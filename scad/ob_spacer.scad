include <MCAD/materials.scad>
use <bom.scad>;
use <geom.scad>;

module ob_spacer(length = 1) {
  bom(str("ob-alu-spacer-",length), str("Aluminum Spacer (", length,")"), ["hardware"]);
  color(Aluminum)
    difference() {
      cylinder(length, 5, 5);
      translate([0, 0, -length/2])
        cylinder(length*2, 2.55, 2.55);
    }
}

module ob_eccentric_spacer() {
  bom("ob-eccentric-spacer", "Eccentric Spacer", ["hardware"]);
  length = 6.35;
  length2 = 2.5;
  lengtht = length + length2;
  m5 = 5;
  diam = 7.11;
  center_offset = 0.79;
  color(Steel)
  difference() {
    union() {
      translate([0,0,length/2])
        scale([1,1,length])
          hexagon(5.774);
      translate([0,0,-length2])
        cylinder(length2,diam/2,diam/2);
    }
    translate([center_offset,0,-lengtht])
      cylinder(lengtht*2,m5/2,m5/2);
  }
}

module ob_spacer_test() {
  ob_spacer(6);
  translate([30, 0, 0])
    ob_eccentric_spacer();
}

ob_spacer_test();