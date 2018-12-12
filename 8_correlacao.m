
% Sequencias proporcionais
% - o módulo da soma dos produtos é um valor relativamente grande
% - soma dos produtos positiva
%  - as amostras correspondentes tendem a ter o mesmo sinal e a soma será sempre crescente
x1 =  [2 3 7 -1 -2 1 4 5 6];
x2 = [4 6 14 -2 -4 2 8 10 12];
soma_produtos(x1,x2)

% Sequências opostas
% - as amostras correspondentes tendem a ter sinais opostos e a soma será sempre negativa
% - soma dos produtos negativa
% - o módulo da soma dos produtos é um valor relativamente grande 
x3 = [1 3 4 6 9 11 11 15 20];
x4 = [-1 -3 -4 -5 -9 -11 -11 -15 -20];
soma_produtos(x3,x4)

% Sequências Aleatórias
% - a probabilidade de sinais iguais e opostos entre as amostras correspondentes é praticamente a mesma e as somas tendem a se cancelar
% - soma dos produtos tende a zero;
% - o sinal pode ser negativo ou positivo;
x5 = [-3 11 -3 7 -21 -4 -8 -16 5];
x6 = [3 1 4 2 1 -5 -10 5 -1];
soma_produtos(x5,x6)


% Coeficiente de Correlação
% - se for zero, os sinais não tenham correlação alguma
% - se for igual a 1, os sinais sejam totalmente correlacionados
%- se for igual a -1, os sinais sejam totalmente correlacionados, mas de forma oposta

coeficiente_correlacao(x1, x2)
coeficiente_correlacao(x3, x4)
coeficiente_correlacao(x5, x6)


% Exercicio 1
coeficiente_correlacao([-3 11 -3 7 -21 -4 -8 -16 5] , [3 1 4 2 1 -5 -10 5 -1])


T = 1/200;
t=0:T:99*T;
s1=sin(2*pi*10*t);
s2=cos(2*pi*10*t);
figure(1), plot(t, s1, t, s2); grid on;
corrcoef(s1, s2)
[rc, lag] = xcorr(s1, s2)
% rc correlação em diferentes atrasos
% lag -> atrasos
figure(2), plot(lag, rc); grid on;
% no ponto de máximo tem a maior correção, tem um ponto no eixo 5, para um atraso de 5 amostras, se pegarmos o sinal x2 e atrasar ele em 5 amostras;
% no atraso de 5 amostras os sinais são muito parecidos;
[m, ind] = max(rc);
lag(ind) % vamos ver o 5;
figure(3), plot(t, s1, t+lag(ind)*T, s2);


%coeficiente_correlacao(s1,s2);
%s3=sin(2*pi*10*t)+2*sin(2*pi*15*t)
%s4=sin(2*pi*10*t)
%coeficiente_correlacao(s3,s4)