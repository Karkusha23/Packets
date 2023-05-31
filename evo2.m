clear;

d = 1e-6;

x = @(t) 3*cos(t);
y = @(t) 2*sin(t);

xdiff = @(t) (x(t + d) - x(t)) / d;
ydiff = @(t) (y(t + d) - y(t)) / d;
x2diff = @(t) (xdiff(t + d) - xdiff(t)) / d;
y2diff = @(t) (ydiff(t + d) - ydiff(t)) / d;

fun = @(t) sqrt((xdiff(t))^2+(ydiff(t))^2);

xevo = @(t) x(t) - ydiff(t) .* ((xdiff(t)).^2 + (ydiff(t)).^2) ./ (xdiff(t) .* y2diff(t) - x2diff(t) .* ydiff(t));
yevo = @(t) y(t) + xdiff(t) .* ((xdiff(t)).^2 + (ydiff(t)).^2) ./ (xdiff(t) .* y2diff(t) - x2diff(t) .* ydiff(t));

%evolvX = @(t) x(t) - xdiff(t) .* integ(fun, 0, t) ./ fun(t);
%evolvY = @(t) y(t) - ydiff(t) .* integ(fun, 0, t) ./ fun(t);

%xs = [];
%ys = [];

%for i = ts
%  xs = [xs, evolvX(i)];
%  ys = [ys, evolvY(i)];
%endfor

ds = 0.01;
ts = 0:ds:2*pi;

plot(x(ts), y(ts));
hold on;
axis equal;
h = plot(0,0);
g = plot(0,0);
hold off;

for i = ts
  r = sqrt((x(i) - xevo(i))^2 + (y(i) - yevo(i))^2);
  s = 0:0.05:2*pi;
  xcirc = r * cos(s) + xevo(i);
  ycirc = r * sin(s) + yevo(i);
  set(h, 'XData', xcirc, 'YData', ycirc);
  set(g, 'XData', xevo(0:ds:i), 'YData', yevo(0:ds:i));
  drawnow;
endfor
%comet(xevo, yevo);
%set(gca, 'xlim', [-4, 4], 'ylim', [-3, 3]);
%plot(xevo, yevo);
%plot(xs, ys);
