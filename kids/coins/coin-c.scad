use <coin-lib.scad>
coin();
translate([-13,-13,2])
  scale([0.3,0.3,1])
    linear_extrude(file = "c.dxf", height = 2, center = true);
