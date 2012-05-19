
module coin() {
  for(n=[0:90]) {
    rotate([0,0,n*4]) translate([15,0,0]) cylinder(r = 2, h = 3);
  }
  cylinder(r = 14, h = 3);
}

difference() {
  coin();
  translate([0,0,2]) cylinder(r = 14, h = 2);
}
translate([-11.5,-11,2]) scale([0.27,0.27,1]) linear_extrude(file = "r.dxf", height = 2, center = true);