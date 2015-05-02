module glass(w,d,h) {
  color([1,1,1,0.25])
  cube([w,d,h]);
}

width  = 120;
depth  = 80;
height = 4;


glass(width, depth, height);