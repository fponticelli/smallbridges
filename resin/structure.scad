use <projector_plate.scad>;
use <projector.scad>;
use <profile.scad>;

translate([0,0,0]) {
  Acer_Plate(200, 120, 60, 100);
  Acer_H6510BD(true);
}

/*
len = 270;
translate([-20,60,-len])
  profile_20x20(len);
translate([-20,140,-len])
  profile_20x20(len);
*/
/*
translate([50, 0, 0])
  profile_20x40(100);

translate([100, 0, 0])
  profile_20x60(100);

translate([150, 0, 0])
  profile_20x80(100);
*/