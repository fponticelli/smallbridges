include <MCAD/materials.scad>
include <bom.scad>;
include <bearing.scad>;
include <shim.scad>;

acetal_black = [0.2,0.2,0.2];
polycarbonate_clear = [0.95,0.95,0.95,0.6];

ob_wheel_half_width = 5.89;
module ob_solid_wheel(finish) {
	ri = 11.455;
	re =  9.77;
	hi =  5.89;
	he =  2.17;

	rh1 = 7.987;
	rh2 = 6.987; // ????
	off = 1;

	if(finish == polycarbonate_clear) {
		bom("ob-solid-wheel-x", "OpenBuild Solid Wheel Xtreme", ["wheel"]);
	} else {
		bom("ob-solid-wheel", "OpenBuild Solid Wheel", ["wheel"]);
	}

	module wheel(f) {
		color(f)
		translate([0,0, -hi/2]) {
			difference() {
				union() {
					translate([0,0, hi])
						cylinder(he, ri, re);
					cylinder(hi, ri, ri);
					translate([0,0,-he])
						cylinder(he, re, ri);

				}

				translate([0,0, (hi+off)/2])
					cylinder(hi, rh1, rh1);
				translate([0,0, -(hi+off)/2])
					cylinder(hi, rh1, rh1);

				cylinder(hi, rh2, rh2);
			}
		}
	}

	if(finish)
		wheel(finish);
	else
		wheel(acetal_black);

	translate([0, 0, off / 2 + ballBearing625_2rs_height / 2])
		ballBearing625_2rs();

	translate([0, 0, -(off / 2 + ballBearing625_2rs_height / 2)])
		ballBearing625_2rs();

	precision_shim_10x5x1();
}

module ob_solid_wheel_xtreme() {
	ob_solid_wheel(polycarbonate_clear);
}

module ob_wheel_test() {
	$fn = 32;
	ob_solid_wheel();

	translate([30, 0, 0])
	ob_solid_wheel_xtreme();
}