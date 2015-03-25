use <plate.scad>;

module Acer_Plate(width, height, offsetX = 0, offsetY = 0, depth = 3.125) {
  x = 264 - 44.5;
  y = 220 - 20 - 81.5;
  p0 = [0, 0, -depth / 2];
  p1 = [-110.05, 0, -depth / 2];
  p2 = [-55, 81.5, -depth / 2];
  rad = 1.75; // screw is 1.5
  echo(str(
    "Projector Plate ",
    width,
    "x",
    height,
    "mm"

  ));
  difference() {
    translate([offsetX, offsetY, 0])
      plate(width, height, depth);
    color("black")
    translate([x,y,0]) {
      translate(p0)
        cylinder(depth * 2, rad, rad);
      translate(p1)
        cylinder(depth * 2, rad, rad);
      translate(p2)
        cylinder(depth * 2, rad, rad);
    }
  }
}
