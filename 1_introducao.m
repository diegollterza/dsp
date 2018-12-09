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


