use <bom.scad>

AnodizedBlack = [0.17, 0.17, 0.2];

vslot_gantry_plate_height = 3;

vslot_gantry_plate_holes_big = [
	[-30.32, 49.85],
	[  0.00, 49.85],
	[ 30.32, 49.85],

	[-30.32, 39.85],
	[  0.00, 39.85],
	[ 30.32, 39.85],

	[-30.32, 29.85],
	[  0.00, 29.85],
	[ 30.32, 29.85],

	[-30.32, 19.85],
	[  0.00, 19.85],
	[ 30.32, 19.85],

	[-30.32,-49.85],
	[  0.00,-49.85],
	[ 30.32,-49.85],

	[-30.32,-39.85],
	[  0.00,-39.85],
	[ 30.32,-39.85],

	[-30.32,-29.85],
	[  0.00,-29.85],
	[ 30.32,-29.85],

	[-30.32,-19.85],
	[  0.00,-19.85],
	[ 30.32,-19.85]
];

vslot_gantry_plate_sizes =[[],
	[65.5,65.5],
	[127,88]
];

module vslot_gantry_plate_big() {
	bom("vslot_gantry_plate_big", str("V-Slot Gantry Plate: ", vslot_gantry_plate_sizes[1][0], "x", vslot_gantry_plate_sizes[1][1], "mm"), "plates");

	color(AnodizedBlack) {
		linear_extrude(height = vslot_gantry_plate_height, center = true, convexity = 10)
   		import (file = "../dxf/vslot_gantry_plate.dxf");
	}
}