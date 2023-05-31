function z = methodNewtone(f, z0)
  d = 0.01;
  eps = 1e-3;
  zprev = z0;
  diff = (f(z0 + d) - f(z0)) / d;
  z1 = z0 - f(z0) ./ diff;
  for k = 1:40
    diff = (f(z1 + d) - f(z1)) / d;
    z1 = z1 - f(z1) ./ diff;
  endfor
  z = z1;
end
