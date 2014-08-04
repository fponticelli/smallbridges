#!/bin/sh
for i in "bearing" "ob_wheel" "shim" "vslot"
do
  #echo "Exporting $i.scad to .stl"
  echo "include <scad/$i.scad>; ${i}_test();" > temp.scad
  openscad -o "stl/$i.stl" temp.scad
done
rm temp.scad