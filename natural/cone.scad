$fn=24;
radius = 25;
angle=137;
max=200;
height=90;
module thing(r = 5, h = 1) {
  rotate([0, 0, 270]) {
    cube([r*2, r*2, h], center = true);
    translate([0, r, 0]) cylinder(r = r, h = h, center = true);
  }
}

for (n=[0:max-1]) {
  rotate([0, -height*(1-n/max), angle*n])
    translate([radius*(1-n/max), 0, 0])
      thing(r=2+3*(n/max));
}
