% 3) Escrever um algoritmo para realizar a filtragem com o filtro Moving Average aplicando a
% média das amostras seguintes do sinal de entrada. O filtro pode ser de qualquer tamanho.

% 5) Escrever um programa para fazer a filtragem do exercício anterior de forma recursiva.
function [y] = mva_recursivo(x, M)
  N = length(x); % tamanho do sinal
  y = zeros(1, N);
  for n=1:N
      if n-1>0 && n-M>0
        y(n)= y(n-1) + (x(n)-x(n-M))/M;
      endif
  endfor;
endfunction