include <modules.scad>;

dist = 20;

translate([0,0,wall_thickness/2]) {
  translate([0,-dist,0])
    sideA();
  translate([0, dist,0])
    sideB();
}
