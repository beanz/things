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
coin();
translate([-11,-10,2])
  scale([0.26,0.26,1])
    linear_extrude(file = "skull-and-x-bones.dxf", height = 2, center = true);
