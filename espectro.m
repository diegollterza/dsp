function [freq, amp, fase] = espectro(sinal, fs)
  % Quantidade de pontos de um sinal;
  N = length(sinal);
  
  df = fs/N;
  # Vetor de frequencias
  freq = 0:df:fs-df;
  
  Esinal=fft(sinal);
  subplot(2, 1, 1);
  
  stem(freq(1:floor(N/2)), 2*abs(Esinal(1:floor(N/2)))/N);
  grid on;
  
  subplot(2,1,2);
  stem(freq(1:floor(N/2)), angle(Esinal(1:floor(N/2)))*180/pi);
  grid on;
endfunction

