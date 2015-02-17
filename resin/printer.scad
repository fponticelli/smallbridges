use <projector_plate.scad>;
include <projector.scad>;
use <plate.scad>;
include <profile.scad>;
use <../scad/ob_wheel.scad>
use <../scad/ob_spacer.scad>
include <gantry_cart.scad>
use <../scad/brackets.scad>
use <../scad/geom.scad>
use <support_projector_beam.scad>

module printer() {
  offset_depth = 50;

  projector_position = 0;
  height = 500;
  projector_movement = height / 2 - acer_projector_distances[projector_position];

  // projector
  translate([0, 0, -offset_depth]) {
    translate([0, projector_movement, 0]) {
      center_projector() {
        Acer_Plate(160, 120, 85, 100);
        Acer_H6510BD(true);
      }
    }
  }
  width = 480;
  beam_offset = 10;
  beam_width = width - 2 * beam_offset;

  carriage_tower_sections = 3;

  translate([0, projector_movement, -offset_depth]) {
    translate([-beam_width/2,-60,-10])
      rotate([90,90,90])
        profile_20x60(beam_width);
  /*
    translate([beam_width/2,-60,-10])
      rotate([90,0,90])
        gantry_cart_big(carriage_tower_sections, offset = 1);
    translate([-beam_width/2,-60,-10])
      rotate([90,0,-90])
        gantry_cart_big(carriage_tower_sections, offset = 1);
  */
  }

  // projector towers
  translate([0, 0, -offset_depth]) {
    translate([-width/2,-height/2,-10])
      rotate([-90,0,0])
        profile(carriage_tower_sections, height);
    translate([width/2,-height/2,-10])
      rotate([-90,0,0])
        profile(carriage_tower_sections, height);
  }

  // supports for horizontal beam
  translate([0, 0, -offset_depth])
  for(d = acer_projector_distances) {
    translate([0,d-height/2-40,0])
      support_projector_beam(width-60);
  }
  //height / 2 - d

  // base
  base_depth = 400;
  module base(width, depth, sections = 2) {
    profile_height = sections * 20;
    translate([-width/2,0,-base_depth/2])
      rotate([0,0,0])
        profile(sections, base_depth);

    translate([width/2,0,-base_depth/2])
      rotate([0,0,0])
        profile(sections, base_depth);

    lateral_beam_width = width - 20;
    translate([-lateral_beam_width/2,0,-base_depth/2+10])
      rotate([0,90,0])
        profile(sections, lateral_beam_width);

    translate([-lateral_beam_width/2,0,base_depth/2-10])
      rotate([0,90,0])
        profile(sections, lateral_beam_width);
  }


  bottom_sections = 4;
  translate([0,-(height+bottom_sections*20)/2,0])
    base(width, base_depth, bottom_sections);

  middle_sections = 2;
  translate([0,(height+middle_sections*20)/2,0])
    base(width, base_depth, middle_sections);


  // support towers
  tower_pos = base_depth / 2 - 20;
  translate([-width/2,-height/2,tower_pos])
    rotate([-90,0,0])
      profile_20x40(height);
  translate([width/2,-height/2,tower_pos])
    rotate([-90,0,0])
      profile_20x40(height);
}