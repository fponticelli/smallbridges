module roundedRect(size, radius) {
	x = size[0] - radius;
	y = size[1] - radius;
	hull() {
		// place 4 circles in the corners, with the given radius
		translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);

		translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);

		translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);

		translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	}
}

module roundedBox(size, radius) {
	z = size[2];
	linear_extrude(height=z)
		roundedRect(size, radius);
}