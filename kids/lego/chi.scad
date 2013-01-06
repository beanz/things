difference() {
  union() {
    cylinder(r = 6.45/2, h = 2.05, $fn = 30);

    translate([0,0,9.52]) cylinder(r = 4.88/2, h = 1.77, $fn = 30);

    rotate([0,0,22.5]) translate([0,0,2.05]) cylinder(r=7.13/2, h = 7.47, $fn = 8);
  }

  translate([0,0,-.1]) cylinder(r = 4.98/2, h = 8.13, $fn = 30);

  translate([0,0,9.525]) cylinder(r = 3.18/2, h = 1.77, $fn = 30);

}

module crystal(r = 3, h = 7.88)
{
  difference() {
    translate([0,0,h/2]) cube([r,r,h], center = true);
    translate([r/2,0,h+2.5]) rotate([0,45,0]) cube(5, center = true);
    translate([0,r/2,h+2.5]) rotate([0,45,90]) cube(5, center = true);
    translate([-r/2,0,h+2.5]) rotate([0,45,180]) cube(5, center = true);
    translate([0,-r/2,h+2.5]) rotate([0,45,270]) cube(5, center = true);
  }
}

translate([0,0,3]) {
  translate([2,0,0]) rotate([0,30,0]) crystal(h = 7.88);
  translate([0,2,0]) rotate([0,30,90]) crystal(h = 7.88);
  translate([-2,0,0]) rotate([0,30,180]) crystal(h = 8.66);
  translate([0,-2,0]) rotate([0,30,270]) crystal(h = 8.47);
}
