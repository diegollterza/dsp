pkg load control
#H = 2s / s^ + 2s + 100

# Ficar atendo com o zero que precisa ser colocado.
sinal = tf([2 0], [1 2 100])
ts= 0.1
z_zoh_sinal = c2d(sinal, ts, 'zoh')
z_tustin_sinal = c2d(sinal, ts, 'tustin')

# Quando colocamos o periodo de amostragem o octave/matlab já retorna pra gente
# um sinal discreto em Z
H = tf([1 -1],[1 1 0.3],0.1)
# Para converter de volta usamos
Hc = d2c(H)

# zpk - Zero Pole Gain!!!!! Essa função parece não estar funcionando no octave, só no matlab
zpk(z_zoh_sinal);
zpk(z_tustin_sinal);


ts=1/5000;
fs=1/ts;
t=0:ts:1-ts;

# Dada um função de transferencia 
num = 1;
den = [1 -0.2]; # Isso ta longe de ser um filtro descente, serve mais para explicar o uso da função filter!!!! Que vai ser muito importante daqui pra frente.
Hz = filt(num,den,ts) 
# Um sinal qualquer
sinal=sin(1*pi*200*t)+sin(1*pi*400*t)+sin(1*pi*600*t)+sin(1*pi*800*t)+sin(1*pi*1000*t)+sin(1*pi*1200*t)+sin(1*pi*1400*t)+sin(1*pi*1600*t)+sin(1*pi*1800*t);
# Podemos aplicar um filtro nesse sinal com comando:
filtrado = filter(den, num, sinal);

figure(1), plot(sinal, color='r');
figure(2), plot(filtrado, color='b');
figure(3), espectro(sinal, 1/ts);
figure(4), espectro(filtrado, 1/ts);





