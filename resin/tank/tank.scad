include <modules.scad>;

glass(width, height, glass_thickness);

rotate([-90,0,0])
  translate([0,support_height+glass_thickness/2-wall_height/2,cut_depth-(height+wall_thickness)/2])
    sideA();

rotate([90,180,0])
  translate([0,support_height+glass_thickness/2-wall_height/2,cut_depth-(height+wall_thickness)/2])
    sideA();

rotate([-90,0,90])
  translate([0,support_height+glass_thickness/2-wall_height/2,cut_depth-(width+wall_thickness)/2])
    sideB();

rotate([90,180,90])
  translate([0,support_height+glass_thickness/2-wall_height/2,cut_depth-(width+wall_thickness)/2])
    sideB();
