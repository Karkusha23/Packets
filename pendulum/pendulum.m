function dydt = pendulum(t, y, l)
  g = 9.8;
  dydt(1) = y(2);
  dydt(2) = -(g / l) * sin(y(1));
  dydt = dydt';
endfunction
