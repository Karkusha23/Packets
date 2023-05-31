function a = checkerboard(m, n)
  a = false(m, n);
  for i = 1:m
    for j = 1:n
      a(i, j) = mod(i + j, 2) == 0;
    endfor
  endfor
end
