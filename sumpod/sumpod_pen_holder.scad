/*
 * Sumpod Pen Holder
 *
 * Copyright (c) 2012 Mark Hindess
 * License:
 *   Creative Commons Attribution-ShareAlike 3.0 Unported License
 *   http://creativecommons.org/licenses/by-sa/3.0
 */

// START OF PARAMETERS

pen_diameter = 13.75;
grip_screw_diameter = 5;
holder_gap = 3;
thickness = 4.5;
base_thickness = thickness;

// END OF PARAMETERS

grip_screw_radius = grip_screw_diameter/2;
pen_radius = pen_diameter/2;
holder_radius = pen_radius+thickness;

use <sumpod_holder.scad>;

x = 70;
y = 40;
c_x = x/2;
c_y = y/2;

union() {
  difference() {
    sumpod_holder([x, y, base_thickness]);
    translate([c_x, c_y, thickness/2])
      scale([1.5, 1, 1])
        cylinder(r=holder_radius+holder_gap, h = thickness*2, center = true);
  }
  difference() {
    union() {
      translate([c_x, c_y, 0])
        cylinder(r=holder_radius, h = thickness*3, center = false);
      translate([c_x+holder_radius-thickness/2, c_y-(thickness+holder_gap/2),
                 0])
        cube([holder_radius/2+holder_gap/2+thickness/2, thickness*2+holder_gap,
              thickness*3], center = false);
      translate([c_x-holder_radius*2, c_y-thickness, 0])
        difference() {
          cube([holder_radius*2+thickness/2, thickness*2, thickness*3],
               center = false);
          translate([0, -thickness/2, thickness])
            rotate([0,-45,0])
              cube([holder_radius*2+thickness/2, thickness*3, thickness*3],
                   center = false);
        }
    }
    union() {
      translate([c_x, c_y, -thickness/2])
        cylinder(r=pen_radius, h = thickness*4, center = false, $fn = 72);
      translate([c_x+holder_radius-thickness*1.5, c_y-holder_gap/2,
                 -thickness/2])
        cube([holder_radius/2+holder_gap+thickness*1.5, holder_gap,
              thickness*4],
             center = false);
      translate([c_x+holder_radius+thickness*.75-grip_screw_radius,
                 c_y, thickness*1.5])
        rotate([90,0,0])
          cylinder(r=grip_screw_radius, h=1.1*(thickness*2+holder_gap),
                   center = true, $fn = 72);
    }
  }
}
