module projector(width, depth, height, supportHeight, lensDiameter, lensX, lensY) {
  color("White")
    difference() {
      translate([0, 0, supportHeight])
        cube([width, depth, height]);
      rotate([90,0,0])
        translate([lensX, lensY, -depth-2])
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
  rotate([0,90,-90])
    translate([-w/2,-h/2,-dist])
      translate(center)
        pyramid(w, h, dist);
}

module Acer_H6510BD(showProjection=true) {
  supportHeight = 8; // ~
  height = 78;
  lensDiameter = 30; // ~
  lensX = 55; // ~
  lensY = supportHeight + height / 2;
  width = 264;
  depth = 220;
  projector(width, depth, height, supportHeight, lensDiameter, lensX, lensY);
  if(showProjection) {
    distToWidth = 192/225;
    widthToHeight = 16/9;
    dist = 225;
    color([0.75,1,1,0.1])
      projection([-lensY,lensX,-depth], distToWidth, widthToHeight, dist);
  }
}

Acer_H6510BD();
