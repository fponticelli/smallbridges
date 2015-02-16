include <../scad/or_gantry_plate.scad>
include <../scad/ob_wheel.scad>
use <../scad/ob_spacer.scad>
use <../scad/shim.scad>

module gantry_cart(mod = 1) {
  translate([0,0,or_gantry_plate_height/2])
    or_gantry_plate(mod);
  eccentric_spacers = [[],[2,10]];
  spacers = [[],[1,9]];
  translate([0,0,or_gantry_plate_height]) {
    for(s = eccentric_spacers[mod])
      translate(or_gantry_plate_holes[mod][s][0]) {
        ob_eccentric_spacer();
        translate([0,0,6.85]) {
          precision_shim_10x5x1();
          translate([0,0,ob_wheel_half_width])
            ob_solid_wheel();
        }
      }
    for(s = spacers[mod])
      translate(or_gantry_plate_holes[mod][s][0]) {
        ob_spacer(6.35);
        translate([0,0,6.85]) {
          precision_shim_10x5x1();
          translate([0,0,ob_wheel_half_width])
            ob_solid_wheel();
        }
      }
  }
}