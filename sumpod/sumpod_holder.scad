/*
 * Sumpod Holder Template
 *
 * See sumpod_pen_holder.scad for example usage.
 *
 * Copyright (c) 2012 Mark Hindess
 * License:
 *   Creative Commons Attribution-ShareAlike 3.0 Unported License
 *   http://creativecommons.org/licenses/by-sa/3.0
 */

module sumpod_holder(size = [70,40,18],
                     corner_radius = 7,
                     corner_hole_radius = 3) {
  depth = size[2];
  difference() {
    union() {
      translate([corner_radius,0,0])
        cube([size[0]-(corner_radius*2), size[1], depth],
               center = false);
      translate([0,corner_radius,0])
        cube([size[0], size[1]-(corner_radius*2), depth],
               center = false);
      translate([corner_radius,corner_radius, depth/2])
        cylinder(r=corner_radius, h = depth, center = true, $fn = 36);
      translate([size[0]-corner_radius,corner_radius, depth/2])
        cylinder(r=corner_radius, h = depth, center = true, $fn = 36);
      translate([corner_radius,size[1]-corner_radius, depth/2])
        cylinder(r=corner_radius, h = depth, center = true, $fn = 36);
      translate([size[0]-corner_radius, size[1]-corner_radius, depth/2])
        cylinder(r=corner_radius, h = depth, center = true, $fn = 36);
    }
    union() {
      translate([corner_radius, corner_radius, depth/2])
       cylinder(r = corner_hole_radius, h = depth*2, center = true, $fn = 72);
      translate([size[0]-corner_radius, corner_radius, depth/2])
       cylinder(r = corner_hole_radius, h = depth*2, center = true, $fn = 72);
      translate([corner_radius, size[1]-corner_radius, depth/2])
       cylinder(r = corner_hole_radius, h = depth*2, center = true, $fn = 72);
      translate([size[0]-corner_radius, size[1]-corner_radius, depth/2])
       cylinder(r = corner_hole_radius, h = depth*2, center = true, $fn = 72);
    }
  }
}

sumpod_holder([70,40,5]);
