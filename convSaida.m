% 2) A partir do conceito de convolução do ponto de vista da máquina de convolução, escrever
% seu próprio programa de convolução.
function y = convSaida(x, h)
  N = length(x);
  M = length(h);
  y = zeros(1, M+N-1);
  for p=1:N+M
    for q=1:M
      if p-q>=0 && p-q<=N-1
          y(p) = y(p) + x(p-q+1)*h(q);
      endif
    endfor
  endfor
endfunction