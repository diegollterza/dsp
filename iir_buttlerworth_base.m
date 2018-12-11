function [h, omega_c] = iir_buttlerworth_base(ganho_db_p, fc_p, ganho_db_s, fc_s)
  pkg load control
  ganho_p = db2mag(ganho_db_p);
  ganho_s = db2mag(ganho_db_s);
  wp = 2*fc_p*pi;
  ws = 2*fc_s*pi;
  # Ficar muito atendo com esses parenteses pois levei quase 1 hora para acertar a conta
  # :@
  n = log10((1/ganho_p^2-1)/(1/ganho_s^2-1)) / ( 2*log10((wp/ws)) );
  n = ceil(n);
  omega_c = wp*(1/(1/ganho_p^2-1))^(1/(2*n));
  display(omega_c/(2*pi));

  m=1;
  for k=0:2*n-1
    polo=omega_c*e^(((i*pi)/(2*n))*((2*k)+1));
    if real(polo)<0
      rp(m)=polo;
      m=m+1;
    endif
  endfor 
  disp('Polos estáveis: ');
  disp(rp');
  
  H=tf(omega_c^n,real(poly(rp)));
  h=zpk(H);
  
endfunction