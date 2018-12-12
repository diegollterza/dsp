function [freq, amp, fase] = espectro(sinal, fs)
  N = length(sinal);
  df = fs/N;
  freq = 0:df:fs-df;
  
  Esinal=fft(sinal);
  amp = 2 * abs(Esinal(1:floor(N/2)))/N;
  fase = 180/pi * angle(Esinal(1:floor(N/2)));
  
  subplot(2, 1, 1); 
  stem(freq(1:floor(N/2)), amp); grid on;
  subplot(2,1,2); 
  stem(freq(1:floor(N/2)), fase); grid on;
endfunction

