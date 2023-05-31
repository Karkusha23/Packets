clear;

rts = roots([1 0 0 -1])
root1 = rts(1);
root2 = rts(2);
root3 = rts(3);
eps = 1e-3;

f = @(z) z.^3 - 1;

[x,y] = meshgrid(-2:0.002:2, -2:0.002:2);

z = methodNewtone(f, x + i*y);
z1 = abs(z - root1) < eps;
z2 = abs(z - root2) < eps;
z3 = abs(z - root3) < eps;
z4 = ~(z1+z2+z3);

z = z1 + 2*z2 + 3*z3 + 4*z4;

map = [1 0 0; 0 1 0; 0 0 1; 0 0 0];
colormap(map);

image([-2,2], [-2,2], z);
