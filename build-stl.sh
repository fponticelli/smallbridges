#!/bin/sh
for i in "v-slot"
do
  #echo "Exporting $i.scad to .stl"
  openscad -o "$i.stl" "$i.scad"
done