include <../scad/vslot_gantry_plate.scad>
include <../scad/ob_wheel.scad>
use <../scad/ob_spacer.scad>
use <../scad/shim.scad>

gantry_cart_wheel_mid = 15.5;

module gantry_cart_big(sections = 1, wheelstop = 2, wheelsbottom = 2, offset = 0) {
  wheels_top = [
    [],
    [[], [10], [ 9,11], [ 9,10,11]],
    [[], [ 7], [ 6, 8], [ 6, 7, 8]],
    [[], [ 4], [ 3, 5], [ 3, 4, 5]],
    [[], [ 1], [ 0, 2], [ 0, 1, 2]]
  ];
  wheels_bottom = [
    [],
    [[], [22], [21,23], [21,22,23]],
    [[], [19], [18,20], [18,19,20]],
    [[], [16], [15,17], [15,16,17]],
    [[], [13], [12,14], [12,13,14]]
  ];
  translate([0,-offset * 10,0]) {
    translate([0,0,vslot_gantry_plate_height/2])
      vslot_gantry_plate_big();
    translate([0,0,vslot_gantry_plate_height]) {
      for(s = wheels_top[sections+offset][wheelstop]) {
        translate(vslot_gantry_plate_holes_big[s]) {
          ob_eccentric_spacer();
          translate([0,0,6.85]) {
            precision_shim_10x5x1();
            translate([0,0,ob_wheel_half_width])
              ob_solid_wheel();
          }
        }
      }
      for(s = wheels_bottom[sections-offset][wheelsbottom]) {
        translate(vslot_gantry_plate_holes_big[s]) {
          ob_spacer(6.35);
          translate([0,0,6.85]) {
            precision_shim_10x5x1();
            translate([0,0,ob_wheel_half_width])
              ob_solid_wheel();
          }
        }
      }
    }
  }
}