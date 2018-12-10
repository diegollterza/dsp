# Projeto de filtros IIR de tempo discreto a partir de filtros de tempo contínuo

# The Scientist and Engineer's Guide to Digital Signal Processing – Steven W. Smith Capítulo 20
# http://www.dspguide.com/ch20.htm

# - A arte do projeto de filtro IIR de tempo contínuo está altamente avançada.
# - Muitos métodos úteis de projeto IIR de tempo contínuo possuem fórmulas 
#       fechadas de projeto relativamente simples.
# - Os métodos de aproximação padrão não levam a fórmulas de projeto fechadas 
#       simples quando esses métodos são aplicados diretamente ao caso IIR de 
#       tempo discreto.

# Filtro Passa-baixas Butterworth

# - Filtro com resposta em magnitude maximamente plana na banda de passagem
# - Descrito pela primeira vez em 1930 pelo engenheiro e físico 
#     Stephen Butterworth em seu artigo “On the theory of filter amplifiers”
# - À época de seu desenvolvimento, o projeto de filtros dependia muito da 
#     experiência e da intuição do engenheiro devido à limitação da teoria e,
#     geralmente, produzia filtros com muito ripple na banda de passagem.
# - O filtro só se tornou de uso comum 30 anos depois de sua publicação

# No livro vamos ver que é muito comum usar tabelas, mas se você tiver uma base
# matématica vai perceber que é possível ter um precisão maior fazendo os 
# cálculos manualmente:

# Por exemplo, para o projeto de um filtro passa baixa:
# - Banda de passagem até 100Hz com 1dB de ripple;
# - Atenuação de -15dB a partir de 400Hz;
# - Rp = -1dB e Wp=2π100 rad/s
# - Rs = -15dB e Ws=2π400 rad/s
format long;
pkg load control;
pkg load signal;
T=1/5000;
fs=1/T;
t=0:T:1-T;

sinal=sin(1*pi*200*t)+sin(1*pi*400*t)+sin(1*pi*600*t)+sin(1*pi*800*t)+sin(1*pi*1000*t)+sin(1*pi*1200*t)+sin(1*pi*1400*t)+sin(1*pi*1600*t)+sin(1*pi*1800*t);

H = iir_buttlerworth_base(-1, 100, -15, 400)
Hz=c2d(H,T, 'zoh');
figure(1), espectro(sinal, 1/T);
[B,A]=tfdata(Hz,'v');
filtrado = filter(B,A, sinal);
figure(2), espectro(filtrado, 1/T);

#1) Projetar (algoritmo) um filtro IIR Butterworth para eliminar as componentes inferiores a 1,2kHz.
#2) Projetar (algoritmo) um filtro IIR Butterworth para eliminar as componentes superiores a 1kHz.
#3) Projetar (algoritmo) um filtro IIR Butterworth para eliminar as componentes de 600Hz e 800 Hz.
#4) Projetar (algoritmo) um filtro IIR Butterworth para eliminar todas as componentes, deixando apenas a de 1,4kHz.
