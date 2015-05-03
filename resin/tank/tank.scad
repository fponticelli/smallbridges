module glass(w,d,h) {
  color([1,1,1,0.35])
  cube([w,d,h], center=true);
}

module side0(width, height, support_height, wall_thickness, cut_depth, glass_thickness) {
  gap_width = width + 2;
  difference() {
    cube([width,height,wall_thickness], center=true);
    translate([
      -1,
      height / 2 - support_height - glass_thickness / 2,
      wall_thickness-cut_depth
    ])
      cube([gap_width,glass_thickness,wall_thickness], center=true);
  }
}

module side1(width, height, support_height, wall_thickness, cut_depth, glass_thickness) {
  color([1,0.1,0.0,0.85])
    side0(width, height, support_height, wall_thickness, cut_depth, glass_thickness);
}

module side2(width, height, support_height, wall_thickness, cut_depth, glass_thickness) {
  height2 = height + 2;
  color([1,0.4,0.1,0.85])
    difference() {
      side0(width, height, support_height, wall_thickness, cut_depth, glass_thickness);
      translate([width/2-wall_thickness/2+1,0,wall_thickness-cut_depth])
        cube([wall_thickness+2,height2,wall_thickness], center=true);
      translate([-width/2+wall_thickness/2-1,0,wall_thickness-cut_depth])
        cube([wall_thickness+2,height2,wall_thickness], center=true);
    }
}

width   = 120;
height  = 80;
glass_thickness = 8;
wall_height = 30;
wall_thickness = 3;
cut_depth = 1;
support_height = 2;

glass(width, height, glass_thickness);

rotate([-90,0,0])
  translate([0,support_height+glass_thickness/2-wall_height/2,cut_depth-(height+wall_thickness)/2])
    side1(width + cut_depth * 0, wall_height, support_height, wall_thickness, cut_depth, glass_thickness);

rotate([90,180,0])
  translate([0,support_height+glass_thickness/2-wall_height/2,cut_depth-(height+wall_thickness)/2])
    side1(width + cut_depth * 0, wall_height, support_height, wall_thickness, cut_depth, glass_thickness);

rotate([-90,0,90])
  translate([0,support_height+glass_thickness/2-wall_height/2,cut_depth-(width+wall_thickness)/2])
    side2(height+(wall_thickness-cut_depth)*2, wall_height, support_height, wall_thickness, cut_depth, glass_thickness);

rotate([90,180,90])
  translate([0,support_height+glass_thickness/2-wall_height/2,cut_depth-(width+wall_thickness)/2])
    side2(height+(wall_thickness-cut_depth)*2, wall_height, support_height, wall_thickness, cut_depth, glass_thickness);
