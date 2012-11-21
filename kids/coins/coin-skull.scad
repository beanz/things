/*
 * Skull and Crossbones coin
 *
 * Copyright (c) 2012 Mark Hindess
 *
 * Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License:
 *
 *   http://creativecommons.org/licenses/by-nc-sa/3.0/
 */

use <coin-lib.scad>
double_sided = true;
height = 3;
cut_height = 1;
coin(double_sided = double_sided, height = height, cut_height = cut_height);
translate([-11,-10,height/2])
  scale([0.26,0.26,1])
      linear_extrude(file = "skull-and-x-bones.dxf",
                     height = height, center = true);
