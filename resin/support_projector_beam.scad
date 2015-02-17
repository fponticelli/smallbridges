use <../scad/geom.scad>
use <../scad/brackets.scad>

module support_projector_beam(width) {
  module half() {
    translate([0,0,-40])
      rotate_z_at(180, [10,10])
        rotate_y_at(90, [10,10])
          angle_corner_connector();
    translate([0,40,0])
      rotate_y_at(-90, [10,10])
        angle_corner_connector();

    translate([0,-20,-20])
      rotate_x_at(90, [10,10])
        rotate_z_at(180, [10,10])
          angle_corner_connector();
  }
  translate([width/2, 0, 0])
    half();
  translate(-[width/2, 0, 0])
    mirror([1,0,0])
      half();
}