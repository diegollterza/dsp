% 3) Escrever um algoritmo para realizar a filtragem com o filtro Moving Average aplicando a
% média das amostras seguintes do sinal de entrada. O filtro pode ser de qualquer tamanho.

% 5) Escrever um programa para fazer a filtragem do exercício anterior de forma recursiva.
function [z] = soma_produtos(x, y)
  N = length(x); % tamanho do sinal
  z = 0;
  for n=1:N
      z = z + (x(n)*y(n));
  endfor;
endfunction