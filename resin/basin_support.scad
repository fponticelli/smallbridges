include <materials.scad>
include <plate.scad>

module basin_support(w, h, cw, offh = 0) {
  d = 6;
  dc = 2;
  dw = 4;
  ch = cw / 16 * 9;
  difference() {
    plate(w, d, h, RedAcrylic);
    translate([0,0,-offh]) {
      union() {
        translate([(w - cw) / 2, -d, (h - ch) / 2])
          plate(cw, d * 3, ch, RedAcrylic);
        translate([(w - cw) / 2 - dw, d - dc, (h - ch) / 2 - dw])
          plate(cw + dw * 2, d, ch + dw * 2, RedAcrylic);
      }
    }
  }
}