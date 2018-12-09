# Filtros: São sistemas dinâmicos:
#    - seletivos em frequência
#    - que modificam certas componentes de frequências em relação a outras 

# Podem ser usados para duas finalidades básicas:
#   - separação de sinais (eliminação de componentes indesejadas)
#   - restauração de sinais (correção de distorções)

# As informações em um sinal são representadas de duas formas:
#   - no tempo: - descrevem quando e com que amplitude ocorre um evento
#   - na frequência: - descrevem características periódicas que ocorrem no sinal

# Resposta temporal / Resposta ao degrau: obtém-se parâmetros de desem- penho para filtros.
# -   Velocidade: Rápida ou lenta;
# -   Overshoot: Com ou s/ overshoot (salto);
# -   Linearidade da fase: Boa ou Ruim;

# Resposta em frequencia:
# -   Roll-off ( Banda de transição: Boa ou Ruim;
# -   Ripple: Poor / Flat;
# -   Atenuação: Poor / Good;


# Resposta em frequencia filtros:
# -    Passa baixas;
# -    Passa baixas;
# -    Passa baixas;
# -    Passa baixas;
# -    Passa baixas;

# Decibeis: no fim do capitulo: http://www.dspguide.com/ch14/1.htm
#  Por exemplo, um circuito eletrônico que possui 3 bels de amplificação produz um sinal de saída
#  com 10 × 10 × 10 = 1000 vezes a potência da entrada

# Um decibel (dB) é um décimo de um bel.

# -20db -10db 0db 10db 20db

# -20/10 -10/10 0/10 10/10 20/10
# -2     -1     0    1     2

# -20db   Portanto 10^-2 = 0.01
# -10d    Portanto 10^-1 = 0.1
# 0db     Portanto 10^-0 = 1
# 10      Portanto 10^1 = 10
# 20      Portanto 10^2 = 100

#Aqui está o problema: você geralmente quer trabalhar com a amplitude de um sinal,
# não com sua potencia.

# Por exemplo, imagine um amplificador com 20dB de ganho. 
# Por definição, isso significa que a potência no sinal aumentou em um fator de 100.
# Como a amplitude é proporcional à raiz quadrada da potência,
#  a amplitude da saída é 10 vezes a amplitude da entrada. 

# Enquanto 20dB significa um fator de 100 em potência, 
# significa apenas um fator de 10 em amplitude. 

# Cada vinte decibéis

# significa que a amplitude mudou por um fator de dez.


#Se você não entender mais nada sobre decibéis, 
# lembre-se de duas coisas: primeiro, 

# -3dB significa que a amplitude é reduzida para 0,707 (e a potência é reduzida para 0,5). 

# Em segundo lugar, memorize as seguintes conversões entre decibéis e proporções de amplitude:

#   60db    1000
#   40db    100
#   20db    10
#   0db     1
#   -20db   0.1 
#   -40db   0.01
#   -60db   0.001

format long;
T=1/10000;
fs=1/T;
t=0:T:1-T;

# Dado um sinal amostrado com fs=10kHz e com as seguintes componentes de frequência:
sinal=sin(1*pi*200*t)+sin(1*pi*400*t)+sin(1*pi*600*t)+sin(1*pi*800*t)+sin(1*pi*1000*t)+sin(1*pi*1200*t)+sin(1*pi*1400*t)+sin(1*pi*1600*t)+sin(1*pi*1800*t);
figure(1), plot(t,sinal); grid on;
figure(2), espectro(sinal, 1/T);

# 1) Projetar (algoritmo) um filtro recursivo para eliminar as componentes inferiores a 1,2kHz.
sinal_filtrado = iir_single_pole_passa_baixa(sinal, fs, 1200);
figure(3), espectro(sinal_filtrado, 1/T);
# 2) Projetar (algoritmo) um filtro recursivo para eliminar as componentes superiores a 1kHz.
sinal_filtrado = iir_single_pole_passa_alta(sinal, fs, 1000);
figure(4), espectro(sinal_filtrado, 1/T);
# 3) Projetar (algoritmo) um filtro recursivo para eliminar as componentes de 600Hz e 800 Hz.
sinal_filtrado = iir_single_pole_rejeita_faixa(sinal, fs, 600, 50);
sinal_filtrado = iir_single_pole_rejeita_faixa(sinal_filtrado, fs, 800, 50);
figure(5), espectro(sinal_filtrado, 1/T);
# 4) Projetar (algoritmo) um filtro recursivo para eliminar todas as componentes, deixando apenas a de 1,4kHz.
# TODO: Este algorimo parece estar com problema!
sinal_filtrado = iir_single_pole_passa_faixa(sinal, fs, 1000, 20);
figure(6), espectro(sinal_filtrado, 1/T);