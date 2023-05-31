function y = polynom(poly, x)
  n = length(poly);
  y = poly(n);
  tmp = ones(size(x)(1), size(x)(2));
  for i = n-1:-1:1
    tmp = tmp .* x;
    if poly(i) != 0
      y += poly(i) * tmp;
    endif
  endfor
end
