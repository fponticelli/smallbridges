module Acer_Plate(width, height, depth = 5, offsetX = 0, offsetY = 0) {
  p0 = [0, 0, -depth / 2];
  p1 = [-110.05, 0, -depth / 2];
  p2 = [-55, 81.5, -depth / 2];
  rad = 3; // TODO
  translate([width / 2+offsetX, height / 2+offsetY, 0])
    difference() {
      translate([-width / 2+offsetX, -height / 2+offsetY, 0])
        cube([width, height, depth]);
        translate(p0)
          cylinder(depth * 2, rad, rad);
        translate(p1)
          cylinder(depth * 2, rad, rad);
        translate(p2)
          cylinder(depth * 2, rad, rad);
    }
}