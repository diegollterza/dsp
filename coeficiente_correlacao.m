function [r] = coeficiente_correlacao(x, y)
  
  x_avg = mean(x);
  y_avg = mean(y);
  
  N = length(x); % tamanho do sinal
  
  numerador = 0;
  denominador_x = 0;
  denominador_y = 0;
 
  for n=1:N
      x_x_avg = x(n) - x_avg;
      y_y_avg = y(n) - y_avg;
      numerador = numerador + (x_x_avg * y_y_avg);
      
      denominador_x = denominador_x + (x_x_avg^2);
      denominador_y = denominador_y + (y_y_avg^2);
      
  endfor;
  numerador
  denominador_x
  denominador_y
  r = numerador / sqrt(denominador_x*denominador_y);
  
endfunction