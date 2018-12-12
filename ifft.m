function [y] = ifft(S)
  N = length(S);
  SCONJ = real(S) - j*imag(S);
  y = (1/N) * fft(SCONJ);
endfunction