module glass(w,d,h) {
  color([1,1,1,0.25])
  cube([w,d,h], center=true);
}

module side1(width, height, wall_thickness, cut_depth, glass_thickness) {
  gap_width = width + 2;
  support_width = 2;
  color([1,0.1,0.0,0.75])
  difference() {
    cube([width,height,wall_thickness], center=true);
    translate([
      -1,
      height / 2 - support_width - glass_thickness / 2,
      wall_thickness-cut_depth
    ])
      cube([gap_width,glass_thickness,wall_thickness], center=true);
  }
}

module side2(width, height, wall_thickness, cut_depth, glass_thickness) {
  height2 = height + 2;
  color([1,0.1,0.0,0.75])
    difference() {
      side1(width, height, wall_thickness, cut_depth, glass_thickness);
      translate([width/2-wall_thickness/2+1,0,wall_thickness-cut_depth])
        cube([wall_thickness+2,height2,wall_thickness], center=true);
      translate([-width/2+wall_thickness/2-1,0,wall_thickness-cut_depth])
        cube([wall_thickness+2,height2,wall_thickness], center=true);
    }
}

width  = 120;
depth  = 80;
glass_thickness = 4;
wall_thickness = 3;
cut_depth = 1;

//glass(width, depth, glass_thickness);
//rotate([90,00,0])
  side2(width, 30, wall_thickness, cut_depth, glass_thickness);