function a = diagsn(m, n)
  a = uint32(zeros(m, n));
  a(1, 1) = 1;
  x = 1;
  y = 2;
  xDir = 1;
  yDir = -1;
  for i = 2:m*n
    a(y, x) = i;
    if (x + xDir > n) || (y + yDir < 1)
      if (x + 1 <= n)
        x += 1
      else
        y += 1
      endif
      xDir *= -1;
      yDir *= -1;
    elseif (x + xDir < 1) || (y + yDir > m)
      if (y + 1 <= m)
        y += 1;
      else
        x += 1;
      endif
      xDir *= -1;
      yDir *= -1;
    else
      x += xDir;
      y += yDir;
    endif
  endfor
end
