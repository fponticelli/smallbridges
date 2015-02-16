module projector(width, depth, height, Acer_support_height, lensDiameter, lensX, lensY) {
  color("White")
    difference() {
      translate([0, 0, Acer_support_height])
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

Acer_support_height = 8; // ~

Acer_size_width  = 264;
Acer_size_depth  = 220;
Acer_size_height =  78;

Acer_lens_diameter = 30; // ~
Acer_lens_x = 55; // ~
Acer_lens_y = Acer_support_height + Acer_size_height / 2; // ~

module Acer_H6510BD(showProjection=true) {
  projector(Acer_size_width, Acer_size_depth, Acer_size_height, Acer_support_height, Acer_lens_diameter, Acer_lens_x, Acer_lens_y);
  if(showProjection) {
    distToWidth = 192/225;
    widthToHeight = 16/9;
    color([0.75,1,1,0.1]) {
      for(dist = [112, 225, 337])
        projection([-Acer_lens_y,Acer_lens_x,-Acer_size_depth], distToWidth, widthToHeight, dist);
    }

  }
}

module center_projector(pos) {
  if(pos == 1) { // on lens
    translate([-Acer_lens_x,-Acer_size_depth,-Acer_lens_y])
      children();
  } else {
    translate([-Acer_lens_x,-Acer_size_depth,0])
      children();
  }
}

Acer_H6510BD();
