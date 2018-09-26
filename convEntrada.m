% A partir do conceito de convolução do ponto de vista da superposição do sinal de entrada,
% escrever seu próprio programa de convolução.
function y = convEntrada(x, h)
  N = length(x);
  M = length(h);
  y = zeros(1, M+N-1);
  for p = 1:N
    for q = 1:M
      y(p+q-1) = y(p+q-1) + x(p)*h(q);
    endfor
  endfor
endfunction