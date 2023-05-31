function fracto(poly, xlimit, ylimit, kx, ky)
  rts = roots(poly);
  n = length(rts);
  x = linspace(xlimit(1), xlimit(2), kx);
  y = linspace(ylimit(1), ylimit(2), ky);
  [x, y] = meshgrid(x, y);
  f = @(z) polynom(poly, z);
  eps = 1e-3;
  z = methodNewtone(f, x + i*y);
  zPic = zeros(size(z)(1), size(z)(2));
  for j = 1:n
    zPic += (abs(z - rts(j)) < eps) * j;
  endfor
  map = [1 0 0; 0 1 0; 0 0 1; 0.5 0.5 0; 0.5 0 0.5; 0 0.5 0.5; 252/255 198/255 194/255; 198/255 217/255 234/255; 216/255 240/255 211/255; 230/255 216/255 234/255; 198/255 233/255 217/255; 253/255 217/255 193/255; 216/255 233/255 237/255; 246/255 215/255 234 / 255];
  colormap(map);
  image(xlimit, ylimit, zPic);
end
