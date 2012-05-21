use <coin-lib.scad>
coin();
translate([-11.5,-11,2])
  scale([0.27,0.27,1])
    linear_extrude(file = "r.dxf", height = 2, center = true);
