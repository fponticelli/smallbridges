include <modules.scad>;

offset = 12;
dist = (wall_height + offset) / 2;

translate([0,0,wall_thickness/2]) {
  translate([0,-dist,0])
    sideA();
  translate([0,-dist - wall_height - offset])
    sideA();
  translate([0, dist,0])
    sideB();
  translate([0, dist + wall_height + offset,0])
    sideB();
}

//cube([12 * inch, 25 * inch, 1], center = true);