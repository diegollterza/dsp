# Filtros IIR / Filtros Recursivos
# É um filtro de um único polo, semelhante a um circuito RC.

# Características:

# - possui, no máximo, 3 coeficientes fáceis de se calcular;
# - são versões digitais de circuitos RC;
# - possui boa resposta no tempo, mas é fraco na resposta em frequência;
# - pode ser montado na forma de cascata, repetindo-se estágios 
# idênticos, para melhorar sua banda de atenuação.

function [y] = iir_single_pole_passa_baixa(sinal, fs, f_corte)
  #   Single Pole passa baixa -  y[k]=a0*x[k]+b1*y[k-1]
  
  #   a0=1-R
  #   b1=R
  #   R=e^(-2*π*fc) -  R determina a frequência de corte fc (-3dB) do filtro e deve estar entre 0 e 1 e fc deve ser normalizada pela frequência de amostragem.
  
  fc_normalizada = f_corte/fs;
  r = e^(-2*pi*fc_normalizada);
  a0 = 1-r;
  b1 = r;
  
  N=length(sinal);
  
  y(1)=a0*sinal(1);
  for k=2:N
      y(k)=a0*sinal(k)+b1*y(k-1);
  endfor
  
endfunction