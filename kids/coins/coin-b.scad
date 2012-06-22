use <coin-lib.scad>
coin();
translate([-10.5, -12, 2])
  scale([0.28, 0.28, 1])
    linear_extrude(file = "b.dxf", height = 2, center = true);
