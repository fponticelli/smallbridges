inch = 25.4;
width = 400;
height = 300;
thickness = inch / 4;
tollerance = 0.2;

cut_thickness = 2;
cut_width = 250;
cut_height = 150;
cut_support = inch / 8;
hole_diameter = 6;
holes_per_side = 5;
holes_coverage = 200;
holes_distance = 350;

module support(width, height, thickness) {
  color([0,0,0,0.75]) {
    difference() {
      cube([width, height, thickness], center=true);

      translate([0,0,thickness-cut_thickness])
        cube([cut_width + tollerance * 2, cut_height + tollerance * 2, thickness], center=true);
      cube([cut_width - cut_support * 2, cut_height - cut_support * 2, thickness * 2], center=true);

      $fn = 32;
      dist = holes_coverage / (holes_per_side - 1);
      for(y = [0 : holes_per_side - 1]) {
        translate([0, -holes_coverage / 2 + y * dist, 0]) {
          translate([  holes_distance / 2, 0, 0])
            cylinder(h = thickness * 2, r = hole_diameter / 2, center = true);
          translate([- holes_distance / 2, 0, 0])
            cylinder(h = thickness * 2, r = hole_diameter / 2, center = true);
        }
      }
    }
  }
}

translate([0,0,thickness/2])
  support(width, height, thickness);