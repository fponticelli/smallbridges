use <../scad/vslot.scad>

$detailed = false;

module profile(sections, length) {
  if($detailed) {
    rotate([0,0,90])
      vslot(length, sections);
  } else {
    translate([-10,-(20 * sections) / 2,0])
      color("Silver")
        cube([20,sections*20,length]);
  }
}

module profile_20x20(length) {
  profile(1, length);
}

module profile_20x40(length) {
  profile(2, length);
}

module profile_20x60(length) {
  profile(3, length);
}

module profile_20x80(length) {
  profile(4, length);
}