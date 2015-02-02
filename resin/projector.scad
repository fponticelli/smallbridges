module projector(width, depth, height, feetHeight, lensDiameter, lensX, lensY) {
  color("White")
    difference() {
      translate([0, 0, feetHeight])
        cube([width, depth, height]);
      rotate([90,0,90])
        translate([lensX, lensY, -2])
          cylinder(20, lensDiameter, lensDiameter / 3 * 2);
    }
}

module pyramid(w, l, h) {
  mw = w/2;
  ml = l/2;
  polyhedron(points = [
    [0,  0,  0],
    [w,  0,  0],
    [0,  l,  0],
    [w,  l,  0],
    [mw, ml, h]
  ], faces = [
    [4, 1, 0],
    [4, 3, 1],
    [4, 2, 3],
    [4, 0, 2],
    //base
    [0, 1, 2],
    [2, 1, 3]
  ]);
}

module projection(center, distToWidth, widthToHeight, dist) {
  w = distToWidth * dist;
  h = widthToHeight * w;
  rotate([0,90,0])
    translate([-w/2,-h/2,-dist])
      translate(center)
        pyramid(w, h, dist);
}

module Acer_H6510BD(showProjection=true) {
  feetHeight = 8; // ~
  height = 78;
  lensDiameter = 30; // ~
  lensX = 55; // ~
  lensY = feetHeight + height / 2;
  projector(264, 220, height, feetHeight, lensDiameter, lensX, lensY);
  if(showProjection) {
    distToWidth = 192/225;
    widthToHeight = 16/9;
    dist = 225;
    color([0.75,1,1,0.1])
      projection([-lensY,lensX,0], distToWidth, widthToHeight, dist);
  }
}

Acer_H6510BD();
