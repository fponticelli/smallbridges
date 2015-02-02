module profile(w, h, length) {
  translate([0,0,0])
    color("Silver")
      cube([w,h,length]);
}

module profile_20x20(length) {
  profile(20, 20, length);
}

module profile_20x40(length) {
  profile(20, 40, length);
}

module profile_20x60(length) {
  profile(20, 60, length);
}

module profile_20x80(length) {
  profile(20, 80, length);
}