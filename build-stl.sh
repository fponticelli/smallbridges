#!/bin/sh
for i in "basics" "v-slot"
do
  #echo "Exporting $i.scad to .stl"
  openscad -o "$i.stl" "$i.scad"
done