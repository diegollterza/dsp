conv([1 2 1 3], [2 1 3])
% 1) A partir do conceito de convolução do ponto de vista da superposição do sinal de entrada,
convEntrada([1 2 1 3], [2 1 3])
%2) A partir do conceito de convolução do ponto de vista da máquina de convolução
convSaida([1 2 1 3], [2 1 3])

% Inicializacao para os itens 4-6
T = 1/10000;
t=0:T:0.1-T;
s=2.5*sin(2*pi*700*t)+1.3*sin(2*pi*1200*t)+0.7*sin(2*pi*2100*t);
ruido=0.5*randn(1,1000);
s=s+3.*ruido;

%4) Gerar o kernel de um filtro Moving Average para reduzir a amplitude do ruído de um sinal
%em pelo menos 5 vezes.
clear h
h(1:5)=1/5

%3) Escrever um algoritmo para realizar a filtragem com o filtro Moving Average aplicando a
%média das amostras seguintes do sinal de entrada. O filtro pode ser de qualquer tamanho.
sinal_filtrado_conv = conv(s,h)

%5) Escrever um programa para fazer a filtragem do exercício anterior de forma recursiva.
sinal_filtrado_recursivo = mva_recursivo(s, 5)

% Tem um deslocamento entre as curvas, mas eu não sei arrumar, mas o kernel recursivo ficou parecido com o convoluido
% azul
figure, plot(s(1:1000), color='b'), grid on;
hold on;
% vermelho
plot(sinal_filtrado_conv(1:1000), color='r');
% amarelo
plot(sinal_filtrado_recursivo(1:1000), color='y');
hold off;

