$fn = 30;

module head() {
  multmatrix([ [1,0,0,0], [0,.9,0,0], [0,0,.5,0], [0,0,0,1] ]) {
    sphere(r = 12);
    translate([0,2,10]) { // eyes
      translate([-4,0,0]) sphere(r = 3);
      translate([4,0,0]) sphere(r = 3);
    }
    translate([0,-3,6]) { // nose
      cylinder(r1 = 6, r2 = 5, h = 10);
      translate([0,0,10]) {
        sphere(r = 5);
        translate([0,1,0]) {
          cylinder(r1 = 4, r2 = 3, h = 4);
          translate([0,0,4]) sphere(r= 3);
        }
      }
    }
    translate([0,6,4]) {
      translate([6,0,0]) ear();
      translate([-6,0,0]) ear();
    }
  }
}

module ear(r = 6) {
  difference() {
    sphere(r = r);
    sphere(r = r-1);
    translate([0,0,.5*(r+2)]) cube([2*r+2,2*r+2,r+2], center = true);
  }
}

module body() {
  multmatrix([ [.8,0,0,0], [0,1,0,0], [0,0,.5,0], [0,0,0,1] ])
    sphere (r = 20);
}
module limb(r1 = 6, r2 = 4, h = 12) {
  sphere(r = r1);
  cylinder(r1 = r1, r2 = r2, h = h);
  translate([0,.5,h]) sphere(r = r2+.5);
}

module arm() {
  translate([10,0,0]) rotate([40,-15,0]) {
    limb(h = 12);
  }
}
module leg() {
  translate([8,0,0]) rotate([30,30,0]) {
    limb(h = 15);
  }
}
module bear() {
  translate([0,25,0]) head();
  translate([0,8, 0]) {
    arm();
    scale([-1,1,1]) arm();
  }
  body();
  translate([0,-10, 0]) {
    leg();
    scale([-1,1,1]) leg();
  }
}
difference() {
  bear();
  translate([0,0,-43]) cube([80,80,80],center = true);
  translate([0,30,-.5]) rotate([0,90,0]) cylinder(r=1, h = 50, center = true);
}