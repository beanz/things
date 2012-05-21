/*
 * Simple coin shape
 *
 * Copyright (c) 2012 Mark Hindess
 *
 * Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License:
 *
 *   http://creativecommons.org/licenses/by-nc-sa/3.0/
 */

module coin(height = 3, radius = 17,
            cut_radius = 14, cut_height = 1,
            bumps = 90, bump_radius = 2) {
  deg = 360/bumps;
  difference() {
    union() {
      for(n=[0:bumps-1]) {
        rotate([0, 0, n*deg])
          translate([radius-bump_radius, 0, 0])
            cylinder(r = bump_radius, h = height);
      }
      cylinder(r = radius-bump_radius, h = height);
    }
    translate([0, 0, height-cut_height])
      cylinder(r = cut_radius, h = height-cut_height);
  }
}

coin();
