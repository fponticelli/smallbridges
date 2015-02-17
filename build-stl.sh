#!/bin/sh
cd scad
for i in "bearing" "brackets" "ob_spacer" "ob_wheel" "or_gantry_plate" "shim" "vslot" "vslot_gantry_plate"
do
  echo "\nExporting $i.scad to .stl\n=============================================\n"
  echo "include <$i.scad>\n\$fn = 36;\n${i}_test();" > _temp.scad
  openscad -o "../stl/$i.stl" _temp.scad
done
rm _temp.scad
cd ../resin
echo "\nExporting printer.scad to .stl\n=============================================\n"
echo "include <printer.scad>\n\$fn = 36;\n\$detailed = true;\nrotate([90,0,0]) {\n  printer();\n}" > _temp.scad
openscad -o "../stl/printer.stl" _temp.scad
rm _temp.scad
cd ..