#Filtro Narrow Band
# 
# Características:
#   - possui 5 coeficientes;
#   - são filtros tipo rejeita-faixa ou passa faixa com banda estreita
#   - a resposta em frequência pode ser melhorada se usar múlti-plos estágios em cascata
function [y] = iir_single_pole_passa_faixa(sinal, fs, f_central, largura_banda)
  #   Single Pole passa faixa - y[k] = a0*sinal[k] + a1*sinal[k-1] + a2x[k-2]+ b1*y[k-1] + b2*y[k-2]

  #   a0=(1+R)/2
  #   a1=-(1+R)/2
  #   b1=R
  #   R=e^(-2*π*fc) R determina a frequência de corte fc (-3dB) do filtro e deve estar entre 0 e 1 e fc deve ser normalizada pela frequência de amostragem.
  display('TODO: O algoritimo iir_single_pole_passa_faixa algorimo parece estar com problema!')
  fc_normalizada = f_central/fs;
  BW = largura_banda/fs;
  
  r = 1-(3*BW);
  k = (1-(2*r*cos(2*pi*fc_normalizada)) + r^2 ) / (2 - (2*cos(2*pi*fc_normalizada)));
  
  a0 = 1-k;
  a1 = 2*(k-r)*cos(2*pi*fc_normalizada);
  a2 = r^2 - k;
  
  b1 = 2*r*cos(2*pi*fc_normalizada);
  b2 = -r^2;
  
  
  N=length(sinal);
  
  y(1) = a0*sinal(1);
  y(2) = a0*sinal(2) + a1*sinal(1) + b1*y(1);
  
  for k=3:N
      y(k) = a0*sinal(k) + a1*sinal(k-1) + a2*sinal(k-2)+ b1*y(k-1) + b2*y(k-2);
  endfor
  
endfunction