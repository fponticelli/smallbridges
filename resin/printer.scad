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
include <materials.scad>
use <basin_support.scad>
use <big_screw.scad>

module printer(projector_position = 0) {
  offset_depth = 50;

  middle_sections = 2;

  height = 500;
  width = 560;
  base_depth = 440;
  display_projection = false;
  base_sections = 3;

  projector_movement = height / 2 - acer_projector_distances[projector_position] + middle_sections * 20;

  // projector
  translate([0, 0, -offset_depth]) {
    translate([0, projector_movement, 0]) {
      center_projector() {
        Acer_Plate(160, 120, 85, 100);
        Acer_H6510BD(display_projection);
      }
    }
  }
  beam_offset = 10;
  beam_width = width - 2 * beam_offset;

  carriage_tower_sections = 3;

  translate([0, projector_movement, -offset_depth]) {
    translate([-beam_width/2,-20 * base_sections,-10])
      rotate([90,90,90])
        profile(base_sections, beam_width);
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
  translate([0, middle_sections * 20, -offset_depth])
  for(d = acer_projector_distances) {
    translate([0,d-height/2+10,0])
      support_projector_beam(width-60);
  }
  //height / 2 - d

  // base
  module base(width, depth, sections = 2) {
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

  module baser(width, depth, sections = 2) {
    translate([(- width + sections * 20) / 2 - 10, -10, -base_depth/2])
      rotate([0,0,90])
        profile(sections, base_depth);

    translate([(  width - sections * 20) / 2 + 10, -10, -base_depth/2])
      rotate([0,0,90])
        profile(sections, base_depth);

    lateral_beam_width = width - 30 * sections;
    translate([-lateral_beam_width/2, -10, -base_depth/2+30])
      rotate([90,0,90])
        profile(sections, lateral_beam_width);
    translate([-lateral_beam_width/2, -10, base_depth/2-30])
      rotate([90,0,90])
        profile(sections, lateral_beam_width);
  }


  bottom_sections = 2;
  translate([0,-(height+bottom_sections*20)/2,0])
    base(width, base_depth, bottom_sections);

  translate([0,(height+middle_sections*20)/2,0])
    baser(width, base_depth, 2);

  // support towers
  tower_pos = base_depth / 2 - 10;
  translate([-width/2,-height/2,tower_pos])
    rotate([-90,0,0])
      profile(1, height);
  translate([width/2,-height/2,tower_pos])
    rotate([-90,0,0])
      profile(1, height);

  rotate([0,180,0]) {

    offset = 16;
    plate_width = width - 20 - offset * 2;
    plate_depth = base_depth - 60 * 2;
    cut_width = 440;
    cut_offset = 7.5;
    translate([
      -plate_width/2,
      height/2 + 20,
      -plate_depth / 2 + 20 - offset])
      basin_support(plate_width, plate_depth, cut_width, cut_offset);

    translate([0, height/2 + 20 * middle_sections, base_depth / 2 + 20])
      big_screw();

    // TODO review
    screw_height = 640;
    rail_sections = 2;
    rotate([-90, 0, 0]) {
      translate([65, -base_depth / 2 - 20, -height / 2 - 20 * (bottom_sections)]) {
        profile(rail_sections, screw_height + height + 20 * (bottom_sections + middle_sections));
      }
      translate([-65, -base_depth / 2 - 20, -height / 2 - 20 * (bottom_sections)]) {
        profile(rail_sections, screw_height + height + 20 * (bottom_sections + middle_sections));
      }
    }
    translate([0,0,30]) {
      translate([40, height / 2 + 20 * middle_sections + 260, base_depth / 2 + 20])
        rotate([0, 180, 0])
          profile(4, width / 2 + rail_sections * 2 - 5);
      translate([-40, height / 2 + 20 * middle_sections + 260, base_depth / 2 + 20])
        rotate([0, 180, 0])
          profile(4, width / 2 + rail_sections * 2 - 5);
      translate([-50, height / 2 + 20 * middle_sections + 300, base_depth / 2 -60])
        plate(100, 4, 80);
      translate([-50, height / 2 + 20 * middle_sections + 216, base_depth / 2 -60])
        plate(100, 4, 80);
      translate([0, height / 2 + 20 * middle_sections + 300, base_depth / 2 - width / 2 + 30])
        rotate([90,90,0])
          profile(3, 120);

      translate([65, height / 2 + 20 * middle_sections + 300 - 10, base_depth / 2 - 20 - rail_sections * 10])
        rotate([0,90,0])
          ob_solid_wheel();
      translate([65, height / 2 + 20 * middle_sections + 240 - 10, base_depth / 2 - 20 - rail_sections * 10])
        rotate([0,90,0])
          ob_solid_wheel();
      translate([65, height / 2 + 20 * middle_sections + 270 - 10, base_depth / 2 + rail_sections * 10])
        rotate([0,90,0])
          ob_solid_wheel();

      translate([-65, height / 2 + 20 * middle_sections + 300 - 10, base_depth / 2 - 20 - rail_sections * 10])
        rotate([0,90,0])
          ob_solid_wheel();
      translate([-65, height / 2 + 20 * middle_sections + 240 - 10, base_depth / 2 - 20 - rail_sections * 10])
        rotate([0,90,0])
          ob_solid_wheel();
      translate([-65, height / 2 + 20 * middle_sections + 270 - 10, base_depth / 2 + rail_sections * 10])
        rotate([0,90,0])
          ob_solid_wheel();
    }
  }
}