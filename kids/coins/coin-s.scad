use <coin-lib.scad>
coin();
translate([-13,-12.8,2])
  scale([0.3,0.3,1])
    linear_extrude(file = "s.dxf", height = 2, center = true);
