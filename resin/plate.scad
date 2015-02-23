module plate(w,h,d = 3.125, material = "gray") {
  color(material)
    cube([w,h,d]);
}