function a = fence(m, n)
  a = true(m, 1);
  for i = 2:n
    if (mod(i, 2) == 0)
      a = [a, false(m, 1)];
    else
      a = [a, true(m, 1)];
    endif
  endfor
end
