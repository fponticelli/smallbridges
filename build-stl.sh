#!/bin/sh
for i in "bearing" "brackets" "ob_spacer" "ob_wheel" "or_gantry_plate" "shim" "vslot" "vslot_gantry_plate"
do
  echo "\nExporting $i.scad to .stl\n=============================================\n"
  echo "include <scad/$i.scad>\n\$fn = 48;\n${i}_test();" > temp.scad
  openscad -o "stl/$i.stl" temp.scad
done

echo "\nExporting printer.scad to .stl\n=============================================\n"
echo "include <resin/printer.scad>\n\$fn = 48;\n\$detailed = true;\nrotate([90,0,0]) {\n  printer();\n}" > temp.scad
openscad -o "stl/$i.stl" temp.scad
rm temp.scad