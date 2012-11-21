use <coin-lib.scad>
double_sided = true;
height = 3;
cut_height = 1;
coin(double_sided = double_sided, height = height, cut_height = cut_height);
translate([-13,-13,height/2])
  scale([0.3,0.3,1])
    linear_extrude(file = "c.dxf", height = height, center = true);
