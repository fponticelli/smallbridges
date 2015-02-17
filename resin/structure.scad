include <printer.scad>;

$fn = 12;
$detailed = true;

rotate([90,0,0]) {
  printer();
}