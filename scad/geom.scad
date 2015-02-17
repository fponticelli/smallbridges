module rotate_at(angle, pivot) {
  translate(pivot)
    rotate(angle)
      translate(-pivot)
        children();
}

module rotate_z_at(angle, pivot) {
  translate([pivot[0], pivot[1], 0])
    rotate([0, 0, angle])
      translate([-pivot[0], -pivot[1], 0])
        children();
}

module rotate_y_at(angle, pivot) {
  translate([pivot[0], 0, pivot[1]])
    rotate([0, angle, 0])
      translate([-pivot[0], 0, -pivot[1]])
        children();
}

module rotate_x_at(angle, pivot) {
  translate([0, pivot[0], pivot[1]])
    rotate([angle, 0, 0])
      translate([0, -pivot[0], -pivot[1]])
        children();
}


module hexagon(r = 1, h = 1) {
  points = [
    [cos(  0), sin(  0)] * r,
    [cos( 60), sin( 60)] * r,
    [cos(120), sin(120)] * r,
    [cos(180), sin(180)] * r,
    [cos(240), sin(240)] * r,
    [cos(300), sin(300)] * r
  ];
  translate([0, 0, -h/2])
    linear_extrude(h)
      polygon(points);
}