% Dado um sinal amostrado com fs=10kHz e com as seguintes
% componentes de frequência:
clc;

T=1/10000;
fs=1/T;
t=0:T:1-T;

s=sin(2*pi*200*t)+sin(2*pi*400*t)+sin(2*pi*600*t)+sin(2*pi*800*t)+sin(2*pi*1000*t)+sin(2*pi*1200*t)+sin(2*pi*1400*t)+sin(2*pi*1600*t)+sin(2*pi*1800*t);

figure(1), plot(t,s); grid on;
figure(2), espectro(s, 1/T);

hh = windownSyncPassaBaixa(s, banda_transicao=200, fc=1090, fs=1/T, janela='hanning');
figure(3), plot(hh), grid on;
figure(4), freqz(hh, 1, 100, fs);
filtrado_hh = conv(s,hh);
figure(5), espectro(filtrado_hh, 1/T);

% Projetar um filtro FIR para eliminar as componentes superiores a 1kHz.
hb = windownSyncPassaBaixa(s, banda_transicao=200, fc=1090, fs=1/T, janela='blackman');
figure(6), plot(hb), grid on;
figure(7), freqz(hb, 1, 100, fs);
filtrado_hb = conv(s,hb);
figure(8), espectro(filtrado_hb, 1/T);

% Projetar um filtro FIR para eliminar as componentes inferiores a 1,2kHz.
h_alta = windownSyncPassaAlta(s, banda_transicao=200, fc=1090, fs=1/T, janela='blackman');
figure(9), plot(h_alta), grid on;
figure(10), freqz(h_alta, 1, 100, fs);
filtrado_halta = conv(s,h_alta);
figure(11), espectro(filtrado_halta, 1/T);

% Projetar um filtro FIR para eliminar todas as componentes, deixando apenas a de 1,4kHz.
kernel_passa_faixa = windownSyncPassaFaixa(s, banda_transicao=200, fc_inicial=1250, fc_final=1450, fs=1/T, janela='blackman');
figure(12), plot(kernel_passa_faixa), grid on;
figure(13), freqz(kernel_passa_faixa, 1, 100, fs);
sinal_filtrado_passa_faixa = conv(s,kernel_passa_faixa);
figure(14), espectro(sinal_filtrado_passa_faixa, 1/T);

% Projetar um filtro FIR para eliminar as componentes de 600Hz e 800 Hz.
kernel_rejeita_faixa = windownSyncRejeitaFaixa(s, banda_transicao=200, fc_inicial=550, fc_final=950, fs=1/T, janela='blackman');
figure(15), plot(kernel_rejeita_faixa), grid on;
figure(16), freqz(kernel_rejeita_faixa, 1, 100, fs);
sinal_filtrado_rejeita_faixa = conv(s,kernel_rejeita_faixa);
figure(17), espectro(sinal_filtrado_rejeita_faixa, 1/T);

% eu não tenho certeza se esta correto, o filtro esta cortando um pouco, preciso conseguir ajustar de uma forma melhor.