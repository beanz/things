use <coin-lib.scad>
coin();
r = 12;
translate([0,0,2]) {
  difference() {
    intersection() {
      translate([0,-r,0]) cube([r, r*2, 1]);
      cylinder(r = r, h = 1);
    }
    translate([0, r/2, 0]) cylinder(r = r/2, h = 2);
  }
  translate([0, -r/2, 0]) cylinder(r = r/2, h = 1);
}
