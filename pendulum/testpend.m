clear;

n = 7;
lens = 5:4+n;
thetas = [];

for i = lens
  [t, y] = ode45(@(t, y) pendulum(t, y, i), 0:0.07:300, [0, 1]);
  thetas = [thetas; (y(:, 1))'];
endfor

x0 = 0;
y0 = 9;
r = 0.2;
circ = 0:2*pi;
xcirc = r*cos(circ);
ycirc = r*sin(circ);

st = [plot(0,0)];
hold on;
bl = [plot(0,0)];

for i = 2:n;
  st = [st, plot(0, 0)];
  bl = [bl, plot(0, 0)];
endfor

hold off;
set(gca, 'xlim', [-10,10], 'ylim',[-5,10]);
axis equal;

for i = 1:length(thetas(1,:))
  for j = 1:n
    x1 = x0 + lens(j)*sin(thetas(j, i));
    y1 = y0 - lens(j)*cos(thetas(j, i));
    set(st(j), 'XData', [x0, x1], 'YData', [y0, y1]);
    set(bl(j), 'XData', x1 + xcirc, 'YData', y1 + ycirc);
    drawnow;
  endfor
endfor

%plot(t, y);
%legend;
